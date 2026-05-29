local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "oasis", "oasis-constants")
local u5 = v4.OasisTargetIndicator
local u6 = v4.OasisVesselMode
return {
    ["OasisVesselModeUi"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u6
        --]]
        local _ = p8.useState
        local v9 = u2.createFragment
        local v10 = {
            ["OasisModeIndicator"] = u2.createElement("Frame", {
                ["BackgroundTransparency"] = 0.5,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }, {
                u2.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }),
                u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 3.667
                }),
                u2.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder"
                }),
                u2.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u5[p7.mode].Icon
                }, { u2.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }),
                u2.createElement("TextLabel", {
                    ["Font"] = "RobotoCondensed",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = "<b>" .. (p7.mode == u6.HEAL and "HEAL" or "BUFF") .. "</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1.3
                    }) })
            })
        }
        return v9(v10)
    end)
}