local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.MathExtras
local u6 = v3.SoundManager
local u7 = v3.WatchCharacter
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util")
local u29 = v28.summoner_getPlayerSpellData
local u30 = v28.summoner_getPlayerSpellLevel
local u31 = v28.summoner_getTotalCastTimeRequired
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u36 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u37 = v1.import(script, script.Parent, "ui", "summoner-kit-cast-bar-ui").SummonerKitCastBarUI
local u38 = v1.import(script, script.Parent, "ui", "summoner-kit-level-ui").SummonerKitLevelUI
local u39 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "SummonerKitController"
    end,
    ["__index"] = u36
})
u39.__index = u39
function u39.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    local v40 = u39
    local v41 = setmetatable({}, v40)
    return v41:constructor(...) or v41
end
function u39.constructor(p42) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u26
        [3] = u34
        [4] = u11
    --]]
    u36.constructor(p42, u26.SUMMONER, {
        ["sounds"] = {
            u34.SUMMONER_SUMMON_CHANNEL_LOOP,
            u34.SUMMONER_SUMMON_FINISH,
            u34.SUMMONER_CLAW_ATTACK_1,
            u34.SUMMONER_CLAW_ATTACK_2,
            u34.SUMMONER_CLAW_ATTACK_3,
            u34.SUMMONER_CLAW_ATTACK_4
        }
    })
    p42.Name = "SummonerKitController"
    p42.localChargingMaid = u11.new()
    p42.levelUpUiMaid = u11.new()
    p42.initializedUI = false
    p42.playerCastingDataMap = {}
    p42.debugging = false
end
function u39.KnitStart(p43) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    u36.KnitStart(p43)
end
function u39.onKitLocalActivated(u44, p45) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
        [3] = u24
        [4] = u35
        [5] = u26
        [6] = u9
        [7] = u32
        [8] = u7
        [9] = u14
    --]]
    p45:GiveTask(u18.CanUseLocalAbility:connect(function(p46) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u24
            [3] = u35
            [4] = u26
            [5] = u9
            [6] = u32
        --]]
        if p46.ability == u20.SUMMONER_START_CHARGING or p46.ability == u20.SUMMONER_FINISH_CHARGING then
            local v47 = u24:getPlayerFromEntityInstance(p46.userCharacter)
            if not v47 then
                p46:setCancelled(true)
                return nil
            end
            if not u35(v47, u26.SUMMONER) then
                p46:setCancelled(true)
                return nil
            end
            local v48 = u24:getEntity(p46.userCharacter)
            if not v48 then
                p46:setCancelled(true)
                return nil
            end
            if not v48:isAlive() then
                p46:setCancelled(true)
                return nil
            end
            if u9.Controllers.MatchController:getMatchState() ~= u32.RUNNING then
                p46:setCancelled(true)
                return nil
            end
        end
    end))
    p45:GiveTask(u7(function(p49, _, _) --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u35
            [3] = u26
            [4] = u44
        --]]
        if p49 ~= u14.LocalPlayer then
            return nil
        end
        if not u35(p49, u26.SUMMONER) then
            return nil
        end
        u44:initializePlayer()
    end))
end
function u39.onKitLocalDeactivated(p50) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    p50.levelUpUiMaid:DoCleaning()
    p50.playerCastingDataMap[u14.LocalPlayer] = nil
    local v51 = p50.abilityRef
    if v51 ~= nil then
        v51.Destroy()
    end
    p50.abilityRef = nil
    p50.localChargingMaid:DoCleaning()
    p50.initializedUI = false
end
function u39.onKitReplicationActivated(u52, p53) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    p53:GiveTask(u33.Client:Get("SummonerStartSummonSpellFromServer"):Connect(function(p54) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52:startChargingSummon(p54.player, p54.startTime)
    end))
    p53:GiveTask(u33.Client:Get("SummonerFinishSummonSpellFromServer"):Connect(function(p55) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52:finishChargingSummon(p55.player, p55.tier)
    end))
    local u57 = u33.Client:Get("SummonerDeath"):Connect(function(p56) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        return u52:cancelSummon(p56.player)
    end)
    p53:GiveTask(function() --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        return u57:Disconnect()
    end)
    p53:GiveTask(u33.Client:Get("SummonerCancelSummon"):Connect(function(p58) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        return u52:cancelSummon(p58.player)
    end))
end
function u39.onKitReplicationDeactivated(_) --[[ Line: 144 ]] end
function u39.onInnateAbilityEnabled(_, _, _) --[[ Line: 146 ]] end
function u39.onAbilityUsed(_, _, _) --[[ Line: 148 ]] end
function u39.initializePlayer(p59) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u38
    --]]
    p59.localChargingMaid:DoCleaning()
    p59:enableStartChargingAbility()
    if not p59.initializedUI then
        p59.initializedUI = true
        p59.levelUpUiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u38)))
    end
end
function u39.startChargingSummon(u60, p61, p62) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
        [3] = u27
        [4] = u9
        [5] = u19
        [6] = u20
        [7] = u30
        [8] = u31
        [9] = u18
        [10] = u2
        [11] = u12
        [12] = u37
    --]]
    if p61 == u14.LocalPlayer then
        local u63 = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = false,
            ["moveSpeedMultiplier"] = u27.CASTING_MOVE_SPEED_MULTIPLIER
        })
        local u64 = u9.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["jumpHeightMultiplier"] = 0
        })
        u60.localChargingMaid:GiveTask(function() --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u64
            --]]
            u63.Destroy()
            u64.Destroy()
        end)
        u60.localChargingMaid:GiveTask(u19:disableActions({
            ["disableSword"] = true,
            ["disableAbilities"] = true,
            ["disableBlockPlacement"] = true,
            ["disableBlockBreaking"] = true,
            ["disableAiming"] = true,
            ["disableConsumingItems"] = true,
            ["player"] = p61,
            ["enabledAbilityOverrides"] = { u20.SUMMONER_FINISH_CHARGING }
        }))
        task.delay(0.25, function() --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            u60:enableFinishChargingAbility()
        end)
        local v65 = u30(p61)
        local v66 = v65 == nil and 1 or v65
        local v67 = u31(v66)
        local v68 = u18.CastTimeModifierCheck:fire(v67).castTime
        local v69 = v66 / 4
        local v70 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u37, {
            ["HideOnComplete"] = true,
            ["Size"] = UDim2.fromScale(v69, 0.03),
            ["StartTime"] = p62,
            ["EndTime"] = p62 + v68,
            ["ProgressBarConfig"] = {
                ["Flip"] = false,
                ["GradientRotation"] = 0,
                ["BarGradient"] = ColorSequence.new(Color3.fromRGB(74, 20, 92), Color3.fromRGB(140, 36, 120))
            },
            ["PlayerSpellLevel"] = v66
        }))
        u60.localChargingMaid:GiveTask(v70)
    end
    u60:createExpandingMagicCircle(p61, p62)
end
function u39.createExpandingMagicCircle(u71, u72, u73) --[[ Line: 217 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
        [3] = u25
        [4] = u17
        [5] = u10
        [6] = u16
        [7] = u29
        [8] = u30
        [9] = u31
        [10] = u18
        [11] = u27
        [12] = u11
        [13] = u24
        [14] = u5
        [15] = u34
        [16] = u6
    --]]
    local u74 = u72.Character
    if u74 ~= nil then
        u74 = u74.PrimaryPart
    end
    if not u74 then
        return nil
    end
    local v75 = u15.Assets.Misc.Kaida.Summoner_SummonCircle
    local v76 = u72.Character
    if v76 then
        local v77 = u25[u9.Controllers.KitSkinController:getKitSkin(v76)]
        local v78 = v77.kaida
        if v78 ~= nil then
            v78 = v78.summon_circle
        end
        if v78 then
            v75 = v77.kaida
            if v75 ~= nil then
                v75 = v75.summon_circle
            end
        end
    end
    local u79 = v75:Clone()
    u79.Parent = u17
    if u10.Controllers.SummonerKitSkinController:isPrismaticSkin(u72) then
        u9.Controllers.SummonerKitSkinController:applyCircleRGB(u79)
    end
    if u16:IsStudio() and (u71.debugging and u79.Pivot.DebugCircle) then
        u79.Pivot.DebugCircle.Transparency = 0
    end
    local v80 = u71.playerCastingDataMap[u72]
    if v80 then
        v80.castingMaid:DoCleaning()
        u71.playerCastingDataMap[u72] = nil
    end
    local v81 = u74.Position
    local u82 = CFrame.new(v81 - Vector3.new(0, 3, 0))
    u79:PivotTo(u82)
    local v83 = u29(u72)
    local v84 = u30(u72)
    local v85 = v84 == nil and 1 or v84
    local v86 = u31(v85)
    local u87 = u18.CastTimeModifierCheck:fire(v86).castTime
    local u88 = u27.CIRCLE_MIN_RADIUS
    local u89 = v83.maxRadius
    local u90 = u11.new()
    local u91 = u11.new()
    local u92 = 0
    local u93 = true
    local u94 = nil
    u94 = u16.Heartbeat:Connect(function(p95) --[[ Line: 287 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u24
            [3] = u72
            [4] = u94
            [5] = u93
            [6] = u17
            [7] = u73
            [8] = u87
            [9] = u5
            [10] = u88
            [11] = u89
            [12] = u74
            [13] = u82
            [14] = u92
        --]]
        local v96 = u79
        if v96 ~= nil then
            v96 = v96.Parent
        end
        local v97 = v96 == nil
        if not v97 then
            v97 = u24:getEntity(u72)
            if v97 ~= nil then
                v97 = v97:isDead()
            end
        end
        if v97 then
            u94:Disconnect()
            return nil
        end
        if u93 then
            local v98 = (u17:GetServerTimeNow() - u73) / u87
            local v99 = u5:lerp(u88, u89, (math.clamp(v98, 0, 1))) * 2
            local v100 = u74.Position
            u82 = CFrame.new(v100 - Vector3.new(0, 3, 0))
            u79:PivotTo(u82)
            u79:ScaleTo(v99)
        end
        u92 = u92 + p95
        local v101 = u79
        if v101 ~= nil then
            v101 = v101.Pivot
        end
        if v101 then
            local v102 = u82
            local v103 = CFrame.Angles
            local v104 = u92 * 60
            local v105 = v103(0, math.rad(v104), 0)
            u79.Pivot.Ring1.CFrame = v102 * v105
            local v106 = u82
            local v107 = CFrame.Angles
            local v108 = u92 * 10
            local v109 = v107(0, math.rad(v108), 0)
            u79.Pivot.Ring2.CFrame = v106 * v109
            local v110 = u82
            local v111 = CFrame.Angles
            local v112 = -u92 * 80
            local v113 = v111(0, math.rad(v112), 0)
            u79.Pivot.Ring3.CFrame = v110 * v113
            local v114 = u82
            local v115 = CFrame.Angles
            local v116 = u92 * 30
            local v117 = v115(0, math.rad(v116), 0)
            u79.Pivot.PortalBottom.CFrame = v114 * v117
            local v118 = u82
            local v119 = CFrame.Angles
            local v120 = u92 * -30
            local v121 = v119(0, math.rad(v120), 0)
            u79.Pivot.PortalTop.CFrame = v118 * v121
        end
    end)
    u91:GiveTask(u94)
    u71.playerCastingDataMap[u72] = {
        ["finishedCasting"] = false,
        ["castingMaid"] = u90,
        ["summonMaid"] = u91,
        ["circleParent"] = u79
    }
    u90:GiveTask(function() --[[ Line: 349 ]]
        --[[
        Upvalues:
            [1] = u93
            [2] = u71
            [3] = u72
            [4] = u79
        --]]
        u93 = false
        local v122 = u71.playerCastingDataMap[u72]
        if v122 and (not v122.finishedCasting and u79) then
            u79:Destroy()
        end
    end)
    local v123 = u34.SUMMONER_SUMMON_CHANNEL_LOOP
    local v124 = u9.Controllers.KitSkinController:getPlayerKitSkinMeta(u72)
    local v125
    if v124 == nil then
        v125 = v124
    else
        v125 = v124.kaida
        if v125 ~= nil then
            v125 = v125.summonChannelLoopSound
        end
    end
    if v125 ~= "" and v125 then
        v123 = v124.kaida.summonChannelLoopSound
    end
    local v126 = u6
    local v127 = {
        ["looped"] = true,
        ["parent"] = u79.PrimaryPart
    }
    local v128 = u79.PrimaryPart
    if v128 ~= nil then
        v128 = v128.Position
    end
    v127.position = v128
    u90:GiveTask((v126:playSound(v123, v127)))
    local v129 = u31(v85)
    local v130 = u18.CastTimeModifierCheck:fire(v129).castTime
    task.delay(v130 + 0.1, function() --[[ Line: 408 ]]
        --[[
        Upvalues:
            [1] = u90
            [2] = u91
        --]]
        u90:DoCleaning()
        u91:DoCleaning()
    end)
end
function u39.finishChargingSummon(p131, p132, _) --[[ Line: 413 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u34
        [3] = u9
        [4] = u6
        [5] = u15
        [6] = u25
        [7] = u10
        [8] = u17
        [9] = u4
        [10] = u23
        [11] = u22
        [12] = u16
        [13] = u5
    --]]
    if p132 == u14.LocalPlayer then
        p131.localChargingMaid:DoCleaning()
        p131:enableStartChargingAbility()
    end
    local u133 = p131.playerCastingDataMap[p132]
    if not u133 then
        return nil
    end
    u133.finishedCasting = true
    u133.castingMaid:DoCleaning()
    local u134 = u133.circleParent
    local v135 = u34.SUMMONER_SUMMON_FINISH
    local v136 = u9.Controllers.KitSkinController:getPlayerKitSkinMeta(p132)
    local v137
    if v136 == nil then
        v137 = v136
    else
        v137 = v136.kaida
        if v137 ~= nil then
            v137 = v137.summonFinishSound
        end
    end
    if v137 ~= "" and v137 then
        v135 = v136.kaida.summonFinishSound
    end
    u6:playSound(v135, {
        ["position"] = u134.Pivot.Position
    })
    local v138
    if v136 == nil then
        v138 = v136
    else
        v138 = v136.kaida
        if v138 ~= nil then
            v138 = v138.summonFinishOverlaySound
        end
    end
    if v138 ~= "" and v138 then
        u6:playSound(v136.kaida.summonFinishOverlaySound, {
            ["position"] = u134.Pivot.Position
        })
    end
    local v139 = u15.Assets.Misc.Kaida.Summoner_DragonHead
    local v140 = p132.Character
    if v140 then
        local v141 = u25[u9.Controllers.KitSkinController:getKitSkin(v140)]
        local v142 = v141.kaida
        if v142 ~= nil then
            v142 = v142.dragon_head
        end
        if v142 then
            v139 = v141.kaida
            if v139 ~= nil then
                v139 = v139.dragon_head
            end
        end
    end
    local u143 = v139:Clone()
    if u10.Controllers.SummonerKitSkinController:isPrismaticSkin(p132) then
        u10.Controllers.SummonerKitSkinController:applyDragonHeadRGB(u143)
    end
    u143.Parent = u17
    if u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        for v144, v145 in u143:GetChildren() do
            local _ = v144 - 1
            if v145:IsA("MeshPart") then
                v145.Transparency = 0.6
            end
        end
    end
    local v146 = u143.PrimaryPart.CFrame.LookVector
    if p132.Character then
        local v147 = p132.Character.PrimaryPart.CFrame.LookVector.X
        local v148 = p132.Character.PrimaryPart.CFrame.LookVector.Z
        v146 = Vector3.new(v147, 0, v148).Unit
    end
    local v149 = v146.X
    local v150 = v146.Z
    math.atan2(v149, v150)
    local v151 = u134:GetPivot().Position
    u143:PivotTo((CFrame.new(v151 - Vector3.new(0, 13, 0))))
    local u152 = u4:playAnimation(u143.AnimationController.Animator, u23:getAssetId(u22.SUMMONER_DRAGON_ATTACK), {
        ["looped"] = false,
        ["speed"] = 1.2
    })
    if u152 then
        local u153 = false
        local u155 = u16.Heartbeat:Connect(function() --[[ Line: 526 ]]
            --[[
            Upvalues:
                [1] = u152
                [2] = u153
                [3] = u134
                [4] = u143
            --]]
            if u152.TimePosition > 0.1 and not u153 then
                local v154 = u134:GetPivot().Position
                u143:PivotTo((CFrame.new(v154 - Vector3.new(0, 0, 0))))
                u153 = true
            end
        end)
        u152.Stopped:Connect(function() --[[ Line: 535 ]]
            --[[
            Upvalues:
                [1] = u155
                [2] = u143
            --]]
            u155:Disconnect()
            u143:Destroy()
        end)
    end
    if u134.Pivot:FindFirstChild("ParticleCircle") then
        local u156 = { u134.Pivot.ParticleCircle.Fire1, u134.Pivot.ParticleCircle.Fire2, u134.Pivot.ParticleCircle.Fire3 }
        for v157, v158 in u156 do
            local _ = v157 - 1
            v158.Enabled = true
        end
        task.delay(0.3, function() --[[ Line: 549 ]]
            --[[
            Upvalues:
                [1] = u156
            --]]
            for v159, v160 in u156 do
                local _ = v159 - 1
                v160.Enabled = false
            end
        end)
    end
    task.wait(2.2)
    if u133 and u133.circleParent then
        local u161 = u133.circleParent:GetScale()
        local u162 = 0
        local u163 = nil
        u163 = u16.Heartbeat:Connect(function(p164) --[[ Line: 568 ]]
            --[[
            Upvalues:
                [1] = u162
                [2] = u5
                [3] = u161
                [4] = u133
                [5] = u163
                [6] = u134
                [7] = u143
            --]]
            u162 = u162 + p164
            local v165 = u162 / 0.75
            local v166 = math.clamp(v165, 0, 1)
            local v167 = u5:lerp(u161, 0.01, v166)
            local v168 = u133
            if v168 ~= nil then
                v168.circleParent:ScaleTo(v167)
            end
            if v166 >= 1 then
                u163:Disconnect()
                local v169 = u133
                if v169 ~= nil then
                    v169.castingMaid:DoCleaning()
                end
                local v170 = u133
                if v170 ~= nil then
                    v170.summonMaid:DoCleaning()
                end
                local v171 = u134
                if v171 ~= nil then
                    v171:Destroy()
                end
                local v172 = u143
                if v172 ~= nil then
                    v172:Destroy()
                end
            end
        end)
    end
    p131.playerCastingDataMap[p132] = nil
end
function u39.enableStartChargingAbility(u173) --[[ Line: 602 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u21
    --]]
    if u173.abilityRef ~= nil then
        u173.abilityRef.Destroy()
    end
    task.defer(function() --[[ Line: 606 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
            [3] = u21
            [4] = u173
        --]]
        local v174 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v175 = u20.SUMMONER_START_CHARGING
        local v176 = {}
        for v177, v178 in u21[u20.SUMMONER_START_CHARGING].triggerConfig do
            v176[v177] = v178
        end
        v174:enableAbility(v175, v176):andThen(function(p179) --[[ Line: 614 ]]
            --[[
            Upvalues:
                [1] = u173
            --]]
            u173.abilityRef = p179
        end)
    end)
end
function u39.enableFinishChargingAbility(u180) --[[ Line: 620 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u21
    --]]
    if u180.abilityRef ~= nil then
        u180.abilityRef.Destroy()
    end
    task.defer(function() --[[ Line: 624 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
            [3] = u21
            [4] = u180
        --]]
        local v181 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v182 = u20.SUMMONER_FINISH_CHARGING
        local v183 = {}
        for v184, v185 in u21[u20.SUMMONER_FINISH_CHARGING].triggerConfig do
            v183[v184] = v185
        end
        v181:enableAbility(v182, v183):andThen(function(p186) --[[ Line: 632 ]]
            --[[
            Upvalues:
                [1] = u180
            --]]
            u180.abilityRef = p186
        end)
    end)
end
function u39.isPlayerCastingSpell(p187, p188) --[[ Line: 638 ]]
    local v189 = p187.playerCastingDataMap[p188]
    if v189 == nil then
        return false
    else
        return not v189.finishedCasting
    end
end
function u39.cancelSummon(p190, p191) --[[ Line: 650 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u26
        [3] = u14
    --]]
    if not u35(p191, u26.SUMMONER) then
        return nil
    end
    local v192 = p190.playerCastingDataMap[p191]
    if v192 then
        v192.castingMaid:DoCleaning()
        p190.playerCastingDataMap[p191] = nil
    end
    if p191 == u14.LocalPlayer then
        p190.localChargingMaid:DoCleaning()
    end
end
u9.CreateController(u39.new())
return nil