local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Countdown
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v13 = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u5
        [4] = u3
    --]]
    local _ = p10.useState
    local _ = p10.useEffect
    local v11 = u6.createFragment
    local v12 = {
        ["MatchEventCountdown"] = u6.createElement("Frame", {
            ["BackgroundTransparency"] = 0.3,
            ["Size"] = UDim2.fromScale(u4.isMobileControls() and 0.25 or 0.2, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, {
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 8)
            }),
            u6.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = p9.image
            }),
            u6.createElement(u5, {
                ["AutomaticSize"] = "X",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 1)
            }, {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Left",
                    ["Padding"] = UDim.new(0, 0.15)
                }),
                u6.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.1, 0),
                    ["PaddingBottom"] = UDim.new(0.1, 0)
                }),
                ["Title"] = u6.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["Font"] = "GothamBold",
                    ["TextScaled"] = true,
                    ["RichText"] = false,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0.3,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 0.3),
                    ["Text"] = p9.name,
                    ["TextColor3"] = Color3.fromRGB(255, 212, 13)
                }),
                u6.createElement(u3, {
                    ["EndTime"] = p9.time,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false
                    },
                    ["TextLabel"] = {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0, 0.55),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    }
                }, { u6.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = Color3.fromRGB(0, 0, 0)
                    }) })
            })
        })
    }
    return v11(v12)
end)
return {
    ["MatchEventCountdown"] = v8.connect(function(_, p14) --[[ Line: 89 ]]
        local v15 = {}
        for v16, v17 in p14 do
            v15[v16] = v17
        end
        return v15
    end)(v13)
}