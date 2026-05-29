local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.ConfettiGroup
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.OfflinePlayerUtil
local u9 = v3.PlayerRender
local u10 = v3.SoundManager
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = u11.values
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.TweenService
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
return {
    ["VictorySection"] = v14.new(u13)(function(p23, p24) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u19
            [4] = u8
            [5] = u4
            [6] = u20
            [7] = u6
            [8] = u18
            [9] = u16
            [10] = u11
            [11] = u12
            [12] = u10
            [13] = u21
            [14] = u17
            [15] = u22
            [16] = u5
            [17] = u9
            [18] = u7
        --]]
        local _ = p24.useState
        local v25 = p24.useEffect
        local v26 = u13.createRef()
        local u27 = u13.createRef()
        local u28 = u13.createRef()
        local u29 = u13.createRef()
        local u30 = u13.createRef()
        local u31 = {}
        local u32 = {}
        local u33 = {}
        local v34 = p23.store.Game.queueType
        local v35 = v34 and u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v34).game == u19.SURVIVAL and "Penguins Win!" or "Tie Game!"
        local v36 = {}
        local u37 = {
            ["id"] = "4",
            ["name"] = "Blue",
            ["members"] = {
                [u8.Dummy.Bryan3838.userId] = u8.Dummy.Bryan3838,
                [u8.Dummy.oiogy.userId] = u8.Dummy.oiogy,
                [u8.Dummy.Rascal.userId] = u8.Dummy.Rascal
            },
            ["color"] = u4.hexColor(u20.lightBlue)
        }
        local v38
        if u6.isHoarceKat() then
            v38 = u37
        else
            v38 = nil
            for v39, v40 in u18:getState().Game.teams do
                local _ = v39 - 1
                if v40.id == p23.WinningTeamId == true then
                    v38 = v40
                    break
                end
            end
        end
        if v38 then
            v35 = v38.name .. " Team Wins"
            local v41 = 0
            v36 = {}
            for v42, v43 in u16:GetPlayers() do
                local _ = v42 - 1
                local v44
                if v38.members[v43.UserId] == nil then
                    v44 = nil
                else
                    v44 = v43.UserId
                end
                if v44 ~= nil then
                    v41 = v41 + 1
                    v36[v41] = v44
                end
            end
            if u6.isHoarceKat() then
                v36 = u11.keys(u37.members)
            end
        end
        local v45
        if v38 == nil then
            v45 = v38
        else
            v45 = v38.color
        end
        if v45 == nil then
            v45 = u4.WHITE
        end
        if v34 and u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v34).game == u19.GUN_GAME then
            if v38 ~= nil then
                v38 = v38.members
            end
            if v38 then
                local v46 = u12(v38)[1]
                if v46 then
                    v35 = v46.name .. " Wins!"
                end
            end
        end
        local v47 = p23.CustomTitleMessage
        if v47 ~= "" and v47 then
            v35 = p23.CustomTitleMessage
        end
        local v48 = u18:getState().Game.myTeam
        local v49 = v48 and v48.id == p23.WinningTeamId and true or true
        v25(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u21
                [3] = u27
                [4] = u28
                [5] = u29
                [6] = u30
                [7] = u6
                [8] = u17
                [9] = u31
                [10] = u32
                [11] = u33
                [12] = u22
            --]]
            u10:playSound(u21.END_GAME)
            local u50 = u27:getValue()
            local u51 = u28:getValue()
            local u52 = u29:getValue()
            local u53 = u30:getValue()
            local u54 = {}
            local u55 = {}
            local u56 = {}
            task.spawn(function() --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u17
                    [3] = u50
                    [4] = u51
                    [5] = u52
                    [6] = u54
                    [7] = u31
                    [8] = u55
                    [9] = u32
                    [10] = u56
                    [11] = u33
                --]]
                if u6.isHoarceKat() then
                    task.wait(0.5)
                end
                u17:Create(u50, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["Size"] = UDim2.fromScale(1, 1)
                }):Play()
                u17:Create(u51, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["Size"] = UDim2.fromScale(1, 1)
                }):Play()
                u17:Create(u52, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
                    ["TextTransparency"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1)
                }):Play()
                task.spawn(function() --[[ Line: 168 ]]
                    --[[
                    Upvalues:
                        [1] = u54
                        [2] = u17
                        [3] = u31
                    --]]
                    local function v60(p57) --[[ Line: 169 ]]
                        --[[
                        Upvalues:
                            [1] = u54
                            [2] = u17
                        --]]
                        local v58 = p57:getValue()
                        local v59 = u54
                        table.insert(v59, v58)
                        u17:Create(v58, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            ["ImageTransparency"] = 0,
                            ["BackgroundTransparency"] = 0.7,
                            ["Position"] = UDim2.fromScale(0, 0)
                        }):Play()
                        task.wait(0.05)
                    end
                    for v61, v62 in u31 do
                        v60(v62, v61 - 1, u31)
                    end
                end)
                task.spawn(function() --[[ Line: 183 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                        [2] = u17
                        [3] = u32
                    --]]
                    local function v66(p63) --[[ Line: 184 ]]
                        --[[
                        Upvalues:
                            [1] = u55
                            [2] = u17
                        --]]
                        local v64 = p63:getValue()
                        local v65 = u55
                        table.insert(v65, v64)
                        u17:Create(v64, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            ["Size"] = UDim2.fromOffset(0, 14)
                        }):Play()
                        task.wait(0.05)
                    end
                    for v67, v68 in u32 do
                        v66(v68, v67 - 1, u32)
                    end
                end)
                task.spawn(function() --[[ Line: 196 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                        [2] = u17
                        [3] = u33
                    --]]
                    local function v72(p69) --[[ Line: 197 ]]
                        --[[
                        Upvalues:
                            [1] = u56
                            [2] = u17
                        --]]
                        local v70 = p69:getValue()
                        local v71 = u56
                        table.insert(v71, v70)
                        u17:Create(v70, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            ["Thickness"] = 1
                        }):Play()
                        task.wait(0.05)
                    end
                    for v73, v74 in u33 do
                        v72(v74, v73 - 1, u33)
                    end
                end)
            end)
            local v75 = u22[1].displaySecs
            local v76 = (v75 == nil and 1 or v75) - 0.5
            task.delay(v76, function() --[[ Line: 216 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u50
                    [3] = u51
                    [4] = u52
                    [5] = u53
                    [6] = u54
                    [7] = u55
                    [8] = u56
                --]]
                u17:Create(u50, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1)
                }):Play()
                u17:Create(u51, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1)
                }):Play()
                u17:Create(u52, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["TextTransparency"] = 1
                }):Play()
                u17:Create(u53, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    ["Transparency"] = 1,
                    ["Thickness"] = 0
                }):Play()
                task.spawn(function() --[[ Line: 235 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u54
                        [3] = u55
                        [4] = u56
                    --]]
                    local function v78(p77) --[[ Line: 236 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                        --]]
                        u17:Create(p77, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["ImageTransparency"] = 1,
                            ["BackgroundTransparency"] = 1
                        }):Play()
                    end
                    for v79, v80 in u54 do
                        v78(v80, v79 - 1, u54)
                    end
                    local function v82(p81) --[[ Line: 245 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                        --]]
                        u17:Create(p81, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Size"] = UDim2.fromOffset(0, 0)
                        }):Play()
                    end
                    for v83, v84 in u55 do
                        v82(v84, v83 - 1, u55)
                    end
                    local function v86(p85) --[[ Line: 253 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                        --]]
                        u17:Create(p85, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Thickness"] = 0
                        }):Play()
                    end
                    for v87, v88 in u56 do
                        v86(v88, v87 - 1, u56)
                    end
                end)
            end)
        end, {})
        local v89 = {}
        if v49 then
            v49 = u13.createElement(u5, {
                ["Lifetime"] = 10
            })
        end
        __set_list(v89, 1, {v49})
        local _ = #v89
        local v90 = {
            [u13.Ref] = v26
        }
        for v91, v92 in p23.FrameProps do
            v90[v91] = v92
        end
        local v93 = p23.DisplayPlayers
        if v93 then
            local function v104(p94) --[[ Line: 279 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u31
                    [3] = u32
                    [4] = u33
                    [5] = u6
                    [6] = u37
                    [7] = u16
                    [8] = u9
                    [9] = u4
                --]]
                local v95 = u13.createRef()
                local v96 = u13.createRef()
                local v97 = u13.createRef()
                local v98 = u31
                table.insert(v98, v95)
                local v99 = u32
                table.insert(v99, v96)
                local v100 = u33
                table.insert(v100, v97)
                local v101
                if u6.isHoarceKat() then
                    v101 = u37.members[p94]
                    if v101 ~= nil then
                        v101 = v101.displayName
                    end
                else
                    v101 = u16:GetPlayerByUserId(p94)
                    if v101 ~= nil then
                        v101 = v101.DisplayName
                    end
                end
                local v102 = u13.createFragment
                local v103 = {
                    ["PlayerRenderWrapper"] = u13.createElement("Frame", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["AutomaticSize"] = Enum.AutomaticSize.X
                    }, {
                        u13.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Vertical,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0, 7)
                        }),
                        ["PlayerRender"] = u13.createElement(u9, {
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["Position"] = UDim2.fromScale(0, -0.5),
                            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                            ["BorderSizePixel"] = 0,
                            ["BackgroundColor3"] = u4.WHITE,
                            ["ImageTransparency"] = 1,
                            ["BackgroundTransparency"] = 1,
                            ["PlayerUserId"] = p94,
                            [u13.Ref] = v95,
                            ["LayoutOrder"] = 0
                        }, { u13.createElement("UICorner", {
                                ["CornerRadius"] = UDim.new(1, 0)
                            }) }),
                        u13.createElement("TextLabel", {
                            ["Size"] = UDim2.fromOffset(0, 0),
                            ["AutomaticSize"] = Enum.AutomaticSize.X,
                            ["Text"] = v101,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            ["TextColor3"] = u4.WHITE,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 1,
                            ["TextScaled"] = true,
                            [u13.Ref] = v96
                        }, { u13.createElement("UIStroke", {
                                ["Color"] = u4.BLACK,
                                ["Thickness"] = 0,
                                [u13.Ref] = v97
                            }) })
                    })
                }
                return v102(v103)
            end
            local v105 = table.create(#v36)
            for v106, v107 in v36 do
                v105[v106] = v104(v107, v106 - 1, v36)
            end
            local v108 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v109 = { u13.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["Padding"] = UDim.new(0.02, 0)
                }) }
            local v110 = #v109
            for v111, v112 in v105 do
                v109[v110 + v111] = v112
            end
            v93 = u13.createFragment({
                ["PlayerRenderList"] = u13.createElement(u7, v108, v109)
            })
        end
        local v113 = {
            u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.5889830508474576,
                ["DominantAxis"] = "Height"
            }),
            u13.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 20)
            }),
            ["WinningTeamWrapper"] = u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.55)
            }, {
                ["WinningTeamPrimaryBanner"] = u13.createElement("Frame", {
                    ["BackgroundColor3"] = u4.WHITE,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 1,
                    [u13.Ref] = u27
                }, {
                    ["TopWhiteBorder"] = u13.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 0.025),
                        ["BackgroundColor3"] = u4.WHITE
                    }, { u13.createElement("UIGradient", {
                            ["Rotation"] = 0,
                            ["Transparency"] = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }),
                    ["BottomWhiteBorder"] = u13.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 0.025),
                        ["AnchorPoint"] = Vector2.new(0, 1),
                        ["Position"] = UDim2.fromScale(0, 1),
                        ["BackgroundColor3"] = u4.WHITE
                    }, { u13.createElement("UIGradient", {
                            ["Rotation"] = 0,
                            ["Transparency"] = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }),
                    u13.createElement("UIGradient", {
                        ["Rotation"] = 0,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v45), ColorSequenceKeypoint.new(1, v45) }),
                        ["Transparency"] = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.2, 0.6),
                            NumberSequenceKeypoint.new(0.5, 0.6),
                            NumberSequenceKeypoint.new(0.8, 0.6),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    })
                }),
                ["WinningTeamSecondaryBannerWrapper"] = u13.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, {
                    ["WinningTeamSecondaryBanner"] = u13.createElement("Frame", {
                        ["BackgroundColor3"] = u4.WHITE,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 2,
                        [u13.Ref] = u28
                    }, { u13.createElement("UIGradient", {
                            ["Rotation"] = 0,
                            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v45), ColorSequenceKeypoint.new(1, v45) }),
                            ["Transparency"] = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) })
                }),
                ["WinningTeamTitleWrapper"] = u13.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.45),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.55)
                }, {
                    ["WinningTeamTitle"] = u13.createElement("TextLabel", {
                        ["Text"] = v35,
                        ["Size"] = UDim2.fromScale(0, 0),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Font"] = Enum.Font.LuckiestGuy,
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["ZIndex"] = 3,
                        [u13.Ref] = u29
                    }, { u13.createElement("UIStroke", {
                            ["Color"] = u4.darken(v45, 0.8),
                            ["Thickness"] = 3,
                            [u13.Ref] = u30
                        }) })
                })
            })
        }
        local v114 = #v113
        if v93 then
            v113[v114 + 1] = v93
        end
        v89.VictorySection = u13.createFragment({
            ["VictorySection"] = u13.createElement(u7, v90, v113)
        })
        return u13.createFragment(v89)
    end)
}