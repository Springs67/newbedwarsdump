local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DarkBackground
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.Padding
local u10 = v3.SoundManager
local u11 = v3.TimedProgressBar
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tableutil")
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "game", "pregame", "draft", "ui", "match-draft-player-row").MatchDraftPlayerRow
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent, "kit-pool-frame").KitPoolFrame
local v149 = v14.new(u13)(function(u26, p27) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
        [3] = u23
        [4] = u2
        [5] = u10
        [6] = u24
        [7] = u19
        [8] = u22
        [9] = u6
        [10] = u8
        [11] = u5
        [12] = u11
        [13] = u18
        [14] = u21
        [15] = u12
        [16] = u17
        [17] = u20
        [18] = u25
        [19] = u4
        [20] = u9
    --]]
    local _ = p27.useEffect
    local _ = p27.useState
    local _ = p27.useValue
    local v28 = p27.useMemo
    local u29 = u26.store.Game.myTeam
    local v30 = nil
    for v31, v32 in u26.store.Game.teams do
        local _ = v31 - 1
        local v33 = v32.id
        local v34
        if u29 == nil then
            v34 = u29
        else
            v34 = u29.id
        end
        if v33 ~= v34 == true then
            v30 = v32
        end
    end
    if not (u29 and v30) then
        return u13.createFragment()
    end
    local v35 = u13.createRef()
    local v36 = u13.createRef()
    local v37 = u13.createRef()
    local function u41(p38) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u23
            [3] = u2
            [4] = u10
            [5] = u24
        --]]
        if not p38 then
            return nil
        end
        if u7.isHoarceKat() then
            return nil
        end
        local v39 = u23.Client:Get("SwapKit"):CallServer(p38)
        if not v39.success then
            local v40 = v39.message
            if v40 == "" or not v40 then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = v39.message
            })
            return nil
        end
        u10:playSound(u24.UI_CLICK)
    end
    local function u44() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u23
            [3] = u2
            [4] = u10
            [5] = u24
        --]]
        if u7.isHoarceKat() then
            return nil
        end
        local v42 = u23.Client:Get("RerollKit"):CallServer()
        if not v42.success then
            local v43 = v42.message
            if v43 == "" or not v43 then
                return nil
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = v42.message
            })
            return nil
        end
        u10:playSound(u24.UI_CLICK)
    end
    local v45 = u19.Reverse(u26.store.ARKDraft.kitPool)
    local v46 = #v45
    local v47 = false
    local v48 = 0
    while true do
        if v47 then
            v48 = v48 + 1
        else
            v47 = true
        end
        if v48 >= 8 - v46 then
            local v49 = {
                ["DisplayOrder"] = 1500,
                ["IgnoreGuiInset"] = true
            }
            local v50 = { u13.createElement(u6, {
                    ["AppId"] = u26.AppId
                }) }
            local _ = #v50
            local v51 = {
                ["AutoButtonColor"] = false,
                ["Image"] = "rbxassetid://71356717298935",
                ["Modal"] = true,
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScaleType"] = Enum.ScaleType.Crop
            }
            local v79 = {
                ["ARKSDraftAppBackgroundTint"] = u13.createElement(u8, {
                    ["Size"] = UDim2.fromScale(1, 1)
                }, {
                    ["HeaderPane"] = u13.createElement("Frame", {
                        ["Transparency"] = 0.2,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 0.25),
                        ["BackgroundColor3"] = u5.BLACK
                    }),
                    ["LeftPane"] = u13.createElement("Frame", {
                        ["Transparency"] = 0.2,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(0.25, 0.75),
                        ["Position"] = UDim2.fromScale(0, 0.25),
                        ["BackgroundColor3"] = u5.BLACK
                    }),
                    ["RightPane"] = u13.createElement("Frame", {
                        ["Transparency"] = 0.2,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(0.25, 0.75),
                        ["Position"] = UDim2.fromScale(1, 0.25),
                        ["AnchorPoint"] = Vector2.new(1, 0),
                        ["BackgroundColor3"] = u5.BLACK
                    }),
                    ["CenterBodyPane"] = u13.createElement("Frame", {
                        ["Transparency"] = 0.2,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.fromScale(0.5, 0.75),
                        ["Position"] = UDim2.fromScale(0.5, 0.25),
                        ["AnchorPoint"] = Vector2.new(0.5, 0),
                        ["BackgroundColor3"] = u5.BLACK
                    })
                }),
                ["BackgroundGradient"] = u13.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u5.BLACK,
                    [u13.Ref] = v35
                }, { u13.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
                        ["Color"] = ColorSequence.new(u5.WHITE)
                    }) }),
                ["HeaderContainer"] = u13.createElement(u8, {
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0)
                }, { u13.createElement(u8, {
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    }, {
                        ["PhaseTitleContainer"] = u13.createElement(u8, {
                            ["Size"] = UDim2.fromScale(1, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0),
                            ["Position"] = UDim2.fromScale(0.5, 0),
                            [u13.Ref] = v36
                        }),
                        v28(function() --[[ Line: 198 ]]
                            --[[
                            Upvalues:
                                [1] = u13
                                [2] = u8
                                [3] = u11
                                [4] = u18
                                [5] = u26
                                [6] = u21
                                [7] = u24
                            --]]
                            local v52 = u13.createFragment
                            local v53 = {}
                            local v54 = u13.createElement
                            local v55 = u8
                            local v56 = {
                                ["Size"] = UDim2.fromScale(1, 0.5),
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Position"] = UDim2.fromScale(0.5, 0.68)
                            }
                            local v57 = {}
                            local v58 = u13.createElement
                            local v59 = u8
                            local v60 = {
                                ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                                ["AnchorPoint"] = Vector2.new(0, 0.5),
                                ["Position"] = UDim2.fromScale(0, 0.5)
                            }
                            local v61 = {}
                            local v62 = u13.createElement("UIPadding", {
                                ["PaddingRight"] = UDim.new(0.1, 0),
                                ["PaddingLeft"] = UDim.new(0.1, 0)
                            })
                            local v63 = u13.createElement
                            local v64 = u11
                            local v65 = {
                                ["Rotation"] = 180,
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["StartTime"] = u18:GetServerTimeNow(),
                                ["EndTime"] = u26.store.Game.startTime,
                                ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                                ["ProgressBarConfig"] = {
                                    ["GradientRotation"] = 180,
                                    ["Flip"] = true,
                                    ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                                }
                            }
                            __set_list(v61, 1, {v62, v63(v64, v65)})
                            local v66 = v58(v59, v60, v61)
                            local v67 = u13.createElement
                            local v68 = u21
                            local v69 = {
                                ["OnlyPlaySoundLastNSec"] = 10,
                                ["EndTime"] = u26.store.Game.startTime,
                                ["FrameProps"] = {
                                    ["ZIndex"] = 3,
                                    ["Size"] = UDim2.fromScale(0.2, 0.9),
                                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                                },
                                ["PlayCustomSoundAtTime"] = {
                                    ["timeLeftSec"] = 3,
                                    ["sound"] = u24.LTM_GOAL_MOVING_SOUND
                                }
                            }
                            local v70 = v67(v68, v69)
                            local v71 = u13.createElement
                            local v72 = u8
                            local v73 = {
                                ["Size"] = UDim2.new(0.45, 0, 0.15, 0),
                                ["AnchorPoint"] = Vector2.new(1, 0.5),
                                ["Position"] = UDim2.fromScale(1, 0.5)
                            }
                            local v74 = {}
                            local v75 = u13.createElement("UIPadding", {
                                ["PaddingRight"] = UDim.new(0.1, 0),
                                ["PaddingLeft"] = UDim.new(0.1, 0)
                            })
                            local v76 = u13.createElement
                            local v77 = u11
                            local v78 = {
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["StartTime"] = u18:GetServerTimeNow(),
                                ["EndTime"] = u26.store.Game.startTime,
                                ["BackgroundColor3"] = Color3.fromRGB(64, 5, 5),
                                ["ProgressBarConfig"] = {
                                    ["GradientRotation"] = 180,
                                    ["Flip"] = true,
                                    ["BarGradient"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                                }
                            }
                            __set_list(v74, 1, {v75, v76(v77, v78)})
                            __set_list(v57, 1, {v66, v70, v71(v72, v73, v74)})
                            v53.CountdownSection = v54(v55, v56, v57)
                            return v52(v53)
                        end, { u26.store.Game.startTime })
                    }) })
            }
            local _ = #v79
            local v80 = {
                ["Size"] = UDim2.fromScale(1, 0.75),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.25)
            }
            local v81 = { u13.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 0),
                    ["PaddingBottom"] = UDim.new(0.04, 0),
                    ["PaddingLeft"] = UDim.new(0.04, 0),
                    ["PaddingRight"] = UDim.new(0.04, 0)
                }) }
            local _ = #v81
            local v82 = u12
            local v83
            if u29 == nil then
                v83 = u29
            else
                v83 = u29.members
            end
            local v84 = v82.values(v83)
            local function v92(p85) --[[ Line: 289 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u17
                    [3] = u26
                    [4] = u29
                    [5] = u13
                    [6] = u20
                --]]
                local v86 = u7.isHoarceKat() and true or p85.userId == u17.LocalPlayer.UserId
                local v87 = u26.store.ARKDraft.kitSelection
                local v88 = p85.userId
                local v89 = {}
                local v90 = {
                    ["KitLockedIn"] = true,
                    ["Player"] = p85,
                    ["Kit"] = v87[tostring(v88)]
                }
                local v91 = u29
                if v91 ~= nil then
                    v91 = v91.color
                end
                v90.TeamColor = v91
                v89.CardData = v90
                v89.LayoutOrder = v86 and 0 or 1
                v89.HideBanBox = true
                return u13.createElement(u20, v89)
            end
            local v93 = table.create(#v84)
            for v94, v95 in v84 do
                v93[v94] = v92(v95, v94 - 1, v84)
            end
            local v96 = {
                ["Size"] = UDim2.fromScale(0.22, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AnchorPoint"] = Vector2.new(0, 0)
            }
            local v97 = { u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0.02, 0),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v98 = #v97
            for v99, v100 in v93 do
                v97[v98 + v99] = v100
            end
            v81.Team1Column = u13.createElement(u8, v96, v97)
            local v101 = {
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                [u13.Ref] = v37
            }
            local v102 = { u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Top",
                    ["Padding"] = UDim.new(0.01, 0),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v103 = #v102
            local v104 = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
            local v105 = { u13.createElement("TextLabel", {
                    ["Text"] = "Available Kits",
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextStrokeTransparency"] = 1,
                    ["TextWrapped"] = true,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.1),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.1),
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextColor3"] = u5.WHITE
                }) }
            local _ = #v105
            local v106 = 0
            local v107 = {}
            for v108, v109 in v45 do
                if v108 - 1 < 4 == true then
                    v106 = v106 + 1
                    v107[v106] = v109
                end
            end
            local function v116(u110, p111) --[[ Line: 386 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u41
                    [3] = u17
                    [4] = u13
                    [5] = u25
                --]]
                local v112 = {}
                local v113
                if u110.kit == u22.NONE then
                    v113 = nil
                else
                    v113 = u110.kit
                end
                v112.Kit = v113
                v112.FrameProps = {
                    ["Size"] = UDim2.fromScale(0.25, 1),
                    ["Position"] = UDim2.fromScale(0.25 * p111, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0)
                }
                function v112.OnClick() --[[ Line: 394 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u110
                    --]]
                    return u41(u110.kit)
                end
                local v114
                if u110 == nil then
                    v114 = u110
                else
                    v114 = u110.prevSelectionUser
                end
                local v115
                if v114 == u17.LocalPlayer.UserId then
                    v115 = u110.prevSelectionUserCooldownExpireTime
                else
                    v115 = u110.othersCooldownExpireTime
                end
                v112.CooldownExpireTime = v115
                return u13.createElement(u25, v112)
            end
            local v117 = table.create(#v107)
            for v118, v119 in v107 do
                v117[v118] = v116(v119, v118 - 1, v107)
            end
            local v120 = {
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0, 0.2)
            }
            local v121 = {}
            local v122 = #v121
            for v123, v124 in v117 do
                v121[v122 + v123] = v124
            end
            v105.UpperContainer = u13.createElement(u8, v120, v121)
            local v125 = 0
            local v126 = {}
            for v127, v128 in v45 do
                if v127 - 1 >= 4 == true then
                    v125 = v125 + 1
                    v126[v125] = v128
                end
            end
            local function v135(u129, p130) --[[ Line: 434 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u41
                    [3] = u17
                    [4] = u13
                    [5] = u25
                --]]
                local v131 = {}
                local v132
                if u129.kit == u22.NONE then
                    v132 = nil
                else
                    v132 = u129.kit
                end
                v131.Kit = v132
                v131.FrameProps = {
                    ["Size"] = UDim2.fromScale(0.25, 1),
                    ["Position"] = UDim2.fromScale(0.25 * p130, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0)
                }
                function v131.OnClick() --[[ Line: 444 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u129
                    --]]
                    return u41(u129.kit)
                end
                local v133
                if u129 == nil then
                    v133 = u129
                else
                    v133 = u129.prevSelectionUser
                end
                local v134
                if v133 == u17.LocalPlayer.UserId then
                    v134 = u129.prevSelectionUserCooldownExpireTime
                else
                    v134 = u129.othersCooldownExpireTime
                end
                v131.CooldownExpireTime = v134
                return u13.createElement(u25, v131)
            end
            local v136 = table.create(#v126)
            for v137, v138 in v126 do
                v136[v137] = v135(v138, v137 - 1, v126)
            end
            local v139 = {
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0, 0.5)
            }
            local v140 = {}
            local v141 = #v140
            for v142, v143 in v136 do
                v140[v141 + v142] = v143
            end
            v105.BottomContainer = u13.createElement(u8, v139, v140)
            v102.KitSelectionListContainer = u13.createElement(u8, v104, v105)
            local v144 = {
                ["Size"] = UDim2.fromScale(0.4, 0.1)
            }
            local v145
            if u7.isHoarceKat() then
                v145 = 0
            else
                local v146 = u26.store.ARKDraft.playerRerolls
                local v147 = u17.LocalPlayer.UserId
                v145 = v146[tostring(v147)]
            end
            v144.Text = "Reroll (" .. tostring(v145) .. "/2)"
            v144.BackgroundColor3 = u5.WHITE
            v144.BackgroundTransparency = 0.5
            function v144.OnClick() --[[ Line: 487 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                return u44()
            end
            v144.TextScaled = true
            v144.LayoutOrder = 1
            v102[v103 + 1] = u13.createElement(u4, v144, { u13.createElement(u9, {
                    ["Padding"] = UDim.new(0.15, 0)
                }) })
            v81.KitSelection = u13.createElement(u8, v101, v102)
            v79.BodyContainer = u13.createElement(u8, v80, v81)
            v50.ARKSDraftAppBackground = u13.createElement("ImageButton", v51, v79)
            return u13.createElement("ScreenGui", v49, v50)
        end
        local v148 = {
            ["othersCooldownExpireTime"] = -1,
            ["prevSelectionUserCooldownExpireTime"] = -1,
            ["prevSelectionUser"] = -1,
            ["kit"] = u22.NONE
        }
        table.insert(v45, v148)
    end
end)
return {
    ["AllRandomKitDraftApp"] = v15.connect(function(p150, p151) --[[ Line: 503 ]]
        local v152 = {}
        for v153, v154 in p151 do
            v152[v153] = v154
        end
        v152.store = p150
        return v152
    end)(v149)
}