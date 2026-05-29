local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-outcome").MatchOutcome
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent.Parent.Parent, "labelled-text", "labelled-text").LabelledText
return {
    ["MatchHistoryEntryCard"] = v6.new(u5)(function(u15, p16) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
            [3] = u12
            [4] = u4
            [5] = u5
            [6] = u8
            [7] = u7
            [8] = u9
            [9] = u10
            [10] = u13
            [11] = u14
            [12] = u2
        --]]
        local _ = p16.useState
        local v17 = nil
        for v18, v19 in u15.match.players do
            local _ = v18 - 1
            if v19.playerInfo.userId == u15.userId == true then
                v17 = v19
                break
            end
        end
        local v20
        if v17 == nil then
            v20 = v17
        else
            v20 = v17.generic.matchOutcome
        end
        local v21 = u3.hexColor(5832693)
        local v22 = u11.CIRCLE_HOLLOW
        local v23
        if v20 then
            if v20 == u12.WIN then
                v22 = u11.TROPHY_SOLID
                v21 = u3.hexColor(16772696)
                v23 = "VICTORY"
            elseif v20 == u12.LOSS then
                v22 = u11.STAT_UPGRADE_DESTRUCTION
                v21 = u3.hexColor(14408667)
                v23 = "DEFEAT"
            else
                v22 = u11.QUESTION_MARK_SOLID
                v21 = u3.hexColor(14408667)
                v23 = "PENDING"
            end
        else
            v23 = "TIE"
        end
        if u15.match.matchCancelled then
            v21 = u3.hexColor(5832693)
            v22 = u11.CIRCLE_HOLLOW
            v23 = "Cancelled"
        end
        local v24 = DateTime.fromUnixTimestamp(u15.match.matchStartTime):FormatLocalTime("llll", "en-us")
        local v25 = u15.match.matchDuration
        local v26 = v25 / 60
        local v27 = math.floor(v26)
        local v28 = v25 - v27 * 60
        local v29 = math.floor(v28)
        local v30 = tostring(v27) .. "m " .. tostring(v29) .. "s"
        local v31 = not u15.match
        if not v31 then
            local v32 = u15.match.mapId
            if v32 == "" then
                v32 = false
            end
            v31 = not v32
        end
        if v31 then
            u4:default():Info("[MATCH HISTORY] {matchId}", u15.match.matchId)
            return u5.createFragment()
        end
        local v33 = u8(u15.match.queueType).title
        local v34 = u7.getMapDisplayName(u15.match.mapId)
        local v35 = u7.getMapImage(u15.match.mapId)
        local v36
        if v17 == nil then
            v36 = v17
        else
            v36 = v17.bedwars.kit
        end
        if v36 == nil then
            v36 = u9.NONE
        end
        local v37 = u10(v36).renderImage
        local v38 = u15.match.teams
        local function v43(p39) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            local v40 = false
            local v41 = v40
            for _, v42 in p39.members do
                if v42.userId == u15.userId then
                    v40 = true
                    v41 = v40
                end
            end
            return v41
        end
        local v44 = nil
        for v45, v46 in v38 do
            if v43(v46, v45 - 1, v38) == true then
                v44 = v46
                break
            end
        end
        local v47
        if v44 == nil then
            v47 = v44
        else
            v47 = v44.name
        end
        local v48 = v47 == nil and "N/A" or v47
        local v49
        if v44 == nil then
            v49 = v44
        else
            v49 = v44.colorHex
        end
        local v50
        if v49 == "" or not v49 then
            v50 = u3.WHITE
        else
            v50 = Color3.fromHex(v44.colorHex)
        end
        if v17 ~= nil then
            v17 = v17.ranked
            if v17 ~= nil then
                v17 = v17.rpDelta
            end
        end
        local v51 = {
            ["Size"] = UDim2.new(1, 0, 0, 70),
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u3.WHITE,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = u15.LayoutOrder,
            [u5.Event.Activated] = function() --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.onClick()
            end
        }
        local v52 = {}
        local v53 = u5.createElement("ImageLabel", {
            ["ImageTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.73, 1),
            ["Image"] = v35,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["BackgroundColor3"] = u3.WHITE
        }, { u5.createElement("UIGradient", {
                ["Rotation"] = 0,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.26, 0.55), NumberSequenceKeypoint.new(1, 1) })
            }) })
        local v54 = u5.createElement
        local v55 = "UIGradient"
        local v56 = {
            ["Rotation"] = 0
        }
        local v57 = ColorSequence.new
        local v58 = {}
        local v59 = ColorSequenceKeypoint.new
        local v60 = 0
        local v61
        if v20 == u12.WIN then
            v61 = u3.darken(u13.backgroundSuccess, 0.6)
        else
            v61 = u3.darken(u13.backgroundTertiaryCard, 1)
        end
        local v62 = v59(v60, v61)
        local v63 = ColorSequenceKeypoint.new
        local v64 = 0.26
        local v65
        if v20 == u12.WIN then
            v65 = u3.darken(u13.backgroundSuccess, 0.4)
        else
            v65 = u3.darken(u13.backgroundTertiaryCard, 1)
        end
        __set_list(v58, 1, {v62, v63(v64, v65), ColorSequenceKeypoint.new(1, u13.backgroundTertiaryCard)})
        v56.Color = v57(v58)
        __set_list(v52, 1, {v53, v54(v55, v56)})
        local _ = #v52
        local v66 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v67 = {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["Results"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.14, 1)
            }, { u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.6,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = v22,
                    ["ImageColor3"] = v21
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }), u5.createElement("TextLabel", {
                    ["TextSize"] = 20,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Text"] = v23,
                    ["TextColor3"] = v21,
                    ["Font"] = Enum.Font.LuckiestGuy
                }) }),
            ["KitUsed"] = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.12, 1)
            }, { u5.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["ClipsDescendants"] = true,
                    ["Size"] = UDim2.fromScale(0.95, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, { u5.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["ImageTransparency"] = 0,
                        ["Size"] = UDim2.fromScale(1.5, 1.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.7),
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        ["Image"] = v37
                    }, { u5.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }) }) })
        }
        local _ = #v67
        local v68 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.27, 1),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v69 = { u5.createElement("UIGradient", {
                ["Rotation"] = 0,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u13.backgroundTertiary), ColorSequenceKeypoint.new(1, u13.backgroundTertiary) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.9, 0.5), NumberSequenceKeypoint.new(1, 0.5) })
            }) }
        local v70 = #v69
        local v71 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v72 = {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["Padding"] = UDim.new(0, 8)
            }),
            ["StartTime"] = u5.createElement("TextLabel", {
                ["LayoutOrder"] = 0,
                ["TextSize"] = 15,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Text"] = v24,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Right
            })
        }
        local v73 = #v72
        local v74 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v75 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local _ = #v75
        local v76 = {
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.4, 1)
            },
            ["Image"] = u11.SERVER_ICON
        }
        local v77 = u15.match.serverRegion
        if v77 ~= nil then
            v77 = v77.countryCode
        end
        local v78 = tostring(v77) .. "-"
        local v79 = u15.match.serverRegion
        if v79 ~= nil then
            v79 = v79.region
        end
        v76.Text = v78 .. tostring(v79)
        v76.TextProps = {
            ["TextSize"] = 20,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
            ["TextXAlignment"] = Enum.TextXAlignment.Right
        }
        v76.ListLayoutProps = {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
        }
        v76.LayoutOrder = 1
        v76.ImageLeft = true
        v76.TextScale = 1.2
        v76.Padding = UDim.new(0, 5)
        v75.Region = u5.createElement(u14, v76)
        v75.Duration = u5.createElement(u14, {
            ["LayoutOrder"] = 1,
            ["ImageLeft"] = true,
            ["TextScale"] = 1.2,
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(0.4, 1)
            },
            ["Image"] = u11.HUD_TIMER_ICON,
            ["Text"] = v30,
            ["TextProps"] = {
                ["TextSize"] = 20,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Right
            },
            ["ListLayoutProps"] = {
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
            },
            ["Padding"] = UDim.new(0, 5)
        })
        v72[v73 + 1] = u5.createElement(u2, v74, v75)
        v69[v70 + 1] = u5.createElement("Frame", v71, v72)
        v67.TimeInfo = u5.createElement("Frame", v68, v69)
        v67.QueueInfo = u5.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.25, 1)
        }, { u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.95, 0.95),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5)
            }, {
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                    ["Padding"] = UDim.new(0, 8)
                }),
                ["QueueType"] = u5.createElement("TextLabel", {
                    ["LayoutOrder"] = 0,
                    ["TextSize"] = 16,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Text"] = v33,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }),
                ["Map"] = u5.createElement("TextLabel", {
                    ["LayoutOrder"] = 1,
                    ["TextSize"] = 16,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Text"] = v34,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
                })
            }) })
        local v80 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.22, 1)
        }
        local v81 = {}
        local v82 = #v81
        local v83 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.95, 0.95),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v84 = {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 8)
            }),
            ["TeamName"] = u5.createElement("TextLabel", {
                ["LayoutOrder"] = 0,
                ["TextSize"] = 16,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Text"] = "Team: <font color=\"" .. u3.richTextColor(v50) .. "\">" .. v48 .. "</font>",
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        }
        local v85 = #v84
        local v86
        if v17 == nil then
            v86 = false
        else
            local v87 = u5.createFragment
            local v88 = {}
            local v89 = u5.createElement
            local v90 = u14
            local v91 = {
                ["LayoutOrder"] = 1,
                ["ImageLeft"] = true,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(1, 0.2)
                }
            }
            local v92 = v17 >= 0 and "+" or "-"
            local v93 = math.abs(v17)
            v91.Text = "<b>" .. v92 .. tostring(v93) .. "</b>"
            v91.TextProps = {
                ["RichText"] = true,
                ["TextSize"] = 16,
                ["TextColor3"] = u3.WHITE
            }
            local v94
            if v17 >= 0 then
                v94 = u11.CARET_UP
            else
                v94 = u11.CARET_DOWN
            end
            v91.Image = v94
            local v95 = {}
            local v96
            if v17 >= 0 then
                v96 = u13.backgroundSuccess
            else
                v96 = u13.backgroundError
            end
            v95.ImageColor3 = v96
            v91.ImageProps = v95
            v91.Padding = UDim.new(0, 5)
            v88.RankDelta = v89(v90, v91)
            v86 = v87(v88)
        end
        if v86 then
            v84[v85 + 1] = v86
        end
        v81[v82 + 1] = u5.createElement("Frame", v83, v84)
        v67.GameInfo = u5.createElement("Frame", v80, v81)
        v52.MatchInfo = u5.createElement("Frame", v66, v67)
        return u5.createFragment({
            ["MatchHistoryEntryCard"] = u5.createElement("ImageButton", v51, v52)
        })
    end)
}