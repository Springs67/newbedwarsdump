local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.DeviceUtil
local u7 = v3.GameQueryUtil
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local u25 = v24.SorcererBalance
local u26 = v24.SorcererTier
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u36 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-charge-progress").SpellChargeComponent
local u37 = { u28.SORCERER_EXPLOSION_1, u28.SORCERER_EXPLOSION_2, u28.SORCERER_EXPLOSION_3 }
local u38 = { u28.SORCERER_EXPLOSION_1_HUGE, u28.SORCERER_EXPLOSION_2_HUGE, u28.SORCERER_EXPLOSION_3_HUGE }
local u39 = {
    u28.SORCERER_EXPLOSION_FRAG_1,
    u28.SORCERER_EXPLOSION_FRAG_2,
    u28.SORCERER_EXPLOSION_FRAG_3,
    u28.SORCERER_EXPLOSION_FRAG_1_HUGE,
    u28.SORCERER_EXPLOSION_FRAG_2_HUGE,
    u28.SORCERER_EXPLOSION_FRAG_3_HUGE
}
local u40 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "HalloweenAbilityDeathAdderTreeController"
    end,
    ["__index"] = u20
})
u40.__index = u40
function u40.new(...) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    local v41 = u40
    local v42 = setmetatable({}, v41)
    return v42:constructor(...) or v42
end
function u40.constructor(p43) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u29
        [3] = u10
    --]]
    u20.constructor(p43, { u29.HALLOWEEN_2025_EVENT_PVE })
    p43.Name = "HalloweenAbilityDeathAdderTreeController"
    p43.chargeMaid = u10.new()
    p43.spellEffectMaidMap = {}
    p43.spellAbilityMaid = u10.new()
end
function u40.KnitStart(p44) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p44)
end
function u40.onGameInit(u45) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u27
        [3] = u31
        [4] = u30
        [5] = u15
        [6] = u19
        [7] = u21
        [8] = u2
        [9] = u32
        [10] = u4
        [11] = u18
        [12] = u17
        [13] = u25
        [14] = u26
        [15] = u12
        [16] = u36
        [17] = u9
        [18] = u5
        [19] = u23
        [20] = u22
        [21] = u37
        [22] = u8
        [23] = u34
        [24] = u16
        [25] = u35
        [26] = u38
        [27] = u39
        [28] = u28
    --]]
    u33.Client:Get("EntityDeathEvent"):Connect(function(p46) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u31
            [3] = u30
            [4] = u45
            [5] = u15
        --]]
        local v47 = u27:getEntity(p46.entityInstance)
        if v47 ~= nil then
            v47 = v47:getPlayer()
        end
        if v47 and u31:isHalloweenKit(v47, u30.SORCERER) then
            u45:endSpellCastEffects(v47)
            if v47 == u15.LocalPlayer then
                u45.chargeMaid:DoCleaning()
            end
        end
    end)
    u19.AbilityUsed:connect(function(p48) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u21
            [3] = u45
            [4] = u2
            [5] = u32
            [6] = u4
            [7] = u18
            [8] = u17
            [9] = u25
            [10] = u26
            [11] = u12
            [12] = u36
            [13] = u33
            [14] = u9
            [15] = u19
            [16] = u5
            [17] = u23
            [18] = u22
        --]]
        local v49 = u15:GetPlayerFromCharacter(p48.userCharacter)
        if not v49 then
            return nil
        end
        if p48.ability == u21.SORCERER_EXPLOSION_HALLOWEEN then
            u45:playSpellCastEffects(v49)
            if p48.userCharacter ~= u15.LocalPlayer.Character then
                return nil
            end
            u45:createAimLine()
            if u45.abilityRef ~= nil then
                u45.abilityRef.Destroy()
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u21.SORCERER_PROJECTILE_FIRE, {
                ["abilityType"] = "KitPrimary",
                ["abilityButton"] = {
                    ["icon"] = u32.SORCERER_FIRE_ABILITY
                },
                ["getExtraData"] = function() --[[ Name: getExtraData, Line 98 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    return {
                        ["direction"] = u45:getProjectileDirection()
                    }
                end
            }):andThen(function(p50) --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                u45.abilityRef = p50
            end)
            u45.chargeMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u21.SORCERER_PROJECTILE_CANCEL, {
                ["abilityType"] = "KitSecondary",
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://16812686987"
                },
                ["getExtraData"] = function() --[[ Name: getExtraData, Line 113 ]] end
            }):expect())
            local v51 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u21.SORCERER_PROJECTILE_FIRE)
            if v51 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v51, u4.DISABLED)
            end
            local u52 = u18:GetServerTimeNow()
            local u54 = u17.Heartbeat:Connect(function() --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u52
                    [3] = u25
                    [4] = u26
                    [5] = u2
                    [6] = u21
                    [7] = u4
                --]]
                local v53 = u18:GetServerTimeNow() - u52 > u25.getSorcererTierData(u26.TIER_1).secCharge and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u21.SORCERER_PROJECTILE_FIRE)
                if v53 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v53, u4.READY)
                end
            end)
            u45.chargeMaid:GiveTask(function() --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u54
                    [3] = u2
                    [4] = u21
                    [5] = u32
                --]]
                if u45.abilityRef ~= nil then
                    u45.abilityRef.Destroy()
                end
                u54:Disconnect()
                local v55 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v56 = u21.SORCERER_EXPLOSION_HALLOWEEN
                local v57 = {
                    ["abilityType"] = "KitPrimary",
                    ["abilityButton"] = {
                        ["icon"] = u32.SORCERER_ABILITY_TIER_3
                    },
                    ["getExtraData"] = function() --[[ Name: getExtraData, Line 139 ]]
                        --[[
                        Upvalues:
                            [1] = u45
                        --]]
                        return {
                            ["direction"] = u45:getProjectileDirection()
                        }
                    end
                }
                v55:enableAbility(v56, v57):andThen(function(p58) --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u45
                    --]]
                    u45.abilityRef = p58
                end)
            end)
            u45.chargeMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u36, {
                ["maxTier"] = 3
            })))
            u33.Client:Get("SorcererSpellChargeStartedHalloween"):SendToServer()
            u45.chargeMaid:GiveTask(u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = u25.SPELL_CHARGE_MOVE_SPEED_MODIFIER
            }))
            u9.Controllers.SwordController:toggleSwordSwing(true)
            u9.Controllers.BlockPlacementController:disableBlockPlacer()
            local u60 = u19.BeginProjectileTargeting:connect(function(p59) --[[ Line: 159 ]]
                p59:setCancelled(true)
                return nil
            end)
            u45.chargeMaid:GiveTask(function() --[[ Line: 163 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u60
                --]]
                u9.Controllers.SwordController:toggleSwordSwing(false)
                u9.Controllers.BlockPlacementController:enableBlockPlacer()
                u60:Destroy()
            end)
            u45.targetingAnimationTrack = u5:playAnimation(v49.Character.Humanoid.Animator, u23:getAssetId(u22.SORCERER_SPELL_CHARGE), {
                ["looped"] = true
            })
            u45.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4
        end
        if p48.ability == u21.SORCERER_PROJECTILE_FIRE or p48.ability == u21.SORCERER_PROJECTILE_CANCEL then
            u45:endSpellCastEffects(v49)
            if p48.userCharacter ~= u15.LocalPlayer.Character then
                return nil
            end
            u45.chargeMaid:DoCleaning()
            local v61 = u45.targetingAnimationTrack
            if v61 ~= nil then
                v61:Stop()
            end
        end
    end)
    u19.ExplosionEffect:connect(function(p62) --[[ Line: 187 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u8
            [3] = u34
            [4] = u16
            [5] = u18
            [6] = u35
        --]]
        local v63 = p62.explosionType
        if table.find(u37, v63) == nil then
            return nil
        end
        u8:playSound(u34.SORCERER_PROJECTILE_HIT, {
            ["rollOffMaxDistance"] = 250,
            ["position"] = p62.position
        })
        local v64 = u16.Assets.Effects.SorcererExplosion:Clone()
        v64.Parent = u18
        v64.CFrame = CFrame.new(p62.position)
        u35:playEffects({ v64 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end)
    u19.ExplosionEffect:connect(function(p65) --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u8
            [3] = u34
            [4] = u16
            [5] = u18
            [6] = u35
        --]]
        local v66 = p65.explosionType
        if table.find(u38, v66) == nil then
            return nil
        end
        u8:playSound(u34.SORCERER_PROJECTILE_HIT, {
            ["rollOffMaxDistance"] = 250,
            ["position"] = p65.position
        })
        local v67 = u16.Assets.Effects.SorcererExplosionHuge:Clone()
        v67.Parent = u18
        v67.CFrame = CFrame.new(p65.position)
        u35:playEffects({ v67 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end)
    u19.ExplosionEffect:connect(function(p68) --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u8
            [3] = u34
            [4] = u28
            [5] = u16
            [6] = u18
            [7] = u35
        --]]
        local v69 = p68.explosionType
        if table.find(u39, v69) == nil then
            return nil
        end
        u8:playSound(u34.SORCERER_PROJECTILE_HIT, {
            ["rollOffMaxDistance"] = 250,
            ["position"] = p68.position
        })
        local v70
        if (p68.explosionType == u28.SORCERER_EXPLOSION_FRAG_1_HUGE or p68.explosionType == u28.SORCERER_EXPLOSION_FRAG_2_HUGE) and true or p68.explosionType == u28.SORCERER_EXPLOSION_FRAG_3_HUGE then
            v70 = u16.Assets.Effects.SorcererExplosionHuge:Clone()
        else
            v70 = u16.Assets.Effects.SorcererExplosion:Clone()
        end
        v70.Parent = u18
        v70.CFrame = CFrame.new(p68.position)
        u35:playEffects({ v70 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end)
    u33.Client:Get("PlaySorcererSpellEffectsHalloween"):Connect(function(p71) --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:playSpellCastEffects(p71.sorcerer)
    end)
    u33.Client:Get("EndSorcererSpellEffectsHalloween"):Connect(function(p72) --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u8
            [3] = u34
            [4] = u15
            [5] = u18
            [6] = u5
            [7] = u23
            [8] = u22
        --]]
        u45:endSpellCastEffects(p72.sorcerer)
        if not p72.projectileFired then
            return nil
        end
        local v73 = p72.sorcerer.Character
        if v73 ~= nil then
            v73 = v73:GetPivot().Position
        end
        if v73 then
            u8:playSound(u34.SORCERER_PROJECTILE_SHOOT, {
                ["position"] = v73
            })
        end
        if p72.sorcerer ~= u15.LocalPlayer then
            return nil
        end
        u45.chargeMaid:DoCleaning()
        local v74 = u18.CurrentCamera
        if v74 ~= nil then
            v74 = v74.CFrame.LookVector
        end
        local v75 = u15.LocalPlayer.Character
        if v75 ~= nil then
            v75 = v75:GetPivot()
        end
        if v74 and v75 then
            local v76 = v75.Position
            local v77 = v75.Position
            local v78 = v74 * 10
            local v79 = CFrame.new(v76, v77 + v78)
            local v80 = u15.LocalPlayer.Character
            if v80 ~= nil then
                v80:PivotTo(v79)
            end
        end
        u5:playAnimation(p72.sorcerer.Character.Humanoid.Animator, u23:getAssetId(u22.COMET_VOLLEY_COMET_FIRED), {
            ["looped"] = false
        })
        local v81 = u45.targetingAnimationTrack
        if v81 ~= nil then
            v81:Stop()
        end
    end)
end
function u40.playSpellCastEffects(p82, p83) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u11
        [4] = u10
        [5] = u8
        [6] = u34
        [7] = u15
        [8] = u14
        [9] = u9
        [10] = u17
        [11] = u25
    --]]
    local v84 = p83.Character
    if not v84 then
        return nil
    end
    local v85 = p83.Character
    if v85 ~= nil then
        v85 = v85:GetPivot().LookVector.Unit
    end
    if not v85 then
        return nil
    end
    local v86 = p83.Character
    if v86 ~= nil then
        v86 = v86:GetPivot().Position
    end
    if not v86 then
        return nil
    end
    local v87 = v85 * 3
    local v88 = CFrame.new(v86 + v87, v86 + v85)
    local v89 = u16.Assets.Effects.SorcererSpellCast:Clone()
    v89.Parent = u18
    v89.CFrame = v88
    u11("WeldConstraint", {
        ["Part0"] = v84.PrimaryPart,
        ["Part1"] = v89,
        ["Parent"] = v89
    })
    local v90 = p82.spellEffectMaidMap[p83] or u10.new()
    v90:GiveTask(v89)
    p82.spellEffectMaidMap[p83] = v90
    local v91 = u8
    local v92 = u34.SORCERER_SPELL_CHARGING_LOOP
    local v93 = {}
    local v94 = p83.Character
    if v94 ~= nil then
        v94 = v94.PrimaryPart
    end
    v93.parent = v94
    v93.position = v86
    v93.looped = true
    v90:GiveTask(v91:playSound(v92, v93))
    local u95 = v89.ChargeUpParticles.Specs
    local u96 = v89.ChargeUpParticles.EnergyPull1
    local u97 = v89.ChargeUpParticles.EnergyPull2
    local v98 = v89.MagicCircle1.MagicCircle
    local v99 = v89.MagicCircle2.MagicCircle
    local u100 = v89.MagicCircle3.MagicCircle
    if p83 == u15.LocalPlayer then
        u14:AddTag(u95, "FirstPersonHidden")
        u14:AddTag(u96, "FirstPersonHidden")
        u14:AddTag(u97, "FirstPersonHidden")
        u14:AddTag(v98, "FirstPersonHidden")
        u14:AddTag(v99, "FirstPersonHidden")
        u14:AddTag(u100, "FirstPersonHidden")
    end
    local v101 = u8
    local v102 = u34.SORCERER_SPELL_UPGRADES
    local v103 = {}
    local v104 = p83.Character
    if v104 ~= nil then
        v104 = v104.PrimaryPart
    end
    v103.parent = v104
    v103.position = v86
    local u105 = v101:playModifiableSound(v102, v103)
    u105:Pause()
    v90:GiveTask(u105)
    local u106 = u18:GetServerTimeNow()
    local u107 = true
    u100.Lifetime = NumberRange.new(120)
    u100.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
    local u108 = u9.Controllers.CameraPerspectiveController:getCameraPerspective()
    v90:GiveTask((u17.Heartbeat:Connect(function() --[[ Line: 383 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u106
            [3] = u25
            [4] = u107
            [5] = u108
            [6] = u9
            [7] = u100
            [8] = u95
            [9] = u96
            [10] = u97
            [11] = u105
        --]]
        local v109 = u18:GetServerTimeNow() - u106
        if u25.getSorcererTierData(u25.HIGHEST_TIER).secCharge < v109 and u107 then
            u108 = u9.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u108 == 1 then
                u100:Emit(1)
            end
            u107 = false
            local v110 = u95
            v110.Rate = v110.Rate + 20
            local v111 = u96
            v111.Rate = v111.Rate + 5
            local v112 = u97
            v112.Rate = v112.Rate + 5
        end
        if v109 > 3.5 then
            u105:Pause()
        end
    end)))
end
function u40.createAimLine(u113) --[[ Line: 402 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
        [3] = u11
        [4] = u16
        [5] = u7
        [6] = u6
        [7] = u14
        [8] = u17
        [9] = u25
    --]]
    local v114 = u15.LocalPlayer.Character
    if v114 ~= nil then
        v114 = v114.PrimaryPart
    end
    if not v114 then
        return nil
    end
    local u115 = u11("Part", {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u18
    })
    local u116 = u16.Assets.Effects.SorcererHitIndicator:Clone()
    u116.Parent = u18
    u115:PivotTo(u15.LocalPlayer.Character:GetPivot())
    local v117 = u11("WeldConstraint", {
        ["Part0"] = u115,
        ["Part1"] = u15.LocalPlayer.Character.PrimaryPart,
        ["Parent"] = u15.LocalPlayer.Character
    })
    u113.chargeMaid:GiveTask(v117)
    u7:setQueryIgnored(u115, true)
    u7:setQueryIgnored(u116, true)
    local v118 = u11("Attachment", {
        ["Parent"] = u115
    })
    local v119 = u11("Attachment", {
        ["Parent"] = u116
    })
    local u120 = u6.isMobileControls() and 3 or 1
    local u121 = u11("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v118,
        ["Attachment1"] = v119,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = u120 * 0.08,
        ["Width1"] = u120 * 0.08,
        ["Parent"] = u18
    })
    u14:AddTag(u121, "projectile-preview-beam")
    u113.chargeMaid:GiveTask(u121)
    local u122 = 0
    local v131 = u17.Heartbeat:Connect(function() --[[ Line: 451 ]]
        --[[
        Upvalues:
            [1] = u122
            [2] = u25
            [3] = u18
            [4] = u115
            [5] = u116
            [6] = u15
            [7] = u113
            [8] = u121
            [9] = u120
            [10] = u116
        --]]
        u122 = u25.getSorcererTierData(u25.HIGHEST_TIER).secCharge * u25.getSorcererTierData(u25.HIGHEST_TIER).secCharge
        local v123 = u18.CurrentCamera
        if v123 ~= nil then
            v123 = v123.CFrame
        end
        if v123 then
            local v124 = u115
            if v124 ~= nil then
                v124 = v124.Position
            end
            if v124 then
                if u116 then
                    local v125 = u15.LocalPlayer.Character
                    if v125 ~= nil then
                        v125 = v125:GetPivot().Position
                    end
                    if v125 then
                        local v126 = u113:getProjectileDirection()
                        local v127 = u18:Raycast(v125 + v126 * 5, v126 * u122)
                        if v127 then
                            local v128 = u116
                            if v128 ~= nil then
                                v128:PivotTo(CFrame.new(v127.Position))
                            end
                            u121.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247))
                            u121.Width0 = u120 * 0.1
                            u121.Width1 = u120 * 0.1
                            u121.Transparency = NumberSequence.new(0)
                            u116.Color = Color3.new(1, 0.03, 0.9)
                            u116.Transparency = 0
                            u116.Attachment.ParticleEmitter.Enabled = true
                        else
                            local v129 = u115.Position + v126 * u122
                            local v130 = u116
                            if v130 ~= nil then
                                v130:PivotTo(CFrame.new(v129))
                            end
                            u121.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255))
                            u121.Transparency = NumberSequence.new(0.3)
                            u121.Width0 = u120 * 0.08
                            u121.Width1 = u120 * 0.08
                            u116.Color = Color3.new(1, 0.95, 1)
                            u116.Transparency = 0.8
                            u116.Attachment.ParticleEmitter.Enabled = false
                        end
                    else
                        return nil
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
    u113.chargeMaid:GiveTask(v131)
end
function u40.getProjectileDirection(_) --[[ Line: 519 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
    --]]
    local v132 = u18.CurrentCamera.CFrame.LookVector
    if u9.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        local v133 = v132.X
        local v134 = v132.Y + 0.3
        local v135 = v132.Z
        v132 = Vector3.new(v133, v134, v135)
    end
    return v132
end
function u40.endSpellCastEffects(p136, p137) --[[ Line: 526 ]]
    local v138 = p136.spellEffectMaidMap[p137]
    if v138 ~= nil then
        v138:DoCleaning()
    end
end
function u40.enableHalloweenAbility(u139) --[[ Line: 535 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u21
        [3] = u32
    --]]
    local v140 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v141 = u21.SORCERER_EXPLOSION_HALLOWEEN
    local v142 = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = u32.SORCERER_ABILITY_TIER_3
        },
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 541 ]] end
    }
    v140:enableAbility(v141, v142):andThen(function(p143) --[[ Line: 543 ]]
        --[[
        Upvalues:
            [1] = u139
        --]]
        u139.abilityRef = p143
        u139.spellAbilityMaid:GiveTask(p143)
    end)
end
u9.CreateController(u40.new())
return nil