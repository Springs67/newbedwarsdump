local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u9 = v1.import(script, script.Parent, "afk-place-current-timer").AfkPlaceCurrentTimer
local v14 = v6.new(u5)(function(p10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u3
        [5] = u9
    --]]
    local _ = p11.useState
    local _ = p11.useEffect
    local v12 = u5.createFragment
    local v13 = {
        ["Header"] = u5.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = p10.Size or UDim2.fromScale(1, 0.25),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, {
            u5.createElement("UIGradient", {
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 54, 112)), ColorSequenceKeypoint.new(1, Color3.fromRGB(23, 23, 32)) })
            }),
            u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 20)
            }),
            ["TitlesWrapper"] = u5.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.125, 0),
                    ["PaddingBottom"] = UDim.new(0.125, 0),
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0)
                }),
                u5.createElement("UIListLayout", {
                    ["VerticalAlignment"] = "Center",
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.05, 0)
                }),
                u5.createElement("TextLabel", {
                    ["Text"] = "AFK AREA",
                    ["TextScaled"] = true,
                    ["TextStrokeTransparency"] = 1,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.4, 0.45),
                    ["FontFace"] = Font.fromName(u8.Theme.font.Name, Enum.FontWeight.Heavy),
                    ["Font"] = u8.Theme.font,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Bottom,
                    ["TextColor3"] = u3.WHITE
                }),
                u5.createElement(u9, {
                    ["AppId"] = "AfkPlaceTimer",
                    ["LayoutOrder"] = 2,
                    ["AfkStartTime"] = p10.AfkStartTime,
                    ["ReturnButtonPressed"] = p10.ReturnButtonPressed,
                    ["MountedStartTime"] = p10.MountedStartTime,
                    ["size"] = Vector2.new(0.3, 0.3)
                })
            }),
            ["ImageContainer"] = u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 0.9),
                ["Position"] = UDim2.fromScale(0.75, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["AutomaticSize"] = Enum.AutomaticSize.None,
                ["BackgroundColor3"] = u3.WHITE
            }, { u5.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeXY",
                    ["Image"] = "rbxassetid://122356771310461",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 1.7),
                    ["ScaleType"] = Enum.ScaleType.Crop,
                    ["Position"] = UDim2.fromScale(0, -0.45)
                }) })
        })
    }
    return v12(v13)
end)
return {
    ["AFKHeader"] = v7.connect(function(_, p15) --[[ Line: 88 ]]
        local v16 = {}
        for v17, v18 in p15 do
            v16[v17] = v18
        end
        return v16
    end)(v14)
}