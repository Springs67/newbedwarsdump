local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-hunter", "void-hunter-kit-balance").VoidHunterKitBalance
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u31 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u32 = v1.import(script, script.Parent, "ui", "void-hunter-mark-duration-ui").VoidHunterMarkDurationUI
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "VoidHunterKitController"
    end,
    ["__index"] = u31
})
u33.__index = u33
function u33.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u24
        [3] = u28
        [4] = u26
        [5] = u10
    --]]
    u31.constructor(p36, u24.VOID_HUNTER, {
        ["sounds"] = {
            u28.VOID_HUNTER_PROJECTILE_FIRE_1,
            u28.VOID_HUNTER_PROJECTILE_FIRE_2,
            u28.VOID_HUNTER_PROJECTILE_FIRE_3,
            u28.VOID_HUNTER_PROJECTILE_HIT_1,
            u28.VOID_HUNTER_PROJECTILE_HIT_2,
            u28.VOID_HUNTER_PROJECTILE_HIT_3,
            u28.VOID_HUNTER_CHASING_LOOP,
            u28.VOID_HUNTER_DETONATE_1,
            u28.VOID_HUNTER_DETONATE_2
        },
        ["imageIds"] = {
            u26.VOID_HUNTER_DETONATE_ABILITY_ICON,
            u26.VOID_HUNTER_PROJECTILE_ABILITY_ICON,
            u26.VOID_HUNTER_MARKED_STATUS_EFFECT_ICON,
            u26.VOID_HUNTER_CHASING_STATUS_EFFECT_ICON
        },
        ["animations"] = {}
    })
    p36.Name = "VoidHunterKitController"
    p36.beamTransparencyNumberSequence_transparent = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.8), NumberSequenceKeypoint.new(1, 1) })
    p36.beamTransparencyNumberSequence_opaque = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
    p36.speedMaid = u10.new()
    p36.entityMarkEffectsMaidMap = {}
    p36.aimMaid = u10.new()
    p36.initialized = false
    p36.hasValidAim = false
    p36.kitMaid = u10.new()
    p36.markDurationUIMaid = u10.new()
    p36.chasingMaid = u10.new()
    p36.defaultProjectileFireSounds = { u28.VOID_HUNTER_PROJECTILE_FIRE_1, u28.VOID_HUNTER_PROJECTILE_FIRE_2, u28.VOID_HUNTER_PROJECTILE_FIRE_3 }
    p36.defaultProjectileHitSounds = { u28.VOID_HUNTER_PROJECTILE_HIT_1, u28.VOID_HUNTER_PROJECTILE_HIT_2, u28.VOID_HUNTER_PROJECTILE_HIT_3 }
    p36.defaultDetonateSounds = { u28.VOID_HUNTER_DETONATE_1, u28.VOID_HUNTER_DETONATE_2 }
end
function u33.KnitStart(p37) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    u31.KnitStart(p37)
end
function u33.onKitLocalActivated(_, _) --[[ Line: 72 ]] end
function u33.onKitLocalDeactivated(_) --[[ Line: 74 ]] end
function u33.onKitReplicationActivated(u38, _) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u29
        [3] = u14
        [4] = u8
        [5] = u25
        [6] = u28
        [7] = u9
        [8] = u23
        [9] = u6
        [10] = u27
        [11] = u22
        [12] = u2
        [13] = u19
    --]]
    u18.StatusEffectAdded:connect(function(p39) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u14
            [3] = u38
            [4] = u8
            [5] = u25
            [6] = u28
            [7] = u9
            [8] = u23
            [9] = u6
        --]]
        if p39.statusEffect ~= u29.VOID_HUNTER_BOOSTED then
            return nil
        end
        local v40 = u14:GetPlayerFromCharacter(p39.entityInstance)
        if not v40 then
            return nil
        end
        if v40 ~= u14.LocalPlayer then
            return nil
        end
        u38.speedMaid:DoCleaning()
        local v41 = u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = u25.SPEED_BOOST_MULTIPLIER
        })
        u38.speedMaid:GiveTask(v41)
        u38.chasingMaid:DoCleaning()
        local v42 = u28.VOID_HUNTER_CHASING_LOOP
        local v43 = v40.Character
        if v43 then
            local v44 = u23[u9.Controllers.KitSkinController:getKitSkin(v43)]
            if v44.skoll then
                v42 = v44.skoll.chasingLoopSound
            end
        end
        local v45 = u6:playSound(v42, {
            ["looped"] = true
        })
        u38.chasingMaid:GiveTask(v45)
    end)
    u18.StatusEffectRemoved:connect(function(p46) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u14
            [3] = u38
        --]]
        if p46.statusEffect ~= u29.VOID_HUNTER_BOOSTED then
            return nil
        end
        local v47 = u14:GetPlayerFromCharacter(p46.entityInstance)
        if not v47 then
            return nil
        end
        if v47 ~= u14.LocalPlayer then
            return nil
        end
        u38.speedMaid:DoCleaning()
        u38.chasingMaid:DoCleaning()
    end)
    u27.Client:Get("VoidHunter_TargetMarked"):Connect(function(p48) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u14
            [3] = u38
            [4] = u2
            [5] = u19
        --]]
        local v49 = u22:getPlayerFromEntityInstance(p48.targetEntityInstance)
        if (p48.userPlayer == u14.LocalPlayer or v49 == u14.LocalPlayer) and p48.targetEntityInstance then
            u38:markTarget(p48.userPlayer, p48.targetEntityInstance, p48.serverStartTime, p48.serverEndTime)
        end
        if p48.userPlayer == u14.LocalPlayer then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u19.VOID_HUNTER_DETONATE, nil)
        end
    end)
    u27.Client:Get("VoidHunter_TargetMarkRemoved"):Connect(function(p50) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u14
            [3] = u38
            [4] = u2
            [5] = u19
        --]]
        local v51 = u22:getPlayerFromEntityInstance(p50.targetEntityInstance)
        if (p50.userPlayer == u14.LocalPlayer or v51 == u14.LocalPlayer) and p50.targetEntityInstance then
            u38:removeMark(p50.userPlayer, p50.targetEntityInstance)
        end
        if p50.userPlayer == u14.LocalPlayer then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u19.VOID_HUNTER_DETONATE)
        end
    end)
    u27.Client:Get("VoidHunter_TargetDetonated"):Connect(function(p52) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:detonateMark(p52.userPlayer, p52.targetEntityInstance)
    end)
    u27.Client:Get("VoidHunter_MarkAbilityUsed"):Connect(function(p53) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:useMarkAbility(p53.userPlayer, p53.originPosition, p53.direction, p53.startTime, p53.uuid, p53.targetEntityInstance)
    end)
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 160 ]] end
function u33.onInnateAbilityEnabled(_, _, _) --[[ Line: 162 ]] end
function u33.onAbilityUsed(_, p54, p55) --[[ Line: 164 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u19
        [4] = u17
        [5] = u8
        [6] = u27
    --]]
    local v56 = u22:getPlayerFromEntityInstance(p55.userCharacter)
    if not v56 then
        return nil
    end
    if v56 ~= u14.LocalPlayer then
        return nil
    end
    if p55.ability == u19.VOID_HUNTER_MARK then
        local v57 = p54.PrimaryPart.Position
        if not v57 then
            return nil
        end
        local v58 = u17.CurrentCamera.CFrame.LookVector
        if u8.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
            local v59 = v58.X
            local v60 = v58.Y + 0.35
            local v61 = v58.Z
            v58 = Vector3.new(v59, v60, v61)
        end
        if not v58 then
            return nil
        end
        u27.Client:Get("VoidHunter_MarkAbilityRequest"):SendToServer({
            ["originPosition"] = v57,
            ["direction"] = v58
        })
    end
end
function u33.useMarkAbility(p62, p63, p64, p65, u66, u67, u68) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
        [3] = u9
        [4] = u23
        [5] = u6
        [6] = u5
        [7] = u17
        [8] = u4
        [9] = u21
        [10] = u20
        [11] = u27
        [12] = u16
        [13] = u25
    --]]
    local u69 = u10.new()
    local v70 = u15.Assets.Misc.VoidHunter_WolfProjectile
    local v71 = p62.defaultProjectileFireSounds
    local v72 = p63.Character
    if v72 then
        local v73 = u23[u9.Controllers.KitSkinController:getKitSkin(v72)]
        if v73.skoll then
            v70 = v73.skoll.wolfModel
            v71 = v73.skoll.projectileFireSounds
        end
    end
    u6:playSound(u5.fromList(unpack(v71)), {
        ["position"] = p64
    })
    local u74 = v70:Clone()
    u74:PivotTo(CFrame.new(p64, p64 + p65))
    u74.Parent = u17
    u69:GiveTask(function() --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u74
        --]]
        u74:Destroy()
    end)
    u4:playAnimation(u74.Pivot.WolfRig.AnimationController.Animator, u21:getAssetId(u20.VOID_HUNTER_WOLF_IDLE), {
        ["looped"] = true
    })
    local u76 = u27.Client:Get("VoidHunter_ProjectileTargetFound"):Connect(function(p75) --[[ Line: 231 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u68
        --]]
        if p75.uuid ~= u67 then
            return nil
        end
        u68 = p75.targetEntityInstance
    end)
    u69:GiveTask(function() --[[ Line: 237 ]]
        --[[
        Upvalues:
            [1] = u76
        --]]
        u76:Disconnect()
    end)
    local u88 = u16.Heartbeat:Connect(function(p77) --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u66
            [3] = u25
            [4] = u69
            [5] = u74
            [6] = u68
        --]]
        if u17:GetServerTimeNow() - u66 > u25.MARK_PROJECTILE_DURATION then
            u69:DoCleaning()
            return nil
        end
        local _ = u74:GetPivot().Position
        local v78 = u74:GetPivot().LookVector.Unit
        if u68 ~= nil then
            local v79 = (u68.PrimaryPart.Position - u74:GetPivot().Position).Unit
            local v80 = v78:Dot(v79)
            local v81 = math.acos(v80)
            local v82 = math.deg(v81)
            local v83 = u25.MARK_PROJECTILE_ANGLE_LIMIT_DEGREES_PER_SECOND * p77
            local v84 = math.min(v82, v83)
            if v78 ~= v79 and v82 > 1 then
                v78 = v78:Lerp(v79, v84 / v82).Unit
            end
        end
        local v85 = u25.MARK_PROJECTILE_SPEED * p77
        local v86 = u74:GetPivot().Position + v78 * v85
        local v87 = v86 + v78 * v85
        u74:PivotTo(CFrame.new(v86, v87))
    end)
    u69:GiveTask(function() --[[ Line: 284 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        u88:Disconnect()
    end)
    local u95 = u27.Client:Get("VoidHunter_ProjectileHit"):Connect(function(p89) --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u74
            [3] = u9
            [4] = u23
            [5] = u15
            [6] = u17
            [7] = u69
        --]]
        if p89.uuid ~= u67 then
            return nil
        end
        local v90 = u74:GetPivot().Position
        local v91 = p89.hitEntityInstance
        if v91 ~= nil then
            v91 = v91.PrimaryPart
        end
        if v91 then
            v90 = p89.hitEntityInstance.PrimaryPart.Position
        end
        local v92 = u23[u9.Controllers.KitSkinController:getKitSkin(p89.hitEntityInstance)]
        local v93
        if v92.skoll then
            v93 = v92.skoll.hitEffectColor
        else
            v93 = nil
        end
        local u94 = u15.Assets.Effects.VoidHunterProjectileHitParticles:Clone()
        if v93 then
            u94.Color = v93
        end
        u94:PivotTo(CFrame.new(v90))
        u94.Parent = u17
        u94.ParticleEmitter:Emit(60)
        task.delay(5, function() --[[ Line: 315 ]]
            --[[
            Upvalues:
                [1] = u94
            --]]
            u94:Destroy()
        end)
        u69:DoCleaning()
    end)
    u69:GiveTask(function() --[[ Line: 360 ]]
        --[[
        Upvalues:
            [1] = u95
        --]]
        u95:Disconnect()
    end)
end
function u33.markTarget(p96, p97, p98, p99, p100) --[[ Line: 364 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u9
        [3] = u23
        [4] = u6
        [5] = u5
        [6] = u10
        [7] = u11
        [8] = u14
        [9] = u15
        [10] = u30
        [11] = u8
        [12] = u2
        [13] = u12
        [14] = u32
    --]]
    local v101 = u22:getPlayerFromEntityInstance(p98)
    local v102 = p98.PrimaryPart
    if not v102 then
        return nil
    end
    local v103 = p96.defaultProjectileHitSounds
    local v104 = nil
    local v105 = p97.Character
    if v105 then
        local v106 = u23[u9.Controllers.KitSkinController:getKitSkin(v105)]
        if v106.skoll then
            v103 = v106.skoll.projectileHitSounds
            v104 = v106.skoll.markEffectColor
        end
    end
    u6:playSound(u5.fromList(unpack(v103)), {
        ["position"] = v102.Position
    })
    local v107 = p96.entityMarkEffectsMaidMap[p98]
    if not v107 then
        v107 = u10.new()
        p96.entityMarkEffectsMaidMap[p98] = v107
    end
    local v108 = v102:FindFirstChild("VoidHunter_MarkTrailAttachment1") or u11("Attachment", {
        ["Name"] = "VoidHunter_MarkTrailAttachment1",
        ["Position"] = Vector3.new(0, -0.5, 0),
        ["Parent"] = v102
    })
    local v109 = v102:FindFirstChild("VoidHunter_MarkTrailAttachment2") or u11("Attachment", {
        ["Name"] = "VoidHunter_MarkTrailAttachment2",
        ["Position"] = Vector3.new(0, 0.5, 0),
        ["Parent"] = v102
    })
    local u110 = v102:FindFirstChild("VoidHunter_MarkTrail")
    if not u110 then
        if v101 == u14.LocalPlayer then
            u110 = u11("Trail", {
                ["Name"] = "VoidHunter_MarkTrail",
                ["Lifetime"] = 999999999999,
                ["Attachment0"] = v108,
                ["Attachment1"] = v109,
                ["Parent"] = v102,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(79, 74, 77)), ColorSequenceKeypoint.new(1, Color3.fromRGB(156, 140, 148)) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(1, 0.6) })
            })
        else
            u110 = u11("Trail", {
                ["Name"] = "VoidHunter_MarkTrail",
                ["Lifetime"] = 999999999999,
                ["Attachment0"] = v108,
                ["Attachment1"] = v109,
                ["Parent"] = v102,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(84, 10, 43)), ColorSequenceKeypoint.new(1, Color3.fromRGB(163, 77, 115)) })
            })
        end
    end
    u110.Enabled = true
    v107:GiveTask(function() --[[ Line: 442 ]]
        --[[
        Upvalues:
            [1] = u110
        --]]
        if u110 and u110.Parent ~= nil then
            u110:Destroy()
        end
    end)
    local v111 = v102:FindFirstChild("VoidHunterMarkParticles")
    if not v111 then
        v111 = u15.Assets.Misc.VoidHunterMarkParticles:Clone()
        v111.Anchored = false
        v111:PivotTo(CFrame.new(v102.Position))
        v111.Parent = v102
        u30:weldParts(v111, v102)
    end
    local u112 = v111:FindFirstChild("ParticleEmitter")
    if u112 then
        if v104 then
            u112.Color = ColorSequence.new(v104)
        end
        local v113 = u8.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
        if v101 == u14.LocalPlayer and v113 then
            u112.Enabled = false
        else
            u112.Enabled = true
        end
    end
    v107:GiveTask(function() --[[ Line: 468 ]]
        --[[
        Upvalues:
            [1] = u112
        --]]
        if u112 then
            u112.Enabled = false
        end
    end)
    if p97 == u14.LocalPlayer then
        local u114 = u11("Highlight", {
            ["Name"] = "VoidHunterHighlight",
            ["FillTransparency"] = 0.5,
            ["OutlineTransparency"] = 1,
            ["Parent"] = p98,
            ["FillColor"] = Color3.fromRGB(207, 0, 38),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })
        v107:GiveTask(function() --[[ Line: 483 ]]
            --[[
            Upvalues:
                [1] = u114
            --]]
            return u114:Destroy()
        end)
    end
    if p97 == u14.LocalPlayer then
        p96.markDurationUIMaid:DoCleaning()
        local v115 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u32, {
            ["HideOnComplete"] = true,
            ["Size"] = UDim2.fromScale(0.3, 0.03),
            ["StartTime"] = p99,
            ["EndTime"] = p100,
            ["ProgressBarConfig"] = {
                ["Flip"] = true,
                ["GradientRotation"] = 0,
                ["BarGradient"] = ColorSequence.new(Color3.fromRGB(184, 46, 82), Color3.fromRGB(140, 36, 36))
            }
        }))
        p96.markDurationUIMaid:GiveTask(v115)
    end
end
function u33.removeMark(p116, p117, p118) --[[ Line: 506 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p117 == u14.LocalPlayer then
        p116.speedMaid:DoCleaning()
        p116.chasingMaid:DoCleaning()
    end
    local v119 = p116.entityMarkEffectsMaidMap[p118]
    if not v119 then
        return nil
    end
    v119:DoCleaning()
    if p117 == u14.LocalPlayer then
        p116.markDurationUIMaid:DoCleaning()
    end
end
function u33.detonateMark(p120, p121, p122) --[[ Line: 524 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u23
        [3] = u6
        [4] = u5
        [5] = u15
        [6] = u17
    --]]
    local v123 = p122.PrimaryPart
    if not v123 then
        return nil
    end
    local v124 = p120.defaultDetonateSounds
    local v125 = nil
    local v126 = p121.Character
    if v126 then
        local v127 = u23[u9.Controllers.KitSkinController:getKitSkin(v126)]
        if v127.skoll then
            v124 = v127.skoll.detonateSounds
            v125 = v127.skoll.detonateEffectColor
        end
    end
    u6:playSound(u5.fromList(unpack(v124)), {
        ["position"] = v123.Position
    })
    local u128 = u15.Assets.Effects.VoidHunterDetonateParticles:Clone()
    if v125 then
        u128.Color = v125
    end
    u128:PivotTo(CFrame.new(v123.Position))
    u128.Parent = u17
    u128.ParticleEmitter:Emit(120)
    task.delay(5, function() --[[ Line: 552 ]]
        --[[
        Upvalues:
            [1] = u128
        --]]
        u128:Destroy()
    end)
end
function u33.setTransparencyOfWolfProjectile(p129, p130, p131) --[[ Line: 556 ]]
    if p130 ~= nil then
        local v132 = p130:FindFirstChild("Pivot")
        if v132 ~= nil then
            for v133, v134 in v132:GetChildren() do
                local _ = v133 - 1
                if v134:IsA("MeshPart") then
                    v134.Transparency = p131 and 0.6 or 0
                end
            end
        end
    end
    if p130 ~= nil then
        local v135 = p130:FindFirstChild("Pivot")
        if v135 ~= nil then
            local v136 = v135:FindFirstChild("Head2")
            if v136 ~= nil then
                for v137, v138 in v136:GetChildren() do
                    local _ = v137 - 1
                    if v138:IsA("Beam") then
                        local v139
                        if p131 then
                            v139 = p129.beamTransparencyNumberSequence_transparent
                        else
                            v139 = p129.beamTransparencyNumberSequence_opaque
                        end
                        v138.Transparency = v139
                    end
                end
            end
        end
    end
end
u8.CreateController(u33.new())
return nil