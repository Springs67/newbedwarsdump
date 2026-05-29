local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Button
local u5 = v2.ColorUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = {
    "LEATHER",
    "IRON",
    "DIAMOND",
    "EMERALD"
}
return {
    ["ArmorTrimSwitchArmorTypeButton"] = v8.new(u7)(function(u11) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u4
            [4] = u5
            [5] = u9
            [6] = u6
            [7] = u3
        --]]
        local v12 = {}
        for v13, v14 in u11 do
            v12[v13] = v14
        end
        v12.OnSwitchArmorSet = nil
        v12.CurrentArmorSet = nil
        local v15 = u11.ZIndex
        local v16 = type(v15) ~= "number" and 1 or u11.ZIndex
        local v20 = {
            ["OnClick"] = function() --[[ Name: OnClick, Line 23 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u10
                --]]
                local v17 = u11.CurrentArmorSet or "LEATHER"
                local v18 = (table.find(u10, v17) or 0) - 1
                local v19 = u10[((v18 < 0 and 0 or v18) + 1) % #u10 + 1]
                u11.OnSwitchArmorSet(v19)
            end
        }
        for v21, v22 in v12 do
            v20[v21] = v22
        end
        return u7.createElement(u4, v20, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u7.createElement("Frame", {
                ["BackgroundTransparency"] = 0.75,
                ["BackgroundColor3"] = u5.BLACK,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["ZIndex"] = v16 + 1
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.22, 0)
                }), u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = u9.SHIELD,
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["ZIndex"] = v16 + 2
                }) }), u7.createElement(u6, {}, { u7.createElement(u3, {
                    ["Text"] = "Switch Armor Type",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end)
}