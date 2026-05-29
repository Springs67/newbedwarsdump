local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "milestones", "ui", "milestones-config").milestonesLayout
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["EggHuntMilestoneProgress"] = v7.new(u6)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u6
            [4] = u10
            [5] = u4
            [6] = u9
            [7] = u3
        --]]
        local _ = p12.useState
        local u13 = u5.values(u11.Milestones)
        table.sort(u13, function(p14, p15) --[[ Line: 15 ]]
            return p14.numRequired < p15.numRequired
        end)
        local function v42(p16, p17) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u8
                [4] = u6
                [5] = u10
                [6] = u4
                [7] = u9
                [8] = u3
            --]]
            local v18 = p17 > 0 and #u13[p17 - 1 + 1].rewards or 0
            local v19 = #p16.rewards
            local v20 = u11.Progress >= p16.numRequired
            local v21
            if p17 == 0 then
                v21 = u8.distanceX / 2
            else
                v21 = u8.distanceX + 30
            end
            if v19 > 1 then
                local v22 = v21 - 30
                local v23 = v19 % 2
                if v23 == 0 or (v23 ~= v23 or not v23) then
                    v21 = v22 + u8.distanceX / 2 + 30
                else
                    v21 = v22 * (v19 - 1)
                end
            end
            if v18 > 1 then
                v21 = v21 + u8.distanceX / 2
            end
            local v24 = u6.createFragment
            local v25 = {}
            local v26 = u6.createElement
            local v27 = "Frame"
            local v28 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(0, v21, 1, 0),
                ["BackgroundColor3"] = u10.backgroundPrimary,
                ["LayoutOrder"] = p17
            }
            local v29 = {}
            local v30 = u6.createElement
            local v31 = u4
            local v32 = {
                ["AcceptZero"] = true,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5)
            }
            local v33 = u11.Progress
            local v34 = p16.numRequired
            local v35
            if p17 >= 1 and v33 < u13[p17 - 1 + 1].numRequired then
                v35 = 0
            elseif v34 <= v33 then
                v35 = 1
            else
                local v36 = v33 / v34
                v35 = math.max(0, v36)
            end
            v32.Progress = v35
            v32.BarColor = u8.progressBarColor
            v32.BarBackgroundColor = u8.progressBarBackgroundColor
            local v37 = v30(v31, v32, { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }) })
            local v38 = u6.createElement
            local v39 = "ImageLabel"
            local v40 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, v20 and 0.9 or 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["Image"] = u9.CIRCLE_SOLID
            }
            local v41
            if v20 then
                v41 = u3.WHITE
            else
                v41 = u3.hexColor(4079463)
            end
            v40.ImageColor3 = v41
            v40.ScaleType = Enum.ScaleType.Fit
            __set_list(v29, 1, {v37, v38(v39, v40), u6.createElement("ImageLabel", {
    ["BorderSizePixel"] = 0,
    ["BackgroundTransparency"] = 1,
    ["ZIndex"] = 11,
    ["Size"] = UDim2.fromScale(1, 1),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["Image"] = u9.CIRCLE_CHECK_SOLID,
    ["ImageColor3"] = u8.progressBarColor,
    ["ImageTransparency"] = v20 and 0 or 1,
    ["ScaleType"] = Enum.ScaleType.Fit
})})
            v25.MilestonesProgressBar = v26(v27, v28, v29)
            return v24(v25)
        end
        local v43 = table.create(#u13)
        for v44, v45 in u13 do
            v43[v44] = v42(v45, v44 - 1, u13)
        end
        local v46 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = u11.Size,
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundColor3"] = u3.BLACK,
            ["LayoutOrder"] = u11.LayoutOrder
        }
        local v47 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v48 = #v47
        for v49, v50 in v43 do
            v47[v48 + v49] = v50
        end
        return u6.createFragment({
            ["MilestonesProgress"] = u6.createElement("Frame", v46, v47)
        })
    end)
}