local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.TweenService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "pvp-arena-intermission-health-holder").PvPArenaIntermissionHealthHolder
local v54 = v6.new(u5)(function(_, p15) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u10
        [4] = u2
        [5] = u12
        [6] = u3
        [7] = u9
        [8] = u11
        [9] = u13
        [10] = u14
    --]]
    local v16 = p15.useState
    local v17 = p15.useEffect
    local u18 = u5.createRef()
    local u19 = u5.createRef()
    local u20, u21 = v16(false)
    v17(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u19
            [3] = u4
            [4] = u10
            [5] = u2
            [6] = u21
            [7] = u12
            [8] = u3
            [9] = u9
            [10] = u11
            [11] = u20
        --]]
        local v22 = u18:getValue()
        local v23 = u19:getValue()
        if v22 and v23 then
            local v24 = u4.new()
            local u25 = u10:Create(v22, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(1, 0.5)
            })
            local u26 = u10:Create(v22, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(1.03, 0.5)
            })
            local u27 = u10:Create(v23, TweenInfo.new(2.4000000000000004, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(1, 0.5)
            })
            local u28 = u10:Create(v23, TweenInfo.new(2.4000000000000004, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(1.3, 0.5)
            })
            u25:Play()
            v24:GiveTask(u25.Completed:Connect(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:Play()
            end))
            v24:GiveTask(u28.Completed:Connect(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:Play()
            end))
            if u2.isHoarceKat() then
                u25:Play()
                u21(true)
            else
                v24:GiveTask(u12.Client:Get("PvPArenaGameStateChanged"):Connect(function(p29) --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u9
                        [3] = u11
                        [4] = u20
                        [5] = u25
                        [6] = u21
                        [7] = u28
                    --]]
                    local v30 = p29.activeMatchups
                    local v31
                    if v30 == nil then
                        v31 = v30
                    else
                        local function v42(p32) --[[ Line: 58 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u9
                            --]]
                            local v33 = {}
                            local v34 = #v33
                            local v35 = u3.values(p32.teamA.members)
                            local v36 = #v35
                            table.move(v35, 1, v36, v34 + 1, v33)
                            local v37 = v34 + v36
                            local v38 = u3.values(p32.teamB.members)
                            table.move(v38, 1, #v38, v37 + 1, v33)
                            local v39 = nil
                            for v40, v41 in v33 do
                                local _ = v40 - 1
                                if v41.userId == u9.LocalPlayer.UserId == true then
                                    v39 = v41
                                    break
                                end
                            end
                            return v39 ~= nil
                        end
                        v31 = nil
                        for v43, v44 in v30 do
                            if v42(v44, v43 - 1, v30) == true then
                                v31 = v44
                                break
                            end
                        end
                    end
                    if p29.gameState == u11.INTERMISSION and not u20 then
                        u25:Play()
                        u21(true)
                    end
                    if p29.gameState == u11.IN_PROGRESS and v31 then
                        u28:Play()
                        u21(false)
                    end
                end))
                v24:GiveTask(u12.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p45) --[[ Line: 102 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u25
                        [4] = u21
                    --]]
                    local v46 = p45.winningTeamMembers
                    local v47 = u9.LocalPlayer
                    local v48 = table.find(v46, v47) ~= nil
                    if not v48 then
                        local v49 = p45.losingTeamMembers
                        local v50 = u9.LocalPlayer
                        v48 = table.find(v49, v50) ~= nil or p45.roundEnded
                    end
                    if v48 and not u20 then
                        u25:Play()
                        u21(true)
                    end
                end))
            end
        else
            return nil
        end
    end, {})
    local v51 = u5.createElement
    local v52 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 900,
        ["ScreenInsets"] = Enum.ScreenInsets.None
    }
    local v53 = {
        ["IntermissionBackground"] = u5.createElement("Frame", {
            [u5.Ref] = u18,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(1.03, 0.5),
            ["Size"] = UDim2.fromScale(0.04, 0.9),
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u13.backgroundPrimary
        }, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 30)
            }), u5.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0,
                ["Color"] = u13.backgroundSecondary
            }) }),
        ["PlayerHealthArea"] = u5.createElement("Frame", {
            [u5.Ref] = u19,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1.3, 0.5),
            ["Size"] = UDim2.fromScale(0.09, 0.9),
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u13.backgroundPrimary
        }, { u5.createElement(u14, {
                ["AppId"] = "PvPArenaIntermissionHealthHolder"
            }) })
    }
    return v51("ScreenGui", v52, v53)
end)
return {
    ["PvPArenaIntermissionUI"] = v7.connect(function(_, p55) --[[ Line: 160 ]]
        local v56 = {}
        for v57, v58 in p55 do
            v56[v57] = v58
        end
        return v56
    end)(v54)
}