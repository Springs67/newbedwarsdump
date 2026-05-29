local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["QueueRegionButton"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u8
            [4] = u5
            [5] = u4
        --]]
        local _ = p10.useState
        local v11 = {}
        local _ = #v11
        local v12 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = false,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(0.99, 0.99),
            ["Size"] = UDim2.fromScale(0.065, 0.05),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v13 = {
            u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3,
                ["AspectType"] = "ScaleWithParentSize",
                ["DominantAxis"] = "Height"
            }),
            u6.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(234, 45)
            }),
            u6.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u8.buttonPrimary), ColorSequenceKeypoint.new(1, u8.buttonPrimary) })
            }),
            u6.createElement(u5, {
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 6)
            }),
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }),
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            })
        }
        local _ = #v13
        local v14 = {
            ["Size"] = UDim2.fromScale(u4.isSmallScreen() and 1 or 0.8, u4.isSmallScreen() and 1 or 0.8),
            ["Image"] = ({
                ["EU"] = "rbxassetid://10469521157",
                ["SEA"] = "rbxassetid://10469521246",
                ["NA"] = "rbxassetid://10469464193"
            })[p9.Region],
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["ImageColor3"] = u3.WHITE,
            ["ImageTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2
        }
        v13.RegionIcon = u6.createElement("ImageLabel", v14, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }) })
        v13.Region = u6.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["TextTransparency"] = 0.5,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0, 1),
            ["Text"] = "<b>" .. p9.Region .. "</b>",
            ["TextScaled"] = not u4.isSmallScreen(),
            ["TextColor3"] = u3.WHITE
        }, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v11.QueueRegionButton = u6.createElement("ImageButton", v12, v13)
        return u6.createFragment({
            ["QueueRegionDisplay"] = u6.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, v11)
        })
    end)
}