local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ConfettiExplosion
local u5 = v2.Countdown
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v2.TimedProgressBar
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.TweenService
local u18 = v15.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = v1.import(script, script.Parent, "pvp-arena-round-icon-list").PvPArenaRoundIconList
local u26 = v1.import(script, script.Parent, "pvp-arena-round-matchups").PvPArenaRoundMatchups
local u27 = v1.import(script, script.Parent, "pvp-arena-round-matchups-solo").PvPArenaRoundMatchupsSolo
local v96 = v13.new(u12)(function(_, p28) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u18
        [3] = u20
        [4] = u12
        [5] = u10
        [6] = u19
        [7] = u11
        [8] = u17
        [9] = u22
        [10] = u16
        [11] = u8
        [12] = u23
        [13] = u21
        [14] = u24
        [15] = u4
        [16] = u27
        [17] = u26
        [18] = u3
        [19] = u5
        [20] = u7
        [21] = u9
        [22] = u25
    --]]
    local v29 = p28.useState
    local v30 = p28.useEffect
    local v31, u32 = v29(0)
    local v33, u34 = v29(1)
    local v35, u36 = v29(not u6.isHoarceKat())
    local v37, u38 = v29(false)
    local v39, u40 = v29(false)
    local u41, u42 = v29(u18:GetServerTimeNow() + u20.getIntermissionRoundTime(u20.isAugmentRound(v31)))
    local v43, u44 = v29(nil)
    local v45, u46 = v29(false)
    local u47 = u12.createRef()
    local v48 = u12.createRef()
    local v49 = u10.Controllers.MatchController:getQueueType() == u19.PVP_ARENA_SOLO
    v30(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u11
            [3] = u17
            [4] = u6
            [5] = u22
            [6] = u16
            [7] = u8
            [8] = u23
            [9] = u46
            [10] = u44
            [11] = u42
            [12] = u18
            [13] = u20
            [14] = u40
            [15] = u32
            [16] = u34
            [17] = u38
            [18] = u21
            [19] = u36
        --]]
        local v50 = u47:getValue()
        if not v50 then
            return nil
        end
        local u51 = u11.new()
        local u52 = u11.new()
        local u53 = u17:Create(v50, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Position"] = UDim2.fromScale(0.5, 0)
        })
        local u54 = u17:Create(v50, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Position"] = UDim2.fromScale(0.5, -0.5)
        })
        task.delay(0.2, function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            u53:Play()
        end)
        u51:GiveTask(u52)
        if not u6.isHoarceKat() then
            u51:GiveTask(u22.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p55) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u8
                    [3] = u23
                    [4] = u46
                    [5] = u44
                    [6] = u52
                    [7] = u42
                    [8] = u18
                    [9] = u20
                    [10] = u40
                --]]
                local v56 = p55.winningTeamMembers
                local v57 = u16.LocalPlayer
                local v58 = table.find(v56, v57) ~= nil
                if not v58 then
                    local v59 = p55.losingTeamMembers
                    local v60 = u16.LocalPlayer
                    v58 = table.find(v59, v60) ~= nil or p55.roundEnded
                end
                if v58 then
                    local v61 = p55.winningTeamMembers
                    local v62 = u16.LocalPlayer
                    local v63 = table.find(v61, v62) ~= nil
                    if v63 then
                        u8:playSound(u23.PVP_ARENA_ROUND_WIN_CHEER)
                    end
                    u8:playSound(u23.PVP_ARENA_ROUND_END)
                    u46(v63)
                    u44(true)
                    u52:DoCleaning()
                    u42(u18:GetServerTimeNow() + u20.ROUND_END_DELAY)
                    u40(false)
                end
            end))
            u51:GiveTask(u22.Client:Get("PvPArenaGameStateChanged"):Connect(function(p64) --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u34
                    [3] = u38
                    [4] = u21
                    [5] = u52
                    [6] = u36
                    [7] = u18
                    [8] = u20
                    [9] = u42
                    [10] = u40
                    [11] = u44
                    [12] = u54
                --]]
                if p64.roundNumber ~= nil then
                    u32(p64.roundNumber)
                end
                if p64.stageNumber ~= nil then
                    u34(p64.stageNumber)
                    if (p64.stageNumber - 3) % 4 == 0 then
                        u38(true)
                    else
                        u38(false)
                    end
                end
                if p64.gameState == u21.INTERMISSION then
                    u52:DoCleaning()
                    u36(true)
                    local v65 = u18:GetServerTimeNow()
                    local v66 = u20
                    local v67 = u20
                    local v68 = p64.roundNumber
                    local v69 = v68 == nil and 0 or v68
                    u42(v65 + v66.getIntermissionRoundTime(v67.isAugmentRound(v69)))
                    u40(false)
                    u44(nil)
                end
                if p64.gameState == u21.IN_PROGRESS then
                    u36(false)
                    u42(u18:GetServerTimeNow() + u20.GRACE_PERIOD_TIME)
                    u44(false)
                    local u70 = task.delay(u20.GRACE_PERIOD_TIME, function() --[[ Line: 125 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                            [2] = u18
                            [3] = u20
                        --]]
                        u42(u18:GetServerTimeNow() + u20.getMatchRoundTime())
                    end)
                    u52:GiveTask(function() --[[ Line: 128 ]]
                        --[[
                        Upvalues:
                            [1] = u70
                        --]]
                        if u70 then
                            task.cancel(u70)
                        end
                    end)
                    local u71 = task.delay(u20.GRACE_PERIOD_TIME + u20.getMatchRoundTime(), function() --[[ Line: 133 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                        --]]
                        u40(true)
                    end)
                    u52:GiveTask(function() --[[ Line: 136 ]]
                        --[[
                        Upvalues:
                            [1] = u71
                        --]]
                        if u71 then
                            task.cancel(u71)
                        end
                    end)
                end
                if p64.gameState == u21.POST then
                    u54:Play()
                end
            end))
        end
        return function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51:DoCleaning()
        end
    end, {})
    v30(function() --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u18
            [3] = u11
            [4] = u8
            [5] = u23
        --]]
        local v72 = u41 - u18:GetServerTimeNow()
        local u73 = u11.new()
        local u74 = task.delay(v72 - 4, function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u23
            --]]
            u8:playSound(u23.PVP_ARENA_COUNTDOWN)
        end)
        u73:GiveTask(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            if u74 then
                task.cancel(u74)
            end
        end)
        return function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            u73:DoCleaning()
        end
    end, { u41 })
    local v75 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 900,
        ["ScreenInsets"] = "None"
    }
    local v76 = {}
    local _ = #v76
    local v77 = {
        [u12.Ref] = u47,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.3, 0.2),
        ["Position"] = UDim2.fromScale(0.5, -0.5),
        ["BackgroundTransparency"] = 0,
        ["BackgroundColor3"] = u24.backgroundPrimary
    }
    local v78 = {}
    local v79 = #v78
    local v80
    if v43 then
        if v45 then
            v80 = u12.createElement(u4, {
                ["Lifetime"] = 5,
                ["Size"] = UDim2.fromScale(2, 2),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
        else
            v80 = v45
        end
    else
        v80 = v43
    end
    if v80 then
        v78[v79 + 1] = v80
    end
    local v81 = #v78
    v78[v81 + 1] = u12.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 2.6
    })
    v78[v81 + 2] = u12.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 12)
    })
    v78[v81 + 3] = u12.createElement("UIStroke", {
        ["Thickness"] = 3,
        ["Transparency"] = 0.3,
        ["Color"] = u24.backgroundSecondary
    })
    local v82 = v81 + 4
    local v83
    if v49 then
        v83 = u12.createElement(u27)
    else
        v83 = u12.createElement(u26)
    end
    v78[v82] = v83
    local v84 = #v78
    local v85
    if v35 then
        if v37 then
            v85 = u12.createFragment({
                ["AugmentText"] = u12.createElement("TextLabel", {
                    ["Text"] = "Relic",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.24, 0.24),
                    ["Position"] = UDim2.fromScale(0.5, 0.62),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Font"] = Enum.Font.LuckiestGuy,
                    ["TextColor3"] = u3.WHITE
                }, { u12.createElement("UIStroke", {
                        ["Thickness"] = 3,
                        ["Transparency"] = 0.5,
                        ["Color"] = u3.BLACK
                    }) })
            })
        else
            v85 = v37
        end
    else
        v85 = v35
    end
    if v85 then
        v78[v84 + 1] = v85
    end
    local v86 = #v78
    local v87 = v35 and not v37
    if v87 then
        v87 = u12.createFragment({
            ["IntermissionText"] = u12.createElement("TextLabel", {
                ["Text"] = "INTERMISSION",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 0.25),
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextColor3"] = u3.WHITE
            }, { u12.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Transparency"] = 0.5,
                    ["Color"] = u3.BLACK
                }) })
        })
    end
    if v87 then
        v78[v86 + 1] = v87
    end
    local v88 = #v78
    local v89 = not v35
    if v89 then
        v89 = u12.createFragment({
            ["RoundNumber"] = u12.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = "Round " .. tostring(v31),
                ["Size"] = UDim2.fromScale(0.25, 0.25),
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextColor3"] = u3.WHITE
            }, { u12.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Transparency"] = 0.5,
                    ["Color"] = u3.BLACK
                }) })
        })
    end
    if v89 then
        v78[v88 + 1] = v89
    end
    local v90 = #v78
    local v91
    if v43 == true then
        v91 = false
    else
        v91 = u12.createElement(u5, {
            ["EndTime"] = math.round(u41),
            ["TextLabel"] = {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = false,
                ["ZIndex"] = 99,
                ["Size"] = UDim2.fromScale(0.25, 0.25),
                ["Position"] = UDim2.fromScale(0.5, 1.11),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["FontFace"] = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            },
            ["CountdownConfig"] = {
                ["minutes"] = false,
                ["hours"] = false,
                ["days"] = false
            }
        }, { u12.createElement("UIStroke", {
                [u12.Ref] = v48,
                ["Color"] = u3.BLACK,
                ["Thickness"] = 3,
                ["Transparency"] = 0.5
            }) })
    end
    if v91 then
        v78[v90 + 1] = v91
    end
    local v92 = #v78
    if v39 then
        if v43 == true then
            v39 = false
        else
            v39 = u12.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "SUDDEN\nDEATH",
                ["TextScaled"] = true,
                ["RichText"] = false,
                ["ZIndex"] = 99,
                ["Size"] = UDim2.fromScale(0.25, 0.25),
                ["Position"] = UDim2.fromScale(0.5, 1.075),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["FontFace"] = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, { u12.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Transparency"] = 0.5,
                    ["Color"] = u3.BLACK
                }) })
        end
    end
    if v39 then
        v78[v92 + 1] = v39
    end
    local v93 = #v78
    local v94 = v43 == true and not v35
    if v94 then
        v94 = u12.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = false,
            ["ZIndex"] = 99,
            ["Size"] = UDim2.fromScale(0.25, 0.25),
            ["Position"] = UDim2.fromScale(0.5, 1.075),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["FontFace"] = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
            ["TextColor3"] = u3.WHITE,
            ["Text"] = "ROUND " .. (v45 and "WON" or "LOSS")
        }, { u12.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0.5,
                ["Color"] = u3.BLACK
            }) })
    end
    if v94 then
        v78[v93 + 1] = v94
    end
    local v95 = #v78
    v78[v95 + 1] = u12.createElement(u7, {
        ["Size"] = UDim2.fromScale(0.8, 0.05),
        ["Position"] = UDim2.fromScale(0.5, 1.05),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }, { u12.createElement(u9, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["EndTime"] = u41,
            ["ProgressBarConfig"] = {
                ["Flip"] = true,
                ["GradientRotation"] = 180,
                ["BarGradient"] = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
            }
        }, { u12.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Transparency"] = 0.3,
                ["Color"] = u24.backgroundSecondary
            }) }) })
    v78[v95 + 2] = u12.createElement(u25, {
        ["stageNumber"] = v33,
        ["roundNumber"] = v31
    })
    v76.PvPArenaRoundUIBackground = u12.createElement("Frame", v77, v78)
    return u12.createElement("ScreenGui", v75, v76)
end)
return {
    ["PvPArenaRoundUI"] = v14.connect(function(_, p97) --[[ Line: 376 ]]
        local v98 = {}
        for v99, v100 in p97 do
            v98[v99] = v100
        end
        return v98
    end)(v96)
}