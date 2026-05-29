local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.DeviceUtil
local u7 = v3.GameQueryUtil
local u8 = v3.SoundManager
local u9 = v3.WatchCollectionTag
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u11 = v10.KnitClient
local u12 = v10.KnitClient
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.CollectionService
local u19 = v17.Players
local u20 = v17.ReplicatedStorage
local u21 = v17.RunService
local u22 = v17.Workspace
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local u30 = v29.SorcererBalance
local u31 = v29.SorcererTier
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u42 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-charge-progress").SpellChargeComponent
local u43 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "sorcerer", "ui", "spell-tracker").SorcererKit
local u44 = { v32.SORCERER_EXPLOSION_1, v32.SORCERER_EXPLOSION_2, v32.SORCERER_EXPLOSION_3 }
local u45 = Color3.fromRGB(89, 149, 182)
local u46 = {
    ["UPGRADE_1"] = v39.SORCERER_SPELL_UPGRADES,
    ["UPGRADE_2"] = v39.SORCERER_SPELL_UPGRADES,
    ["UPGRADE_3"] = v39.SORCERER_SPELL_UPGRADES,
    ["SHOT"] = v39.SORCERER_PROJECTILE_SHOOT,
    ["HIT"] = v39.SORCERER_PROJECTILE_HIT,
    ["CHARGE_LOOP"] = v39.SORCERER_SPELL_CHARGING_LOOP
}
local u47 = {
    ["UPGRADE_1"] = v39.SORCERER_ICE_CHARGE_UPGRADE_1,
    ["UPGRADE_2"] = v39.SORCERER_ICE_CHARGE_UPGRADE_2,
    ["UPGRADE_3"] = v39.SORCERER_ICE_CHARGE_UPGRADE_3,
    ["SHOT"] = v39.SORCERER_ICE_PROJECTILE_SHOT,
    ["HIT"] = v39.SORCERER_ICE_PROJECTILE_HIT,
    ["CHARGE_LOOP"] = v39.SORCERER_ICE_CHARGE_LOOP
}
local v48 = v13.values(u30.getSorcererMeta())
local u49 = {}
for v50 = 1, #v48 do
    local v51 = v48[v50]
    local _ = v50 - 1
    u49[v51.abilityId] = true
end
local u52 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 82 ]]
        return "HalloweenDeathAdarController"
    end,
    ["__index"] = u24
})
u52.__index = u52
function u52.new(...) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u52
    --]]
    local v53 = u52
    local v54 = setmetatable({}, v53)
    return v54:constructor(...) or v54
end
function u52.constructor(p55) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u33
        [3] = u14
    --]]
    u24.constructor(p55, { u33.HALLOWEEN_2025_EVENT_PVE })
    p55.Name = "HalloweenDeathAdarController"
    p55.spellEffectMaidMap = {}
    p55.kitMaid = u14.new()
    p55.chargeMaid = u14.new()
    p55.currentSpellLevel = 1
    p55.progressTierBarMaid = u14.new()
    p55.spellAbilityMaid = u14.new()
    p55.inited = false
end
function u52.KnitStart(p56) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    u24.KnitStart(p56)
end
function u52.onGameInit(u57) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u36
        [3] = u23
        [4] = u19
        [5] = u49
        [6] = u2
        [7] = u25
        [8] = u26
        [9] = u4
        [10] = u22
        [11] = u21
        [12] = u30
        [13] = u31
        [14] = u16
        [15] = u42
        [16] = u11
        [17] = u5
        [18] = u28
        [19] = u27
    --]]
    u38.Client:Get("HalloweenSetKit"):Connect(function(p58) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u36
        --]]
        if not u57.inited then
            if p58.kit == u36.SORCERER then
                u57:initKit()
            end
            u57.inited = true
        end
    end)
    u23.AbilityUsed:connect(function(p59) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u49
            [3] = u57
            [4] = u2
            [5] = u25
            [6] = u26
            [7] = u4
            [8] = u22
            [9] = u21
            [10] = u30
            [11] = u31
            [12] = u16
            [13] = u42
            [14] = u38
            [15] = u11
            [16] = u23
            [17] = u5
            [18] = u28
            [19] = u27
        --]]
        local v60 = u19:GetPlayerFromCharacter(p59.userCharacter)
        if v60 then
            if u49[p59.ability] == nil then
                if p59.ability == u25.SORCERER_PROJECTILE_FIRE or p59.ability == u25.SORCERER_PROJECTILE_CANCEL then
                    u57:endSpellCastEffects(v60)
                    if p59.userCharacter ~= u19.LocalPlayer.Character then
                        return nil
                    end
                    u57.chargeMaid:DoCleaning()
                    local v61 = u57.targetingAnimationTrack
                    if v61 ~= nil then
                        v61:Stop()
                    end
                end
            else
                u57:playSpellCastEffects(v60)
                if p59.userCharacter ~= u19.LocalPlayer.Character then
                    return nil
                end
                u57:createAimLine()
                if u57.abilityRef ~= nil then
                    u57.abilityRef.Destroy()
                end
                local v62 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v63 = u25.SORCERER_PROJECTILE_FIRE
                local v64 = {}
                for v65, v66 in u26[u25.SORCERER_PROJECTILE_FIRE].triggerConfig do
                    v64[v65] = v66
                end
                function v64.getExtraData() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                    --]]
                    return {
                        ["direction"] = u57:getProjectileDirection()
                    }
                end
                v62:enableAbility(v63, v64):andThen(function(p67) --[[ Line: 143 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                    --]]
                    u57.abilityRef = p67
                    u57.chargeMaid:GiveTask(p67)
                end)
                local v68 = u57.chargeMaid
                local v69 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v70 = u25.SORCERER_PROJECTILE_CANCEL
                local v71 = {}
                for v72, v73 in u26[u25.SORCERER_PROJECTILE_CANCEL].triggerConfig do
                    v71[v72] = v73
                end
                function v71.getExtraData() --[[ Line: 155 ]] end
                v68:GiveTask(v69:enableAbility(v70, v71):expect())
                local v74 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u25.SORCERER_PROJECTILE_FIRE)
                if v74 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v74, u4.DISABLED)
                end
                local u75 = u22:GetServerTimeNow()
                local u77 = u21.Heartbeat:Connect(function() --[[ Line: 162 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u75
                        [3] = u30
                        [4] = u31
                        [5] = u2
                        [6] = u25
                        [7] = u4
                    --]]
                    local v76 = u22:GetServerTimeNow() - u75 > u30.getSorcererTierData(u31.TIER_1).secCharge and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u25.SORCERER_PROJECTILE_FIRE)
                    if v76 then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v76, u4.READY)
                    end
                end)
                u57.chargeMaid:GiveTask(function() --[[ Line: 171 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                        [2] = u77
                    --]]
                    if u57.abilityRef ~= nil then
                        u57.abilityRef.Destroy()
                    end
                    u77:Disconnect()
                    u57:syncExplosiveAbility()
                end)
                u57.chargeMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(u42, {
                    ["maxTier"] = u30.getSorcererTier(u19.LocalPlayer)
                })))
                u38.Client:Get("SorcererSpellChargeStarted"):SendToServer()
                u57.chargeMaid:GiveTask(u11.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = u30.SPELL_CHARGE_MOVE_SPEED_MODIFIER
                }))
                u11.Controllers.SwordController:toggleSwordSwing(true)
                u11.Controllers.BlockPlacementController:disableBlockPlacer()
                local u79 = u23.BeginProjectileTargeting:connect(function(p78) --[[ Line: 187 ]]
                    p78:setCancelled(true)
                    return nil
                end)
                u57.chargeMaid:GiveTask(function() --[[ Line: 191 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u79
                    --]]
                    u11.Controllers.SwordController:toggleSwordSwing(false)
                    u11.Controllers.BlockPlacementController:enableBlockPlacer()
                    u79:Destroy()
                end)
                u57.targetingAnimationTrack = u5:playAnimation(v60.Character.Humanoid.Animator, u28:getAssetId(u27.SORCERER_SPELL_CHARGE), {
                    ["looped"] = true
                })
                u57.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4
            end
        else
            return nil
        end
    end)
end
function u52.initKit(u80) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u43
        [4] = u19
        [5] = u11
        [6] = u9
        [7] = u18
        [8] = u38
        [9] = u37
        [10] = u36
        [11] = u23
        [12] = u44
        [13] = u47
        [14] = u46
        [15] = u8
        [16] = u20
        [17] = u22
        [18] = u40
        [19] = u5
        [20] = u28
        [21] = u27
    --]]
    local v81 = u14.new()
    local u82 = u16.mount(u16.createElement(u43), u19.LocalPlayer:WaitForChild("PlayerGui"))
    v81:GiveTask(function() --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u82
        --]]
        u16.unmount(u82)
    end)
    u11.Controllers.HalloweenAbilityDeathAdderTreeController:enableHalloweenAbility()
    v81:GiveTask(u9("alchemy_crystal", function(p83) --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u80
        --]]
        u80:recolorCrystal(p83)
    end))
    for v84, v85 in u18:GetTagged("alchemy_crystal") do
        local _ = v84 - 1
        u80:recolorCrystal(v85)
    end
    v81:GiveTask(u38.Client:Get("EntityDeathEvent"):Connect(function(p86) --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u37
            [3] = u36
            [4] = u80
        --]]
        local v87 = u19:GetPlayerFromCharacter(p86.entityInstance)
        if not v87 then
            return nil
        end
        if not u37:isHalloweenKit(v87, u36.SORCERER) then
            return nil
        end
        u80:endSpellCastEffects(v87)
        if v87 == u19.LocalPlayer then
            u80.chargeMaid:DoCleaning()
        end
    end))
    v81:GiveTask(u23.ExplosionEffect:connect(function(p88) --[[ Line: 273 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u47
            [3] = u46
            [4] = u8
            [5] = u20
            [6] = u22
            [7] = u40
        --]]
        local v89 = p88.explosionType
        if table.find(u44, v89) == nil then
            return nil
        end
        local v90 = p88.extraData == "sorcererIceExplosion"
        local v91
        if v90 then
            v91 = u47.HIT
        else
            v91 = u46.HIT
        end
        u8:playSound(v91, {
            ["rollOffMaxDistance"] = 250,
            ["position"] = p88.position
        })
        local v92
        if v90 then
            v92 = u20.Assets.Effects.IceSorcererExplosion:Clone()
        else
            v92 = u20.Assets.Effects.SorcererExplosion:Clone()
        end
        v92.Parent = u22
        v92.CFrame = CFrame.new(p88.position)
        u40:playEffects({ v92 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end))
    v81:GiveTask(u38.Client:Get("PlaySorcererSpellEffects"):Connect(function(p93) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u80
        --]]
        u80:playSpellCastEffects(p93.sorcerer)
    end))
    v81:GiveTask(u38.Client:Get("EndSorcererSpellEffects"):Connect(function(p94) --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u8
            [3] = u19
            [4] = u22
            [5] = u5
            [6] = u28
            [7] = u27
        --]]
        u80:endSpellCastEffects(p94.sorcerer)
        if not p94.projectileFired then
            return nil
        end
        local v95 = p94.sorcerer.Character
        if v95 ~= nil then
            v95 = v95:GetPivot().Position
        end
        if v95 then
            u8:playSound(u80:getSounds(p94.sorcerer).SHOT, {
                ["position"] = v95
            })
        end
        if p94.sorcerer ~= u19.LocalPlayer then
            return nil
        end
        u80.chargeMaid:DoCleaning()
        local v96 = u22.CurrentCamera
        if v96 ~= nil then
            v96 = v96.CFrame.LookVector
        end
        local v97 = u19.LocalPlayer.Character
        if v97 ~= nil then
            v97 = v97:GetPivot()
        end
        if v96 and v97 then
            local v98 = v97.Position
            local v99 = v97.Position
            local v100 = v96 * 10
            local v101 = CFrame.new(v98, v99 + v100)
            local v102 = u19.LocalPlayer.Character
            if v102 ~= nil then
                v102:PivotTo(v101)
            end
        end
        u5:playAnimation(p94.sorcerer.Character.Humanoid.Animator, u28:getAssetId(u27.COMET_VOLLEY_COMET_FIRED), {
            ["looped"] = false
        })
        local v103 = u80.targetingAnimationTrack
        if v103 ~= nil then
            v103:Stop()
        end
    end))
end
function u52.playSpellCastEffects(p104, p105) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u34
        [3] = u20
        [4] = u22
        [5] = u15
        [6] = u14
        [7] = u8
        [8] = u19
        [9] = u18
        [10] = u30
        [11] = u31
        [12] = u11
        [13] = u21
    --]]
    local v106 = p105.Character
    if not v106 then
        return nil
    end
    local v107 = p105.Character
    if v107 ~= nil then
        v107 = v107:GetPivot().LookVector.Unit
    end
    if not v107 then
        return nil
    end
    local v108 = p105.Character
    if v108 ~= nil then
        v108 = v108:GetPivot().Position
    end
    if not v108 then
        return nil
    end
    local v109 = v107 * 3
    local v110 = CFrame.new(v108 + v109, v108 + v107)
    local v111
    if u12.Controllers.KitController:getKitSkin(v106) == u34.SORCERER_ICE_QUEEN then
        v111 = u20.Assets.Effects.IceSorcererSpellCast:Clone()
    else
        v111 = u20.Assets.Effects.SorcererSpellCast:Clone()
    end
    v111.Parent = u22
    v111.CFrame = v110
    u15("WeldConstraint", {
        ["Part0"] = v106.PrimaryPart,
        ["Part1"] = v111,
        ["Parent"] = v111
    })
    local v112 = p104.spellEffectMaidMap[p105] or u14.new()
    v112:GiveTask(v111)
    p104.spellEffectMaidMap[p105] = v112
    local v113 = u8
    local v114 = p104:getSounds(p105).CHARGE_LOOP
    local v115 = {}
    local v116 = p105.Character
    if v116 ~= nil then
        v116 = v116.PrimaryPart
    end
    v115.parent = v116
    v115.position = v108
    v115.looped = true
    v112:GiveTask(v113:playSound(v114, v115))
    local u117 = v111.ChargeUpParticles.Specs
    local u118 = v111.ChargeUpParticles.EnergyPull1
    local u119 = v111.ChargeUpParticles.EnergyPull2
    local u120 = v111.MagicCircle1.MagicCircle
    local u121 = v111.MagicCircle2.MagicCircle
    local u122 = v111.MagicCircle3.MagicCircle
    if p105 == u19.LocalPlayer then
        u18:AddTag(u117, "FirstPersonHidden")
        u18:AddTag(u118, "FirstPersonHidden")
        u18:AddTag(u119, "FirstPersonHidden")
        u18:AddTag(u120, "FirstPersonHidden")
        u18:AddTag(u121, "FirstPersonHidden")
        u18:AddTag(u122, "FirstPersonHidden")
    end
    local v123 = u8
    local v124 = p104:getSounds(p105).UPGRADE_1
    local v125 = {}
    local v126 = p105.Character
    if v126 ~= nil then
        v126 = v126.PrimaryPart
    end
    v125.parent = v126
    v125.position = v108
    local u127 = v123:playModifiableSound(v124, v125)
    u127:Pause()
    v112:GiveTask(u127)
    local u128 = u22:GetServerTimeNow()
    local v129 = p105:GetAttribute("CrystalsCollected")
    local _ = (v129 == 0 or (v129 ~= v129 or not v129)) and 0 or v129
    local u130 = true
    local u131 = false
    local u132 = false
    local u133 = 3.5
    local v134 = u30.getSorcererTier(u19.LocalPlayer)
    local u135 = u30.getSorcererTierData(v134)
    if v134 == u31.TIER_5 then
        u122.Lifetime = NumberRange.new(120)
        u122.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u132 = true
        u131 = true
    elseif v134 == u31.TIER_4 or v134 == u31.TIER_3 then
        u121.Lifetime = NumberRange.new(120)
        u121.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u131 = true
        u133 = 2.5
    else
        u120.Lifetime = NumberRange.new(120)
        u120.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u133 = 1.5
    end
    local u136 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
    v112:GiveTask((u21.Heartbeat:Connect(function() --[[ Line: 457 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u128
            [3] = u135
            [4] = u130
            [5] = u136
            [6] = u11
            [7] = u120
            [8] = u117
            [9] = u118
            [10] = u119
            [11] = u127
            [12] = u131
            [13] = u121
            [14] = u132
            [15] = u122
            [16] = u133
        --]]
        local v137 = u22:GetServerTimeNow() - u128
        if u135.secCharge < v137 and u130 then
            u136 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u136 == 1 then
                u120:Emit(1)
            end
            u130 = false
            local v138 = u117
            v138.Rate = v138.Rate + 10
            local v139 = u118
            v139.Rate = v139.Rate + 5
            local v140 = u119
            v140.Rate = v140.Rate + 5
            u127:Play()
        end
        if u135.secCharge < v137 and u131 then
            u136 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u136 == 1 then
                u121:Emit(1)
            end
            u131 = false
            local v141 = u117
            v141.Rate = v141.Rate + 20
            local v142 = u118
            v142.Rate = v142.Rate + 5
            local v143 = u119
            v143.Rate = v143.Rate + 5
        end
        if u135.secCharge < v137 and u132 then
            u136 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u136 == 1 then
                u122:Emit(1)
            end
            u132 = false
            local v144 = u117
            v144.Rate = v144.Rate + 20
            local v145 = u118
            v145.Rate = v145.Rate + 5
            local v146 = u119
            v146.Rate = v146.Rate + 5
        end
        if u133 < v137 then
            u127:Pause()
        end
    end)))
end
function u52.endSpellCastEffects(p147, p148) --[[ Line: 498 ]]
    local v149 = p147.spellEffectMaidMap[p148]
    if v149 ~= nil then
        v149:DoCleaning()
    end
end
function u52.syncExplosiveAbility(u150) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u19
        [3] = u2
    --]]
    local v151 = u30.getSorcererTier(u19.LocalPlayer)
    local v152 = u30.getSorcererTierData(v151)
    if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v152.abilityId) then
        return false
    end
    u150.spellAbilityMaid:DoCleaning()
    local v153 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v154 = v152.abilityId
    local v155 = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v152.abilityIcon
        },
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 520 ]]
            --[[
            Upvalues:
                [1] = u150
            --]]
            return {
                ["direction"] = u150:getProjectileDirection()
            }
        end
    }
    v153:enableAbility(v154, v155):andThen(function(p156) --[[ Line: 526 ]]
        --[[
        Upvalues:
            [1] = u150
        --]]
        u150.kitMaid:GiveTask(p156)
        u150.abilityRef = p156
        u150.spellAbilityMaid:GiveTask(p156)
    end)
    return true
end
function u52.getProjectileDirection(_) --[[ Line: 536 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u11
    --]]
    local v157 = u22.CurrentCamera.CFrame.LookVector
    if u11.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        local v158 = v157.X
        local v159 = v157.Y + 0.3
        local v160 = v157.Z
        v157 = Vector3.new(v158, v159, v160)
    end
    return v157
end
function u52.createAimLine(u161) --[[ Line: 544 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
        [3] = u15
        [4] = u20
        [5] = u7
        [6] = u6
        [7] = u18
        [8] = u21
        [9] = u30
        [10] = u31
    --]]
    local v162 = u19.LocalPlayer.Character
    if v162 ~= nil then
        v162 = v162.PrimaryPart
    end
    if not v162 then
        return nil
    end
    u161.aimLineOrigin = u15("Part", {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u22
    })
    local u163 = u20.Assets.Effects.SorcererHitIndicator:Clone()
    u163.Parent = u22
    u161.aimLineEnd = u163
    u161.aimLineOrigin:PivotTo(u19.LocalPlayer.Character:GetPivot())
    local v164 = u15("WeldConstraint", {
        ["Part0"] = u161.aimLineOrigin,
        ["Part1"] = u19.LocalPlayer.Character.PrimaryPart,
        ["Parent"] = u19.LocalPlayer.Character
    })
    u161.chargeMaid:GiveTask(v164)
    u7:setQueryIgnored(u161.aimLineOrigin, true)
    u7:setQueryIgnored(u161.aimLineEnd, true)
    local v165 = u15("Attachment", {
        ["Parent"] = u161.aimLineOrigin
    })
    local v166 = u15("Attachment", {
        ["Parent"] = u161.aimLineEnd
    })
    local u167 = u6.isMobileControls() and 3 or 1
    local u168 = u15("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v165,
        ["Attachment1"] = v166,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = u167 * 0.08,
        ["Width1"] = u167 * 0.08,
        ["Parent"] = u22
    })
    u18:AddTag(u168, "projectile-preview-beam")
    u161.chargeMaid:GiveTask(u168)
    local u169 = 0
    local u170 = u22:GetServerTimeNow()
    local v191 = u21.Heartbeat:Connect(function() --[[ Line: 594 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u170
            [3] = u30
            [4] = u19
            [5] = u169
            [6] = u31
            [7] = u161
            [8] = u18
            [9] = u168
            [10] = u167
            [11] = u163
        --]]
        local v171 = u22:GetServerTimeNow() - u170
        local v172 = u30.getSorcererTier(u19.LocalPlayer)
        local v173 = u30.getSorcererTierData(v172)
        u169 = v173.projectileVelocity * v173.projectileLifetime
        if v171 < u30.getSorcererTierData(u31.TIER_2).secCharge then
            local v174 = u30.getSorcererTierData(u31.TIER_1)
            u169 = v174.projectileVelocity * v174.projectileLifetime
        elseif v171 < u30.getSorcererTierData(u31.TIER_3).secCharge and u161.currentSpellLevel > 1 then
            local v175 = u30.getSorcererTierData(u31.TIER_2)
            u169 = v175.projectileVelocity * v175.projectileLifetime
        elseif v171 < u30.getSorcererTierData(u31.TIER_4).secCharge and u161.currentSpellLevel > 2 then
            local v176 = u30.getSorcererTierData(u31.TIER_3)
            u169 = v176.projectileVelocity * v176.projectileLifetime
        elseif v171 < u30.getSorcererTierData(u31.TIER_5).secCharge and u161.currentSpellLevel > 3 then
            local v177 = u30.getSorcererTierData(u31.TIER_4)
            u169 = v177.projectileVelocity * v177.projectileLifetime
        elseif u161.currentSpellLevel > 4 then
            local v178 = u30.getSorcererTierData(u31.TIER_5)
            u169 = v178.projectileVelocity * v178.projectileLifetime
        end
        local v179 = u22.CurrentCamera
        if v179 ~= nil then
            v179 = v179.CFrame
        end
        if v179 then
            local v180 = u161.aimLineOrigin
            if v180 ~= nil then
                v180 = v180.Position
            end
            if v180 then
                if u161.aimLineEnd then
                    local v181 = u19.LocalPlayer.Character
                    if v181 ~= nil then
                        v181 = v181:GetPivot().Position
                    end
                    if v181 then
                        local v182 = u161:getProjectileDirection()
                        local v183 = RaycastParams.new()
                        local v184 = {}
                        local v185 = #v184
                        local v186 = u18:GetTagged("DontBlockAbilityRaycast")
                        table.move(v186, 1, #v186, v185 + 1, v184)
                        v183.FilterDescendantsInstances = v184
                        v183.FilterType = Enum.RaycastFilterType.Exclude
                        local v187 = u22:Raycast(v181 + v182 * 5, v182 * u169, v183)
                        if v187 then
                            local v188 = u161.aimLineEnd
                            if v188 ~= nil then
                                v188:PivotTo(CFrame.new(v187.Position))
                            end
                            u168.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247))
                            u168.Width0 = u167 * 0.1
                            u168.Width1 = u167 * 0.1
                            u168.Transparency = NumberSequence.new(0)
                            u161.aimLineEnd.Color = Color3.new(1, 0.03, 0.9)
                            u161.aimLineEnd.Transparency = 0
                            u163.Attachment.ParticleEmitter.Enabled = true
                        else
                            local v189 = u161.aimLineOrigin.Position + v182 * u169
                            local v190 = u161.aimLineEnd
                            if v190 ~= nil then
                                v190:PivotTo(CFrame.new(v189))
                            end
                            u168.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255))
                            u168.Transparency = NumberSequence.new(0.3)
                            u168.Width0 = u167 * 0.08
                            u168.Width1 = u167 * 0.08
                            u161.aimLineEnd.Color = Color3.new(1, 0.95, 1)
                            u161.aimLineEnd.Transparency = 0.8
                            u163.Attachment.ParticleEmitter.Enabled = false
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
    u161.chargeMaid:GiveTask(v191)
end
function u52.getSounds(_, p192) --[[ Line: 688 ]]
    --[[
    Upvalues:
        [1] = u46
        [2] = u11
        [3] = u34
        [4] = u47
    --]]
    if p192.Character then
        if u11.Controllers.KitController:getKitSkin(p192.Character) == u34.SORCERER_ICE_QUEEN then
            return u47
        else
            return u46
        end
    else
        return u46
    end
end
function u52.recolorCrystal(_, p193) --[[ Line: 698 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u41
        [3] = u35
        [4] = u12
        [5] = u34
        [6] = u45
    --]]
    if not u19.LocalPlayer.Character then
        return nil
    end
    if not u41(u19.LocalPlayer, u35.SORCERER) then
        return nil
    end
    if u12.Controllers.KitController:getKitSkin(u19.LocalPlayer.Character) == u34.SORCERER_ICE_QUEEN then
        for v194, v195 in p193:GetDescendants() do
            local _ = v194 - 1
            if v195:IsA("MeshPart") then
                v195.Color = u45
            elseif v195:IsA("PointLight") then
                v195.Color = u45
            end
        end
    end
end
u11.CreateController(u52.new())
return nil