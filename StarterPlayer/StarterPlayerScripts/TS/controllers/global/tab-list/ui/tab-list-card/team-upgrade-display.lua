local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta")
local u9 = v8.getSortedTeamUpgrades
local u10 = v8.getTeamUpgradeDefinition
local v50 = v6.new(u5)(function(u11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u5
        [4] = u4
        [5] = u3
    --]]
    local _ = p12.useState
    local _ = p12.useEffect
    local v13 = u9()
    local function v20(p14) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
        --]]
        local v15 = 0
        local v16 = u11.TeamUpgrades
        if v16 then
            v16 = u11.TeamUpgrades[p14] ~= nil
        end
        if v16 then
            local v17 = u11.TeamUpgrades[p14]
            v15 = v17 == nil and 0 or v17
        end
        local v18 = {
            ["stat"] = p14
        }
        local v19 = u10(p14)
        if v19 ~= nil then
            v19 = v19.icon
        end
        v18.icon = v19
        v18.level = v15
        return v18
    end
    local u21 = table.create(#v13)
    for v22, v23 in v13 do
        u21[v22] = v20(v23, v22 - 1, v13)
    end
    local v24 = {
        ["ZIndex"] = 5
    }
    local v25 = u11.FrameProps
    if v25 then
        for v26, v27 in v25 do
            v24[v26] = v27
        end
    end
    local function v42(p28, p29) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u21
            [4] = u3
            [5] = u11
        --]]
        local v30 = u5.createFragment
        local v31 = {}
        local v32 = u5.createElement
        local v33 = u4
        local v34 = {
            ["Size"] = UDim2.fromScale(1 / #u21 - 0.03, 0.9)
        }
        local v35 = {}
        local v36 = u5.createElement
        local v37 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 61,
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = p28.icon,
            ["ImageColor3"] = u3.WHITE,
            ["ImageTransparency"] = u11.Eliminated == true and 0.75 or 0.15,
            ["LayoutOrder"] = p29
        }
        local v38 = { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), (u5.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = ColorSequence.new(Color3.fromRGB(213, 217, 229), Color3.fromRGB(189, 191, 201)),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
            })) }
        local v39 = u5.createElement
        local v40 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 62,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(1, 1.2)
        }
        local v41 = p28.level
        v40.Text = "<b>" .. tostring(v41) .. "</b>"
        v40.Font = Enum.Font.SourceSans
        v40.TextColor3 = u3.WHITE
        v40.TextTransparency = u11.Eliminated == true and 0.6 or 0
        v40.TextXAlignment = Enum.TextXAlignment.Right
        v40.TextYAlignment = Enum.TextYAlignment.Bottom
        v38.StatUpgradeTabLevel = v39("TextLabel", v40)
        v35.StatUpgradeTabIcon = v36("ImageLabel", v37, v38)
        v31.StatUpgradeTabDisplay = v32(v33, v34, v35)
        return v30(v31)
    end
    local v43 = table.create(#u21)
    for v44, v45 in u21 do
        v43[v44] = v42(v45, v44 - 1, u21)
    end
    local v46 = { u5.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Center",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["Padding"] = UDim.new(0.03, 0)
        }), u5.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.03, 0)
        }) }
    local v47 = #v46
    for v48, v49 in v43 do
        v46[v47 + v48] = v49
    end
    return u5.createElement(u4, v24, v46)
end)
return {
    ["TeamUpgradeDisplay"] = v7.connect(function(p51, p52) --[[ Line: 132 ]]
        local v53 = {}
        for v54, v55 in p52 do
            v53[v54] = v55
        end
        v53.TeamUpgrades = p51.Bedwars.teamUpgrades[p52.Team.id]
        return v53
    end)(v50)
}