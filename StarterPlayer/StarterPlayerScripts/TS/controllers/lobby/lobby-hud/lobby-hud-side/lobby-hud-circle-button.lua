local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Padding
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LobbyHudCircleButton"] = v8.new(u7)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u3
            [4] = u7
            [5] = u6
            [6] = u9
            [7] = u5
        --]]
        local _ = p12.useState
        local v13 = u11.FrameProps
        if v13 ~= nil then
            v13 = v13.BackgroundColor3
        end
        if v13 == nil then
            v13 = u10.backgroundPrimary
        end
        local v14 = (u4.isSmallScreen() and 70 or 80) * 0.8
        local v15 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromOffset(v14, v14),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v16 = u11.FrameProps
        if v16 then
            for v17, v18 in v16 do
                v15[v17] = v18
            end
        end
        v15[u7.Event.Activated] = function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u9
                [3] = u11
            --]]
            u6:playSound(u9.UI_CLICK_2)
            u11.OnClick()
        end
        local v19 = {
            u7.createElement(u5, {
                ["Padding"] = UDim.new(0, 8)
            }),
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }),
            u7.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(v13, Color3.fromRGB(76, 78, 132))
            }),
            u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Image"] = u11.Icon,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["BackgroundColor3"] = Color3.fromRGB(120, 123, 188)
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        }
        local v20 = #v19
        local v21 = u11[u7.Children]
        if v21 then
            for v22, v23 in v21 do
                if type(v22) == "number" then
                    v19[v20 + v22] = v23
                else
                    v19[v22] = v23
                end
            end
        end
        return u7.createElement("ImageButton", v15, v19)
    end)
}