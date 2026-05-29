local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ImageId
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["CloseButton"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u7
            [4] = u3
        --]]
        local _ = p9.useState
        local v10 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            [u5.Event.Activated] = function() --[[ Line: 14 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                    [3] = u7
                --]]
                u8.OnClick()
                u4:playSound(u7.UI_CLOSE_2)
            end
        }
        local v11 = u8.ButtonProps
        if v11 then
            for v12, v13 in v11 do
                v10[v12] = v13
            end
        end
        local v14 = {}
        local v15 = #v14
        local v16 = not u8.DisableAspectRatio
        if v16 then
            v16 = u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.853658536585366
            })
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        local v17 = #v14
        v14[v17 + 1] = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        })
        v14[v17 + 2] = u5.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 123, 123)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 86, 86)) })
        })
        v14[v17 + 3] = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = u3.X,
            ["ImageColor3"] = Color3.fromRGB(52, 52, 52)
        }, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        return u5.createElement("ImageButton", v10, v14)
    end)
}