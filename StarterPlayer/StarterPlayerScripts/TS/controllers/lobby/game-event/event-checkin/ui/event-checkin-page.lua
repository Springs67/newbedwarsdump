local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ButtonComponent
local u6 = v3.ColorUtil
local u7 = v3.ConfettiExplosion
local u8 = v3.Countdown
local u9 = v3.DeviceUtil
local u10 = v3.Empty
local u11 = v3.Padding
local u12 = v3.ResetTime
local u13 = v3.ShineEffect
local u14 = v3.SoundManager
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system-meta").getCheckInSystemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-util").CheckInUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v104 = v17.new(u16)(function(u28, p29) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u20
        [3] = u21
        [4] = u12
        [5] = u9
        [6] = u15
        [7] = u16
        [8] = u27
        [9] = u6
        [10] = u24
        [11] = u7
        [12] = u19
        [13] = u11
        [14] = u4
        [15] = u10
        [16] = u8
        [17] = u23
        [18] = u14
        [19] = u26
        [20] = u13
        [21] = u5
        [22] = u2
        [23] = u25
    --]]
    local v30 = p29.useState
    local v31 = p29.useEffect
    local u32, u33 = v30(false)
    local v34 = u22[u28.EventType]
    local v35 = u20(u28.CheckInSystem)
    local u36
    if u28.checkInData then
        u36 = u21.hasCheckedIn(u28.checkInData, u28.CheckInSystem)
    else
        u36 = false
    end
    local v37 = math
    local v38 = os.time()
    local v39 = v35.timePeriod
    if v39 ~= nil then
        v39 = v39.startTime
    end
    if v39 == nil then
        v39 = v34.startDate
    end
    local v40 = (v38 - v39) / 86400
    local v41 = v37.ceil(v40)
    local v42 = u28.checkInData
    local v43 = v42 ~= nil and #v42.checkIns or v42
    local u44 = v41 - (v43 == nil and 0 or v43)
    local v45 = u12.new(v34.startDate):getNextDailyResetTime()
    v31(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u9
            [3] = u15
        --]]
        if not (u28.checkInData or u9.isHoarceKat()) then
            u15.Controllers.CheckinController:requestCheckInData(u28.CheckInSystem)
        end
    end, {})
    local v46 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v47 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.01, 0)
        }), u16.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0),
            ["PaddingBottom"] = UDim.new(0.02, 0),
            ["PaddingLeft"] = UDim.new(0.02, 0),
            ["PaddingRight"] = UDim.new(0.02, 0)
        }) }
    local v48 = #v47
    local v49 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.875)
    }
    local v50 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }) }
    local _ = #v50
    local v51 = v35.rewards
    local v52
    if v51 == nil then
        v52 = v51
    else
        local function v80(p53, p54) --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u27
                [3] = u16
                [4] = u6
                [5] = u24
                [6] = u32
                [7] = u7
                [8] = u19
            --]]
            local v55 = u28.checkInData
            local v56 = v55 ~= nil and #v55.checkIns or v55
            local v57 = v56 == nil and 0 or v56
            local v58 = p54 < v57
            local v59 = v57 == p54
            local v60
            if p54 >= 0 then
                v60 = p54 == v57 - 1
            else
                v60 = false
            end
            local v61 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u27.backgroundPrimary
            }
            local v62 = {}
            local v63 = u16.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            })
            local v64 = u16.createElement
            local v65 = "UIStroke"
            local v66 = {
                ["Thickness"] = 2
            }
            local v67
            if v59 then
                v67 = Color3.fromRGB(155, 202, 240)
            else
                v67 = Color3.fromRGB(155, 159, 240)
            end
            v66.Color = v67
            v66.Transparency = v58 and 1 or 0
            local v68 = v64(v65, v66)
            local v69 = u16.createElement
            local v70 = "Frame"
            local v71 = {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.15)
            }
            local v72
            if v59 then
                v72 = Color3.fromRGB(155, 202, 240)
            else
                v72 = Color3.fromRGB(155, 159, 240)
            end
            v71.BackgroundColor3 = v72
            local v73 = {}
            local v74 = u16.createElement
            local v75 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextYAlignment"] = "Center",
                ["TextXAlignment"] = "Center",
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.8)
            }
            local v76 = p54 + 1
            v75.Text = tostring(v76)
            v75.TextColor3 = u6.WHITE
            v75.Font = Enum.Font.SourceSansBold
            __set_list(v73, 1, {v74("TextLabel", v75)})
            __set_list(v62, 1, {v63, v68, v69(v70, v71, v73)})
            local v77 = #v62
            if v58 then
                v58 = u16.createFragment({
                    ["Background"] = u16.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 0.3,
                        ["ZIndex"] = 4,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = u6.BLACK
                    }, { u16.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 3)
                        }), u16.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 4,
                            ["Size"] = UDim2.fromScale(0.4, 0.4),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = u24.CIRCLE_CHECK_SOLID,
                            ["ScaleType"] = Enum.ScaleType.Fit
                        }) })
                })
            end
            if v58 then
                v62[v77 + 1] = v58
            end
            local v78 = #v62
            local v79 = v60 and u32
            if v79 then
                v79 = u16.createElement(u7, {
                    ["Lifetime"] = 1.45,
                    ["ZIndex"] = 100,
                    ["Size"] = UDim2.fromScale(7, 7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            end
            if v79 then
                v62[v78 + 1] = v79
            end
            v62[#v62 + 1] = u16.createElement(u19, {
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.67, 0.67),
                ["Reward"] = p53,
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
            v62.GradientGlow = u16.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u16.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u6.BLACK), ColorSequenceKeypoint.new(1, Color3.fromRGB(95, 202, 255)) }),
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) })
            return u16.createFragment({
                ["RewardCard"] = u16.createElement("Frame", v61, v62)
            })
        end
        v52 = table.create(#v51)
        for v81, v82 in v51 do
            v52[v81] = v80(v82, v81 - 1, v51)
        end
    end
    local v83 = {
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
    }
    local v84 = { u16.createElement(u11, {
            ["Padding"] = {
                ["Vertical"] = 2,
                ["Horizontal"] = 2
            }
        }), u16.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 5,
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["CellSize"] = UDim2.new(0, 112.52, 0, 93.12),
            ["CellPadding"] = UDim2.fromOffset(16, 16)
        }) }
    local v85 = #v84
    for v86, v87 in v52 do
        v84[v85 + v86] = v87
    end
    v50.RewardList = u16.createElement(u4, v83, v84)
    v47[v48 + 1] = u16.createElement(u10, v49, v50)
    local v88 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.95, 0.1)
    }
    local v89 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.025, 0)
        }) }
    local v90 = #v89
    local v91 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.7, 1)
    }
    local v92 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.025, 0)
        }) }
    local v93 = #v92
    local v94
    if u36 then
        v94 = u16.createElement(u8, {
            ["EndTime"] = v45,
            ["TextLabel"] = {
                ["LayoutOrder"] = 3,
                ["RichText"] = false,
                ["Size"] = UDim2.fromScale(0.3, 1)
            }
        })
    else
        v94 = u36
    end
    if v94 then
        v92[v93 + 1] = v94
    end
    local _ = #v92
    local v95 = {
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 3,
        ["Selectable"] = true,
        ["Size"] = UDim2.fromScale(0.4, 1),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["Text"] = u23.isEventRunning(u28.EventType) and (u36 and "CHECKED IN" or "CHECK IN") or "Event Ended"
    }
    local v96
    if u36 then
        v96 = u6.darken(u27.backgroundSuccess, 0.75)
    else
        v96 = u27.backgroundSuccess
    end
    v95.BackgroundColor3 = v96
    function v95.OnClick(_, _) --[[ Line: 282 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u28
            [3] = u15
            [4] = u14
            [5] = u26
            [6] = u33
        --]]
        if not u23.isEventRunning(u28.EventType) then
            return nil
        end
        u15.Controllers.CheckinController:recordCheckIn(u28.CheckInSystem):andThen(function(p97) --[[ Line: 287 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u26
                [3] = u33
            --]]
            if p97 then
                task.spawn(function() --[[ Line: 289 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u26
                    --]]
                    u14:playSound(u26.TEAM_UPGRADE_PURCHASE)
                end)
                u33(true)
            end
        end)
    end
    v95.TextColor3 = u6.WHITE
    v95.TextTransparency = u36 and 0.3 or 0
    v95.Disabled = u36 or not u23.isEventRunning(u28.EventType)
    v95.CornerRadius = UDim.new(0, 3)
    local v98 = {}
    local v99 = #v98
    local v100 = not u36
    if v100 then
        v100 = u16.createElement(u13)
    end
    if v100 then
        v98[v99 + 1] = v100
    end
    local v101 = #v98
    local v102 = not u36
    if v102 then
        v102 = u16.createFragment({
            ["CustomButtonStroke"] = u16.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u16.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }), u16.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = u6.WHITE
                }, { u16.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5DFF4F")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5DFF4F")) }),
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
                    }) }) })
        })
    end
    if v102 then
        v98[v101 + 1] = v102
    end
    v92.CheckInButton = u16.createElement(u5, v95, v98)
    v92.CheckInDesc = u16.createElement("TextLabel", {
        ["Text"] = "(Automatically checks in when you play a match)",
        ["RichText"] = true,
        ["TextScaled"] = true,
        ["Font"] = "GothamBlack",
        ["BackgroundTransparency"] = 1,
        ["TextXAlignment"] = "Left",
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.3, 1),
        ["TextColor3"] = u6.WHITE
    })
    v89[v90 + 1] = u16.createElement(u10, v91, v92)
    v89[v90 + 2] = u16.createElement(u10, {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.3, 1)
    }, { u16.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.8, 1),
            ["Position"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["BackgroundColor3"] = u27.backgroundPrimary
        }, {
            u16.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }),
            u16.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            u16.createElement("Frame", {
                ["LayoutOrder"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.35, 0.7),
                ["BackgroundColor3"] = u27.backgroundTertiary
            }, { u16.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }), u16.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = tostring(u44),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }) }),
            ["CatchUpDayButton"] = u16.createElement(u5, {
                ["Text"] = "CATCH UP",
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 2,
                ["Selectable"] = true,
                ["Size"] = UDim2.fromScale(0.45, 0.7),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["BackgroundColor3"] = u27.mcGold,
                ["OnClick"] = function(_, _) --[[ Name: OnClick, Line 395 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u28
                        [3] = u36
                        [4] = u2
                        [5] = u44
                        [6] = u25
                        [7] = u14
                        [8] = u26
                    --]]
                    if u23.isEventRunning(u28.EventType) then
                        if u36 then
                            if u44 > 0 then
                                u25.Client:Get("CatchUpMissedCheckIn"):CallServerAsync(u28.CheckInSystem):andThen(function(p103) --[[ Line: 407 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u14
                                        [2] = u26
                                    --]]
                                    if p103 then
                                        u14:playSound(u26.TEAM_UPGRADE_PURCHASE)
                                    end
                                end)
                            else
                                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                                    ["message"] = "You haven\'t missed any days!"
                                })
                            end
                        else
                            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                                ["message"] = "Check In First!"
                            })
                            return nil
                        end
                    else
                        return nil
                    end
                end,
                ["Disabled"] = not u23.isEventRunning(u28.EventType),
                ["TextColor3"] = u6.WHITE,
                ["CornerRadius"] = UDim.new(0, 3)
            })
        }) })
    v47[v48 + 2] = u16.createElement(u10, v88, v89)
    return u16.createFragment({
        ["CheckInpage"] = u16.createElement(u10, v46, v47)
    })
end)
return {
    ["EventCheckinPage"] = v18.connect(function(p105, p106) --[[ Line: 434 ]]
        local v107 = {}
        for v108, v109 in p106 do
            v107[v108] = v109
        end
        v107.checkInData = p105.Lobby.checkInData[p106.CheckInSystem]
        return v107
    end)(v104)
}