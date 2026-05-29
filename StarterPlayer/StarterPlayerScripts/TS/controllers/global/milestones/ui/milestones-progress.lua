local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "milestones-config").milestonesLayout
local u12 = nil
local u13 = nil
local function v42(p14, _) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u10
        [4] = u4
        [5] = u12
        [6] = u13
        [7] = u7
        [8] = u3
        [9] = u8
    --]]
    local u15 = p14.store.Bedwars.playerLevel
    local u16 = p14.store.Bedwars.playerLevelTotalExperience
    local function v33(p17, p18) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u10
            [4] = u4
            [5] = u12
            [6] = u15
            [7] = u16
            [8] = u13
            [9] = u7
            [10] = u3
        --]]
        local v19 = u5.createFragment
        local v20 = {}
        local v21 = u5.createElement
        local v22 = "Frame"
        local v23 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v24 = UDim2.new
        local v25 = 0
        local v26
        if p18 == 0 then
            v26 = u11.distanceX / 2
        else
            v26 = u11.distanceX
        end
        v23.Size = v24(v25, v26, 1, 0)
        v23.BackgroundColor3 = u10.backgroundPrimary
        local v27 = {}
        local v28 = u5.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Progress"] = u12(u15, u16, p17, p18),
            ["BarColor"] = u11.progressBarColor,
            ["BarBackgroundColor"] = u11.progressBarBackgroundColor
        }, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) })
        local v29 = u5.createElement
        local v30 = "ImageLabel"
        local v31 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(1, u13(u15, p17) and 0.9 or 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Image"] = u7.CIRCLE_SOLID
        }
        local v32
        if u13(u15, p17) then
            v32 = u3.WHITE
        else
            v32 = u3.hexColor(4079463)
        end
        v31.ImageColor3 = v32
        v31.ScaleType = Enum.ScaleType.Fit
        __set_list(v27, 1, {v28, v29(v30, v31), u5.createElement("ImageLabel", {
    ["BorderSizePixel"] = 0,
    ["BackgroundTransparency"] = 1,
    ["ZIndex"] = 11,
    ["Size"] = UDim2.fromScale(1, 1),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["Image"] = u7.CIRCLE_CHECK_SOLID,
    ["ImageColor3"] = u11.progressBarColor,
    ["ImageTransparency"] = u13(u15, p17) and 0 or 1,
    ["ScaleType"] = Enum.ScaleType.Fit
})})
        v20.MilestonesProgressBar = v21(v22, v23, v27)
        return v19(v20)
    end
    local v34 = table.create(#u8)
    for v35, v36 in u8 do
        v34[v35] = v33(v36, v35 - 1, u8)
    end
    local v37 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = p14.Size,
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["BackgroundColor3"] = u3.BLACK,
        ["LayoutOrder"] = p14.LayoutOrder
    }
    local v38 = { u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v39 = #v38
    for v40, v41 in v34 do
        v38[v39 + v40] = v41
    end
    return u5.createFragment({
        ["MilestonesProgress"] = u5.createElement("Frame", v37, v38)
    })
end
u13 = function(p43, p44) --[[ Name: meetsLevelRequirement, Line 94 ]]
    return p44.levelRequirement <= p43
end
u12 = function(p45, p46, p47, p48) --[[ Name: getProgress, Line 97 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u8
    --]]
    if u13(p45, p47) then
        return 1
    end
    local v49 = math
    local v50 = u9.levelSystem
    local v51 = u8[p48 - 1 + 1]
    if v51 ~= nil then
        v51 = v51.levelRequirement
    end
    local v52 = (p46 - v50:getTotalExperienceForLevel(v51 == nil and 0 or v51)) / u9.levelSystem:getTotalExperienceForLevel(p47.levelRequirement)
    return v49.max(0, v52)
end
return {
    ["meetsLevelRequirement"] = u13,
    ["getProgress"] = u12,
    ["MilestonesProgress"] = v6.new(u5)(v42)
}