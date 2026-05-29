local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = v1.import(script, script.Parent, "event-team-selected-content").EventTeamSelectedContent
return {
    ["EventTeams"] = v11.new(u10)(function(p21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u17
            [3] = u15
            [4] = u9
            [5] = u14
            [6] = u6
            [7] = u5
            [8] = u19
            [9] = u7
            [10] = u20
            [11] = u2
            [12] = u16
            [13] = u18
            [14] = u13
            [15] = u8
            [16] = u4
        --]]
        local v23 = p22.useState
        local v24 = p22.useEffect
        local u25 = u10.createRef()
        local u26 = u10.createRef()
        local u27 = u10.createRef()
        local u28 = u10.createRef()
        local u29 = u10.createRef()
        local u30 = u10.createRef()
        local u31 = u10.createRef()
        local u32 = u10.createRef()
        local u33 = u10.createRef()
        local u34 = u10.createRef()
        local u35 = u17[p21.EventType]
        local v36 = 0
        local u37 = false
        local u38 = Random.new():NextInteger(1, 2)
        local v39 = u35.customPagesConfig
        if v39 ~= nil then
            v39 = v39.setTeamPage
        end
        if v39 ~= nil then
            local v40 = u15:getState().Event.profileData.events[p21.EventType]
            local v41
            if v40 == nil then
                v41 = v40
            else
                v41 = v40.globalTeamKey
            end
            if v41 then
                local v42
                if v40 == nil then
                    v42 = v40
                else
                    v42 = v40.globalTeamKey
                end
                u37 = v42 ~= nil
                local v43 = v40.totalGlobalTeamContribution
                v36 = v43 == nil and 0 or v43
                if v41 == u35.customPagesConfig.setTeamPage.team1.globalTeamKey then
                    u38 = 1
                elseif v41 == u35.customPagesConfig.setTeamPage.team2.globalTeamKey then
                    u38 = 2
                end
            end
        end
        local u44, u45 = v23(u38)
        v24(function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u9
                [3] = u38
                [4] = u25
                [5] = u27
                [6] = u14
                [7] = u26
                [8] = u28
            --]]
            if u37 then
                local u46 = u9.new()
                if u38 == 1 then
                    local v47 = u25:getValue()
                    local v48 = u27:getValue()
                    if not (v47 and v48) then
                        return nil
                    end
                    local u49 = u14:Create(v48, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = 5,
                        ["Size"] = UDim2.fromScale(1, 1)
                    })
                    local u50 = u14:Create(v48, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = -5
                    })
                    local u51 = u14:Create(v48, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = 0
                    })
                    u46:GiveTask(v47.Activated:Connect(function() --[[ Line: 89 ]]
                        --[[
                        Upvalues:
                            [1] = u49
                            [2] = u50
                            [3] = u51
                        --]]
                        u49:Play()
                        u49.Completed:Connect(function() --[[ Line: 91 ]]
                            --[[
                            Upvalues:
                                [1] = u50
                                [2] = u51
                            --]]
                            u50:Play()
                            u50.Completed:Connect(function() --[[ Line: 93 ]]
                                --[[
                                Upvalues:
                                    [1] = u51
                                --]]
                                u51:Play()
                            end)
                        end)
                    end))
                end
                if u38 == 2 then
                    local v52 = u26:getValue()
                    local v53 = u28:getValue()
                    if not (v52 and v53) then
                        return nil
                    end
                    local u54 = u14:Create(v53, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = 5,
                        ["Size"] = UDim2.fromScale(1, 1)
                    })
                    local u55 = u14:Create(v53, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = -5
                    })
                    local u56 = u14:Create(v53, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        ["Rotation"] = 0
                    })
                    u46:GiveTask(v52.Activated:Connect(function() --[[ Line: 116 ]]
                        --[[
                        Upvalues:
                            [1] = u54
                            [2] = u55
                            [3] = u56
                        --]]
                        u54:Play()
                        u54.Completed:Connect(function() --[[ Line: 118 ]]
                            --[[
                            Upvalues:
                                [1] = u55
                                [2] = u56
                            --]]
                            u55:Play()
                            u55.Completed:Connect(function() --[[ Line: 120 ]]
                                --[[
                                Upvalues:
                                    [1] = u56
                                --]]
                                u56:Play()
                            end)
                        end)
                    end))
                end
                return function() --[[ Line: 126 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                    --]]
                    u46:DoCleaning()
                end
            end
        end, {})
        v24(function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u25
                [3] = u26
                [4] = u27
                [5] = u28
                [6] = u29
                [7] = u30
                [8] = u31
                [9] = u32
                [10] = u33
                [11] = u34
                [12] = u9
                [13] = u14
                [14] = u6
            --]]
            if not u37 then
                local v57 = u25:getValue()
                local v58 = u26:getValue()
                local v59 = u27:getValue()
                local v60 = u28:getValue()
                local v61 = u29:getValue()
                local v62 = u30:getValue()
                local v63 = u31:getValue()
                local v64 = u32:getValue()
                local v65 = u33:getValue()
                local v66 = u34:getValue()
                if not (v57 and (v58 and (v59 and (v60 and (v61 and (v62 and (v63 and (v64 and (v65 and v66))))))))) then
                    return nil
                end
                local u67 = u9.new()
                local u68 = u14:Create(v59, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 5,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                local u69 = u14:Create(v59, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = -5
                })
                local u70 = u14:Create(v59, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 0
                })
                local u71 = u14:Create(v59, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 0,
                    ["Size"] = UDim2.fromScale(0.9, 0.9)
                })
                local u72 = u14:Create(v60, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 5,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                local u73 = u14:Create(v60, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = -5
                })
                local u74 = u14:Create(v60, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 0
                })
                local u75 = u14:Create(v60, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["Rotation"] = 0,
                    ["Size"] = UDim2.fromScale(0.9, 0.9)
                })
                local u76 = u14:Create(v63, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["TextSize"] = u6.isSmallScreen() and 24 or 45
                })
                local u77 = u14:Create(v63, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["TextSize"] = u6.isSmallScreen() and 20 or 40
                })
                local u78 = u14:Create(v64, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["TextSize"] = u6.isSmallScreen() and 24 or 45
                })
                local u79 = u14:Create(v64, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["TextSize"] = u6.isSmallScreen() and 20 or 40
                })
                local u80 = u14:Create(v65, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["BackgroundTransparency"] = 1
                })
                local u81 = u14:Create(v65, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["BackgroundTransparency"] = 0.7
                })
                local u82 = u14:Create(v66, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["BackgroundTransparency"] = 1
                })
                local u83 = u14:Create(v66, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["BackgroundTransparency"] = 0.7
                })
                u67:GiveTask(v57.Activated:Connect(function() --[[ Line: 202 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                        [2] = u83
                        [3] = u76
                        [4] = u79
                        [5] = u68
                        [6] = u69
                        [7] = u70
                        [8] = u75
                    --]]
                    u80:Play()
                    u83:Play()
                    u76:Play()
                    u79:Play()
                    u68:Play()
                    u68.Completed:Connect(function() --[[ Line: 208 ]]
                        --[[
                        Upvalues:
                            [1] = u69
                            [2] = u70
                        --]]
                        u69:Play()
                        u69.Completed:Connect(function() --[[ Line: 210 ]]
                            --[[
                            Upvalues:
                                [1] = u70
                            --]]
                            u70:Play()
                        end)
                    end)
                    u75:Play()
                end))
                u67:GiveTask(v58.Activated:Connect(function() --[[ Line: 216 ]]
                    --[[
                    Upvalues:
                        [1] = u81
                        [2] = u82
                        [3] = u77
                        [4] = u78
                        [5] = u71
                        [6] = u72
                        [7] = u73
                        [8] = u74
                    --]]
                    u81:Play()
                    u82:Play()
                    u77:Play()
                    u78:Play()
                    u71:Play()
                    u72:Play()
                    u72.Completed:Connect(function() --[[ Line: 223 ]]
                        --[[
                        Upvalues:
                            [1] = u73
                            [2] = u74
                        --]]
                        u73:Play()
                        u73.Completed:Connect(function() --[[ Line: 225 ]]
                            --[[
                            Upvalues:
                                [1] = u74
                            --]]
                            u74:Play()
                        end)
                    end)
                end))
                return function() --[[ Line: 230 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                    --]]
                    u67:DoCleaning()
                end
            end
        end, {})
        local v84 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v85 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v85
        local v86 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v87 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v87
        local v88 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v89 = { u10.createElement("Frame", {
                [u10.Ref] = u33,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = u37 and u44 == 2 and 0.7 or 1,
                ["BackgroundColor3"] = u5.BLACK,
                ["ZIndex"] = 5
            }) }
        local _ = #v89
        local v90 = {
            [u10.Ref] = u31
        }
        local v91 = u35.customPagesConfig
        if v91 ~= nil then
            v91 = v91.setTeamPage
            if v91 ~= nil then
                v91 = v91.team1.name
            end
        end
        v90.Text = "TEAM " .. tostring(v91)
        v90.AnchorPoint = Vector2.new(0.5, 0.5)
        v90.Position = UDim2.fromScale(0.5, 0.2)
        v90.Size = UDim2.fromScale(1, 0.2)
        v90.BackgroundTransparency = 1
        v90.Font = Enum.Font.LuckiestGuy
        v90.TextColor3 = Color3.fromRGB(255, 255, 255)
        v90.TextWrapped = true
        local v92
        if u37 and u44 == 2 then
            v92 = u6.isSmallScreen() and 20 or 40
        else
            v92 = u6.isSmallScreen() and 24 or 45
        end
        v90.TextSize = v92
        v90.ZIndex = 4
        local v93 = {}
        local v94 = #v93
        local v95 = {
            ["Rotation"] = 90
        }
        local v96 = u5
        local v97 = u35.customPagesConfig
        if v97 ~= nil then
            v97 = v97.setTeamPage
            if v97 ~= nil then
                v97 = v97.team1
            end
        end
        local v98 = v97.teamColor
        if v98 == nil then
            v98 = u5.WHITE
        end
        local v99 = ColorSequenceKeypoint.new(0, v96.brighten(v98, 0.95))
        local v100 = u5
        local v101 = u35.customPagesConfig
        if v101 ~= nil then
            v101 = v101.setTeamPage
            if v101 ~= nil then
                v101 = v101.team1
            end
        end
        local v102 = v101.teamColor
        if v102 == nil then
            v102 = u5.WHITE
        end
        v95.Color = ColorSequence.new({ v99, ColorSequenceKeypoint.new(1, v100.darken(v102, 0.95)) })
        v93[v94 + 1] = u10.createElement("UIGradient", v95)
        v93[v94 + 2] = u10.createElement("UIStroke", {
            ["Thickness"] = 2.5,
            ["Color"] = Color3.fromRGB(0, 0, 0)
        })
        v89.TeamName = u10.createElement("TextLabel", v90, v93)
        local v103 = {
            [u10.Ref] = u25
        }
        local v104 = u35.customPagesConfig
        if v104 ~= nil then
            v104 = v104.setTeamPage
            if v104 ~= nil then
                v104 = v104.team1.backgroundImage
            end
        end
        v103.Image = v104
        v103.Size = UDim2.fromScale(1, 1)
        v103.ImageTransparency = 0
        v103.ScaleType = Enum.ScaleType.Stretch
        v103.BorderSizePixel = 0
        v103.BackgroundTransparency = 1
        v103.BackgroundColor3 = u19.backgroundTertiary
        v103[u10.Event.Activated] = function(_) --[[ Line: 349 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u45
            --]]
            if not u37 then
                u45(1)
            end
        end
        v89.BackgroundImage = u10.createElement("ImageButton", v103)
        local v105 = {
            [u10.Ref] = u27
        }
        local v106 = u35.customPagesConfig
        if v106 ~= nil then
            v106 = v106.setTeamPage
            if v106 ~= nil then
                v106 = v106.team1.iconImage
            end
        end
        v105.Image = v106
        v105.Position = UDim2.fromScale(0.5, 0.5)
        v105.AnchorPoint = Vector2.new(0.5, 0.5)
        local v107
        if u37 and u44 == 2 then
            v107 = UDim2.fromScale(0.9, 0.9)
        else
            v107 = UDim2.fromScale(1, 1)
        end
        v105.Size = v107
        v105.ScaleType = Enum.ScaleType.Stretch
        v105.BackgroundTransparency = 1
        v105.ZIndex = 2
        v89.TeamIconImage = u10.createElement("ImageLabel", v105)
        local v108 = {
            [u10.Ref] = u29
        }
        local v109 = u35.customPagesConfig
        if v109 ~= nil then
            v109 = v109.setTeamPage
            if v109 ~= nil then
                v109 = v109.team1.foregroundImage
            end
        end
        v108.Image = v109
        v108.Position = UDim2.fromScale(0.5, 0.5)
        v108.AnchorPoint = Vector2.new(0.5, 0.5)
        v108.Size = UDim2.fromScale(1, 1)
        v108.ScaleType = Enum.ScaleType.Stretch
        v108.BackgroundTransparency = 1
        v108.ZIndex = 3
        v89.TeamForeground = u10.createElement("ImageLabel", v108)
        v87.Team1 = u10.createElement(u7, v88, v89)
        local v110 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v111 = { u10.createElement("Frame", {
                [u10.Ref] = u34,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = u37 and u44 == 2 and 1 or 0.7,
                ["BackgroundColor3"] = u5.BLACK,
                ["ZIndex"] = 5
            }) }
        local _ = #v111
        local v112 = {
            [u10.Ref] = u32
        }
        local v113 = u35.customPagesConfig
        if v113 ~= nil then
            v113 = v113.setTeamPage
            if v113 ~= nil then
                v113 = v113.team2.name
            end
        end
        v112.Text = "TEAM " .. tostring(v113)
        v112.AnchorPoint = Vector2.new(0.5, 0.5)
        v112.Position = UDim2.fromScale(0.5, 0.2)
        v112.Size = UDim2.fromScale(1, 0.2)
        v112.BackgroundTransparency = 1
        v112.Font = Enum.Font.LuckiestGuy
        v112.TextColor3 = Color3.fromRGB(255, 255, 255)
        v112.TextWrapped = true
        local v114
        if u37 and u44 == 2 then
            v114 = u6.isSmallScreen() and 24 or 45
        else
            v114 = u6.isSmallScreen() and 20 or 40
        end
        v112.TextSize = v114
        v112.ZIndex = 4
        local v115 = {}
        local v116 = #v115
        local v117 = {
            ["Rotation"] = 90
        }
        local v118 = u5
        local v119 = u35.customPagesConfig
        if v119 ~= nil then
            v119 = v119.setTeamPage
            if v119 ~= nil then
                v119 = v119.team2
            end
        end
        local v120 = v119.teamColor
        if v120 == nil then
            v120 = u5.WHITE
        end
        local v121 = ColorSequenceKeypoint.new(0, v118.brighten(v120, 0.95))
        local v122 = u5
        local v123 = u35.customPagesConfig
        if v123 ~= nil then
            v123 = v123.setTeamPage
            if v123 ~= nil then
                v123 = v123.team2
            end
        end
        local v124 = v123.teamColor
        if v124 == nil then
            v124 = u5.WHITE
        end
        v117.Color = ColorSequence.new({ v121, ColorSequenceKeypoint.new(1, v122.darken(v124, 0.95)) })
        v115[v116 + 1] = u10.createElement("UIGradient", v117)
        v115[v116 + 2] = u10.createElement("UIStroke", {
            ["Thickness"] = 2.5,
            ["Color"] = Color3.fromRGB(0, 0, 0)
        })
        v111.TeamName = u10.createElement("TextLabel", v112, v115)
        local v125 = {
            [u10.Ref] = u26
        }
        local v126 = u35.customPagesConfig
        if v126 ~= nil then
            v126 = v126.setTeamPage
            if v126 ~= nil then
                v126 = v126.team2.backgroundImage
            end
        end
        v125.Image = v126
        v125.Size = UDim2.fromScale(1, 1)
        v125.ImageTransparency = 0
        v125.ScaleType = Enum.ScaleType.Stretch
        v125.BorderSizePixel = 0
        v125.BackgroundTransparency = 1
        v125.BackgroundColor3 = u19.backgroundTertiary
        v125[u10.Event.Activated] = function(_) --[[ Line: 482 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u45
            --]]
            if not u37 then
                u45(2)
            end
        end
        v111.BackgroundImage = u10.createElement("ImageButton", v125)
        local v127 = {
            [u10.Ref] = u28
        }
        local v128 = u35.customPagesConfig
        if v128 ~= nil then
            v128 = v128.setTeamPage
            if v128 ~= nil then
                v128 = v128.team2.iconImage
            end
        end
        v127.Image = v128
        v127.Position = UDim2.fromScale(0.5, 0.5)
        v127.AnchorPoint = Vector2.new(0.5, 0.5)
        local v129
        if u37 and u44 == 2 then
            v129 = UDim2.fromScale(1, 1)
        else
            v129 = UDim2.fromScale(0.9, 0.9)
        end
        v127.Size = v129
        v127.ScaleType = Enum.ScaleType.Stretch
        v127.BackgroundTransparency = 1
        v127.ZIndex = 2
        v111.TeamIconImage = u10.createElement("ImageLabel", v127)
        local v130 = {
            [u10.Ref] = u30
        }
        local v131 = u35.customPagesConfig
        if v131 ~= nil then
            v131 = v131.setTeamPage
            if v131 ~= nil then
                v131 = v131.team2.foregroundImage
            end
        end
        v130.Image = v131
        v130.Position = UDim2.fromScale(0.5, 0.5)
        v130.AnchorPoint = Vector2.new(0.5, 0.5)
        v130.Size = UDim2.fromScale(1, 1)
        v130.ScaleType = Enum.ScaleType.Stretch
        v130.BackgroundTransparency = 1
        v130.ZIndex = 3
        v111.TeamForeground = u10.createElement("ImageLabel", v130)
        v87.Team2 = u10.createElement(u7, v110, v111)
        v85.TeamImages = u10.createElement(u7, v86, v87)
        local v132 = not u37
        if v132 then
            local v133 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.25),
                ["Size"] = UDim2.fromScale(0.9, 0.4)
            }
            local v134 = {}
            local v135 = #v134
            local v136 = {}
            local v137 = u35.customPagesConfig
            if v137 ~= nil then
                v137 = v137.setTeamPage
                if v137 ~= nil then
                    v137 = v137.eventDescription
                end
            end
            v136.Text = "<b>" .. tostring(v137) .. "</b>"
            v136.TextSize = u37 and 20 or 14
            v136.AnchorPoint = Vector2.new(0.5, 0.5)
            v136.Position = UDim2.fromScale(0.5, 0.5)
            v136.Size = UDim2.fromScale(1, 1)
            v136.Font = Enum.Font.GothamBold
            v136.BorderColor3 = Color3.new(1, 1, 1)
            v136.BorderMode = Enum.BorderMode.Inset
            v136.TextColor3 = u5.WHITE
            v136.RichText = true
            v136.BackgroundTransparency = 1
            v134[v135 + 1] = u10.createElement("TextLabel", v136)
            v132 = u10.createFragment({
                ["EventDescription"] = u10.createElement("Frame", v133, v134)
            })
        end
        local v138 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v139 = {}
        local v140 = #v139
        if v132 then
            v139[v140 + 1] = v132
        end
        local v141 = #v139
        local v142 = u37
        if v142 then
            local v143 = {
                ["CoinsCollected"] = v36
            }
            local v144 = u35.customPagesConfig
            if v144 ~= nil then
                v144 = v144.setTeamPage
                if v144 ~= nil then
                    v144 = v144.eventContributionCurrency
                end
            end
            v143.ContributionCurrencyImage = v144 == nil and "" or v144
            v143.AppId = "EventTeamSelectedContent"
            v142 = u10.createElement(u20, v143)
        end
        if v142 then
            v139[v141 + 1] = v142
        end
        local v145 = #v139
        local v146 = not u37
        if v146 then
            local v147 = {}
            local v148
            if u44 == 1 then
                local v149 = u35.customPagesConfig
                if v149 ~= nil then
                    v149 = v149.setTeamPage
                    if v149 ~= nil then
                        v149 = v149.team1.name
                    end
                end
                v148 = "JOIN TEAM " .. tostring(v149)
            else
                local v150 = u35.customPagesConfig
                if v150 ~= nil then
                    v150 = v150.setTeamPage
                    if v150 ~= nil then
                        v150 = v150.team2.name
                    end
                end
                v148 = "JOIN TEAM " .. tostring(v150)
            end
            v147.Text = v148
            v147.Font = Enum.Font.GothamBold
            v147.AnchorPoint = Vector2.new(0.5, 0.5)
            v147.Position = UDim2.fromScale(0.5, 0.6)
            v147.Size = UDim2.new(0.5, 0, 0, 32)
            function v147.OnClick() --[[ Line: 623 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u16
                    [3] = u44
                    [4] = u35
                    [5] = u5
                    [6] = u19
                    [7] = u18
                    [8] = u13
                    [9] = u8
                --]]
                local v151 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v152 = u16.CONFIRMATION_MODAL
                local v153 = {}
                local v154
                if u44 == 1 then
                    local v155 = u35.customPagesConfig
                    if v155 ~= nil then
                        v155 = v155.setTeamPage
                        if v155 ~= nil then
                            v155 = v155.team1.nameTagIcon
                        end
                    end
                    v154 = "Join Team " .. tostring(v155)
                else
                    local v156 = u35.customPagesConfig
                    if v156 ~= nil then
                        v156 = v156.setTeamPage
                        if v156 ~= nil then
                            v156 = v156.team2.nameTagIcon
                        end
                    end
                    v154 = "Join Team " .. tostring(v156)
                end
                v153.Title = v154
                local v157
                if u44 == 1 then
                    local v158 = u5
                    local v159 = u35.customPagesConfig
                    if v159 ~= nil then
                        v159 = v159.setTeamPage
                        if v159 ~= nil then
                            v159 = v159.team1.teamColor
                        end
                    end
                    if v159 == nil then
                        v159 = u5.WHITE
                    end
                    local v160 = v158.richTextColor(v159)
                    local v161 = u35.customPagesConfig
                    if v161 ~= nil then
                        v161 = v161.setTeamPage
                        if v161 ~= nil then
                            v161 = v161.team1.name
                        end
                    end
                    v157 = "Are you sure you want to join team <font transparency=\"0\" color=\"" .. v160 .. "\"><b>" .. tostring(v161) .. "</b></font>?\n\nOnce selected you will be locked in for the event."
                else
                    local v162 = u5
                    local v163 = u35.customPagesConfig
                    if v163 ~= nil then
                        v163 = v163.setTeamPage
                        if v163 ~= nil then
                            v163 = v163.team2.teamColor
                        end
                    end
                    if v163 == nil then
                        v163 = u5.WHITE
                    end
                    local v164 = v162.richTextColor(v163)
                    local v165 = u35.customPagesConfig
                    if v165 ~= nil then
                        v165 = v165.setTeamPage
                        if v165 ~= nil then
                            v165 = v165.team2.name
                        end
                    end
                    v157 = "Are you sure you want to join team <font transparency=\"0\" color=\"" .. v164 .. "\"><b>" .. tostring(v165) .. "</b></font>?\n\nOnce selected you will be locked in for the event."
                end
                v153.Body = v157
                v153.PrimaryBtnProps = {
                    ["Text"] = "Confirm",
                    ["BackgroundColor3"] = u19.backgroundSuccess
                }
                v153.SecondaryBtnProps = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u19.backgroundError
                }
                function v153.OnPrimaryBtnClick(_) --[[ Line: 705 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u44
                        [3] = u18
                        [4] = u13
                        [5] = u2
                        [6] = u16
                    --]]
                    local v166 = u35.customPagesConfig
                    if v166 ~= nil then
                        v166 = v166.setTeamPage
                        if v166 ~= nil then
                            v166 = v166.globalTeamEventKey
                        end
                    end
                    local v167
                    if u44 == 1 then
                        v167 = u35.customPagesConfig
                        if v167 ~= nil then
                            v167 = v167.setTeamPage
                            if v167 ~= nil then
                                v167 = v167.team1.globalTeamKey
                            end
                        end
                    else
                        v167 = u35.customPagesConfig
                        if v167 ~= nil then
                            v167 = v167.setTeamPage
                            if v167 ~= nil then
                                v167 = v167.team2.globalTeamKey
                            end
                        end
                    end
                    if not (v166 and v167) then
                        return nil
                    end
                    u18.Client:Get("GlobalTeamsSetTeam"):SendToServer({
                        ["player"] = u13.LocalPlayer,
                        ["globalTeamEventKey"] = v166,
                        ["globalTeamKey"] = v167
                    })
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.EVENT_APP)
                end
                function v153.OnSecondaryBtnClick() --[[ Line: 745 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u8
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.OVERLAY)
                end
                v151:openApp(v152, v153)
            end
            v147.CornerRadius = UDim.new(0, 5)
            v147.TextSize = 24
            v147.BackgroundColor3 = u19.backgroundSuccess
            v147.LayoutOrder = 1
            v147.Selectable = true
            v146 = u10.createElement(u4, v147)
        end
        if v146 then
            v139[v145 + 1] = v146
        end
        v85.TeamInfo = u10.createElement(u7, v138, v139)
        return u10.createFragment({
            ["EventTeams"] = u10.createElement(u7, v84, v85)
        })
    end)
}