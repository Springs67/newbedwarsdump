local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AbilityState
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").LifeForceAttr
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "HalloweenAbilityNazarTreeController"
    end,
    ["__index"] = u7
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
    --]]
    u7.constructor(p20, { u11.HALLOWEEN_2024_EVENT })
    p20.Name = "HalloweenAbilityNazarTreeController"
    p20.isStatusEffectActive = false
end
function u17.KnitStart(p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p21)
end
function u17.onGameInit(u22) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u5
        [4] = u4
        [5] = u2
        [6] = u8
        [7] = u9
        [8] = u3
        [9] = u6
        [10] = u15
        [11] = u10
        [12] = u16
        [13] = u13
    --]]
    u14.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p23) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u4
            [4] = u2
            [5] = u8
            [6] = u9
            [7] = u22
            [8] = u3
        --]]
        if p23.halloweenAbilityType == u12.NAZAR_STARTER and p23.player == u5.LocalPlayer then
            u4.Controllers.LifeForceUiController:mountLifeForceUi()
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u8.CONSUME_LIFE_FORCE)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u8.ENABLE_LIFE_FORCE_ATTACK)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u8.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE, u9[u8.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE].triggerConfig)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u8.ENABLE_LIFE_FORCE_ATTACK, u9[u8.ENABLE_LIFE_FORCE_ATTACK].triggerConfig)
            u22.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u8.HALLOWEEN_NAZAR_KNOCKBACK_STRIKE)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u22.enabledAbility, u3.DISABLED)
        end
    end)
    u6.StatusEffectAdded:connect(function(p24) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u2
            [4] = u22
            [5] = u3
        --]]
        if p24.entityInstance == u5.LocalPlayer.Character and p24.statusEffect == u15.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u22.enabledAbility, u3.DISABLED)
            u22.isStatusEffectActive = true
        end
    end)
    u6.StatusEffectRemoved:connect(function(p25) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u2
            [4] = u22
            [5] = u3
        --]]
        if p25.entityInstance == u5.LocalPlayer.Character and p25.statusEffect == u15.NAZAR_HALLOWEEN_KNOCKBACK_STRIKE then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u22.enabledAbility, u3.READY)
            u22.isStatusEffectActive = false
        end
    end)
    u5.LocalPlayer:GetAttributeChangedSignal(u10.Name):Connect(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u5
            [3] = u10
            [4] = u13
            [5] = u22
            [6] = u2
            [7] = u3
        --]]
        local v26 = u16(u5.LocalPlayer, u10)
        local v27 = v26 == nil and 0 or v26
        if v27 < u13.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST and not u22.isStatusEffectActive then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u22.enabledAbility, u3.DISABLED)
        elseif u13.NAZAR_KNOCKBACK_STRIKE_LIFE_FORCE_COST <= v27 and not u22.isStatusEffectActive then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u22.enabledAbility, u3.READY)
        end
    end)
end
u4.CreateController(u17.new())
return nil