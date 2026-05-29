local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AbilityState
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").LifeForceAttr
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "armor-util").ArmorUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u27 = v1.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "nazar", "life-force-ui").LifeForceUi
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "HalloweenNazarController"
    end,
    ["__index"] = u13
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u18
        [3] = u7
    --]]
    u13.constructor(p31, { u18.HALLOWEEN_2025_EVENT_PVE })
    p31.Name = "HalloweenNazarController"
    p31.lifeForceUiMaid = u7.new()
    p31.lifeForceUiKey = "LifeForceUI"
    p31.isStatusEffectActive = false
    p31.inited = false
    p31.empowerMaid = {}
end
function u28.KnitStart(p32) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p32)
end
function u28.onGameInit(u33) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u25
        [4] = u2
        [5] = u4
        [6] = u24
        [7] = u21
        [8] = u6
        [9] = u19
        [10] = u23
        [11] = u14
    --]]
    u12.StatusEffectAdded:connect(function(p34) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u25
            [3] = u2
            [4] = u33
            [5] = u4
        --]]
        if p34.entityInstance == u10.LocalPlayer.Character and p34.statusEffect == u25.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.enabledAbility, u4.DISABLED)
            u33.isStatusEffectActive = true
        end
    end)
    u12.StatusEffectRemoved:connect(function(p35) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u25
            [3] = u2
            [4] = u33
            [5] = u4
        --]]
        if p35.entityInstance == u10.LocalPlayer.Character and p35.statusEffect == u25.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u33.enabledAbility, u4.READY)
            u33.isStatusEffectActive = false
        end
    end)
    u24.Client:Get("HalloweenSetKit"):Connect(function(p36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u21
        --]]
        if not u33.inited and p36.kit == u21.NAZAR then
            u33:mountLifeForceUi()
            u33:mountAbility()
            u33.inited = true
        end
    end)
    u12.ProjectileLaunched:setPriority(u6.HIGH):connect(function(p37) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u33
        --]]
        local v38 = not p37:isLocalShooter()
        if not v38 then
            local v39 = u19.HEALTH_TAKEN_BY_PROJECTILE[p37.projectileType] ~= nil
            v38 = not v39
        end
        if v38 then
            return nil
        end
        if not u33:hasHealthToFireProjectile(p37.projectileType) then
            p37.projectile:Destroy()
            p37:setCancelled(true)
        end
    end)
    u12.BeginProjectileTargeting:setPriority(u6.HIGH):connect(function(p40) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u19
            [3] = u33
        --]]
        local v41 = u23(p40.handItem.itemType).projectileSource
        if v41 ~= nil then
            v41 = v41.projectileType(nil)
        end
        if not v41 or u19.HEALTH_TAKEN_BY_PROJECTILE[v41] == nil then
            return nil
        end
        if not u33:hasHealthToFireProjectile(v41) then
            p40:setCancelled(true)
        end
    end)
    u12.AbilityUsed:connect(function(p42) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u33
        --]]
        if p42:isCancelled() then
            return nil
        elseif p42.ability == u14.ENABLE_LIFE_FORCE_ATTACK then
            u33:addEmpowerParticles(p42.userCharacter)
        elseif p42.ability == u14.DISABLE_LIFE_FORCE_ATTACK then
            local v43 = u33.empowerMaid[p42.userCharacter]
            if v43 ~= nil then
                v43:DoCleaning()
            end
        end
    end)
end
function u28.hasHealthToFireProjectile(_, p44) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u22
        [3] = u10
        [4] = u17
    --]]
    local v45 = u19.HEALTH_TAKEN_BY_PROJECTILE[p44]
    if not v45 then
        return true
    end
    local v46 = u22.calculateDamageAfterArmor(u10.LocalPlayer, v45.damage, v45.armorMult)
    local v47 = u17:getEntity(u10.LocalPlayer)
    if v47 ~= nil then
        v47 = v47:getHealth()
    end
    return v46 < (v47 == nil and 0 or v47)
end
function u28.addEmpowerParticles(p48, p49) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u3
        [3] = u7
    --]]
    local v50 = u11.Assets.Effects.Empower:Clone():GetChildren()
    local v51 = u11.Assets.Effects.Empower:Clone():GetChildren()
    local v52 = u3.getOrCreate(p48.empowerMaid, p49, u7.new())
    for v53, v54 in v50 do
        local _ = v53 - 1
        v54.Parent = p49.LeftHand
        v52:GiveTask(v54)
    end
    for v55, v56 in v51 do
        local _ = v55 - 1
        v56.Parent = p49.RightHand
        v52:GiveTask(v56)
    end
end
function u28.mountAbility(u57) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u15
        [4] = u10
        [5] = u16
        [6] = u26
        [7] = u20
        [8] = u4
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u14.DISABLE_LIFE_FORCE_ATTACK)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u14.ENABLE_LIFE_FORCE_ATTACK, u15[u14.ENABLE_LIFE_FORCE_ATTACK].triggerConfig)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u14.CONSUME_LIFE_FORCE, u15[u14.CONSUME_LIFE_FORCE].triggerConfig)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u14.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE, u15[u14.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE].triggerConfig)
    u57.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u14.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE)
    u10.LocalPlayer:GetAttributeChangedSignal(u16.Name):Connect(function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u10
            [3] = u16
            [4] = u20
            [5] = u57
            [6] = u2
            [7] = u4
        --]]
        local v58 = u26(u10.LocalPlayer, u16)
        local v59 = v58 == nil and 0 or v58
        if v59 < u20.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST and not u57.isStatusEffectActive then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u57.enabledAbility, u4.DISABLED)
        elseif u20.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST <= v59 and not u57.isStatusEffectActive then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u57.enabledAbility, u4.READY)
        end
    end)
end
function u28.mountLifeForceUi(p60) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u27
    --]]
    p60.lifeForceUiMaid:DoCleaning()
    p60.lifeForceUiMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createFragment({
        [p60.lifeForceUiKey] = u8.createElement(u27)
    })))
end
v5.CreateController(u28.new())
return nil