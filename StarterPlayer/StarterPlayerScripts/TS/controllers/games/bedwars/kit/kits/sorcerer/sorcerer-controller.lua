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
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local u29 = v28.SorcererBalance
local u30 = v28.SorcererTier
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u38 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u39 = v1.import(script, script.Parent, "ui", "spell-charge-progress").SpellChargeComponent
local u40 = v1.import(script, script.Parent, "ui", "spell-tracker").SorcererKit
local u41 = { v31.SORCERER_EXPLOSION_1, v31.SORCERER_EXPLOSION_2, v31.SORCERER_EXPLOSION_3 }
local u42 = Color3.fromRGB(89, 149, 182)
local u43 = {
    ["UPGRADE_1"] = v35.SORCERER_SPELL_UPGRADES,
    ["UPGRADE_2"] = v35.SORCERER_SPELL_UPGRADES,
    ["UPGRADE_3"] = v35.SORCERER_SPELL_UPGRADES,
    ["SHOT"] = v35.SORCERER_PROJECTILE_SHOOT,
    ["HIT"] = v35.SORCERER_PROJECTILE_HIT,
    ["CHARGE_LOOP"] = v35.SORCERER_SPELL_CHARGING_LOOP
}
local u44 = {
    ["UPGRADE_1"] = v35.SORCERER_ICE_CHARGE_UPGRADE_1,
    ["UPGRADE_2"] = v35.SORCERER_ICE_CHARGE_UPGRADE_2,
    ["UPGRADE_3"] = v35.SORCERER_ICE_CHARGE_UPGRADE_3,
    ["SHOT"] = v35.SORCERER_ICE_PROJECTILE_SHOT,
    ["HIT"] = v35.SORCERER_ICE_PROJECTILE_HIT,
    ["CHARGE_LOOP"] = v35.SORCERER_ICE_CHARGE_LOOP
}
local v45 = v13.values(u29.getSorcererMeta())
local u46 = {}
for v47 = 1, #v45 do
    local v48 = v45[v47]
    local _ = v47 - 1
    u46[v48.abilityId] = true
end
local u49 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 79 ]]
        return "SorcererController"
    end,
    ["__index"] = u38
})
u49.__index = u49
function u49.new(...) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u49
    --]]
    local v50 = u49
    local v51 = setmetatable({}, v50)
    return v51:constructor(...) or v51
end
function u49.constructor(p52) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u33
        [3] = u14
    --]]
    u38.constructor(p52, u33.SORCERER)
    p52.Name = "SorcererController"
    p52.spellEffectMaidMap = {}
    p52.kitMaid = u14.new()
    p52.chargeMaid = u14.new()
    p52.currentSpellLevel = 1
    p52.progressTierBarMaid = u14.new()
    p52.spellAbilityMaid = u14.new()
end
function u49.KnitStart(p53) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    u38.KnitStart(p53)
end
function u49.onKitLocalActivated(u54, u55) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u40
        [3] = u19
        [4] = u2
        [5] = u24
        [6] = u25
        [7] = u4
        [8] = u9
        [9] = u18
        [10] = u29
        [11] = u34
        [12] = u37
        [13] = u33
        [14] = u23
        [15] = u41
        [16] = u44
        [17] = u43
        [18] = u8
        [19] = u20
        [20] = u22
        [21] = u36
        [22] = u5
        [23] = u27
        [24] = u26
    --]]
    local u56 = u16.mount(u16.createElement(u40), u19.LocalPlayer:WaitForChild("PlayerGui"))
    u55:GiveTask(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u56
        --]]
        u16.unmount(u56)
    end)
    local v57 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v58 = u24.SORCERER_EXPLOSION_TIER_1
    local v59 = {}
    for v60, v61 in u25[u24.SORCERER_EXPLOSION_TIER_1].triggerConfig do
        v59[v60] = v61
    end
    function v59.getExtraData() --[[ Line: 114 ]] end
    v57:enableAbility(v58, v59):andThen(function(p62) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u55
        --]]
        u54.abilityRef = p62
        u54.spellAbilityMaid:GiveTask(p62)
        u55:GiveTask(u54.abilityRef)
    end)
    u54.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u24.SORCERER_EXPLOSION_TIER_1)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u54.enabledAbility, u4.DISABLED)
    u55:GiveTask(u9("alchemy_crystal", function(p63) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        u54:recolorCrystal(p63)
    end))
    for v64, v65 in u18:GetTagged("alchemy_crystal") do
        local _ = v64 - 1
        u54:recolorCrystal(v65)
    end
    u55:GiveTask(u19.LocalPlayer:GetAttributeChangedSignal("SpellCharges"):Connect(function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u2
            [3] = u24
        --]]
        u54:syncAbilityEnabled()
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u24.SORCERER_PROJECTILE_CANCEL)
    end))
    u55:GiveTask(u19.LocalPlayer:GetAttributeChangedSignal("CrystalsCollected"):Connect(function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u29
            [3] = u54
        --]]
        local v66 = u19.LocalPlayer:GetAttribute("CrystalsCollected")
        if v66 == 0 or (v66 ~= v66 or not v66) then
            return nil
        end
        local v67 = u29.getSorcererTier(u19.LocalPlayer)
        local v68 = u29.getSorcererTierData(v67)
        if u54.currentSpellLevel ~= v67 then
            u54.currentSpellLevel = v67
            u54.progressTierBarMaid:DoCleaning()
            local v69 = u54.enabledAbility
            if v69 ~= nil then
                v69 = v69.abilityId
            end
            if v69 ~= v68.abilityId then
                u54:syncExplosiveAbility()
            end
        end
    end))
    u55:GiveTask(u34.Client:Get("EntityDeathEvent"):Connect(function(p70) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u37
            [3] = u33
            [4] = u54
        --]]
        local v71 = u19:GetPlayerFromCharacter(p70.entityInstance)
        if not v71 then
            return nil
        end
        if not u37(v71, u33.SORCERER) then
            return nil
        end
        u54:endSpellCastEffects(v71)
        if v71 == u19.LocalPlayer then
            u54.chargeMaid:DoCleaning()
        end
    end))
    u55:GiveTask(u23.ExplosionEffect:connect(function(p72) --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u44
            [3] = u43
            [4] = u8
            [5] = u20
            [6] = u22
            [7] = u36
        --]]
        local v73 = p72.explosionType
        if table.find(u41, v73) == nil then
            return nil
        end
        local v74 = p72.extraData == "sorcererIceExplosion"
        local v75
        if v74 then
            v75 = u44.HIT
        else
            v75 = u43.HIT
        end
        u8:playSound(v75, {
            ["rollOffMaxDistance"] = 250,
            ["position"] = p72.position
        })
        local v76
        if v74 then
            v76 = u20.Assets.Effects.IceSorcererExplosion:Clone()
        else
            v76 = u20.Assets.Effects.SorcererExplosion:Clone()
        end
        v76.Parent = u22
        v76.CFrame = CFrame.new(p72.position)
        u36:playEffects({ v76 }, nil, {
            ["destroyAfterSec"] = 3
        })
    end))
    u55:GiveTask(u34.Client:Get("PlaySorcererSpellEffects"):Connect(function(p77) --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        u54:playSpellCastEffects(p77.sorcerer)
    end))
    u55:GiveTask(u34.Client:Get("EndSorcererSpellEffects"):Connect(function(p78) --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u54
            [2] = u8
            [3] = u19
            [4] = u22
            [5] = u5
            [6] = u27
            [7] = u26
        --]]
        u54:endSpellCastEffects(p78.sorcerer)
        if not p78.projectileFired then
            return nil
        end
        local v79 = p78.sorcerer.Character
        if v79 ~= nil then
            v79 = v79:GetPivot().Position
        end
        if v79 then
            u8:playSound(u54:getSounds(p78.sorcerer).SHOT, {
                ["position"] = v79
            })
        end
        if p78.sorcerer ~= u19.LocalPlayer then
            return nil
        end
        u54.chargeMaid:DoCleaning()
        local v80 = u22.CurrentCamera
        if v80 ~= nil then
            v80 = v80.CFrame.LookVector
        end
        local v81 = u19.LocalPlayer.Character
        if v81 ~= nil then
            v81 = v81:GetPivot()
        end
        if v80 and v81 then
            local v82 = v81.Position
            local v83 = v81.Position
            local v84 = v80 * 10
            local v85 = CFrame.new(v82, v83 + v84)
            local v86 = u19.LocalPlayer.Character
            if v86 ~= nil then
                v86:PivotTo(v85)
            end
        end
        u5:playAnimation(p78.sorcerer.Character.Humanoid.Animator, u27:getAssetId(u26.COMET_VOLLEY_COMET_FIRED), {
            ["looped"] = false
        })
        local v87 = u54.targetingAnimationTrack
        if v87 ~= nil then
            v87:Stop()
        end
    end))
end
function u49.onKitLocalDeactivated(_) --[[ Line: 242 ]] end
function u49.onKitReplicationActivated(_, _) --[[ Line: 244 ]] end
function u49.onKitReplicationDeactivated(_) --[[ Line: 246 ]] end
function u49.onInnateAbilityEnabled(_, _, _) --[[ Line: 248 ]] end
function u49.onAbilityUsed(u88, _, p89) --[[ Line: 250 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u37
        [3] = u33
        [4] = u46
        [5] = u2
        [6] = u24
        [7] = u25
        [8] = u4
        [9] = u22
        [10] = u29
        [11] = u30
        [12] = u23
        [13] = u21
        [14] = u16
        [15] = u39
        [16] = u34
        [17] = u11
        [18] = u5
        [19] = u27
        [20] = u26
    --]]
    local v90 = u19:GetPlayerFromCharacter(p89.userCharacter)
    if v90 then
        if u37(v90, u33.SORCERER) then
            if u46[p89.ability] == nil then
                if p89.ability == u24.SORCERER_PROJECTILE_FIRE or p89.ability == u24.SORCERER_PROJECTILE_CANCEL then
                    u88:endSpellCastEffects(v90)
                    if p89.userCharacter ~= u19.LocalPlayer.Character then
                        return nil
                    end
                    u88.chargeMaid:DoCleaning()
                    local v91 = u88.targetingAnimationTrack
                    if v91 ~= nil then
                        v91:Stop()
                    end
                end
            else
                u88:playSpellCastEffects(v90)
                if p89.userCharacter ~= u19.LocalPlayer.Character then
                    return nil
                end
                u88:createAimLine()
                if u88.abilityRef ~= nil then
                    u88.abilityRef.Destroy()
                end
                local v92 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v93 = u24.SORCERER_PROJECTILE_FIRE
                local v94 = {}
                for v95, v96 in u25[u24.SORCERER_PROJECTILE_FIRE].triggerConfig do
                    v94[v95] = v96
                end
                function v94.getExtraData() --[[ Line: 274 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                    --]]
                    return {
                        ["direction"] = u88:getProjectileDirection()
                    }
                end
                v92:enableAbility(v93, v94):andThen(function(p97) --[[ Line: 280 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                    --]]
                    u88.abilityRef = p97
                    u88.chargeMaid:GiveTask(p97)
                end)
                local v98 = u88.chargeMaid
                local v99 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v100 = u24.SORCERER_PROJECTILE_CANCEL
                local v101 = {}
                for v102, v103 in u25[u24.SORCERER_PROJECTILE_CANCEL].triggerConfig do
                    v101[v102] = v103
                end
                function v101.getExtraData() --[[ Line: 292 ]] end
                v98:GiveTask(v99:enableAbility(v100, v101):expect())
                local v104 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u24.SORCERER_PROJECTILE_FIRE)
                if v104 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v104, u4.DISABLED)
                end
                local u105 = u22:GetServerTimeNow()
                local v106 = u29.getSorcererTierData(u30.TIER_1).secCharge
                local u107 = u23.CastTimeModifierCheck:fire(v106).castTime
                local u109 = u21.Heartbeat:Connect(function() --[[ Line: 301 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u105
                        [3] = u107
                        [4] = u2
                        [5] = u24
                        [6] = u4
                    --]]
                    local v108 = u107 < u22:GetServerTimeNow() - u105 and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u24.SORCERER_PROJECTILE_FIRE)
                    if v108 then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v108, u4.READY)
                    end
                end)
                u88.chargeMaid:GiveTask(function() --[[ Line: 310 ]]
                    --[[
                    Upvalues:
                        [1] = u88
                        [2] = u109
                    --]]
                    if u88.abilityRef ~= nil then
                        u88.abilityRef.Destroy()
                    end
                    u109:Disconnect()
                    u88:syncExplosiveAbility()
                end)
                u88.chargeMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(u39, {
                    ["maxTier"] = u29.getSorcererTier(u19.LocalPlayer)
                })))
                u34.Client:Get("SorcererSpellChargeStarted"):SendToServer()
                u88.chargeMaid:GiveTask(u11.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = u29.SPELL_CHARGE_MOVE_SPEED_MODIFIER
                }))
                u11.Controllers.SwordController:toggleSwordSwing(true)
                u11.Controllers.BlockPlacementController:disableBlockPlacer()
                local u111 = u23.BeginProjectileTargeting:connect(function(p110) --[[ Line: 326 ]]
                    p110:setCancelled(true)
                    return nil
                end)
                u88.chargeMaid:GiveTask(function() --[[ Line: 330 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u111
                    --]]
                    u11.Controllers.SwordController:toggleSwordSwing(false)
                    u11.Controllers.BlockPlacementController:enableBlockPlacer()
                    u111:Destroy()
                end)
                u88.targetingAnimationTrack = u5:playAnimation(v90.Character.Humanoid.Animator, u27:getAssetId(u26.SORCERER_SPELL_CHARGE), {
                    ["looped"] = true
                })
                u88.targetingAnimationTrack.Priority = Enum.AnimationPriority.Action4
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u49.playSpellCastEffects(p112, p113) --[[ Line: 353 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u32
        [3] = u20
        [4] = u22
        [5] = u15
        [6] = u14
        [7] = u8
        [8] = u19
        [9] = u18
        [10] = u29
        [11] = u23
        [12] = u30
        [13] = u11
        [14] = u21
    --]]
    local v114 = p113.Character
    if not v114 then
        return nil
    end
    local v115 = p113.Character
    if v115 ~= nil then
        v115 = v115:GetPivot().LookVector.Unit
    end
    if not v115 then
        return nil
    end
    local v116 = p113.Character
    if v116 ~= nil then
        v116 = v116:GetPivot().Position
    end
    if not v116 then
        return nil
    end
    local v117 = v115 * 3
    local v118 = CFrame.new(v116 + v117, v116 + v115)
    local v119
    if u12.Controllers.KitController:getKitSkin(v114) == u32.SORCERER_ICE_QUEEN then
        v119 = u20.Assets.Effects.IceSorcererSpellCast:Clone()
    else
        v119 = u20.Assets.Effects.SorcererSpellCast:Clone()
    end
    v119.Parent = u22
    v119.CFrame = v118
    u15("WeldConstraint", {
        ["Part0"] = v114.PrimaryPart,
        ["Part1"] = v119,
        ["Parent"] = v119
    })
    local v120 = p112.spellEffectMaidMap[p113] or u14.new()
    v120:GiveTask(v119)
    p112.spellEffectMaidMap[p113] = v120
    local v121 = u8
    local v122 = p112:getSounds(p113).CHARGE_LOOP
    local v123 = {}
    local v124 = p113.Character
    if v124 ~= nil then
        v124 = v124.PrimaryPart
    end
    v123.parent = v124
    v123.position = v116
    v123.looped = true
    v120:GiveTask(v121:playSound(v122, v123))
    local u125 = v119.ChargeUpParticles.Specs
    local u126 = v119.ChargeUpParticles.EnergyPull1
    local u127 = v119.ChargeUpParticles.EnergyPull2
    local u128 = v119.MagicCircle1.MagicCircle
    local u129 = v119.MagicCircle2.MagicCircle
    local u130 = v119.MagicCircle3.MagicCircle
    if p113 == u19.LocalPlayer then
        u18:AddTag(u125, "FirstPersonHidden")
        u18:AddTag(u126, "FirstPersonHidden")
        u18:AddTag(u127, "FirstPersonHidden")
        u18:AddTag(u128, "FirstPersonHidden")
        u18:AddTag(u129, "FirstPersonHidden")
        u18:AddTag(u130, "FirstPersonHidden")
    end
    local v131 = u8
    local v132 = p112:getSounds(p113).UPGRADE_1
    local v133 = {}
    local v134 = p113.Character
    if v134 ~= nil then
        v134 = v134.PrimaryPart
    end
    v133.parent = v134
    v133.position = v116
    local u135 = v131:playModifiableSound(v132, v133)
    u135:Pause()
    v120:GiveTask(u135)
    local u136 = u22:GetServerTimeNow()
    local v137 = p113:GetAttribute("CrystalsCollected")
    local _ = (v137 == 0 or (v137 ~= v137 or not v137)) and 0 or v137
    local u138 = true
    local u139 = false
    local u140 = false
    local u141 = 3.5
    local v142 = u29.getSorcererTier(u19.LocalPlayer)
    local v143 = u29.getSorcererTierData(v142)
    local u144 = u23.CastTimeModifierCheck:fire(v143.secCharge).castTime
    if v142 == u30.TIER_5 then
        u130.Lifetime = NumberRange.new(120)
        u130.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u140 = true
        u139 = true
    elseif v142 == u30.TIER_4 or v142 == u30.TIER_3 then
        u129.Lifetime = NumberRange.new(120)
        u129.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u141 = 2.5
        u139 = true
    else
        u128.Lifetime = NumberRange.new(120)
        u128.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.0004166666666666667, 0.1, 0), NumberSequenceKeypoint.new(1, 0.1, 0) })
        u141 = 1.5
    end
    local u145 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
    v120:GiveTask((u21.Heartbeat:Connect(function() --[[ Line: 467 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u136
            [3] = u144
            [4] = u138
            [5] = u145
            [6] = u11
            [7] = u128
            [8] = u125
            [9] = u126
            [10] = u127
            [11] = u135
            [12] = u139
            [13] = u129
            [14] = u140
            [15] = u130
            [16] = u141
        --]]
        local v146 = u22:GetServerTimeNow() - u136
        if u144 < v146 and u138 then
            u145 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u145 == 1 then
                u128:Emit(1)
            end
            u138 = false
            local v147 = u125
            v147.Rate = v147.Rate + 10
            local v148 = u126
            v148.Rate = v148.Rate + 5
            local v149 = u127
            v149.Rate = v149.Rate + 5
            u135:Play()
        end
        if u144 < v146 and u139 then
            u145 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u145 == 1 then
                u129:Emit(1)
            end
            u139 = false
            local v150 = u125
            v150.Rate = v150.Rate + 20
            local v151 = u126
            v151.Rate = v151.Rate + 5
            local v152 = u127
            v152.Rate = v152.Rate + 5
        end
        if u144 < v146 and u140 then
            u145 = u11.Controllers.CameraPerspectiveController:getCameraPerspective()
            if u145 == 1 then
                u130:Emit(1)
            end
            u140 = false
            local v153 = u125
            v153.Rate = v153.Rate + 20
            local v154 = u126
            v154.Rate = v154.Rate + 5
            local v155 = u127
            v155.Rate = v155.Rate + 5
        end
        if u141 < v146 then
            u135:Pause()
        end
    end)))
end
function u49.endSpellCastEffects(p156, p157) --[[ Line: 508 ]]
    local v158 = p156.spellEffectMaidMap[p157]
    if v158 ~= nil then
        v158:DoCleaning()
    end
end
function u49.syncAbilityEnabled(p159) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u4
    --]]
    local v160 = u19.LocalPlayer:GetAttribute("SpellCharges")
    local v161 = (v160 == 0 or (v160 ~= v160 or not v160)) and 0 or v160
    if p159.enabledAbility then
        if v161 == 0 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p159.enabledAbility, u4.DISABLED)
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p159.enabledAbility, u4.READY)
        end
    else
        return nil
    end
end
function u49.syncExplosiveAbility(u162) --[[ Line: 532 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u19
        [3] = u2
    --]]
    local v163 = u29.getSorcererTier(u19.LocalPlayer)
    local v164 = u29.getSorcererTierData(v163)
    if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v164.abilityId) then
        return false
    end
    u162.spellAbilityMaid:DoCleaning()
    local v165 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v166 = v164.abilityId
    local v167 = {
        ["abilityType"] = "KitPrimary",
        ["abilityButton"] = {
            ["icon"] = v164.abilityIcon
        },
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 545 ]]
            --[[
            Upvalues:
                [1] = u162
            --]]
            return {
                ["direction"] = u162:getProjectileDirection()
            }
        end
    }
    v165:enableAbility(v166, v167):andThen(function(p168) --[[ Line: 551 ]]
        --[[
        Upvalues:
            [1] = u162
        --]]
        u162.kitMaid:GiveTask(p168)
        u162.abilityRef = p168
        u162.spellAbilityMaid:GiveTask(p168)
    end)
    u162.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(v164.abilityId)
    u162:syncAbilityEnabled()
    return true
end
function u49.getProjectileDirection(_) --[[ Line: 561 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u11
    --]]
    local v169 = u22.CurrentCamera.CFrame.LookVector
    if u11.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        local v170 = v169.X
        local v171 = v169.Y + 0.3
        local v172 = v169.Z
        v169 = Vector3.new(v170, v171, v172)
    end
    return v169
end
function u49.createAimLine(u173) --[[ Line: 569 ]]
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
        [9] = u29
        [10] = u23
        [11] = u30
    --]]
    local v174 = u19.LocalPlayer.Character
    if v174 ~= nil then
        v174 = v174.PrimaryPart
    end
    if not v174 then
        return nil
    end
    u173.aimLineOrigin = u15("Part", {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u22
    })
    local u175 = u20.Assets.Effects.SorcererHitIndicator:Clone()
    u175.Parent = u22
    u173.aimLineEnd = u175
    u173.aimLineOrigin:PivotTo(u19.LocalPlayer.Character:GetPivot())
    local v176 = u15("WeldConstraint", {
        ["Part0"] = u173.aimLineOrigin,
        ["Part1"] = u19.LocalPlayer.Character.PrimaryPart,
        ["Parent"] = u19.LocalPlayer.Character
    })
    u173.chargeMaid:GiveTask(v176)
    u7:setQueryIgnored(u173.aimLineOrigin, true)
    u7:setQueryIgnored(u173.aimLineEnd, true)
    local v177 = u15("Attachment", {
        ["Parent"] = u173.aimLineOrigin
    })
    local v178 = u15("Attachment", {
        ["Parent"] = u173.aimLineEnd
    })
    local u179 = u6.isMobileControls() and 3 or 1
    local u180 = u15("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Brightness"] = 1,
        ["Attachment0"] = v177,
        ["Attachment1"] = v178,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 115, 250)),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = u179 * 0.08,
        ["Width1"] = u179 * 0.08,
        ["Parent"] = u22
    })
    u18:AddTag(u180, "projectile-preview-beam")
    u173.chargeMaid:GiveTask(u180)
    local u181 = 0
    local u182 = u22:GetServerTimeNow()
    local v203 = u21.Heartbeat:Connect(function() --[[ Line: 619 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u182
            [3] = u29
            [4] = u19
            [5] = u181
            [6] = u23
            [7] = u30
            [8] = u173
            [9] = u18
            [10] = u180
            [11] = u179
            [12] = u175
        --]]
        local v183 = u22:GetServerTimeNow() - u182
        local v184 = u29.getSorcererTier(u19.LocalPlayer)
        local v185 = u29.getSorcererTierData(v184)
        u181 = v185.projectileVelocity * v185.projectileLifetime
        if v183 < u23.CastTimeModifierCheck:fire(u29.getSorcererTierData(u30.TIER_2).secCharge).castTime then
            local v186 = u29.getSorcererTierData(u30.TIER_1)
            u181 = v186.projectileVelocity * v186.projectileLifetime
        elseif v183 < u23.CastTimeModifierCheck:fire(u29.getSorcererTierData(u30.TIER_3).secCharge).castTime and u173.currentSpellLevel > 1 then
            local v187 = u29.getSorcererTierData(u30.TIER_2)
            u181 = v187.projectileVelocity * v187.projectileLifetime
        elseif v183 < u23.CastTimeModifierCheck:fire(u29.getSorcererTierData(u30.TIER_4).secCharge).castTime and u173.currentSpellLevel > 2 then
            local v188 = u29.getSorcererTierData(u30.TIER_3)
            u181 = v188.projectileVelocity * v188.projectileLifetime
        elseif v183 < u23.CastTimeModifierCheck:fire(u29.getSorcererTierData(u30.TIER_5).secCharge).castTime and u173.currentSpellLevel > 3 then
            local v189 = u29.getSorcererTierData(u30.TIER_4)
            u181 = v189.projectileVelocity * v189.projectileLifetime
        elseif u173.currentSpellLevel > 4 then
            local v190 = u29.getSorcererTierData(u30.TIER_5)
            u181 = v190.projectileVelocity * v190.projectileLifetime
        end
        local v191 = u22.CurrentCamera
        if v191 ~= nil then
            v191 = v191.CFrame
        end
        if v191 then
            local v192 = u173.aimLineOrigin
            if v192 ~= nil then
                v192 = v192.Position
            end
            if v192 then
                if u173.aimLineEnd then
                    local v193 = u19.LocalPlayer.Character
                    if v193 ~= nil then
                        v193 = v193:GetPivot().Position
                    end
                    if v193 then
                        local v194 = u173:getProjectileDirection()
                        local v195 = RaycastParams.new()
                        local v196 = {}
                        local v197 = #v196
                        local v198 = u18:GetTagged("DontBlockAbilityRaycast")
                        table.move(v198, 1, #v198, v197 + 1, v196)
                        v195.FilterDescendantsInstances = v196
                        v195.FilterType = Enum.RaycastFilterType.Exclude
                        local v199 = u22:Raycast(v193 + v194 * 5, v194 * u181, v195)
                        if v199 then
                            local v200 = u173.aimLineEnd
                            if v200 ~= nil then
                                v200:PivotTo(CFrame.new(v199.Position))
                            end
                            u180.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247))
                            u180.Width0 = u179 * 0.1
                            u180.Width1 = u179 * 0.1
                            u180.Transparency = NumberSequence.new(0)
                            u173.aimLineEnd.Color = Color3.new(1, 0.03, 0.9)
                            u173.aimLineEnd.Transparency = 0
                            u175.Attachment.ParticleEmitter.Enabled = true
                        else
                            local v201 = u173.aimLineOrigin.Position + v194 * u181
                            local v202 = u173.aimLineEnd
                            if v202 ~= nil then
                                v202:PivotTo(CFrame.new(v201))
                            end
                            u180.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255))
                            u180.Transparency = NumberSequence.new(0.3)
                            u180.Width0 = u179 * 0.08
                            u180.Width1 = u179 * 0.08
                            u173.aimLineEnd.Color = Color3.new(1, 0.95, 1)
                            u173.aimLineEnd.Transparency = 0.8
                            u175.Attachment.ParticleEmitter.Enabled = false
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
    u173.chargeMaid:GiveTask(v203)
end
function u49.getSounds(_, p204) --[[ Line: 713 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u11
        [3] = u32
        [4] = u44
    --]]
    if p204.Character then
        if u11.Controllers.KitController:getKitSkin(p204.Character) == u32.SORCERER_ICE_QUEEN then
            return u44
        else
            return u43
        end
    else
        return u43
    end
end
function u49.recolorCrystal(_, p205) --[[ Line: 723 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u37
        [3] = u33
        [4] = u12
        [5] = u32
        [6] = u42
    --]]
    if not u19.LocalPlayer.Character then
        return nil
    end
    if not u37(u19.LocalPlayer, u33.SORCERER) then
        return nil
    end
    if u12.Controllers.KitController:getKitSkin(u19.LocalPlayer.Character) == u32.SORCERER_ICE_QUEEN then
        for v206, v207 in p205:GetDescendants() do
            local _ = v206 - 1
            if v207:IsA("MeshPart") then
                v207.Color = u42
            elseif v207:IsA("PointLight") then
                v207.Color = u42
            end
        end
    end
end
u11.CreateController(u49.new())
return nil