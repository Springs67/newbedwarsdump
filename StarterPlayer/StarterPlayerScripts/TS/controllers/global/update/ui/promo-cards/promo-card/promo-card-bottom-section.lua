local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["GameUpdateKitCardBottom"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local _ = p7.useState
        local v8 = u5.createFragment
        local v9 = {
            ["BottomHalf"] = u5.createElement("Frame", {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 0)
            }, {
                u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 8 or 14),
                    ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 8 or 14),
                    ["PaddingLeft"] = p6.PaddingHorizontal,
                    ["PaddingRight"] = p6.PaddingHorizontal
                }),
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 6)
                }),
                u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["Text"] = "Description:",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0.9, 0, 0, 0),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u3.WHITE
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u4.isSmallScreen() and 14 or 18
                    }) }),
                u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["TextTransparency"] = 0.2,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0.9, 0, 0, 0),
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u3.WHITE,
                    ["Text"] = p6.Description
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u4.isSmallScreen() and 14 or 18
                    }) })
            })
        }
        return v8(v9)
    end)
}