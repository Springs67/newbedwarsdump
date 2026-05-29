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
    ["PvPArenaSoloHealthPanel"] = v10.new(u9)(function(p16, p17) --[[ Line: 17 ]]
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
        local v29
        if v28[1] == nil then
            v29 = nil
        else
            v29 = v28[1].userId
        end
        if v28[2] ~= nil then
            local _ = v28[2].userId
        end
        local v30 = p16.teamHealth.health <= 0
        local v31
        if u4.isHoarceKat() then
            v31 = false
        else
            local v32 = u11.LocalPlayer.UserId
            local v33 = v28[1]
            if v33 ~= nil then
                v33 = v33.userId
            end
            v31 = v32 == v33
            if not v31 then
                local v34 = u11.LocalPlayer.UserId
                local v35 = v28[2]
                if v35 ~= nil then
                    v35 = v35.userId
                end
                v31 = v34 == v35
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
            local v36 = u26:getValue()
            local v37 = u27:getValue()
            if not v36 then
                return nil
            end
            if not v37 then
                return nil
            end
            local u38 = u8.new()
            u38:GiveTask(v36.MouseEnter:Connect(function() --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23(true)
            end))
            u38:GiveTask(v36.MouseLeave:Connect(function() --[[ Line: 69 ]]
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
            u38:GiveTask(v37.MouseEnter:Connect(function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25(true)
            end))
            u38:GiveTask(v37.MouseLeave:Connect(function() --[[ Line: 80 ]]
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
                        [1] = u38
                        [2] = u13
                        [3] = u12
                        [4] = u21
                    --]]
                    u38:GiveTask(u13.Client:Get("PvPArenaGameStateChanged"):Connect(function(p39) --[[ Line: 91 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u21
                        --]]
                        if p39.gameState == u12.IN_PROGRESS then
                            u21(false)
                        end
                    end))
                end)
            end
            return function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38:DoCleaning()
            end
        end, { u22, u24 })
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 0.09),
            ["LayoutOrder"] = p16.LayoutOrder
        }
        local v41 = { u9.createElement("ImageButton", {
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
        local v42 = #v41
        local v43 = {
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Size"] = UDim2.fromScale(0.7, 1),
            ["Position"] = UDim2.fromScale(1, 0),
            ["BackgroundTransparency"] = 0
        }
        local v44
        if v30 then
            v44 = u3.darken(u14.backgroundPrimary, 0.8)
        elseif v31 then
            v44 = Color3.fromHex("#777BC7")
        else
            v44 = u14.backgroundPrimary
        end
        v43.BackgroundColor3 = v44
        v43.ImageTransparency = 1
        v43[u9.Event.MouseButton1Click] = function() --[[ Line: 131 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u20
            --]]
            u21(not u20)
        end
        v43[u9.Ref] = u26
        local v45 = {}
        local v46 = #v45
        if u20 or u22 then
            u22 = u9.createElement(u15, {
                ["AppId"] = "PvpArenaAugmentTeamCard",
                ["team"] = p16.teamHealth.team
            })
        end
        if u22 then
            v45[v46 + 1] = u22
        end
        local v47 = #v45
        v45[v47 + 1] = u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.8
        })
        v45[v47 + 2] = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        local v48 = v47 + 3
        local v49 = u9.createElement
        local v50 = "UIStroke"
        local v51 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v52
        if v30 then
            v52 = u3.darken(u14.backgroundSecondary, 0.8)
        elseif v31 then
            v52 = Color3.fromHex("#FFEF5E")
        else
            v52 = u14.backgroundSecondary
        end
        v51.Color = v52
        v45[v48] = v49(v50, v51)
        local v53 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(0.7, 0.5),
            ["Position"] = UDim2.fromScale(0.1, 0.1)
        }
        local v54 = {}
        local _ = #v54
        local v55 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.45, 0.45),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["Position"] = UDim2.fromScale(0.1, 0),
            ["BackgroundTransparency"] = v30 and 0.5 or 0.1
        }
        local v56
        if v30 then
            v56 = u3.darken(u3.WHITE, 0.8)
        else
            v56 = u3.WHITE
        end
        v55.BackgroundColor3 = v56
        local v57
        if v29 == 0 or (v29 ~= v29 or not v29) then
            v57 = nil
        else
            v57 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v29) .. "&w=48&h=48"
        end
        v55.Image = v57
        local v58 = {}
        local v59 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(1, 0)
        })
        local v60 = u9.createElement
        local v61 = "UIStroke"
        local v62 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v63
        if v30 then
            v63 = u3.darken(u14.backgroundSecondary, 0.8)
        else
            v63 = u14.backgroundSecondary
        end
        v62.Color = v63
        __set_list(v58, 1, {v59, v60(v61, v62)})
        local v64 = #v58
        local v65
        if v30 then
            v65 = u9.createFragment({
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
            v65 = v30
        end
        if v65 then
            v58[v64 + 1] = v65
        end
        v54.PlayerCard1 = u9.createElement("ImageLabel", v55, v58)
        v45.PlayerCardArea = u9.createElement("Frame", v53, v54)
        local v66 = "health-" .. p16.teamHealth.team.id
        local v67 = u9.createElement
        local v68 = u6
        local v69 = {
            ["ZIndex"] = 2,
            ["AcceptZero"] = true,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.8),
            ["Size"] = UDim2.fromScale(0.9, 0.1)
        }
        local v70 = p16.teamHealth.health / 100
        v69.Progress = math.clamp(v70, 0, 1)
        v69.BarColor = p16.teamHealth.team.color
        v69.BarBackgroundColor = u14.backgroundTertiary
        local v71 = {}
        local v72 = u9.createElement
        local v73 = "UIStroke"
        local v74 = {
            ["Thickness"] = 3,
            ["Transparency"] = 0
        }
        local v75
        if v30 then
            v75 = u3.darken(u14.backgroundSecondary, 0.8)
        else
            v75 = u14.backgroundSecondary
        end
        v74.Color = v75
        __set_list(v71, 1, {v72(v73, v74)})
        v45[v66] = v67(v68, v69, v71)
        local v76 = u9.createElement
        local v77 = "Frame"
        local v78 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Size"] = UDim2.fromScale(0.34, 0.6),
            ["Position"] = UDim2.fromScale(0.6, 0.65)
        }
        local v79 = {}
        local v80 = u9.createElement
        local v81 = "TextLabel"
        local v82 = {
            ["TextSize"] = 24,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1)
        }
        local v83 = p16.teamHealth.health
        v82.Text = tostring(v83)
        v82.Font = Enum.Font.LuckiestGuy
        local v84
        if v30 then
            v84 = Color3.fromRGB(255, 0, 0)
        else
            v84 = Color3.fromHex("#29FF52")
        end
        v82.TextColor3 = v84
        v82.TextTransparency = v30 and 0.5 or 0
        v82.TextXAlignment = Enum.TextXAlignment.Center
        v82.TextStrokeColor3 = u14.backgroundSecondary
        v79.PlayerHealthText = v80(v81, v82)
        v45.PlayerHealthTextArea = v76(v77, v78, v79)
        v41[v42 + 1] = u9.createElement("ImageButton", v43, v45)
        return u9.createFragment({
            ["TeamHealthBackground"] = u9.createElement(u5, v40, v41)
        })
    end)
}