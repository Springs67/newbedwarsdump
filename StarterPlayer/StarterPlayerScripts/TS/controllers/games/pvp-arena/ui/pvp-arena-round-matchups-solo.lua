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
    ["PvPArenaRoundMatchupsSolo"] = v7.new(u6)(function(_, p14) --[[ Line: 15 ]]
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
        local u25 = u6.createRef()
        local u26 = u6.createRef()
        v16(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u26
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
            --]]
            local v27 = u25:getValue()
            local v28 = u26:getValue()
            if v27 and v28 then
                local u29 = u10:Create(v27, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.09, 0)
                })
                local u30 = u10:Create(v27, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.2, 0)
                })
                local u31 = u10:Create(v28, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.91, 0)
                })
                local u32 = u10:Create(v28, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                    ["Position"] = UDim2.fromScale(0.8, 0)
                })
                if u4.isHoarceKat() then
                    u29:Play()
                    u31:Play()
                else
                    u12.Client:Get("PvPArenaGameStateChanged"):Connect(function(p33) --[[ Line: 43 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u30
                            [3] = u32
                            [4] = u5
                            [5] = u9
                            [6] = u18
                            [7] = u20
                            [8] = u22
                            [9] = u24
                            [10] = u29
                            [11] = u31
                        --]]
                        if p33.gameState == u11.INTERMISSION then
                            u30:Play()
                            u32:Play()
                        end
                        if p33.gameState == u11.IN_PROGRESS and p33.activeMatchups then
                            local u34 = nil
                            local v35 = p33.activeMatchups
                            local function v43(p36) --[[ Line: 52 ]]
                                --[[
                                Upvalues:
                                    [1] = u5
                                    [2] = u9
                                    [3] = u34
                                --]]
                                local v37 = u5.values(p36.teamA.members)
                                local v38 = u5.values(p36.teamB.members)
                                for v39, v40 in v37 do
                                    local _ = v39 - 1
                                    if u9.LocalPlayer.UserId == v40.userId then
                                        u34 = p36
                                    end
                                end
                                for v41, v42 in v38 do
                                    local _ = v41 - 1
                                    if u9.LocalPlayer.UserId == v42.userId then
                                        u34 = p36
                                    end
                                end
                            end
                            local v44 = u34
                            for v45, v46 in v35 do
                                v43(v46, v45 - 1, v35)
                            end
                            if v44 ~= nil then
                                local v47 = u5.values(v44.teamA.members)
                                local v48 = u5.values(v44.teamB.members)
                                u18(v44.teamA)
                                u20(v44.teamB)
                                if v47[1] ~= nil then
                                    u22(v47[1].userId)
                                end
                                if v48[1] ~= nil then
                                    u24(v48[1].userId)
                                end
                                u29:Play()
                                u31:Play()
                            end
                        end
                    end)
                end
            else
                return nil
            end
        end, {})
        local v49 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1.6, 0.35),
            ["Position"] = UDim2.fromScale(0.5, 0.65)
        }
        local v50 = {}
        local _ = #v50
        local v51 = {
            [u6.Ref] = u25,
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
        v51.BackgroundColor3 = v17
        v51.ZIndex = -2
        local v52 = u6.createElement
        local v53 = "Frame"
        local v54 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 12)
            }), (u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            })) }
        local v55 = u6.createElement
        local v56 = "ImageLabel"
        local v57 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.25, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["BackgroundColor3"] = u3.WHITE
        }
        local v58
        if v21 == 0 or (v21 ~= v21 or not v21) then
            v58 = nil
        else
            v58 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v21) .. "&w=48&h=48"
        end
        v57.Image = v58
        v54.PlayerCard1 = v55(v56, v57, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        v50.PvPArenaMatchup1 = v52(v53, v51, v54)
        local v59 = {
            [u6.Ref] = u26,
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
        v59.BackgroundColor3 = v19
        v59.ZIndex = -2
        local v60 = u6.createElement
        local v61 = "Frame"
        local v62 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 12)
            }), (u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            })) }
        local v63 = u6.createElement
        local v64 = "ImageLabel"
        local v65 = {
            ["BackgroundTransparency"] = 0.1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(0.28, 0.28),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.75, 0.5),
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
        v62.PlayerCard2 = v63(v64, v65, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) })
        v50.PvPArenaMatchup2 = v60(v61, v59, v62)
        return u6.createFragment({
            ["PvPArenaMatchupAreaSolo"] = u6.createElement("Frame", v49, v50)
        })
    end)
}