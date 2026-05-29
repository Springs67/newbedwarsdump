local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.ProgressBar
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "pvp-arena-augment-team-card").PvpArenaAugmentTeamCard
return {
    ["PvPArenaTeamHealthPanel"] = v10.new(u9)(function(p16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u4
            [4] = u11
            [5] = u8
            [6] = u13
            [7] = u12
            [8] = u3
            [9] = u14
            [10] = u15
            [11] = u6
            [12] = u5
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local u20, u21 = v18(false)
        local u22, u23 = v18(false)
        local u24, u25 = v18(false)
        local u26 = u9.createRef()
        local u27 = u9.createRef()
        local v28 = u7.values(p16.teamHealth.team.members)
        local v29 = nil
        local v30
        if v28[1] == nil then
            v30 = nil
        else
            v30 = v28[1].userId
        end
        if v28[2] ~= nil then
            v29 = v28[2].userId
        end
        local v31 = p16.teamHealth.health <= 0
        local v32
        if u4.isHoarceKat() then
            v32 = false
        else
            local v33 = u11.LocalPlayer.UserId
            local v34 = v28[1]
            if v34 ~= nil then
                v34 = v34.userId
            end
            v32 = v33 == v34
            if not v32 then
                local v35 = u11.LocalPlayer.UserId
                local v36 = v28[2]
                if v36 ~= nil then
                    v36 = v36.userId
                end
                v32 = v35 == v36
            end
        end
        v19(function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
                [3] = u8
                [4] = u23
                [5] = u24
                [6] = u20
                [7] = u21
                [8] = u25
                [9] = u4
                [10] = u13
                [11] = u12
            --]]
            local v37 = u26:getValue()
            local v38 = u27:getValue()
            if not v37 then
                return nil
            end
            if not v38 then
                return nil
            end
            local u39 = u8.new()
            u39:GiveTask(v37.MouseEnter:Connect(function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23(true)
            end))
            u39:GiveTask(v37.MouseLeave:Connect(function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u23
                    [3] = u20
                    [4] = u21
                --]]
                if not u24 then
                    u23(false)
                    if u20 then
                        u21(false)
                    end
                end
            end))
            u39:GiveTask(v38.MouseEnter:Connect(function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25(true)
            end))
            u39:GiveTask(v38.MouseLeave:Connect(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u24
                    [3] = u23
                    [4] = u20
                    [5] = u21
                --]]
                u25(false)
                if u24 then
                    u23(false)
                    if u20 then
                        u21(false)
                    end
                end
            end))
            if not u4.isHoarceKat() then
                task.defer(function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u13
                        [3] = u12
                        [4] = u21
                    --]]
                    u39:GiveTask(u13.Client:Get("PvPArenaGameStateChanged"):Connect(function(p40) --[[ Line: 91 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u21
                        --]]
                        if p40.gameState == u12.IN_PROGRESS then
                            u21(false)
                        end
                    end))
                end)
            end
            return function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                u39:DoCleaning()
            end
        end, { u22, u24 })
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 0.09),
            ["LayoutOrder"] = p16.LayoutOrder
        }
        local v42 = { u9.createElement("ImageButton", {
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Size"] = UDim2.fromScale(3, 1),
                ["Position"] = UDim2.fromScale(1, 0),
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 1,
                [u9.Event.MouseButton1Click] = function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u21
                        [3] = u20
                    --]]
                    if u22 then
                        u21(not u20)
                    end
                end,
                [u9.Ref] = u27,
                ["Active"] = u22,
                ["Interactable"] = u22
            }) }
        local v43 = #v42
        local v44 = {
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(1, 0),
            ["BackgroundTransparency"] = 0
        }
        local v45
        if v31 then
            v45 = u3.darken(u14.backgroundPrimary, 0.8)
        elseif v32 then
            v45 = Color3.fromHex("#777BC7")
        else
            v45 = u14.backgroundPrimary
        end
        v44.BackgroundColor3 = v45
        v44.ImageTransparency = 1
        v44[u9.Event.MouseButton1Click] = function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u20
            --]]
            u21(not u20)
        end
        v44[u9.Ref] = u26
        local v46 = {}
        local v47 = #v46
        if u20 or u22 then
            u22 = u9.createElement(u15, {
                ["AppId"] = "PvpArenaAugmentTeamCard",
                ["team"] = p16.teamHealth.team
            })
        end
        if u22 then
            v46[v47 + 1] = u22
        end
        local v48 = #v46
        v46[v48 + 1] = u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2.5
        })
        v46[v48 + 2] = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        local v49 = v48 + 3
        local v50 = u9.createElement
        local v51 = "UIStroke"
        local v52 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v53
        if v31 then
            v53 = u3.darken(u14.backgroundSecondary, 0.8)
        elseif v32 then
            v53 = Color3.fromHex("#FFEF5E")
        else
            v53 = u14.backgroundSecondary
        end
        v52.Color = v53
        v46[v49] = v50(v51, v52)
        local v54 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(0.7, 0.5),
            ["Position"] = UDim2.fromScale(0.1, 0.1)
        }
        local v55 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }) }
        local _ = #v55
        local v56 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.24, 0.24),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundTransparency"] = v31 and 0.5 or 0.1
        }
        local v57
        if v31 then
            v57 = u3.darken(u3.WHITE, 0.8)
        else
            v57 = u3.WHITE
        end
        v56.BackgroundColor3 = v57
        local v58
        if v30 == 0 or (v30 ~= v30 or not v30) then
            v58 = nil
        else
            v58 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v30) .. "&w=48&h=48"
        end
        v56.Image = v58
        local v59 = {}
        local v60 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v61 = u9.createElement
        local v62 = "UIStroke"
        local v63 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v64
        if v31 then
            v64 = u3.darken(u14.backgroundSecondary, 0.8)
        else
            v64 = u14.backgroundSecondary
        end
        v63.Color = v64
        __set_list(v59, 1, {v60, v61(v62, v63)})
        local v65 = #v59
        local v66
        if v31 then
            v66 = u9.createFragment({
                ["CrossedOut"] = u9.createElement("Frame", {
                    ["Rotation"] = 45,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.1, 1),
                    ["BorderColor3"] = u3.darken(u14.backgroundSecondary, 0.8),
                    ["BackgroundColor3"] = u3.darken(u14.backgroundSecondary, 0.8)
                })
            })
        else
            v66 = v31
        end
        if v66 then
            v59[v65 + 1] = v66
        end
        v55.PlayerCard1 = u9.createElement("ImageLabel", v56, v59)
        local v67 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.24, 0.24),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundTransparency"] = v31 and 0.5 or 0.1
        }
        local v68
        if v31 then
            v68 = u3.darken(u3.WHITE, 0.8)
        else
            v68 = u3.WHITE
        end
        v67.BackgroundColor3 = v68
        local v69
        if v29 == 0 or (v29 ~= v29 or not v29) then
            v69 = nil
        else
            v69 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v29) .. "&w=48&h=48"
        end
        v67.Image = v69
        local v70 = {}
        local v71 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v72 = u9.createElement
        local v73 = "UIStroke"
        local v74 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v75
        if v31 then
            v75 = u3.darken(u14.backgroundSecondary, 0.8)
        else
            v75 = u14.backgroundSecondary
        end
        v74.Color = v75
        __set_list(v70, 1, {v71, v72(v73, v74)})
        local v76 = #v70
        local v77
        if v31 then
            v77 = u9.createFragment({
                ["CrossedOut"] = u9.createElement("Frame", {
                    ["Rotation"] = 45,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.1, 1),
                    ["BorderColor3"] = u3.darken(u14.backgroundSecondary, 0.8),
                    ["BackgroundColor3"] = u3.darken(u14.backgroundSecondary, 0.8)
                })
            })
        else
            v77 = v31
        end
        if v77 then
            v70[v76 + 1] = v77
        end
        v55.PlayerCard2 = u9.createElement("ImageLabel", v67, v70)
        v46.PlayerCardArea = u9.createElement("Frame", v54, v55)
        local v78 = "health-" .. p16.teamHealth.team.id
        local v79 = u9.createElement
        local v80 = u6
        local v81 = {
            ["ZIndex"] = 2,
            ["AcceptZero"] = true,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.8),
            ["Size"] = UDim2.fromScale(0.9, 0.1)
        }
        local v82 = p16.teamHealth.health / 100
        v81.Progress = math.clamp(v82, 0, 1)
        v81.BarColor = p16.teamHealth.team.color
        v81.BarBackgroundColor = u14.backgroundTertiary
        local v83 = {}
        local v84 = u9.createElement
        local v85 = "UIStroke"
        local v86 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v87
        if v31 then
            v87 = u3.darken(u14.backgroundSecondary, 0.8)
        else
            v87 = u14.backgroundSecondary
        end
        v86.Color = v87
        __set_list(v83, 1, {v84(v85, v86)})
        v46[v78] = v79(v80, v81, v83)
        local v88 = u9.createElement
        local v89 = "Frame"
        local v90 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Size"] = UDim2.fromScale(0.34, 0.6),
            ["Position"] = UDim2.fromScale(0.65, 0.65)
        }
        local v91 = {}
        local v92 = u9.createElement
        local v93 = "TextLabel"
        local v94 = {
            ["TextSize"] = 24,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1)
        }
        local v95 = p16.teamHealth.health
        v94.Text = tostring(v95)
        v94.Font = Enum.Font.LuckiestGuy
        local v96
        if v31 then
            v96 = Color3.fromRGB(255, 0, 0)
        else
            v96 = Color3.fromHex("#29FF52")
        end
        v94.TextColor3 = v96
        v94.TextTransparency = v31 and 0.5 or 0
        v94.TextXAlignment = Enum.TextXAlignment.Center
        v94.TextStrokeColor3 = u14.backgroundSecondary
        v91.PlayerHealthText = v92(v93, v94)
        v46.PlayerHealthTextArea = v88(v89, v90, v91)
        v42[v43 + 1] = u9.createElement("ImageButton", v44, v46)
        return u9.createFragment({
            ["TeamHealthBackground"] = u9.createElement(u5, v41, v42)
        })
    end)
}