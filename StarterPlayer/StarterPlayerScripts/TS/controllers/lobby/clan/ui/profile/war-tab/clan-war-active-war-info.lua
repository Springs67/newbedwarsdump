local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "clan-war-active-banner").ClanWarActiveBanner
local u14 = v1.import(script, script.Parent, "pill-counter").PillCounter
local u15 = v1.import(script, script.Parent, "pill-text").PillText
return {
    ["ClanWarActiveWarInfo"] = v8.new(u7)(function(p16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u11
            [3] = u6
            [4] = u12
            [5] = u7
            [6] = u3
            [7] = u5
            [8] = u13
            [9] = u10
            [10] = u4
            [11] = u15
            [12] = u14
        --]]
        local _ = p17.useState
        local v18 = not p16.ActiveClanWar and 1 or u9.getDivisionMultipliers(p16.ActiveClanWar.division).matchScore
        local function v27(p19) --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u7
                [3] = u3
            --]]
            local v20 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.15),
                ["BackgroundColor3"] = u12.backgroundTertiary
            }
            local v21 = p19.LayoutOrder
            v20.LayoutOrder = v21 == nil and 5 or v21
            local v22 = u7.createElement
            local v23 = {
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.5, 0)
                }),
                u7.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0)
                }),
                ["Label"] = u7.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["TextTransparency"] = 0.3,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["Text"] = p19.Label,
                    ["TextColor3"] = u3.WHITE
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) })
            }
            local v24 = u7.createElement
            local v25 = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.7)
            }
            local v26 = p19.Value
            v25.Text = tostring(v26)
            v25.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            v25.TextColor3 = u3.WHITE
            v23.Value = v24("TextLabel", v25, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
            return v22("Frame", v20, v23)
        end
        local function u33(p28) --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
                [3] = u3
                [4] = u12
            --]]
            local v29 = u7.createElement
            local v30 = u5
            local v31 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 20)
            }
            local v32 = {
                ["Left"] = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.3, 1),
                    ["BackgroundColor3"] = u3.hexColor(8948973)
                }, { u7.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Text"] = string.upper(p28.LeftText),
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = u3.WHITE
                    }, { u7.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }) }),
                ["Right"] = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.7, 1),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["BackgroundColor3"] = u12.backgroundTertiary
                }, { u7.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Text"] = p28.RightText,
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = u12.textPrimary
                    }, { u7.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }) })
            }
            return v29(v30, v31, v32)
        end
        local v34 = u9.isClanWarsQueueLive()
        local v35 = {}
        local _ = #v35
        local v36 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.85)
        }
        local v37 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local _ = #v37
        local v38 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v39 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }), u7.createElement(u13) }
        local v40 = #v39
        local v41 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.52)
        }
        local v42 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0.02, 0)
            }) }
        local _ = #v42
        local v43 = {
            ["Size"] = UDim2.fromScale(1, 0.6)
        }
        local v44 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["Padding"] = UDim.new(0.02, 0)
            }) }
        local _ = #v44
        local v45 = u9.getClanWarUTCTimeRanges()
        local function v49(p46) --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u33
            --]]
            local v47 = p46[1]
            local v48 = p46[2]
            return u7.createElement(u33, {
                ["LeftText"] = os.date("%x", v47),
                ["RightText"] = os.date("%I:%M %p", v47) .. " - " .. os.date("%I:%M %p", v48)
            })
        end
        local v50 = table.create(#v45)
        for v51, v52 in v45 do
            v50[v51] = v49(v52, v51 - 1, v45)
        end
        local v53 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 0.49)
        }
        local v54 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["SectionTitle"] = u7.createElement("TextLabel", {
                ["Text"] = "TIME SLOTS",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 18),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v55 = #v54
        for v56, v57 in v50 do
            v54[v55 + v56] = v57
        end
        v44.TimeSlotsTableContainer = u7.createElement(u5, v53, v54)
        local v58 = u7.createElement
        local v59 = u5
        local v60 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 0.49)
        }
        local v61 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["SectionTitle"] = u7.createElement("TextLabel", {
                ["Text"] = "SCORE GUIDE",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 18),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v62 = u7.createElement
        local v63 = u5
        local v64 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v65 = {}
        local v66 = u7.createElement
        local v67 = {
            ["LeftText"] = "Win"
        }
        local v68 = 150 * v18
        v67.RightText = "+" .. tostring(v68)
        __set_list(v65, 1, {v66(u33, v67)})
        local v69 = v62(v63, v64, v65)
        local v70 = u7.createElement
        local v71 = u5
        local v72 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v73 = {}
        local v74 = u7.createElement
        local v75 = {
            ["LeftText"] = "Loss"
        }
        local v76 = 30 * v18
        v75.RightText = "+" .. tostring(v76)
        __set_list(v73, 1, {v74(u33, v75)})
        __set_list(v61, 2, {v69, v70(v71, v72, v73)})
        v44.ScoreGuideTableContainer = v58(v59, v60, v61)
        v42.TableRow = u7.createElement(u5, v43, v44)
        v42.TableRow2 = u7.createElement(u5, {
            ["Size"] = UDim2.fromScale(1, 0.36)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["Padding"] = UDim.new(0.02, 0)
            }),
            ["ScoreGuideTableContainer"] = u7.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.5, 0.49)
            }, {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["SectionTitle"] = u7.createElement("TextLabel", {
                    ["Text"] = "MISSIONS SCORE GUIDE",
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 18),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u3.WHITE
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }),
                u7.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 20)
                }, { u7.createElement(u33, {
                        ["LeftText"] = "ALL MISSIONS",
                        ["RightText"] = "+20"
                    }) })
            }),
            ["ScoreGuideTableContainer2"] = u7.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.5, 0.49)
            }, {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["SectionTitle"] = u7.createElement("TextLabel", {
                    ["Text"] = "War Crystals Guide",
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 18),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u3.WHITE
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }),
                u7.createElement(u5, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 20)
                }, { u7.createElement(u33, {
                        ["LeftText"] = "Clan War Crystals",
                        ["RightText"] = "War Points * 10"
                    }) })
            })
        })
        v39.TableList = u7.createElement(u5, v41, v42)
        local v77 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v78 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.04, 0)
            }), u7.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(0.48, 1),
                ["BackgroundColor3"] = u3.WHITE,
                ["BorderSizePixel"] = 0,
                [u7.Event.Activated] = function() --[[ Line: 363 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    u11.Client:GetNamespace("Clans"):Get("GoToClanHQ"):SendToServer()
                end,
                ["LayoutOrder"] = 1
            }, {
                u7.createElement("UIGradient", {
                    ["Rotation"] = 45,
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#33355E")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6165B3")) })
                }),
                u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }),
                u7.createElement("UIStroke", {
                    ["Color"] = Color3.fromHex("#585BA3")
                }),
                u7.createElement(u5, {
                    ["Position"] = UDim2.fromScale(0.1, 0.5),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Size"] = UDim2.fromScale(0.5, 0.75)
                }, { u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Center"
                    }), u7.createElement("TextLabel", {
                        ["Text"] = "GO TO CLAN HQ",
                        ["TextScaled"] = true,
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.6),
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = u3.WHITE
                    }, { u7.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 24
                        }) }) }),
                u7.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ImageTransparency"] = 0.7,
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.925, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u10.ANNIVERSARY_BALLOON_LOBBY_GADGET,
                    ["ScaleType"] = Enum.ScaleType.Crop
                })
            }) }
        local v79 = #v78
        local v80 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.48, 1)
        }
        local v81 = {}
        local v82 = #v81
        local v83 = not v34
        if v83 then
            v83 = u7.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.6),
                ["Position"] = UDim2.fromScale(0, -0.35),
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["BackgroundColor3"] = Color3.fromHex("#2B2B2B")
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u7.createElement(u4, {
                    ["PreText"] = "OPENS IN: ",
                    ["EndTime"] = u9.getNextQueueOpenTime(),
                    ["TextLabel"] = {
                        ["TextTransparency"] = 0.3,
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Center",
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.7),
                        ["Position"] = UDim2.fromScale(0.1, -0.1),
                        ["AnchorPoint"] = Vector2.new(0, 0)
                    }
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) })
        end
        if v83 then
            v81[v82 + 1] = v83
        end
        local v84 = #v81 + 1
        local v85 = u7.createElement
        local v86 = "ImageButton"
        local v87 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.WHITE,
            ["BorderSizePixel"] = 0,
            [u7.Event.Activated] = function() --[[ Line: 459 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u9
                --]]
                u6.Controllers.QueueController:joinQueue(u9.activeQueue)
            end,
            ["ZIndex"] = 2
        }
        local v88 = {}
        local v89 = u7.createElement
        local v90 = "UIGradient"
        local v91 = {
            ["Rotation"] = 45
        }
        local v92
        if v34 then
            v92 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#48a878")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6AC4A4")) })
        else
            v92 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#8D8D8D")), ColorSequenceKeypoint.new(1, Color3.fromHex("#333333")) })
        end
        v91.Color = v92
        local v93 = v89(v90, v91)
        local v94 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v95 = u7.createElement
        local v96 = "UIStroke"
        local v97 = {}
        local v98
        if v34 then
            v98 = Color3.fromHex("#63FF8F")
        else
            v98 = Color3.fromHex("#717171")
        end
        v97.Color = v98
        local v99 = v95(v96, v97)
        local v100 = u7.createElement
        local v101 = u5
        local v102 = {
            ["ZIndex"] = 2,
            ["Position"] = UDim2.fromScale(0.1, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0.5, 0.75)
        }
        local v103 = {}
        local v104 = u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center"
        })
        local v105 = u7.createElement
        local v106 = "TextLabel"
        local v107 = {
            ["Text"] = "QUEUE FOR CLAN WAR",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.6),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }
        local v108
        if v34 then
            v108 = Color3.fromHex("#63FF8F")
        else
            v108 = u3.WHITE
        end
        v107.TextColor3 = v108
        __set_list(v103, 1, {v104, v105(v106, v107, { u7.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 24
    }) }), u7.createElement("TextLabel", {
    ["Text"] = "4v4",
    ["TextScaled"] = true,
    ["TextXAlignment"] = "Left",
    ["TextYAlignment"] = "Center",
    ["TextTransparency"] = 0.3,
    ["BackgroundTransparency"] = 1,
    ["LayoutOrder"] = 1,
    ["ZIndex"] = 3,
    ["Size"] = UDim2.fromScale(1, 0.4),
    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
    ["TextColor3"] = u3.WHITE
}, { u7.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 18
    }) })})
        __set_list(v88, 1, {v93, v94, v99, v100(v101, v102, v103), u7.createElement("ImageLabel", {
    ["SizeConstraint"] = "RelativeYY",
    ["ImageTransparency"] = 0.7,
    ["BackgroundTransparency"] = 1,
    ["ZIndex"] = 3,
    ["Position"] = UDim2.fromScale(0.925, 0.5),
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["Size"] = UDim2.fromScale(1, 1),
    ["Image"] = u10.NOOB_RAGEBLADE,
    ["ScaleType"] = Enum.ScaleType.Crop
})})
        v81[v84] = v85(v86, v87, v88)
        v78[v79 + 1] = u7.createElement(u5, v80, v81)
        v39[v40 + 1] = u7.createElement(u5, v77, v78)
        v37.Left = u7.createElement(u5, v38, v39)
        local v109 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.37, 1)
        }
        local v110 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local _ = #v110
        local v111 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["BackgroundColor3"] = u12.backgroundPrimary
        }
        local v112 = { u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.075, 0),
                ["PaddingBottom"] = UDim.new(0.075, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v113 = #v112
        local v114 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.45, 1)
        }
        local v115 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["Title"] = u7.createElement("TextLabel", {
                ["Text"] = "MATCHES PLAYED",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v116 = #v115
        local v117 = {
            ["Icon"] = u10.BATTLE_ICON
        }
        local v118 = p16.ActiveClanWar
        local v119 = v118 ~= nil and #v118.matches or v118
        local v120 = v119 == nil and 0 or v119
        local v121 = tostring(v120)
        local v122 = u9.maxMatchesPerClan
        v117.Text = "<b>" .. v121 .. " / " .. tostring(v122) .. "</b>"
        v117.FrameProps = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.9, 0, 0, 25)
        }
        v117.Tooltip = "The total matches counts for the whole clan"
        v115[v116 + 1] = u7.createElement(u15, v117)
        v112[v113 + 1] = u7.createElement(u5, v114, v115)
        local v123 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.45, 1)
        }
        local v124 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["DivisionTitle"] = u7.createElement("TextLabel", {
                ["Text"] = "DIVISION",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v125 = #v124
        local v126 = {
            ["Icon"] = u10.CLAN_CASTLE_ICON
        }
        local v127 = p16.ActiveClanWar
        if v127 ~= nil then
            v127 = v127.division
        end
        local v128 = v127 == nil and "" or v127
        v126.Text = "<b>" .. tostring(v128) .. "</b>"
        v126.FrameProps = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.9, 0, 0, 25)
        }
        v126.Tooltip = "Clan War Division determines your clan war matchmaking"
        v124[v125 + 1] = u7.createElement(u15, v126)
        v112[v113 + 2] = u7.createElement(u5, v123, v124)
        v110.MatchesPlayedInfo = u7.createElement("Frame", v111, v112)
        local v129 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["BackgroundColor3"] = u12.backgroundPrimary
        }
        local v130 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local _ = #v130
        local v131 = {
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v132 = {
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.035, 0),
                ["PaddingBottom"] = UDim.new(0.035, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }),
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }),
            ["SectionTitle"] = u7.createElement("TextLabel", {
                ["Text"] = "CLAN STATS",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        local v133 = #v132
        local v134 = {
            ["Label"] = "Wins"
        }
        local v135 = p16.ActiveClanWar
        if v135 ~= nil then
            v135 = v135.stats.generic.wins
        end
        v134.Value = v135 == nil and 0 or v135
        v132[v133 + 1] = u7.createElement(v27, v134)
        local v136 = {
            ["Label"] = "Losses"
        }
        local v137 = p16.ActiveClanWar
        if v137 ~= nil then
            v137 = v137.stats.generic.losses
        end
        v136.Value = v137 == nil and 0 or v137
        v132[v133 + 2] = u7.createElement(v27, v136)
        v130.StatInfo = u7.createElement(u5, v131, v132)
        local v138 = {
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 0.95,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1),
            ["BackgroundColor3"] = u12.backgroundTertiaryCard,
            ["Image"] = u10.TROPHY_ICON,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["TileSize"] = UDim2.fromOffset(30, 30)
        }
        local v139 = {
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            }),
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["SectionTitle"] = u7.createElement("TextLabel", {
                ["Text"] = "CLAN WAR POINTS",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            })
        }
        local v140 = #v139
        local v141 = {
            ["Icon"] = u10.TROPHY_ICON
        }
        local v142 = p16.ActiveClanWar
        if v142 ~= nil then
            v142 = v142.score
        end
        v141.Amount = v142 == nil and 0 or v142
        v141.Tooltip = "Clan War Points"
        v141.FrameProps = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.6, 0, 0, 25)
        }
        v139[v140 + 1] = u7.createElement(u14, v141)
        v130.ClanWarScoreContainer = u7.createElement("ImageLabel", v138, v139)
        v110.StatContainer = u7.createElement("Frame", v129, v130)
        v37.Right = u7.createElement(u5, v109, v110)
        v35.WAR_INFO = u7.createFragment({
            ["WAR_INFO"] = u7.createElement(u5, v36, v37)
        })
        return u7.createFragment(v35)
    end)
}