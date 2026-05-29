local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["HotbarButton"] = v7.new(u6)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u8
            [4] = u5
            [5] = u9
            [6] = u3
            [7] = u4
        --]]
        local _ = p12.useState
        local u13 = u6.createRef()
        local v16 = {
            ["LayoutOrder"] = u11.LayoutOrder,
            ["Size"] = UDim2.fromScale(0.3, 0.5),
            ["BackgroundColor3"] = u11.BackgroundColor or u10.backgroundSecondary,
            ["BorderSizePixel"] = 0,
            [u6.Event.MouseEnter] = function(_) --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u13
                --]]
                local v14 = u8:Create(u13:getValue(), TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.9
                })
                v14:Play()
                v14:Cancel()
            end,
            [u6.Event.MouseLeave] = function(_) --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u13
                --]]
                local v15 = u8:Create(u13:getValue(), TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 1
                })
                v15:Play()
                v15:Cancel()
            end,
            [u6.Event.MouseButton1Click] = function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u9
                    [3] = u11
                --]]
                u5:playSound(u9.UI_OPEN)
                u11.OnClick()
            end,
            ["AutoButtonColor"] = false
        }
        local v17 = {
            u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = u11.AspectRatio
            }),
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u6.createElement("Frame", {
                [u6.Ref] = u13,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.WHITE,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0
            }, { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.05, 0)
                }) }),
            u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center"
                }),
                u6.createElement(u4, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.fromScale(0.5, 0)
                }),
                u6.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = u11.IconSize or UDim2.fromScale(0.6, 0.6),
                    ["Image"] = u11.Icon
                }),
                u6.createElement("TextLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["Text"] = u11.Text,
                    ["Size"] = UDim2.fromScale(u11.AspectRatio - 0.5 - 0.6 - 0.2, 0.55),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u11.TextColor or u3.WHITE
                }),
                u6.createElement(u4, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.fromScale(0.2, 0)
                })
            })
        }
        local v18 = #v17
        local v19 = u11[u6.Children]
        if v19 then
            for v20, v21 in v19 do
                if type(v20) == "number" then
                    v17[v18 + v20] = v21
                else
                    v17[v20] = v21
                end
            end
        end
        return u6.createElement("ImageButton", v16, v17)
    end)
}