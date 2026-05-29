local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "armor-util").ArmorUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "NazarController"
    end,
    ["__index"] = u22
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u15
        [3] = u21
        [4] = u17
    --]]
    u22.constructor(p26, u15.NAZAR, {
        ["sounds"] = { u21.CONSUME_ACTIVATE, u21.EMPOWER_ENABLE, u21.EMPOWER_DISABLE },
        ["imageIds"] = { u17.CONSUME_ICON, u17.EMPOWER_ENABLE_ICON, u17.EMPOWER_DISABLE_ICON }
    })
    p26.Name = "NazarController"
    p26.empowerMaid = {}
end
function u23.KnitStart(p27) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22.KnitStart(p27)
end
function u23.onKitLocalActivated(u28, u29) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u16
        [4] = u19
        [5] = u20
        [6] = u4
        [7] = u9
        [8] = u5
        [9] = u2
        [10] = u12
        [11] = u13
    --]]
    u29:GiveTask(u11.ProjectileLaunched:setPriority(u6.HIGH):connect(function(p30) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
        --]]
        local v31 = not p30:isLocalShooter()
        if not v31 then
            local v32 = u16.HEALTH_TAKEN_BY_PROJECTILE[p30.projectileType] ~= nil
            v31 = not v32
        end
        if v31 then
            return nil
        end
        if not u28:hasHealthToFireProjectile(p30.projectileType) then
            p30.projectile:Destroy()
            p30:setCancelled(true)
        end
    end))
    u29:GiveTask(u11.BeginProjectileTargeting:setPriority(u6.HIGH):connect(function(p33) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u16
            [3] = u28
        --]]
        local v34 = u19(p33.handItem.itemType).projectileSource
        if v34 ~= nil then
            v34 = v34.projectileType(nil)
        end
        if not v34 or u16.HEALTH_TAKEN_BY_PROJECTILE[v34] == nil then
            return nil
        end
        if not u28:hasHealthToFireProjectile(v34) then
            p33:setCancelled(true)
        end
    end))
    u29:GiveTask(u11.MatchStateChange:connect(function(p35) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u29
            [3] = u4
            [4] = u9
            [5] = u5
            [6] = u2
            [7] = u12
            [8] = u28
            [9] = u13
        --]]
        if p35.matchState == u20.RUNNING then
            task.delay(0.5, function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u4
                    [3] = u9
                    [4] = u5
                    [5] = u20
                    [6] = u2
                    [7] = u12
                    [8] = u28
                    [9] = u13
                --]]
                u29:GiveTask(u4(function(p36) --[[ Line: 81 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u5
                        [3] = u20
                        [4] = u2
                        [5] = u12
                        [6] = u28
                        [7] = u13
                    --]]
                    local v37
                    if p36 == u9.LocalPlayer then
                        v37 = u5.Controllers.MatchController:getMatchState() == u20.RUNNING
                    else
                        v37 = false
                    end
                    if v37 then
                        local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities()[u12.ENABLE_LIFE_FORCE_ATTACK] ~= nil
                        v37 = not v38
                    end
                    if v37 then
                        u28.logger:Debug("Resetting player abilities.")
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u12.DISABLE_LIFE_FORCE_ATTACK)
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u12.ENABLE_LIFE_FORCE_ATTACK, u13[u12.ENABLE_LIFE_FORCE_ATTACK].triggerConfig)
                    end
                end))
            end)
        end
    end))
end
function u23.onKitLocalDeactivated(_) --[[ Line: 98 ]] end
function u23.onKitReplicationActivated(u39, p40) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    p40:GiveTask(u11.AbilityUsed:connect(function(p41) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u39
        --]]
        if p41:isCancelled() then
            return nil
        elseif p41.ability == u12.ENABLE_LIFE_FORCE_ATTACK then
            u39:addEmpowerParticles(p41.userCharacter)
        elseif p41.ability == u12.DISABLE_LIFE_FORCE_ATTACK then
            local v42 = u39.empowerMaid[p41.userCharacter]
            if v42 ~= nil then
                v42:DoCleaning()
            end
        end
    end))
end
function u23.onKitReplicationDeactivated(_) --[[ Line: 117 ]] end
function u23.onInnateAbilityEnabled(_, _, _) --[[ Line: 119 ]] end
function u23.onAbilityUsed(_, _, _) --[[ Line: 121 ]] end
function u23.hasHealthToFireProjectile(_, p43) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u9
        [4] = u14
    --]]
    local v44 = u16.HEALTH_TAKEN_BY_PROJECTILE[p43]
    if not v44 then
        return true
    end
    local v45 = u18.calculateDamageAfterArmor(u9.LocalPlayer, v44.damage, v44.armorMult)
    local v46 = u14:getEntity(u9.LocalPlayer)
    if v46 ~= nil then
        v46 = v46:getHealth()
    end
    return v45 < (v46 == nil and 0 or v46)
end
function u23.addEmpowerParticles(p47, p48) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u7
    --]]
    local v49 = u10.Assets.Effects.Empower:Clone():GetChildren()
    local v50 = u10.Assets.Effects.Empower:Clone():GetChildren()
    local v51 = u3.getOrCreate(p47.empowerMaid, p48, u7.new())
    for v52, v53 in v49 do
        local _ = v52 - 1
        v53.Parent = p48.LeftHand
        v51:GiveTask(v53)
    end
    for v54, v55 in v50 do
        local _ = v54 - 1
        v55.Parent = p48.RightHand
        v51:GiveTask(v55)
    end
end
u5.CreateController(u23.new())
return nil