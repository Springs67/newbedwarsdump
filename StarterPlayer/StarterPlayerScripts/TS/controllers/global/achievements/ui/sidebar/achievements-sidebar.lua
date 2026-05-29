local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent, "achievements-sidebar-bottom").AchievementsSidebarBottom
local u13 = v1.import(script, script.Parent, "achievements-sidebar-center").AchievementsSidebarCenter
local u14 = v1.import(script, script.Parent, "achievements-sidebar-top").AchievementsSidebarTop
local v37 = v8.new(u7)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u11
        [4] = u7
        [5] = u6
        [6] = u4
        [7] = u14
        [8] = u13
        [9] = u12
        [10] = u3
    --]]
    local _ = p16.useState
    local v17 = p15.SelectedAch
    local v18
    if v17 then
        v18 = u10.getMeta(v17)
    else
        v18 = nil
    end
    local v19
    if v17 then
        v19 = p15.ProfileData
        if v19 ~= nil then
            v19 = v19.achievements[v17]
        end
    else
        v19 = nil
    end
    local v20
    if v19 == nil then
        v20 = v19
    else
        v20 = v19.achieved
    end
    if v20 == nil then
        v20 = false
    end
    local v21
    if v19 == nil then
        v21 = v19
    else
        v21 = v19.dateAchieved
    end
    local v22 = u5.isSmallScreen() and 5 or 10
    local v23 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u11.backgroundPrimary
    }
    local v24 = p15.FrameProps
    if v24 then
        for v25, v26 in v24 do
            v23[v25] = v26
        end
    end
    local v27 = { u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }) }
    local v28 = #v27
    local v29 = {}
    local v30 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v31
    if u5.isSmallScreen() and v17 then
        v31 = nil
    else
        v31 = UDim2.fromScale(1, 1)
    end
    v30.CanvasSize = v31
    v29.ScrollingFrameProps = v30
    local v32 = { u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, v22),
            ["PaddingBottom"] = UDim.new(0, v22),
            ["PaddingLeft"] = UDim.new(0, v22),
            ["PaddingRight"] = UDim.new(0, v22)
        }) }
    local v33 = #v32
    local v34
    if v17 == nil then
        v34 = u7.createElement(u6, {
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u7.createElement("TextLabel", {
                ["Text"] = "(Select an achievement)",
                ["TextSize"] = 24,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["TextWrapped"] = true,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }) })
    else
        v34 = false
    end
    if v34 then
        v32[v33 + 1] = v34
    end
    local v35 = #v32
    local v36
    if v17 == nil then
        v36 = false
    else
        v36 = u7.createFragment({
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["Padding"] = UDim.new(0, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }),
            u7.createElement(u14, {
                ["DateAchieved"] = v21,
                ["Achieved"] = v20,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.03)
                }
            }),
            u7.createElement(u6, {
                ["Size"] = UDim2.fromScale(0, 0.02)
            }),
            u7.createElement(u13, {
                ["AchievementId"] = v17,
                ["AchievementMeta"] = v18,
                ["ProfileData"] = p15.ProfileData,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.75)
                }
            }),
            u7.createElement(u12, {
                ["AchievementId"] = v17,
                ["AchievementMeta"] = v18,
                ["AchievementData"] = v19,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.2)
                }
            })
        })
    end
    if v36 then
        v32[v35 + 1] = v36
    end
    v27[v28 + 1] = u7.createElement(u3, v29, v32)
    return u7.createElement("Frame", v23, v27)
end)
return {
    ["AchievementsSidebar"] = v9.connect(function(p38, p39) --[[ Line: 146 ]]
        local v40 = {}
        for v41, v42 in p39 do
            v40[v41] = v42
        end
        v40.store = p38
        return v40
    end)(v37)
}