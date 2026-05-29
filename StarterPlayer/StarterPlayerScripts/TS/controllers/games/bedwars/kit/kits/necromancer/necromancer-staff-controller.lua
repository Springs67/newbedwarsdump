local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "target-selector", "target-selector-util")
local u16 = v15.TargetSelector
local u17 = v15.TargetType
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").findSurfacePosition
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "necromancer", "necromancer-kit-util").NecromancerSummonType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u32 = v1.import(script, script.Parent, "ui", "necromancer-staff-base").NecromancerStaffUiBase
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "NecromancerStaffController"
    end,
    ["__index"] = u18
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
        [1] = u18
        [2] = u8
        [3] = u27
    --]]
    u18.constructor(p36)
    p36.Name = "NecromancerStaffController"
    p36.maid = u8.new()
    p36.summonMode = u27.MELEE
    p36.animationCooldown = -1
end
function u33.KnitStart(u37) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u20
        [4] = u10
        [5] = u27
        [6] = u6
        [7] = u30
        [8] = u19
        [9] = u13
        [10] = u5
        [11] = u23
        [12] = u22
        [13] = u28
        [14] = u11
        [15] = u31
        [16] = u7
        [17] = u26
        [18] = u24
        [19] = u16
        [20] = u29
        [21] = u8
        [22] = u12
    --]]
    u18.KnitStart(u37)
    u14.AbilityUsed:connect(function(p38) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u10
            [3] = u37
            [4] = u27
            [5] = u6
            [6] = u30
            [7] = u19
            [8] = u13
            [9] = u5
            [10] = u23
            [11] = u22
        --]]
        if p38.ability == u20.NECROMANCER_SWAP and p38.userCharacter == u10.LocalPlayer.Character then
            if u37.summonMode == u27.MELEE then
                u37.summonMode = u27.PROJECTILE
                u6:playSound(u30.WARLOCK_HEAL_START)
                u19:dispatch({
                    ["type"] = "NecromancerSetMode",
                    ["necromancerSummonMode"] = u37.summonMode
                })
                if u13:GetServerTimeNow() > u37.animationCooldown then
                    u5:playAnimation(u10.LocalPlayer.Character, u23:getAssetId(u22.NECROMANCER_SWAP))
                    u37.animationCooldown = u13:GetServerTimeNow() + 1
                    return
                end
            else
                u37.summonMode = u27.MELEE
                u6:playSound(u30.WARLOCK_SIPHON_START)
                u19:dispatch({
                    ["type"] = "NecromancerSetMode",
                    ["necromancerSummonMode"] = u37.summonMode
                })
                if u13:GetServerTimeNow() > u37.animationCooldown then
                    u5:playAnimation(u10.LocalPlayer.Character, u23:getAssetId(u22.WIZARD_LIGHTNING_STRIKE_CAST))
                    u37.animationCooldown = u13:GetServerTimeNow() + 1
                end
            end
        end
    end)
    u14.BeginProjectileTargeting:connect(function(p39) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u10
        --]]
        local v40 = p39.handItem.itemType == u28.NECROMANCER_STAFF
        if v40 then
            local v41 = u10.LocalPlayer:GetAttribute("SkeletonCount")
            if v41 == 0 or v41 ~= v41 then
                v41 = false
            elseif v41 == "" then
                v41 = false
            end
            v40 = not v41
        end
        if v40 then
            p39:setCancelled(true)
        end
    end)
    u14.ProjectileHit:connect(function(p42) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u37
            [3] = u11
            [4] = u13
            [5] = u31
            [6] = u7
            [7] = u30
            [8] = u26
            [9] = u24
            [10] = u6
        --]]
        if p42:isCancelled() then
            return nil
        end
        if p42.projectileType ~= "deploy_skeleton" or not p42.shooter then
            return nil
        end
        local v43 = u10:GetPlayerFromCharacter(p42.shooter:getInstance())
        if not v43 then
            return nil
        end
        u37:playSummonAnimation(v43)
        local u44 = u11.Assets.Effects.NecromancerExplosion:Clone()
        u44.Parent = u13
        u44:PivotTo(p42.hitData.hitCFrame)
        u31:playEffects({ u44 }, nil)
        task.delay(2, function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:Destroy()
        end)
        local v45 = u7.Controllers.KitSkinController:getKitSkin(p42.shooter:getInstance())
        local v46 = u30.CRYPT_SUMMON_SKELETON
        local u47
        if v45 == u26.NECROMANCER_CHRISTMAS then
            u47 = u11.Assets.Effects.SkeletonSummonChristmas:Clone()
            v46 = u30.CRYPT_SUMMON_SKELETON_XMAS
        elseif v45 == u26.CRYPTWRECKED then
            u47 = u11.Assets.Effects.SkeletonSummonCryptwrecked:Clone()
            v46 = u30.CRYPT_SUMMON_SKELETON_CRYPTWRECKED
        else
            u47 = u11.Assets.Effects.SummoningSmoke:Clone()
        end
        u47.Parent = u13
        local v48 = u24(p42.hitData.hitCFrame.Position)
        if not v48 then
            return nil
        end
        u6:playSound(v46, {
            ["position"] = v48
        })
        u47.Position = v48
        u31:playEffects({ u47 }, nil)
        task.delay(6, function() --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u47
            --]]
            u47:Destroy()
        end)
    end)
    u14.AbilityUsed:connect(function(p49) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u20
            [3] = u16
            [4] = u29
        --]]
        if p49.userCharacter == u10.LocalPlayer.Character and p49.ability == u20.NECROMANCER_SKELETONS_ATTACK then
            local v50 = u16:getTargetEntity()
            if not v50 then
                p49:setCancelled(true)
                return nil
            end
            u29.Client:Get("NecromancerSelectTarget"):SendToServer({
                ["target"] = v50:getInstance()
            })
        end
    end)
    u29.Client:Get("NecromancerRecall"):Connect(function(p51) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u30
            [3] = u26
            [4] = u11
            [5] = u13
            [6] = u31
            [7] = u5
            [8] = u23
            [9] = u22
            [10] = u6
            [11] = u8
            [12] = u12
        --]]
        local v52 = p51.caster.Character
        if not v52 then
            return nil
        end
        local v53 = u7.Controllers.KitSkinController:getKitSkin(v52)
        local v54 = u30.CRYPT_SUMMON_SKELETON
        local u55
        if v53 == u26.NECROMANCER_CHRISTMAS then
            u55 = u11.Assets.Effects.SkeletonSummonChristmas
            v54 = u30.CRYPT_SUMMON_SKELETON_XMAS
        elseif v53 == u26.CRYPTWRECKED then
            u55 = u11.Assets.Effects.SkeletonSummonCryptwrecked
            v54 = u30.CRYPT_SUMMON_SKELETON_CRYPTWRECKED
        else
            u55 = u11.Assets.Effects.SummoningSmoke
        end
        local u56 = u55:Clone()
        u56.Position = p51.targetPos - Vector3.new(0, 2, 0)
        u56.Parent = u13
        u31:playEffects({ u56 }, nil)
        task.delay(3, function() --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            u56:Destroy()
        end)
        u5:playAnimation(v52, u23:getAssetId(u22.HALLOWEEN_BOSS_CAST))
        u6:playSound(v54, {
            ["position"] = p51.targetPos
        })
        local v57 = p51.skeletons
        local function v65(u58) --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u55
                [3] = u13
                [4] = u12
            --]]
            local u59 = u8.new()
            local u60 = u55:Clone()
            u60.Parent = u13
            local v61 = u60:WaitForChild("Circle", 1)
            if v61 then
                for v62, v63 in v61:GetChildren() do
                    local _ = v62 - 1
                    if v63:IsA("ParticleEmitter") then
                        v63:Emit(1)
                    end
                end
            end
            u59:GiveTask(u60)
            u59:GiveTask(u12.Heartbeat:Connect(function(_) --[[ Line: 202 ]]
                --[[
                Upvalues:
                    [1] = u58
                    [2] = u60
                    [3] = u13
                --]]
                local v64 = u58.PrimaryPart
                if v64 ~= nil then
                    v64 = v64.Position
                end
                if not v64 or u60.Parent ~= u13 then
                    return nil
                end
                u60.Position = v64 - Vector3.new(0, 2, 0)
            end))
            task.delay(1.5, function() --[[ Line: 214 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                u59:DoCleaning()
            end)
        end
        for v66, v67 in v57 do
            v65(v67, v66 - 1, v57)
        end
    end)
end
function u33.isRelevantItem(_, p68) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    return p68.itemType == u28.NECROMANCER_STAFF
end
function u33.onEnable(u69, _, _) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u21
        [4] = u8
        [5] = u32
        [6] = u27
        [7] = u16
        [8] = u17
        [9] = u4
        [10] = u14
        [11] = u25
    --]]
    u69:setupYield(function() --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u2
            [3] = u20
            [4] = u21
        --]]
        u69.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.NECROMANCER_RECALL_SKELETONS, u21[u20.NECROMANCER_RECALL_SKELETONS].triggerConfig):expect())
        return function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69.maid:DoCleaning()
        end
    end)
    u69:setupYield(function() --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u2
            [3] = u20
            [4] = u21
        --]]
        u69.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.NECROMANCER_SKELETONS_ATTACK, u21[u20.NECROMANCER_SKELETONS_ATTACK].triggerConfig):expect())
        u69.targetAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u20.NECROMANCER_SKELETONS_ATTACK)
        return function() --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69.maid:DoCleaning()
        end
    end)
    u69:setupYield(function() --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u2
            [3] = u69
        --]]
        local u70 = u8.new()
        local v72 = {
            ["action"] = "KitPrimary",
            ["actionId"] = "necromancer-swap",
            ["boundFunction"] = function(_, p71, _) --[[ Name: boundFunction, Line 245 ]]
                --[[
                Upvalues:
                    [1] = u69
                --]]
                if p71 == Enum.UserInputState.Begin then
                    u69:swap()
                end
            end
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v72)
        return function() --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u70
            --]]
            u70:DoCleaning()
        end
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "NecromancerStaffBase",
        ["app"] = u32
    }, {
        ["ChangeAbility"] = function(_) --[[ Name: ChangeAbility, Line 259 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            return u69:swap()
        end,
        ["Modes"] = { u27.MELEE, u27.PROJECTILE }
    })
    u16:enableTargetSelector(u17.ENTITY, {
        ["requireSight"] = true,
        ["distance"] = 30
    })
    if not u16:getTargetEntity() and u69.targetAbilityRef then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u69.targetAbilityRef, u4.DISABLED)
    end
    u69.maid:GiveTask(u14.NewSelectorTarget:connect(function(p73) --[[ Line: 271 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u2
            [3] = u20
            [4] = u4
            [5] = u25
        --]]
        if not u69.targetAbilityRef then
            u69.targetAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u20.NECROMANCER_SKELETONS_ATTACK)
        end
        if u69.targetAbilityRef then
            if p73.target and u69.targetAbilityRef.abilityState == u4.DISABLED then
                if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u25.NECROMANCER_SKELETON_MARK) > 0 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u69.targetAbilityRef, u4.ON_COOLDOWN)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u69.targetAbilityRef, u4.READY)
                end
            else
                if not p73.target and (u69.targetAbilityRef.abilityState == u4.READY or u69.targetAbilityRef.abilityState == u4.ON_COOLDOWN) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u69.targetAbilityRef, u4.DISABLED)
                end
                return
            end
        else
            return nil
        end
    end))
end
function u33.onDisable(p74) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u2
    --]]
    p74.maid:DoCleaning()
    u16:disableTargetSelector()
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("NecromancerStaffBase")
end
function u33.playSummonAnimation(_, p75) --[[ Line: 294 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u23
        [3] = u22
    --]]
    u5:playAnimation(p75, u23:getAssetId(u22.NECROMANCER_SUMMON), {
        ["looped"] = false
    })
end
function u33.swap(p76) --[[ Line: 299 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
    --]]
    if not p76:isEnabled() then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u20.NECROMANCER_SWAP)
end
u7.CreateController(u33.new())
return nil