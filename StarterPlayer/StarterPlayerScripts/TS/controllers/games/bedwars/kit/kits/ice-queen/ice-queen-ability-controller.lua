local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "IceQueenAbilityController"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
    --]]
    u15.constructor(p19, u14.ICE_QUEEN)
    p19.Name = "IceQueenAbilityController"
    p19.frozenTargets = {}
end
function u16.onKitLocalActivated(u20, p21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u9
        [5] = u4
    --]]
    p21:GiveTask(u5("entity", function(u22) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u22:GetAttributeChangedSignal("IceQueenStacks"):Connect(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u20
            --]]
            local v23 = u22:GetAttribute("IceQueenStacks")
            if v23 == nil or v23 == 0 then
                u20.frozenTargets[u22] = nil
            else
                u20.frozenTargets[u22] = true
            end
        end)
    end))
    local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v25 = u8.ICE_QUEEN
    local v26 = {}
    for v27, v28 in u9[u8.ICE_QUEEN].triggerConfig do
        v26[v27] = v28
    end
    v24:enableAbility(v25, v26):expect()
    u20.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u8.ICE_QUEEN)
    if not u20:shouldEnableAbility() and u20.enabledAbility then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u20.enabledAbility, u4.DISABLED)
    end
    task.defer(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        while true do
            local v29 = task.wait(0.5)
            if v29 == 0 or (v29 ~= v29 or not (v29 and u20.enabledAbility)) then
                break
            end
            if u20:shouldEnableAbility() then
                u20:enableAbility()
            else
                u20:disableAbility()
            end
        end
    end)
end
function u16.onAbilityUsed(_, _, p30) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u11
        [4] = u10
    --]]
    if p30.userCharacter == u7.LocalPlayer.Character and p30.ability == u8.ICE_QUEEN then
        u11:playAnimation(u7.LocalPlayer, u10.NECROMANCER_SUMMON)
    end
end
function u16.onKitLocalDeactivated(_) --[[ Line: 84 ]] end
function u16.onKitReplicationActivated(_, _) --[[ Line: 86 ]] end
function u16.onKitReplicationDeactivated(_) --[[ Line: 88 ]] end
function u16.onInnateAbilityEnabled(_, _, _) --[[ Line: 90 ]] end
function u16.shouldEnableAbility(p31) --[[ Line: 92 ]]
    return #p31:getNearbyTargets() ~= 0
end
function u16.enableAbility(p32) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
        [3] = u4
    --]]
    if p32.enabledAbility then
        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u12.ICE_QUEEN) <= 0 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p32.enabledAbility, u4.READY)
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p32.enabledAbility, u4.ON_COOLDOWN)
        end
    else
        return nil
    end
end
function u16.disableAbility(p33) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    if not p33.enabledAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p33.enabledAbility, u4.DISABLED)
end
function u16.getNearbyTargets(p34) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    local v35 = u13:getLocalPlayerEntity()
    local v36 = u7.LocalPlayer.Character
    if v36 ~= nil then
        v36 = v36.PrimaryPart
        if v36 ~= nil then
            v36 = v36.Position
        end
    end
    if not (v35 and v36) then
        return {}
    end
    local v37 = {}
    for v38 in p34.frozenTargets do
        local v39 = v38.PrimaryPart
        if v39 ~= nil then
            v39 = v39.Position
        end
        if v39 and (v39 - v36).Magnitude <= 30 then
            local v40 = u13:getEntity(v38)
            if v40 and v35:canAttack(v40) then
                table.insert(v37, v38)
            end
        end
    end
    return v37
end
v6.CreateController(u16.new())
return nil