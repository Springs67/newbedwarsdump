local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, script.Parent.Parent, "locker-util").LockerUtil
return {
    ["LockerPreviewButtons"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u4
            [4] = u5
            [5] = u11
            [6] = u3
            [7] = u10
            [8] = u7
        --]]
        local _ = p13.useState
        local _ = p13.useEffect
        local v14 = {
            ["Size"] = UDim2.new(0.75, 0, 0, 40),
            ["Position"] = UDim2.new(0.5, 0, 1, -10),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        }
        local v15 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, u6.isSmallScreen() and 12 or 6),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v16 = #v15
        local v17 = u12.CanReplay
        if v17 then
            v17 = u8.createElement(u4, {
                ["BackgroundTransparency"] = 0.4,
                ["Text"] = "<b>REPLAY</b>",
                ["TextSize"] = 24,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.8, -12, 1, 0),
                ["BackgroundColor3"] = u5.BLACK,
                ["OnClick"] = function() --[[ Name: OnClick, Line 37 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u12
                    --]]
                    u11.previewElement(u12.Element, u12.Tab, true)
                end,
                ["CornerRadius"] = UDim.new(0, 10)
            })
        end
        if v17 then
            v15[v16 + 1] = v17
        end
        local _ = #v15
        v15.MaximizeButton = u8.createElement(u3, {
            ["BackgroundTransparency"] = 0.4,
            ["LayoutOrder"] = 2,
            ["BackgroundColor3"] = u5.BLACK,
            ["Size"] = UDim2.fromScale(0.2, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 51 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u12
                --]]
                u11.openFullscreenPreview(u12.Element, u12.Tab)
            end,
            ["CornerRadius"] = UDim.new(0, 10)
        }, { u8.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u10.MAXIMIZE_ICON,
                ["ScaleType"] = Enum.ScaleType.Fit
            }), u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1,
                ["DominantAxis"] = "Height"
            }) })
        return u8.createElement(u7, v14, v15)
    end)
}