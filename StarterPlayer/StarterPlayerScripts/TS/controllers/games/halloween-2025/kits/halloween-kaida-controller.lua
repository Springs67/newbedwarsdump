local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.MathExtras
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.ReplicatedStorage
local u15 = v12.RunService
local u16 = v12.TweenService
local u17 = v12.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util")
local u30 = v29.summoner_getPlayerSpellData
local u31 = v29.summoner_getPlayerSpellLevel
local u32 = v29.summoner_getTotalCastTimeRequired
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u40 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "summoner", "ui", "summoner-kit-cast-bar-ui").SummonerKitCastBarUI
local u41 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "summoner", "ui", "summoner-kit-level-ui").SummonerKitLevelUI
local u42 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
        return "HalloweenKaidaController"
    end,
    ["__index"] = u19
})
u42.__index = u42
function u42.new(...) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u42
    --]]
    local v43 = u42
    local v44 = setmetatable({}, v43)
    return v44:constructor(...) or v44
end
function u42.constructor(p45) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u26
        [3] = u10
    --]]
    u19.constructor(p45, { u26.HALLOWEEN_2025_EVENT_PVE })
    p45.Name = "HalloweenKaidaController"
    p45.localChargingMaid = u10.new()
    p45.levelUpUiMaid = u10.new()
    p45.initializedUI = false
    p45.inited = false
    p45.playerCastingDataMap = {}
    p45.debugging = false
end
function u42.KnitStart(p46) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p46)
end
function u42.onGameInit(u47) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u34
    --]]
    u37.Client:Get("HalloweenSetKit"):Connect(function(p48) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u34
        --]]
        if not u47.inited then
            if p48.kit == u34.SUMMONER then
                u47:initializePlayer()
            end
            u47.inited = true
        end
    end)
    u37.Client:Get("SummonerStartSummonSpellFromServer"):Connect(function(p49) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:startChargingSummon(p49.player, p49.startTime)
    end)
    u37.Client:Get("SummonerFinishSummonSpellFromServer"):Connect(function(p50) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:finishChargingSummon(p50.player, p50.tier)
    end)
    u37.Client:Get("SummonerDeath"):Connect(function(p51) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        return u47:cancelSummon(p51.player)
    end)
    u37.Client:Get("SummonerCancelSummon"):Connect(function(p52) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        return u47:cancelSummon(p52.player)
    end)
end
function u42.initializePlayer(p53) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u41
        [4] = u18
        [5] = u13
        [6] = u21
        [7] = u25
    --]]
    p53.localChargingMaid:DoCleaning()
    p53:enableStartChargingAbility()
    if not p53.initializedUI then
        p53.initializedUI = true
        p53.levelUpUiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11.createElement(u41)))
    end
    u18.CanUseLocalAbility:connect(function(p54) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u21
            [3] = u25
        --]]
        if p54.userCharacter ~= u13.LocalPlayer.Character then
            return nil
        end
        if p54.ability == u21.SUMMONER_START_CHARGING or p54.ability == u21.SUMMONER_FINISH_CHARGING then
            if not u25:getPlayerFromEntityInstance(p54.userCharacter) then
                p54:setCancelled(true)
                return nil
            end
            local v55 = u25:getEntity(p54.userCharacter)
            if not v55 then
                p54:setCancelled(true)
                return nil
            end
            if not v55:isAlive() then
                p54:setCancelled(true)
                return nil
            end
        end
    end)
end
function u42.startChargingSummon(u56, p57, p58) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u28
        [4] = u8
        [5] = u20
        [6] = u21
        [7] = u31
        [8] = u2
        [9] = u11
        [10] = u40
        [11] = u32
    --]]
    if p57 == u13.LocalPlayer then
        local u59 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = false,
            ["moveSpeedMultiplier"] = u28.CASTING_MOVE_SPEED_MULTIPLIER
        })
        local u60 = u8.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = 0
        })
        u56.localChargingMaid:GiveTask(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u60
            --]]
            u59.Destroy()
            u60.Destroy()
        end)
        u56.localChargingMaid:GiveTask(u20:disableActions({
            ["disableSword"] = true,
            ["disableAbilities"] = true,
            ["disableBlockPlacement"] = true,
            ["disableBlockBreaking"] = true,
            ["disableAiming"] = true,
            ["disableConsumingItems"] = true,
            ["player"] = p57,
            ["enabledAbilityOverrides"] = { u21.SUMMONER_FINISH_CHARGING }
        }))
        task.delay(0.25, function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            u56:enableFinishChargingAbility()
        end)
        local v61 = u31(p57)
        local v62 = v61 == nil and 1 or v61
        local v63 = v62 / 4
        local v64 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11.createElement(u40, {
            ["HideOnComplete"] = true,
            ["Size"] = UDim2.fromScale(v63, 0.03),
            ["StartTime"] = p58,
            ["EndTime"] = p58 + u32(v62),
            ["ProgressBarConfig"] = {
                ["Flip"] = false,
                ["GradientRotation"] = 0,
                ["BarGradient"] = ColorSequence.new(Color3.fromRGB(74, 20, 92), Color3.fromRGB(140, 36, 120))
            },
            ["PlayerSpellLevel"] = v62
        }))
        u56.localChargingMaid:GiveTask(v64)
    end
    u56:createExpandingMagicCircle(p57, p58)
end
function u42.createExpandingMagicCircle(u65, u66, u67) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u17
        [3] = u15
        [4] = u30
        [5] = u31
        [6] = u32
        [7] = u28
        [8] = u36
        [9] = u35
        [10] = u33
        [11] = u10
        [12] = u25
        [13] = u5
        [14] = u6
        [15] = u38
    --]]
    local u68 = u66.Character
    if u68 ~= nil then
        u68 = u68.PrimaryPart
    end
    if not u68 then
        return nil
    end
    local u69 = u14.Assets.Misc.Kaida.Summoner_SummonCircle:Clone()
    u69.Parent = u17
    if u15:IsStudio() and (u65.debugging and u69.Pivot.DebugCircle) then
        u69.Pivot.DebugCircle.Transparency = 0
    end
    local v70 = u65.playerCastingDataMap[u66]
    if v70 then
        v70.castingMaid:DoCleaning()
        u65.playerCastingDataMap[u66] = nil
    end
    local v71 = u68.Position
    local u72 = CFrame.new(v71 - Vector3.new(0, 3, 0))
    u69:PivotTo(u72)
    local v73 = u30(u66)
    local v74 = u31(u66)
    local v75 = v74 == nil and 1 or v74
    local u76 = u32(v75)
    local u77 = u28.CIRCLE_MIN_RADIUS
    local u78 = v73.maxRadius
    local v79 = u36:getAbilityStacks(u66, u35.KAIDA_RADIUS)
    if v79 > 0 then
        u78 = u78 + u28.SPELL_TIER_1_DATA.maxRadius * (v79 * u33.KAIDA_EXPANSION_PERCENT / 100)
    end
    local u80 = u10.new()
    local v81 = u10.new()
    local u82 = 0
    local u83 = true
    local u84 = nil
    u84 = u15.Heartbeat:Connect(function(p85) --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u25
            [3] = u66
            [4] = u84
            [5] = u83
            [6] = u17
            [7] = u67
            [8] = u76
            [9] = u5
            [10] = u77
            [11] = u78
            [12] = u68
            [13] = u72
            [14] = u82
        --]]
        local v86 = u69
        if v86 ~= nil then
            v86 = v86.Parent
        end
        local v87 = v86 == nil
        if not v87 then
            v87 = u25:getEntity(u66)
            if v87 ~= nil then
                v87 = v87:isDead()
            end
        end
        if v87 then
            u84:Disconnect()
            return nil
        end
        if u83 then
            local v88 = (u17:GetServerTimeNow() - u67) / u76
            local v89 = u5:lerp(u77, u78, (math.clamp(v88, 0, 1))) * 2
            local v90 = u68.Position
            u72 = CFrame.new(v90 - Vector3.new(0, 3, 0))
            u69:PivotTo(u72)
            u69:ScaleTo(v89)
        end
        u82 = u82 + p85
        local v91 = u69
        if v91 ~= nil then
            v91 = v91.Pivot
        end
        if v91 then
            local v92 = u72
            local v93 = CFrame.Angles
            local v94 = u82 * 60
            local v95 = v93(0, math.rad(v94), 0)
            u69.Pivot.Ring1.CFrame = v92 * v95
            local v96 = u72
            local v97 = CFrame.Angles
            local v98 = u82 * 10
            local v99 = v97(0, math.rad(v98), 0)
            u69.Pivot.Ring2.CFrame = v96 * v99
            local v100 = u72
            local v101 = CFrame.Angles
            local v102 = -u82 * 80
            local v103 = v101(0, math.rad(v102), 0)
            u69.Pivot.Ring3.CFrame = v100 * v103
            local v104 = u72
            local v105 = CFrame.Angles
            local v106 = u82 * 30
            local v107 = v105(0, math.rad(v106), 0)
            u69.Pivot.PortalBottom.CFrame = v104 * v107
            local v108 = u72
            local v109 = CFrame.Angles
            local v110 = u82 * -30
            local v111 = v109(0, math.rad(v110), 0)
            u69.Pivot.PortalTop.CFrame = v108 * v111
        end
    end)
    v81:GiveTask(u84)
    u65.playerCastingDataMap[u66] = {
        ["finishedCasting"] = false,
        ["castingMaid"] = u80,
        ["summonMaid"] = v81,
        ["circleParent"] = u69
    }
    u80:GiveTask(function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u83
            [2] = u65
            [3] = u66
            [4] = u69
        --]]
        u83 = false
        local v112 = u65.playerCastingDataMap[u66]
        if v112 and (not v112.finishedCasting and u69) then
            u69:Destroy()
        end
    end)
    local v113 = u6
    local v114 = u38.SUMMONER_SUMMON_CHANNEL_LOOP
    local v115 = {
        ["looped"] = true,
        ["parent"] = u69.PrimaryPart
    }
    local v116 = u69.PrimaryPart
    if v116 ~= nil then
        v116 = v116.Position
    end
    v115.position = v116
    u80:GiveTask((v113:playSound(v114, v115)))
    local v117 = u32(v75)
    task.delay(v117 + 0.1, function() --[[ Line: 344 ]]
        --[[
        Upvalues:
            [1] = u80
        --]]
        u80:DoCleaning()
    end)
end
function u42.finishChargingSummon(p118, p119, _) --[[ Line: 349 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u38
        [4] = u14
        [5] = u17
        [6] = u8
        [7] = u4
        [8] = u24
        [9] = u23
        [10] = u15
        [11] = u36
        [12] = u35
        [13] = u16
        [14] = u33
        [15] = u5
    --]]
    if p119 == u13.LocalPlayer then
        p118.localChargingMaid:DoCleaning()
        p118:enableStartChargingAbility()
    end
    local u120 = p118.playerCastingDataMap[p119]
    if not u120 then
        return nil
    end
    u120.finishedCasting = true
    u120.castingMaid:DoCleaning()
    local u121 = u120.circleParent
    u6:playSound(u38.SUMMONER_SUMMON_FINISH, {
        ["position"] = u121.Pivot.Position
    })
    local u122 = u14.Assets.Misc.Kaida.Summoner_DragonHead:Clone()
    u122.Parent = u17
    if u8.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        for v123, v124 in u122:GetChildren() do
            local _ = v123 - 1
            if v124:IsA("MeshPart") then
                v124.Transparency = 0.6
            end
        end
    end
    u120.summonMaid:GiveTask(function() --[[ Line: 393 ]] end)
    local v125 = u122.PrimaryPart.CFrame.LookVector
    if p119.Character then
        local v126 = p119.Character.PrimaryPart.CFrame.LookVector.X
        local v127 = p119.Character.PrimaryPart.CFrame.LookVector.Z
        v125 = Vector3.new(v126, 0, v127).Unit
    end
    local v128 = v125.X
    local v129 = v125.Z
    math.atan2(v128, v129)
    local v130 = u121:GetPivot().Position
    u122:PivotTo((CFrame.new(v130 - Vector3.new(0, 13, 0))))
    local u131 = u4:playAnimation(u122.AnimationController.Animator, u24:getAssetId(u23.SUMMONER_DRAGON_ATTACK), {
        ["looped"] = false,
        ["speed"] = 1.2
    })
    if u131 then
        local u132 = false
        local u134 = u15.Heartbeat:Connect(function() --[[ Line: 414 ]]
            --[[
            Upvalues:
                [1] = u131
                [2] = u132
                [3] = u121
                [4] = u122
            --]]
            if u131.TimePosition > 0.1 and not u132 then
                local v133 = u121:GetPivot().Position
                u122:PivotTo((CFrame.new(v133 - Vector3.new(0, 0, 0))))
                u132 = true
            end
        end)
        u131.Stopped:Connect(function() --[[ Line: 423 ]]
            --[[
            Upvalues:
                [1] = u134
                [2] = u122
            --]]
            u134:Disconnect()
            u122:Destroy()
        end)
    end
    task.delay(2, function() --[[ Line: 428 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122:Destroy()
    end)
    local v135 = u36:isActive(p119, u35.KAIDA_UNIQUE_FIRE) and true or false
    if u121.Pivot.ParticleCircle then
        local u136 = { u121.Pivot.ParticleCircle.Fire1, u121.Pivot.ParticleCircle.Fire2, u121.Pivot.ParticleCircle.Fire3 }
        for v137, v138 in u136 do
            local _ = v137 - 1
            v138.Enabled = true
        end
        if not v135 then
            task.delay(0.3, function() --[[ Line: 446 ]]
                --[[
                Upvalues:
                    [1] = u136
                --]]
                for v139, v140 in u136 do
                    local _ = v139 - 1
                    v140.Enabled = false
                end
            end)
        end
    end
    task.wait(2.2)
    if v135 then
        task.spawn(function() --[[ Line: 462 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u121
                [3] = u33
                [4] = u120
                [5] = u15
                [6] = u5
            --]]
            local v141 = Color3.fromRGB(117, 20, 23)
            local v142 = u16
            local v143 = u121.Pivot.PortalBottom:FindFirstChild("PortalRing1")
            if v143 ~= nil then
                v143 = v143:FindFirstChild("UI")
                if v143 ~= nil then
                    v143 = v143:FindFirstChild("Logo")
                end
            end
            v142:Create(v143, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v144 = u16
            local v145 = u121.Pivot.PortalBottom:FindFirstChild("UI")
            if v145 ~= nil then
                v145 = v145:FindFirstChild("Logo")
            end
            v144:Create(v145, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v146 = u16
            local v147 = u121.Pivot.PortalTop:FindFirstChild("PortalWhite")
            if v147 ~= nil then
                v147 = v147:FindFirstChild("UI")
                if v147 ~= nil then
                    v147 = v147:FindFirstChild("Logo")
                end
            end
            v146:Create(v147, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v148 = u16
            local v149 = u121.Pivot.PortalTop:FindFirstChild("UI")
            if v149 ~= nil then
                v149 = v149:FindFirstChild("Logo")
            end
            v148:Create(v149, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v150 = u16
            local v151 = u121.Pivot.Ring1:FindFirstChild("UI")
            if v151 ~= nil then
                v151 = v151:FindFirstChild("Logo")
            end
            v150:Create(v151, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v152 = u16
            local v153 = u121.Pivot.Ring2:FindFirstChild("UI")
            if v153 ~= nil then
                v153 = v153:FindFirstChild("Logo")
            end
            v152:Create(v153, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            local v154 = u16
            local v155 = u121.Pivot.Ring3:FindFirstChild("UI")
            if v155 ~= nil then
                v155 = v155:FindFirstChild("Logo")
            end
            v154:Create(v155, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["ImageColor3"] = v141
            }):Play()
            task.wait(u33.KAIDA_UNIQUE_FIRE_DURATION)
            if u120 and u120.circleParent then
                local u156 = u120.circleParent:GetScale()
                local u157 = 0
                local u158 = nil
                u158 = u15.Heartbeat:Connect(function(p159) --[[ Line: 537 ]]
                    --[[
                    Upvalues:
                        [1] = u157
                        [2] = u5
                        [3] = u156
                        [4] = u120
                        [5] = u158
                        [6] = u121
                    --]]
                    u157 = u157 + p159
                    local v160 = u157 / 0.75
                    local v161 = math.clamp(v160, 0, 1)
                    local v162 = u5:lerp(u156, 0.01, v161)
                    local v163 = u120
                    if v163 ~= nil then
                        v163.circleParent:ScaleTo(v162)
                    end
                    if v161 >= 1 then
                        u158:Disconnect()
                        local v164 = u120
                        if v164 ~= nil then
                            v164.castingMaid:DoCleaning()
                        end
                        local v165 = u120
                        if v165 ~= nil then
                            v165.summonMaid:DoCleaning()
                        end
                        u121:Destroy()
                    end
                end)
            end
        end)
    elseif u120 and u120.circleParent then
        local u166 = u120.circleParent:GetScale()
        local u167 = 0
        local u168 = nil
        u168 = u15.Heartbeat:Connect(function(p169) --[[ Line: 568 ]]
            --[[
            Upvalues:
                [1] = u167
                [2] = u5
                [3] = u166
                [4] = u120
                [5] = u168
                [6] = u121
            --]]
            u167 = u167 + p169
            local v170 = u167 / 0.75
            local v171 = math.clamp(v170, 0, 1)
            local v172 = u5:lerp(u166, 0.01, v171)
            local v173 = u120
            if v173 ~= nil then
                v173.circleParent:ScaleTo(v172)
            end
            if v171 >= 1 then
                u168:Disconnect()
                local v174 = u120
                if v174 ~= nil then
                    v174.castingMaid:DoCleaning()
                end
                local v175 = u120
                if v175 ~= nil then
                    v175.summonMaid:DoCleaning()
                end
                u121:Destroy()
            end
        end)
    end
    p118.playerCastingDataMap[p119] = nil
end
function u42.enableStartChargingAbility(u176) --[[ Line: 596 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u22
    --]]
    if u176.abilityRef ~= nil then
        u176.abilityRef.Destroy()
    end
    task.defer(function() --[[ Line: 600 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u21
            [3] = u22
            [4] = u176
        --]]
        local v177 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v178 = u21.SUMMONER_START_CHARGING
        local v179 = {}
        for v180, v181 in u22[u21.SUMMONER_START_CHARGING].triggerConfig do
            v179[v180] = v181
        end
        v177:enableAbility(v178, v179):andThen(function(p182) --[[ Line: 608 ]]
            --[[
            Upvalues:
                [1] = u176
            --]]
            u176.abilityRef = p182
        end)
    end)
end
function u42.enableFinishChargingAbility(u183) --[[ Line: 614 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u22
    --]]
    if u183.abilityRef ~= nil then
        u183.abilityRef.Destroy()
    end
    task.defer(function() --[[ Line: 618 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u21
            [3] = u22
            [4] = u183
        --]]
        local v184 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v185 = u21.SUMMONER_FINISH_CHARGING
        local v186 = {}
        for v187, v188 in u22[u21.SUMMONER_FINISH_CHARGING].triggerConfig do
            v186[v187] = v188
        end
        v184:enableAbility(v185, v186):andThen(function(p189) --[[ Line: 626 ]]
            --[[
            Upvalues:
                [1] = u183
            --]]
            u183.abilityRef = p189
        end)
    end)
end
function u42.isPlayerCastingSpell(p190, p191) --[[ Line: 632 ]]
    local v192 = p190.playerCastingDataMap[p191]
    if v192 == nil then
        return false
    else
        return not v192.finishedCasting
    end
end
function u42.cancelSummon(p193, p194) --[[ Line: 644 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u27
        [3] = u13
    --]]
    if not u39(p194, u27.SUMMONER) then
        return nil
    end
    local v195 = p193.playerCastingDataMap[p194]
    if v195 then
        v195.castingMaid:DoCleaning()
        p193.playerCastingDataMap[p194] = nil
    end
    if p194 == u13.LocalPlayer then
        p193.localChargingMaid:DoCleaning()
    end
end
u8.CreateController(u42.new())
return nil