local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local v6 = v2.ExpireList
local u7 = v2.SoundManager
local u8 = v2.UIUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.ContextActionService
local u15 = v13.RunService
local u16 = v13.TweenService
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, script.Parent, "fisherman-minigame-countdown").FishermanMinigameCountdown
local u22 = v6.new(3)
return {
    ["FishermanMinigameApp"] = v12.new(u11)(function(u23, p24) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u20
            [3] = u10
            [4] = u14
            [5] = u18
            [6] = u1
            [7] = u15
            [8] = u22
            [9] = u4
            [10] = u9
            [11] = u17
            [12] = u16
            [13] = u11
            [14] = u8
            [15] = u5
            [16] = u3
            [17] = u19
            [18] = u21
        --]]
        local v25 = p24.useState
        local v26 = p24.useEffect
        local u27, u28 = v25(false)
        local u29, u30 = v25(false)
        local u31, u32 = v25(25)
        local u33 = nil
        local u34 = nil
        local u35 = nil
        local u36 = nil
        local u37 = nil
        local u38 = nil
        v26(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u20
                [3] = u10
                [4] = u14
                [5] = u33
                [6] = u18
                [7] = u1
                [8] = u34
                [9] = u15
                [10] = u22
                [11] = u35
                [12] = u36
                [13] = u37
                [14] = u38
            --]]
            local u39 = u7:playSound(u20.FISHERMAN_GAME_START)
            local u40 = false
            local u41 = u10.new()
            u14:BindActionAtPriority("fishing-click", function(_, p42, _) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u40
                    [3] = u7
                    [4] = u20
                    [5] = u33
                    [6] = u18
                    [7] = u1
                    [8] = u34
                --]]
                if p42 == Enum.UserInputState.Begin then
                    u41:DoCleaning()
                    u40 = true
                    u41:GiveTask(function() --[[ Line: 42 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        u40 = false
                    end)
                    local v43 = 0
                    local v44 = u7:playSound(u20.FISHERMAN_GAME_PULLING_LOOP, {
                        ["looped"] = true
                    })
                    if v44 then
                        u41:GiveTask(v44)
                    end
                    while u40 do
                        u33(u18.startingMarkerIncrementSpeed - v43)
                        v43 = v43 + 0.01
                        u1.Promise.delay(0.05):await()
                    end
                elseif p42 == Enum.UserInputState.End then
                    u41:DoCleaning()
                    u34()
                end
            end, false, Enum.ContextActionPriority.High.Value, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, Enum.UserInputType.Touch)
            local u45 = nil
            local u46 = 0
            local u51 = u15.Heartbeat:Connect(function(p47) --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u18
                    [3] = u22
                    [4] = u35
                    [5] = u36
                    [6] = u45
                    [7] = u7
                    [8] = u20
                    [9] = u37
                    [10] = u38
                --]]
                local v48 = u46 * 10
                local v49 = math.round(v48) / 10
                if v49 ~= 0 and (v49 % u18.fishZoneMoveCooldown == 0 and not u22:has("moveFishZone")) then
                    u35()
                    u22:add("moveFishZone")
                end
                if u36(p47) then
                    if not u45 then
                        u45 = u7:playSound(u20.FISHERMAN_GAME_PROGRESS_INCREASE, {
                            ["looped"] = true
                        })
                    end
                else
                    local v50 = u45
                    if v50 ~= nil then
                        v50:Destroy()
                    end
                    u45 = nil
                end
                if u37() then
                    u38()
                end
                u46 = u46 + p47
            end)
            local u52 = u7:playSound(u20.FISHERMAN_GAME_LOOP, {
                ["looped"] = true
            })
            return function() --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u45
                    [3] = u52
                    [4] = u41
                    [5] = u14
                    [6] = u51
                --]]
                local v53 = u39
                if v53 ~= nil then
                    v53:Destroy()
                end
                local v54 = u45
                if v54 ~= nil then
                    v54:Destroy()
                end
                local v55 = u52
                if v55 ~= nil then
                    v55:Destroy()
                end
                u41:DoCleaning()
                u14:UnbindAction("fishing-click")
                if u51 then
                    u51:Disconnect()
                end
            end
        end, {})
        v26(function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u38
                [3] = u4
                [4] = u9
            --]]
            if not u27 then
                return nil
            end
            u38()
            if not u4.isHoarceKat() then
                u9.Controllers.FishingMinigameController:closeFishingMinigameApp()
            end
        end, { u27 })
        u38 = function() --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u17
                [3] = u29
                [4] = u31
            --]]
            if not u27 then
                return nil
            end
            u17.FishermanMinigameEnd:fire(u27, u29, u31)
        end
        local u56 = nil
        u33 = function(p57) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u27
                [3] = u18
                [4] = u16
            --]]
            local v58 = u56:getValue()
            if u27 or not v58 then
                return nil
            end
            local v59 = TweenInfo.new
            local v60 = u18.holdMinimumMarkerIncrementSpeed
            local v61 = v59(math.max(p57, v60), Enum.EasingStyle.Linear)
            local v62 = {}
            local v63 = UDim2.new
            local v64 = v58.Position.X.Scale + u18.markerIncrementAmount
            local v65 = 1 - v58.Size.X.Scale
            v62.Position = v63(math.min(v64, v65), 0, 0.5, 0)
            u16:Create(v58, v61, v62):Play()
        end
        u34 = function() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u27
                [3] = u18
                [4] = u16
            --]]
            local v66 = u56:getValue()
            if u27 or not v66 then
                return nil
            end
            local v67 = u18.totalDecaySpeedSec * (v66.Position.X.Scale + v66.Size.X.Scale)
            u16:Create(v66, TweenInfo.new(v67, Enum.EasingStyle.Linear), {
                ["Position"] = UDim2.new(0, 2, 0.5, 0)
            }):Play()
        end
        local u68 = nil
        u35 = function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u68
                [2] = u27
                [3] = u7
                [4] = u20
                [5] = u18
                [6] = u16
            --]]
            local v69 = u68:getValue()
            if u27 or not v69 then
                return nil
            end
            u7:playSound(u20.FISHERMAN_GAME_FISH_MOVE)
            local v70 = v69.Position.X
            local v71 = u18.MinMoveDistance
            local v72 = u18.MaxMoveDistance
            local v73 = {}
            local v74 = v70.Scale - v72
            local v75 = 0 + v71
            local v76 = math.max(v74, v75)
            local v77 = v70.Scale + v72
            local v78 = 1 - v71
            __set_list(v73, 1, {v76, (math.min(v77, v78))})
            local v79 = Random.new(os.time()):NextNumber(v73[1], v73[2]) + v71 / 2
            local v80 = u18.fishZoneSpeedMultiplier
            local v81 = v69.Position.X.Scale - v79
            local v82 = v80 * math.abs(v81)
            u16:Create(v69, TweenInfo.new(v82, Enum.EasingStyle.Linear), {
                ["Position"] = UDim2.new(v79, 0, 0.5, 0)
            }):Play()
        end
        local u83 = nil
        u36 = function(p84) --[[ Line: 179 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u27
                [3] = u68
                [4] = u83
            --]]
            local v85 = false
            local v86 = u56:getValue()
            if u27 or not v86 then
                return nil
            end
            local v87 = u68:getValue()
            local v88 = v87.AbsolutePosition.X
            local v89 = v87.AbsolutePosition.X + v87.AbsoluteSize.X
            local v90 = v86.AbsolutePosition.X
            local v91 = v86.AbsolutePosition.X + v86.AbsoluteSize.X
            if v90 > v88 or v89 > v91 then
                u83(v85, p84)
                return v85
            end
            local v92 = true
            u83(v92, p84)
            return v92
        end
        local u93 = nil
        u83 = function(p94, p95) --[[ Line: 200 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u18
                [3] = u23
            --]]
            local v96 = u93:getValue()
            local v97 = 60 * p95
            if p94 then
                local v98 = UDim2.new
                local v99 = v96.Size.X.Scale + u18.fillAmount * v97
                v96.Size = v98(math.min(v99, 1), 0, 1, 0)
            else
                local v100 = u23.decaySpeedMultiplier
                local v101 = v100 == nil and 1 or v100
                local v102 = UDim2.new
                local v103 = v96.Size.X.Scale - u18.drainAmount * v101 * v97
                v96.Size = v102(math.max(v103, 0), 0, 1, 0)
            end
        end
        u37 = function() --[[ Line: 216 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u27
                [3] = u30
                [4] = u28
            --]]
            local v104 = u93:getValue()
            if u27 or not v104 then
                return nil
            end
            if v104.Size.X.Scale ~= 1 then
                return false
            end
            u30(true)
            u28(true)
            return true
        end
        local function v106(p105) --[[ Line: 230 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u32
                [3] = u30
                [4] = u28
            --]]
            if u27 then
                return nil
            end
            u32(p105)
            u30(false)
            u28(true)
        end
        u56 = u11.createRef()
        u68 = u11.createRef()
        u93 = u11.createRef()
        local v107 = Color3.fromRGB(0, 255, 56)
        local v108 = u23.fishType
        if v108 == "fish_diamond" then
            v107 = Color3.fromRGB(2, 247, 247)
        elseif v108 == "fish_gold" then
            v107 = Color3.fromRGB(247, 181, 44)
        elseif v108 == "fish_iron" then
            v107 = Color3.fromRGB(145, 140, 146)
        elseif v108 == "fish_special" then
            v107 = Color3.fromRGB(220, 111, 127)
        end
        local v109 = {}
        local v110 = u23.size
        if v110 == nil then
            v110 = u4.isHoarceKat()
        end
        local v111
        if v110 then
            v111 = UDim2.fromScale(0.3, 0.3)
        else
            v111 = UDim2.fromScale(1, 1)
        end
        v109.Size = v111
        v109.SizeConstraint = "RelativeXX"
        local v112 = u23.position
        if v112 == nil then
            v112 = u4.isHoarceKat()
        end
        local v113
        if v112 then
            v113 = u8:getActionBarPosition()
        else
            v113 = nil
        end
        v109.Position = v113
        v109.AnchorPoint = u23.anchorPoint or Vector2.new(0.5, 0.5)
        local v114 = { u11.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 6.3
            }) }
        local v115 = #v114
        local v116 = not u27
        if v116 then
            local v117 = u11.createFragment
            local v118 = {}
            local v119 = u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.2, 0)
            })
            local v120 = u11.createElement
            local v121 = u5
            local v122 = {
                ["Size"] = UDim2.fromScale(1, 0.2)
            }
            local v123 = {}
            local v124 = u11.createElement
            local v125 = u5
            local v126 = {
                ["Size"] = UDim2.fromScale(0.6, 1)
            }
            local v127 = {
                ["Instructions"] = u11.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["Text"] = (u4.isMobileControls() and "Tap" or "Click") .. " & Hold"
                }, { u11.createElement("UIStroke", {
                        ["Transparency"] = 0.2,
                        ["Thickness"] = 1,
                        ["Color"] = u3.BLACK
                    }) })
            }
            local v128 = u11.createElement
            local v129 = "ImageLabel"
            local v130 = {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 4,
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Size"] = UDim2.fromScale(1, 0.8)
            }
            local v131
            if u4.isMobileControls() then
                v131 = u19.MOUSE
            else
                v131 = u19.TOUCH
            end
            v130.Image = v131
            __set_list(v127, 1, {v128(v129, v130)})
            __set_list(v123, 1, {v124(v125, v126, v127), u11.createElement(u5, {
    ["Size"] = UDim2.fromScale(0.4, 1.1),
    ["AnchorPoint"] = Vector2.new(1, 0),
    ["Position"] = UDim2.fromScale(1, 0)
}, { u11.createElement(u21, {
        ["HandleRanOutOfTime"] = v106,
        ["GameOver"] = u27,
        ["Duration"] = u23.duration
    }) })})
            local v132 = v120(v121, v122, v123)
            local v133 = u11.createElement
            local v134 = u5
            local v135 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.6)
            }
            local v136 = {
                u11.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0.3, 0)
                }),
                ["Minigame"] = u11.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.5)
                }, {
                    u11.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 154, 253)), ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 195, 255)) }),
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.7) })
                    }),
                    u11.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 3)
                    }),
                    u11.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Transparency"] = 0.3,
                        ["Color"] = u3.BLACK
                    }),
                    ["Marker"] = u11.createElement("Frame", {
                        ["Size"] = UDim2.new(u18.markerSize.X.Scale, -4, u18.markerSize.Y.Scale, -4),
                        ["Position"] = UDim2.new(0, 2, 0.5, 0),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["BackgroundColor3"] = u18.markerColor,
                        [u11.Ref] = u56,
                        ["ZIndex"] = 3
                    }, { u11.createElement("UIStroke", {
                            ["Thickness"] = 1,
                            ["Transparency"] = 0.7,
                            ["Color"] = Color3.fromRGB(0, 0, 0)
                        }), u11.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 3)
                        }) }),
                    ["FishZone"] = u11.createElement(u5, {
                        ["Size"] = UDim2.new(u18.fishZoneSize.X.Scale, -4, u18.fishZoneSize.Y.Scale + 0.2, -4),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        [u11.Ref] = u68,
                        ["ZIndex"] = 4
                    }, {
                        u11.createElement("ImageLabel", {
                            ["SizeConstraint"] = "RelativeYY",
                            ["Rotation"] = -20,
                            ["ScaleType"] = "Fit",
                            ["Image"] = "rbxassetid://7976208326",
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 4,
                            ["Position"] = UDim2.fromScale(0.5, -0.03),
                            ["AnchorPoint"] = Vector2.new(0.5, 1),
                            ["Size"] = UDim2.fromScale(1.5, 1)
                        }),
                        ["FishZone"] = u11.createElement("Frame", {
                            ["BorderSizePixel"] = 0,
                            ["ZIndex"] = 4,
                            ["Size"] = UDim2.new(1, 0, u18.fishZoneSize.Y.Scale, -4),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["BackgroundColor3"] = v107
                        }, { u11.createElement("UICorner", {
                                ["CornerRadius"] = UDim.new(0.5, 0)
                            }), u11.createElement("UIStroke", {
                                ["Thickness"] = 1,
                                ["Color"] = u3.darken(v107, 0.7)
                            }) })
                    })
                }),
                ["ProgressBar"] = u11.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.2,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.65, 0.2),
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                }, { u11.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Transparency"] = 0.3,
                        ["Color"] = Color3.fromRGB(0, 0, 0)
                    }), u11.createElement("Frame", {
                        ["Size"] = UDim2.fromScale(0, 0),
                        [u11.Ref] = u93,
                        ["BackgroundColor3"] = u3.WHITE,
                        ["BorderSizePixel"] = 0
                    }, { u11.createElement("UIGradient", {
                            ["Rotation"] = 90,
                            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 243, 86)), ColorSequenceKeypoint.new(1, u18.markerColor) })
                        }) }) })
            }
            __set_list(v118, 1, {v119, v132, v133(v134, v135, v136)})
            v116 = v117(v118)
        end
        if v116 then
            v114[v115 + 1] = v116
        end
        return u11.createFragment({
            ["FishingMinigameApp"] = u11.createElement(u5, v109, v114)
        })
    end)
}