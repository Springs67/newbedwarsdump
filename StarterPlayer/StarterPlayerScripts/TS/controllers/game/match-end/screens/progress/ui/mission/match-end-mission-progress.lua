local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.MathExtras
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-context").MissionContext
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-generator-type").MissionGenerator
local u17 = nil
local u18 = nil
local function v101(u19, p20) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
        [3] = u16
        [4] = u4
        [5] = u14
        [6] = u13
        [7] = u10
        [8] = u6
        [9] = u3
        [10] = u17
        [11] = u18
        [12] = u11
        [13] = u5
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local v23, u24 = v21(nil)
    local v25 = u7.createRef()
    v22(function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u15
            [3] = u16
            [4] = u4
            [5] = u14
            [6] = u13
            [7] = u24
            [8] = u10
            [9] = u6
        --]]
        local u26 = {}
        local v27 = u19.Missions
        local function v33(p28) --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u26
                [3] = u16
            --]]
            local v29 = u15.getMission(p28.missionId)
            local v30 = u26
            local v31 = {
                ["id"] = p28.missionId,
                ["description"] = p28.description,
                ["currProgress"] = p28.startProgress,
                ["goalProgress"] = p28.goalProgress
            }
            local v32
            if v29 == nil then
                v32 = v29
            else
                v32 = v29.rewardAmount
            end
            v31.rewardAmount = v32 == nil and 1 or v32
            v31.intervalType = p28.intervalType
            if v29 ~= nil then
                v29 = v29.playerLevelReq
            end
            v31.playerLevelReq = v29 == nil and 0 or v29
            v31.tempStartProgress = p28.startProgress
            v31.tempEndProgress = p28.currentProgress
            v31.event = p28.event
            v31.generator = u16.BATTLEPASS
            table.insert(v30, v31)
        end
        for v34, v35 in v27 do
            v33(v35, v34 - 1, v27)
        end
        if u4.isHoarceKat() then
            local v36 = false
            local v37 = 0
            while true do
                if true then
                    if v36 then
                        v37 = v37 + 1
                    else
                        v36 = true
                    end
                end
                if v37 >= 1 then
                    break
                end
                local v38 = {
                    ["id"] = "1",
                    ["description"] = "Win 5 games",
                    ["currProgress"] = 0,
                    ["goalProgress"] = 5,
                    ["rewardAmount"] = 1,
                    ["playerLevelReq"] = 0,
                    ["tempStartProgress"] = 0,
                    ["tempEndProgress"] = 3,
                    ["intervalType"] = u14.DAILY,
                    ["generator"] = u16.BATTLEPASS
                }
                table.insert(u26, v38)
            end
            local v39 = false
            local v40 = 0
            while true do
                if true then
                    if v39 then
                        v40 = v40 + 1
                    else
                        v39 = true
                    end
                end
                if v40 >= 2 then
                    break
                end
                local v41 = {
                    ["id"] = "1",
                    ["description"] = "Deal 800 damage",
                    ["currProgress"] = 200,
                    ["goalProgress"] = 800,
                    ["rewardAmount"] = 1,
                    ["playerLevelReq"] = 0,
                    ["tempStartProgress"] = 200,
                    ["tempEndProgress"] = 400,
                    ["intervalType"] = u14.WEEKLY,
                    ["generator"] = u16.BATTLEPASS
                }
                table.insert(u26, v41)
            end
            local v42 = {
                ["id"] = "1",
                ["description"] = "Win 5 games",
                ["currProgress"] = 0,
                ["goalProgress"] = 5,
                ["rewardAmount"] = 1,
                ["playerLevelReq"] = 0,
                ["tempStartProgress"] = 0,
                ["tempEndProgress"] = 3,
                ["intervalType"] = u14.DAILY,
                ["event"] = u13.EGG_HUNT_2025,
                ["generator"] = u16.BATTLEPASS
            }
            table.insert(u26, v42)
        end
        u24(u26)
        local u43 = 0
        local u44 = nil
        u44 = u10.Heartbeat:Connect(function(p45) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u44
                [3] = u26
                [4] = u6
                [5] = u24
            --]]
            u43 = u43 + p45 / 2
            if u43 >= 1 then
                u43 = 1
                u44:Disconnect()
            end
            for v46, v47 in u26 do
                local _ = v46 - 1
                if v47.currProgress < v47.goalProgress then
                    v47.currProgress = u6:lerp(v47.tempStartProgress, v47.tempEndProgress, u43)
                end
                u24(u26)
            end
        end)
    end, {})
    local v48 = {
        ["Size"] = u19.Size,
        [u7.Ref] = v25,
        ["LayoutOrder"] = u19.LayoutOrder,
        ["BackgroundColor3"] = u3.BLACK,
        ["BackgroundTransparency"] = 0.7,
        ["BorderSizePixel"] = 0
    }
    local v49 = u19.FrameProps
    if v49 then
        for v50, v51 in v49 do
            v48[v50] = v51
        end
    end
    local v52 = { u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }) }
    local v53 = #v52
    local v54 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v55 = {}
    local v56 = #v55
    local v57 = {
        ["Text"] = "No mission progress to display.",
        ["TextSize"] = 25,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.9, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["TextColor3"] = Color3.fromRGB(158, 158, 158),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
    local v58 = v23 ~= nil and #v23 or v23
    v57.Visible = (v58 == nil and 0 or v58) <= 0
    v55[v56 + 1] = u7.createElement("TextLabel", v57)
    v52.NoMissionFrame = u7.createElement("Frame", v54, v55)
    local v59 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 20),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.X
    }
    local v60 = UDim2
    local v61 = u4.isSmallScreen() and 53 or 85
    local v62 = v23 ~= nil and #v23 or v23
    local v63 = v62 == nil and 0 or v62
    v59.CanvasSize = v60.fromOffset(0, v61 * v63)
    v59.BackgroundTransparency = 1
    v59.BorderSizePixel = 0
    v59.ScrollingDirection = Enum.ScrollingDirection.Y
    v59.ScrollBarThickness = 4
    v59.ScrollBarImageTransparency = 0.3
    v59.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    local v64
    if v23 == nil then
        v64 = v23
    else
        local function v94(p65) --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
                [3] = u4
                [4] = u7
                [5] = u3
                [6] = u11
                [7] = u5
            --]]
            local v66 = u17(p65)
            local v67 = u18(p65)
            local v68 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(0.95, 0, 0, u4.isSmallScreen() and 30 or 60),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v69 = { u7.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v70 = #v69
            local v71 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v72 = {
                ["MissionDescription"] = u7.createElement(u11, {
                    ["FrameProps"] = {
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["AutomaticSize"] = Enum.AutomaticSize.X
                    },
                    ["Image"] = v66,
                    ["ImageLeft"] = v66 ~= nil,
                    ["Text"] = "<b>" .. p65.description .. "</b>",
                    ["TextProps"] = {
                        ["TextScaled"] = false,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextSize"] = u4.isSmallScreen() and 13 or 16
                    },
                    ["Padding"] = UDim.new(0, 5)
                })
            }
            local _ = #v72
            local v73 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            if v67 ~= nil then
                v67 = string.upper(v67)
            end
            v73.Text = tostring(v67)
            v73.TextXAlignment = Enum.TextXAlignment.Right
            v73.TextTransparency = 0.2
            v73.TextColor3 = u3.WHITE
            v73.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v73.TextSize = u4.isSmallScreen() and 12 or 15
            v72.MissionType = u7.createElement("TextLabel", v73)
            v69.MissionTopContainer = u7.createElement("Frame", v71, v72)
            v69[v70 + 1] = u7.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 5)
            })
            local v74 = u7.createElement
            local v75 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 8 or 16)
            }
            local v76 = {}
            local v77 = u7.createElement
            local v78 = {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2
            }
            local v79 = UDim2.fromScale
            local v80 = p65.currProgress / p65.goalProgress
            v78.Size = v79(math.clamp(v80, 0, 1), 1)
            v78.BackgroundColor3 = u3.hexColor(12172543)
            v76.CurrProgress = v77("Frame", v78, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) })
            v76.TotalProgress = u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u3.hexColor(6580135)
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }) })
            v69.ProgressBar = v74("Frame", v75, v76)
            v69[v70 + 2] = u7.createElement(u5, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0, 10)
            })
            local v81 = u7.createElement
            local v82 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v83 = {}
            local v84 = u7.createElement
            local v85 = {
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0, 0)
            }
            local v86 = p65.currProgress / p65.goalProgress * 100
            local v87 = math.floor(v86)
            v85.Text = tostring(v87) .. "%"
            v85.TextColor3 = u3.WHITE
            v85.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v85.TextSize = u4.isSmallScreen() and 12 or 16
            v85.TextXAlignment = Enum.TextXAlignment.Left
            v83.MissionPercentProgress = v84("TextLabel", v85)
            local v88 = u7.createElement
            local v89 = {
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0)
            }
            local v90 = p65.currProgress
            local v91 = math.floor(v90)
            local v92 = tostring(v91)
            local v93 = p65.goalProgress
            v89.Text = v92 .. "/" .. tostring(v93)
            v89.TextColor3 = u3.WHITE
            v89.TextXAlignment = Enum.TextXAlignment.Right
            v89.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v89.TextSize = u4.isSmallScreen() and 12 or 16
            v83.MissionGoalProgress = v88("TextLabel", v89)
            v69.MissionBottomContainer = v81("Frame", v82, v83)
            return u7.createFragment({
                ["MissionWrapper"] = u7.createElement("Frame", v68, v69)
            })
        end
        v64 = table.create(#v23)
        for v95, v96 in v23 do
            v64[v95] = v94(v96, v95 - 1, v23)
        end
    end
    local v97 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 25)
        }) }
    local v98 = #v97
    if v64 then
        for v99, v100 in v64 do
            v97[v98 + v99] = v100
        end
    end
    v52[v53 + 1] = u7.createElement("ScrollingFrame", v59, v97)
    return u7.createElement("Frame", v48, v52)
end
u17 = function(p102) --[[ Name: getMissionIcon, Line 390 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
    --]]
    if p102.event == nil then
        local v103 = u15.getMissionGeneratorClass(p102.generator)
        if v103 ~= nil then
            v103 = v103:getConfig().icon
        end
        return v103
    else
        local v104 = u12[p102.event].lobbyButtonConfig
        if v104 ~= nil then
            v104 = v104.icon
        end
        return v104
    end
end
u18 = function(p105) --[[ Name: getMissionType, Line 405 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p105.event ~= nil then
        return "EVENT"
    end
    if p105.intervalType == u14.DAILY then
        return "DAILY"
    end
    if p105.intervalType == u14.WEEKLY then
        return "WEEKLY"
    end
end
local v106 = v8.new(u7)(v101)
return {
    ["MatchEndMissionProgress"] = v9.connect(function(_, p107) --[[ Line: 417 ]]
        local v108 = {}
        for v109, v110 in p107 do
            v108[v109] = v110
        end
        return v108
    end)(v106)
}