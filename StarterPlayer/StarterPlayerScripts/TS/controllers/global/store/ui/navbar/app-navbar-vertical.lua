local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["AppNavbarVertical"] = v8.new(u7)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u6
            [4] = u9
            [5] = u5
            [6] = u4
        --]]
        local _ = p11.useState
        local _ = p11.useEffect
        local u12 = u10.ActiveBackgroundColor or u3.WHITE
        local v13 = {
            ["AutomaticSize"] = "XY",
            ["Size"] = UDim2.fromScale(0, 0),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v14 = u10.FrameProps
        if v14 then
            for v15, v16 in v14 do
                v13[v15] = v16
            end
        end
        local v17 = {}
        local _ = #v17
        local v18 = u10.NavButtons
        local function v25(u19) --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u7
                [3] = u12
                [4] = u6
                [5] = u9
            --]]
            local v20 = u10.ActiveAppId == u19.Id
            local v21 = u7.createElement
            local v22 = "ImageButton"
            local v23 = {
                ["Size"] = UDim2.new(0, 40, 0, 40)
            }
            local v24
            if v20 then
                v24 = u12
            else
                v24 = Color3.fromRGB(0, 0, 0)
            end
            v23.BackgroundColor3 = v24
            v23.BackgroundTransparency = 0.5
            v23.BorderSizePixel = 0
            v23[u7.Event.Activated] = function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u19
                    [3] = u6
                    [4] = u9
                --]]
                if u10.ActiveAppId == u19.Id then
                    return nil
                end
                u10.SetActiveAppId(u19.Id)
                u6:playSound(u9.UI_CLICK_2)
                u6:playSound(u9.UI_OPEN_2)
            end
            v23.ZIndex = 2
            return v21(v22, v23, {
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u7.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = Color3.fromRGB(255, 255, 255)
                }, { u7.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new(Color3.fromRGB(131, 131, 131)),
                        ["Transparency"] = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.49, 1),
                            NumberSequenceKeypoint.new(0.5, 0.4),
                            NumberSequenceKeypoint.new(1, 0)
                        })
                    }) }),
                ["Icon"] = u7.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u19.Icon
                }),
                ["Title"] = u7.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 2,
                    ["Text"] = u19.Title,
                    ["Size"] = UDim2.fromScale(1.25, 0.45),
                    ["Position"] = UDim2.fromScale(0.5, 1.45),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                })
            })
        end
        local v26 = table.create(#v18)
        for v27, v28 in v18 do
            v26[v27] = v25(v28, v27 - 1, v18)
        end
        local v29 = {
            ["AutomaticSize"] = "XY",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v30 = { u7.createElement(u5, {
                ["Padding"] = {
                    ["Top"] = 20,
                    ["Bottom"] = 32,
                    ["Horizontal"] = 16
                }
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 32)
            }) }
        local v31 = #v30
        for v32, v33 in v26 do
            v30[v31 + v32] = v33
        end
        v17.NavButtons = u7.createElement(u4, v29, v30)
        v17.Background = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }) })
        return u7.createFragment({
            ["Navbar"] = u7.createElement(u4, v13, v17)
        })
    end)
}