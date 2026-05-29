local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").getAbilityMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "AbilityStatusEffectController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "AbilityStatusEffectController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u7
        [4] = u5
        [5] = u10
        [6] = u3
        [7] = u2
        [8] = u6
        [9] = u11
        [10] = u12
    --]]
    u9.KnitStart(p17)
    u8.StatusEffectAdded:connect(function(p18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u10
            [4] = u3
            [5] = u2
        --]]
        if p18.entityInstance ~= u7.LocalPlayer.Character then
            return nil
        end
        for _, v19 in u5.values(u10) do
            local v20 = u3(v19).blockingStatusEffects or {}
            local v21 = p18.statusEffect
            if table.find(v20, v21) ~= nil then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v19, "status-effect:" .. p18.statusEffect)
            end
        end
    end)
    u8.StatusEffectRemoved:connect(function(p22) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u10
            [4] = u3
            [5] = u2
        --]]
        if p22.entityInstance ~= u7.LocalPlayer.Character then
            return nil
        end
        for _, v23 in u5.values(u10) do
            local v24 = u3(v23).blockingStatusEffects or {}
            local v25 = p22.statusEffect
            if table.find(v24, v25) ~= nil then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v23, "status-effect:" .. p22.statusEffect)
            end
        end
    end)
    u8.CanUseLocalAbility:setPriority(u6.HIGHEST):connect(function(p26) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u11
            [3] = u7
            [4] = u12
        --]]
        if p26:isCancelled() then
            return nil
        end
        local v27 = u3(p26.ability)
        if not v27.blockingStatusEffects then
            return nil
        end
        local v28 = u11:getEntity(u7.LocalPlayer)
        if v28 ~= nil then
            v28 = v28:getInstance()
        end
        if not v28 then
            return nil
        end
        if u12:hasAnyActive(v28, v27.blockingStatusEffects) then
            p26:setCancelled(true)
        end
    end)
end
v4.CreateController(u13.new())
return nil