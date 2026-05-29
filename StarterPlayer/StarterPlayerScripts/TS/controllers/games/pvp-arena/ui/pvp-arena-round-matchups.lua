local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["PvPArenaRoundMatchups"] = v7.new(u6)(function(_, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u4
            [4] = u12
            [5] = u11
            [6] = u5
            [7] = u9
            [8] = u13
            [9] = u3
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(nil)
        local v19, u20 = v15(nil)
        local v21, u22 = v15(nil)
        local v23, u24 = v15(nil)
        local v25, u26 = v15(nil)
        local v27, u28 = v15(nil)
        local u29 = u6.createRef()
        local u30 = u6.createRef()
        v16(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u30
                [3] = u10
                [4] = u4
                [5] = u12
                [6] = u11
                [7] = u5
                [8] = u9
                [9] = u18
                [10] = u20
                [11] = u22
                [12] = u24
                [13] = u26
                [14] = u28
            --]]
            local v31 = u29:getValue()
            local v32 = u30:getValue()
            if v31 and v32 then
                local u33 = u10:Create(v31, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0, 0)
                })
                local u34 = u10:Create(v31, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.2, 0)
                })
                local u35 = u10:Create(v32, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(1, 0)
                })
                local u36 = u10:Create(v32, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.8, 0)
                })
                if u4.isHoarceKat() then
                    u33:Play()
                    u35:Play()
                else
                    u12.Client:Get("PvPArenaGameStateChanged"):Connect(function(p37) --[[ Line: 45 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u34
                            [3] = u36
                            [4] = u5
                            [5] = u9
                            [6] = u18
                            [7] = u20
                            [8] = u22
                            [9] = u24
                            [10] = u26
                            [11] = u28
                            [12] = u33
                            [13] = u35
                        --]]
                        if p37.gameState == u11.INTERMISSION then
                            u34:Play()
                            u36:Play()
                        end
                        if p37.gameState == u11.IN_PROGRESS and p37.activeMatchups then
                            local u38 = nil
                            local v39 = p37.activeMatchups
                            local function v47(p40) --[[ Line: 54 ]]
                                --[[
                                Upvalues:
                                    [1] = u5
                                    [2] = u9
                                    [3] = u38
                                --]]
                                local v41 = u5.values(p40.teamA.members)
                                local v42 = u5.values(p40.teamB.members)
                                for v43, v44 in v41 do
                                    local _ = v43 - 1
                                    if u9.LocalPlayer.UserId == v44.userId then
                                        u38 = p40
                                    end
                                end
                                for v45, v46 in v42 do
                                    local _ = v45 - 1
                                    if u9.LocalPlayer.UserId == v46.userId then
                                        u38 = p40
                                    end
                                end
                            end
                            local v48 = u38
                            for v49, v50 in v39 do
                                v47(v50, v49 - 1, v39)
                            end
                            if v48 ~= nil then
                                local v51 = u5.values(v48.teamA.members)
                                local v52 = u5.values(v48.teamB.members)
                                u18(v48.teamA)
                                u20(v48.teamB)
                                if v51[1] ~= nil then
                                    u22(v51[1].userId)
                                end
                                if v51[2] ~= nil then
                                    u24(v51[2].userId)
                                end
                                if v52[1] ~= nil then
                                    u26(v52[1].userId)
                                end
                                if v52[2] ~= nil then
                                    u28(v52[2].userId)
                                end
                                u33:Play()
                                u35:Play()
                            end
                        end
                    end)
                end
            else
                return nil
            end
        end, {})
        local v53 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1.6, 0.35),
            ["Position"] = UDim2.fromScale(0.5, 0.65)
        }
        local v54 = {}
        local _ = #v54
        local v55 = {
            [u6.Ref] = u29,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(0.2, 1),
            ["Position"] = UDim2.fromScale(0.2, 0),
            ["BackgroundTransparency"] = 0
        }
        if v17 ~= nil then
            v17 = v17.color
        end
        if v17 == nil then
            v17 = u13.backgroundPrimary
        end
        v55.BackgroundColor3 = v17
        v55.ZIndex = -2
        local v56 = u6.createElement
        local v57 = "Frame"
        local v58 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 12)
            }), (u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            })) }
        local v59 = u6.createElement
        local v60 = "ImageLabel"
        local v61 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.25, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v62
        if v21 == 0 or (v21 ~= v21 or not v21) then
            v62 = nil
        else
            v62 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v21) .. "&w=48&h=48"
        end
        v61.Image = v62
        v58.PlayerCard1 = v59(v60, v61, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        local v63 = u6.createElement
        local v64 = "ImageLabel"
        local v65 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.7, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v66
        if v23 == 0 or (v23 ~= v23 or not v23) then
            v66 = nil
        else
            v66 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v23) .. "&w=48&h=48"
        end
        v65.Image = v66
        v58.PlayerCard2 = v63(v64, v65, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        v54.PvPArenaMatchup1 = v56(v57, v55, v58)
        local v67 = {
            [u6.Ref] = u30,
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Size"] = UDim2.fromScale(0.2, 1),
            ["Position"] = UDim2.fromScale(0.8, 0),
            ["BackgroundTransparency"] = 0
        }
        if v19 ~= nil then
            v19 = v19.color
        end
        if v19 == nil then
            v19 = u13.backgroundPrimary
        end
        v67.BackgroundColor3 = v19
        v67.ZIndex = -2
        local v68 = u6.createElement
        local v69 = "Frame"
        local v70 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 12)
            }), (u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            })) }
        local v71 = u6.createElement
        local v72 = "ImageLabel"
        local v73 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.3, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v74
        if v25 == 0 or (v25 ~= v25 or not v25) then
            v74 = nil
        else
            v74 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v25) .. "&w=48&h=48"
        end
        v73.Image = v74
        v70.PlayerCard3 = v71(v72, v73, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        local v75 = u6.createElement
        local v76 = "ImageLabel"
        local v77 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.75, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v78
        if v27 == 0 or (v27 ~= v27 or not v27) then
            v78 = nil
        else
            v78 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v27) .. "&w=48&h=48"
        end
        v77.Image = v78
        v70.PlayerCard4 = v75(v76, v77, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        v54.PvPArenaMatchup2 = v68(v69, v67, v70)
        return u6.createFragment({
            ["PvPArenaMatchupArea"] = u6.createElement("Frame", v53, v54)
        })
    end)
}