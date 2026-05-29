local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DarkBackground
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v2.TimedProgressBar
local u10 = v2.TooltipContainer
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.TweenService
local u18 = v16.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v122 = v14.new(u13)(function(u27, p28) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u13
        [3] = u6
        [4] = u11
        [5] = u12
        [6] = u17
        [7] = u5
        [8] = u4
        [9] = u7
        [10] = u9
        [11] = u18
        [12] = u20
        [13] = u25
        [14] = u24
        [15] = u22
        [16] = u23
        [17] = u26
        [18] = u8
        [19] = u10
        [20] = u3
        [21] = u19
    --]]
    local v29 = p28.useEffect
    local v30 = p28.useState
    local v31 = p28.useMemo
    local v32 = p28.useValue
    local u33, u34 = v30(1)
    local u35 = v32(u33)
    local v36
    if u27.SelectedKits then
        v36 = u27.SelectedKits[u33 + 1]
    else
        v36 = nil
    end
    local u37, u38 = v30(v36)
    local v39, u40 = v30(u27.SelectedKits or table.create(2, u21.RANDOM))
    local v41, u42 = v30("")
    local u43 = u13.createRef()
    local u44 = {}
    local function v51(p45) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u11
            [3] = u35
            [4] = u21
            [5] = u40
            [6] = u38
        --]]
        if not p45 then
            return false
        end
        if not u6.isHoarceKat() then
            u11.Controllers.CombinedKitDraftController:onKitSelect(p45, u35.value):andThen(function(p46) --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u40
                --]]
                local v47 = table.create(#p46)
                for v48, v50 in p46 do
                    local _ = v48 - 1
                    if v50 == u21.NONE then
                        local v50 = u21.RANDOM
                    end
                    v47[v48] = v50
                end
                u40(v47)
            end)
        end
        u38(p45)
        return true
    end
    v29(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u33
        --]]
        u35.value = u33
    end, { u33 })
    v29(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u37
            [3] = u21
            [4] = u35
            [5] = u34
        --]]
        u40(function(p52) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u21
                [3] = u35
            --]]
            local v53 = {}
            local v54 = #v53
            table.move(p52, 1, #p52, v54 + 1, v53)
            local v55 = u37 or u21.RANDOM
            local v56 = u35.value + 1
            if v55 == u21.NONE then
                v55 = u21.RANDOM
            end
            v53[v56] = v55
            return v53
        end)
        u34(function(p57) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            local v58 = (p57 + 1) % 2
            u35.value = v58
            return v58
        end)
    end, { u37 })
    v29(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u12
            [3] = u17
        --]]
        local u59 = u43:getValue()
        if not u59 then
            return nil
        end
        local u60 = u12.new()
        local u61 = u17:Create(u59, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Transparency"] = 0.25
        })
        local u62 = u17:Create(u59, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Transparency"] = 0.5
        })
        u60:GiveTask(u61.Completed:Connect(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u62
            --]]
            u60:GiveTask(task.delay(0.5, function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u62
                --]]
                u62:Play()
            end))
        end))
        u60:GiveTask(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u61
            --]]
            u61:Cancel()
            u61:Destroy()
        end)
        u60:GiveTask(u62.Completed:Connect(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u61
            --]]
            u60:GiveTask(task.delay(0.5, function() --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                u61:Play()
            end))
        end))
        u60:GiveTask(function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            u62:Cancel()
            u62:Destroy()
        end)
        u61:Play()
        return function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u59
            --]]
            u60:Destroy()
            u59.Transparency = 0
        end
    end, {})
    v29(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u44
            [3] = u17
        --]]
        local u63 = u12.new()
        for _, v64 in u44 do
            local u65 = v64.ref:getValue()
            if u65 then
                local u66 = u17:Create(u65, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    ["Transparency"] = 0.5
                })
                local u67 = u17:Create(u65, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    ["Transparency"] = 0
                })
                u63:GiveTask(function() --[[ Line: 133 ]]
                    --[[
                    Upvalues:
                        [1] = u65
                    --]]
                    u65.Transparency = 0
                end)
                u63:GiveTask(u66.Completed:Connect(function() --[[ Line: 136 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u67
                    --]]
                    u63:GiveTask(task.delay(0.5, function() --[[ Line: 137 ]]
                        --[[
                        Upvalues:
                            [1] = u67
                        --]]
                        u67:Play()
                    end))
                end))
                u63:GiveTask(function() --[[ Line: 141 ]]
                    --[[
                    Upvalues:
                        [1] = u66
                    --]]
                    u66:Cancel()
                    u66:Destroy()
                end)
                u63:GiveTask(u67.Completed:Connect(function() --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u66
                    --]]
                    u63:GiveTask(task.delay(0.5, function() --[[ Line: 146 ]]
                        --[[
                        Upvalues:
                            [1] = u66
                        --]]
                        u66:Play()
                    end))
                end))
                u63:GiveTask(function() --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                    --]]
                    u67:Cancel()
                    u67:Destroy()
                end)
                u66:Play()
            end
        end
        return function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            u63:Destroy()
        end
    end, { v39, u33 })
    local u68 = v31(function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        return u27.CustomMatch ~= nil
    end, { u27.CustomMatch })
    v29(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u68
            [3] = u27
            [4] = u42
        --]]
        local u69 = u12.new()
        if not u68 then
            local v70 = math
            local v71 = u27.store.Game.startTime
            local v72 = v71 == nil and 0 or v71
            local v73 = v70.max(v72, 0)
            u69:GiveTask(task.delay(v73 - os.time(), function() --[[ Line: 172 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42("Starting Match...")
            end))
        end
        u42(u68 and "Select your Kits..." or "Match Begins in...")
        return function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:Destroy()
        end
    end, { u27.CustomMatch, u27.store.Game.startTime })
    local v74 = {
        ["DisplayOrder"] = 1500,
        ["IgnoreGuiInset"] = true
    }
    local v75 = { u13.createElement(u5, {
            ["AppId"] = u27.AppId
        }) }
    local _ = #v75
    local v76 = {
        ["AutoButtonColor"] = false,
        ["Image"] = "rbxassetid://71356717298935",
        ["Size"] = UDim2.fromScale(1, 1),
        ["ScaleType"] = Enum.ScaleType.Crop
    }
    local v77 = {
        u13.createElement("Frame", {
            ["Transparency"] = 0.5,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.BLACK
        }),
        ["BackgroundGradient"] = u13.createElement("Frame", {
            [u13.Ref] = u43,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.WHITE,
            ["Transparency"] = 0.5
        }, { u13.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
                ["Color"] = ColorSequence.new(u4.WHITE)
            }) })
    }
    local v78 = u13.createElement
    local v79 = u7
    local v80 = {
        ["Size"] = UDim2.fromScale(1, 0.2)
    }
    local v81 = {}
    local v82 = u13.createElement("TextLabel", {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["TextTransparency"] = 0,
        ["ZIndex"] = 10,
        ["LayoutOrder"] = 2,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, u27.CustomMatch and 0.5 or 0.22),
        ["Size"] = UDim2.fromScale(0.2, 0.4),
        ["Text"] = v41,
        ["TextColor3"] = u4.WHITE,
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
    })
    local v83
    if u68 then
        v83 = u13.createFragment({
            ["GoBackIcon"] = u13.createElement("ImageButton", {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.25, 0.25),
                ["Image"] = u24.ARROW_LEFT,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Rotation"] = 180,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(0.95, 0.5),
                ["ImageTransparency"] = 0.2,
                ["BackgroundTransparency"] = 1,
                [u13.Event.MouseButton1Click] = function() --[[ Line: 316 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    u11.Controllers.CombinedKitDraftController:unmountUI()
                end
            })
        })
    else
        v83 = v31(function() --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u13
                [3] = u7
                [4] = u9
                [5] = u18
                [6] = u20
                [7] = u25
            --]]
            local v84 = math
            local v85 = u27.store.Game.startTime
            local v86 = v85 == nil and 0 or v85
            local v87 = v84.max(v86, 0)
            return u13.createFragment({
                ["CountdownSection"] = u13.createElement(u7, {
                    ["Size"] = UDim2.fromScale(0.7, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.68)
                }, { u13.createElement(u7, {
                        ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Position"] = UDim2.fromScale(0, 0.5)
                    }, { u13.createElement("UIPadding", {
                            ["PaddingRight"] = UDim.new(0.1, 0),
                            ["PaddingLeft"] = UDim.new(0.1, 0)
                        }), u13.createElement(u9, {
                            ["Rotation"] = 180,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["StartTime"] = u18:GetServerTimeNow(),
                            ["EndTime"] = v87,
                            ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                            ["ProgressBarConfig"] = {
                                ["GradientRotation"] = 180,
                                ["Flip"] = true,
                                ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                            }
                        }) }), u13.createElement(u20, {
                        ["OnlyPlaySoundLastNSec"] = 10,
                        ["EndTime"] = v87,
                        ["FrameProps"] = {
                            ["ZIndex"] = 3,
                            ["Size"] = UDim2.fromScale(0.2, 0.9),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                        },
                        ["PlayCustomSoundAtTime"] = {
                            ["timeLeftSec"] = 3,
                            ["sound"] = u25.LTM_GOAL_MOVING_SOUND
                        }
                    }), u13.createElement(u7, {
                        ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Position"] = UDim2.fromScale(1, 0.5)
                    }, { u13.createElement("UIPadding", {
                            ["PaddingRight"] = UDim.new(0.1, 0),
                            ["PaddingLeft"] = UDim.new(0.1, 0)
                        }), u13.createElement(u9, {
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["StartTime"] = u18:GetServerTimeNow(),
                            ["EndTime"] = v87,
                            ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                            ["ProgressBarConfig"] = {
                                ["GradientRotation"] = 180,
                                ["Flip"] = true,
                                ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                            }
                        }) }) })
            })
        end, { u27.store.Game.startTime })
    end
    __set_list(v81, 1, {v82, v83})
    v77.Header = v78(v79, v80, v81)
    local v88 = #v77
    local v89 = {
        ["Size"] = UDim2.fromScale(0.25, 0.8),
        ["Position"] = UDim2.fromScale(0, 0.2),
        ["AnchorPoint"] = Vector2.new(0, 0)
    }
    local v90 = {}
    local v91 = #v90
    local function v113(p92, u93) --[[ Line: 331 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
            [3] = u13
            [4] = u44
            [5] = u33
            [6] = u4
            [7] = u26
            [8] = u8
            [9] = u25
            [10] = u35
            [11] = u34
            [12] = u7
            [13] = u10
            [14] = u3
        --]]
        local v94 = u22[p92]
        local v95
        if v94.kitClass == nil then
            v95 = nil
        else
            v95 = u23(v94.kitClass)
        end
        local v96 = u13.createRef()
        local v97 = u44
        table.insert(v97, {
            ["ref"] = v96,
            ["index"] = u93
        })
        local v98 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v99
        if u93 == u33 then
            v99 = u4.darken(u26.backgroundPrimary, 0.6)
        else
            v99 = u4.darken(u26.backgroundPrimary, 0.2)
        end
        v98.BackgroundColor3 = v99
        v98.BorderSizePixel = 0
        v98.Image = u22[p92].renderImage
        v98[u13.Event.MouseButton1Click] = function() --[[ Line: 345 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u25
                [3] = u35
                [4] = u93
                [5] = u34
            --]]
            u8:playSound(u25.UI_CLICK)
            u35.value = u93
            u34(u93)
        end
        local v100 = { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }), u13.createElement("UIStroke", {
                ["Color"] = Color3.fromRGB(255, 255, 255),
                ["Thickness"] = u93 == u33 and 3 or 0,
                [u13.Ref] = v96
            }), (u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v101 = u13.createElement
        local v102 = u7
        local v103 = {
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(1, 0.16),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v104 = {}
        local v105 = u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.035, 0)
        })
        local v106 = u13.createElement(u7, {
            ["LayoutOrder"] = 0
        })
        local v107 = u13.createElement
        local v108 = {
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["ZIndex"] = 10,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v109 = u93 + 1
        v108.Text = "Kit " .. tostring(v109)
        v108.TextColor3 = u4.WHITE
        v108.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        __set_list(v104, 1, {v105, v106, v107("TextLabel", v108)})
        v100.KitNumber = v101(v102, v103, v104)
        local _ = #v100
        local v110 = {
            ["BackgroundTransparency"] = 0.55,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(1, 0.16),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v111 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.035, 0)
            }), u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }), u13.createElement(u7, {
                ["LayoutOrder"] = 0
            }) }
        local v112 = #v111
        if v95 then
            if v95.imageId == "" then
                v95 = false
            else
                v95 = u13.createFragment({
                    ["KitClass"] = u13.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["ScaleType"] = "Fit",
                        ["ImageTransparency"] = 0,
                        ["ZIndex"] = 10,
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.12, 0.75),
                        ["Image"] = v95.imageId
                    }, { u13.createElement(u10, {}, { u13.createElement(u3, {
                                ["TextSize"] = 16,
                                ["Text"] = v95.display,
                                ["Font"] = Enum.Font.SourceSansBold
                            }) }), u13.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            end
        end
        if v95 then
            v111[v112 + 1] = v95
        end
        v111[#v111 + 1] = u13.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0,
            ["ZIndex"] = 10,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = v94.name,
            ["TextColor3"] = u4.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        })
        v100.KitNameTag = u13.createElement("Frame", v110, v111)
        return u13.createElement("ImageButton", v98, v100)
    end
    local v114 = table.create(#v39)
    for v115, v116 in v39 do
        v114[v115] = v113(v116, v115 - 1, v39)
    end
    local v117 = {
        ["Size"] = UDim2.fromScale(0.35, 0.75),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v118 = { u13.createElement("UIListLayout", {
            ["VerticalFlex"] = "SpaceAround",
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0.01, 0)
        }) }
    local v119 = #v118
    for v120, v121 in v114 do
        v118[v119 + v120] = v121
    end
    v90[v91 + 1] = u13.createElement(u7, v117, v118)
    v77[v88 + 1] = u13.createElement(u7, v89, v90)
    v77[v88 + 2] = u13.createElement(u7, {
        ["Size"] = UDim2.fromScale(0.7, 0.8),
        ["Position"] = UDim2.fromScale(1, 0.2),
        ["AnchorPoint"] = Vector2.new(1, 0)
    }, {
        ["KitSelection"] = u13.createElement(u7, {
            ["Size"] = UDim2.fromScale(0.9, 1),
            ["Position"] = UDim2.fromScale(0.4, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["Padding"] = UDim.new(0.01, 0)
            }), u13.createElement(u19, {
                ["SelectionMode"] = "SELECTION_ONLY",
                ["Size"] = UDim2.fromScale(1, 0.9),
                ["store"] = u27.store,
                ["SelectedKit"] = u37,
                ["SetSelectedKit"] = v51
            }) })
    })
    v75.CombinedKitDraftApp = u13.createElement("ImageButton", v76, v77)
    return u13.createElement("ScreenGui", v74, v75)
end)
return {
    ["KIT_SELECTION_LENGTH"] = 2,
    ["CombinedKitDraftApp"] = v15.connect(function(p123, p124) --[[ Line: 514 ]]
        local v125 = {}
        for v126, v127 in p124 do
            v125[v126] = v127
        end
        v125.store = p123
        v125.CustomMatch = p123.Game.customMatch
        return v125
    end)(v122)
}