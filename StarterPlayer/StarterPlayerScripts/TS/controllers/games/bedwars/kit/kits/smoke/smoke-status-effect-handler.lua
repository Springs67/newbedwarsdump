local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SmokeStatusEffectHandler"
    end,
    ["__index"] = u12
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18, ...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p18, ...)
end
function u15.onApply(u19, u20, _) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u13
        [4] = u9
        [5] = u11
        [6] = u2
    --]]
    local v21
    if u20 == u8.LocalPlayer.Character then
        v21 = u8.LocalPlayer.Character
    else
        v21 = false
    end
    local v22 = u5
    local v23 = u13.USE_SMOKE_CHARGE
    local v24 = {}
    local v25
    if v21 then
        v25 = nil
    else
        v25 = u20.PrimaryPart
        if v25 ~= nil then
            v25 = v25.Position
        end
    end
    v24.position = v25
    v22:playSound(v23, v24)
    local v26 = u5
    local v27 = u13.SMOKE_CHARGE_LOOP
    local v28 = {}
    local v29
    if v21 then
        v29 = nil
    else
        v29 = u20.PrimaryPart
        if v29 ~= nil then
            v29 = v29.Position
        end
    end
    v28.position = v29
    local v30
    if v21 then
        v30 = nil
    else
        v30 = u20.PrimaryPart
    end
    v28.parent = v30
    v28.looped = true
    local u31 = v26:playSound(v27, v28)
    if u31 then
        u19.maid:GiveTask(function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:Destroy()
        end)
    end
    u19:playSmokePuff(u20)
    task.delay(0.08, function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
        --]]
        u19:playSmokePuff(u20)
    end)
    local u32 = u9.Assets.Effects.SmokeTrail:Clone()
    local v33 = u20.PrimaryPart
    if not v33 then
        return nil
    end
    u32.Parent = v33
    u19.maid:GiveTask(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:Destroy()
    end)
    if v21 then
        u19.maid:GiveTask(u11.PerformCombat:connect(function(p34) --[[ Line: 89 ]]
            p34:setCancelled(true)
        end))
        u19.maid:GiveTask(u2.DamageBlock:connect(function(p35) --[[ Line: 92 ]]
            p35:setCancelled(true)
        end))
        u19.maid:GiveTask(u2.PlaceBlock:connect(function(p36) --[[ Line: 95 ]]
            p36:setCancelled(true)
        end))
    end
end
function u15.onRemove(u37, u38, _) --[[ Line: 100 ]]
    u37:playSmokePuff(u38)
    task.delay(0.08, function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u38
        --]]
        u37:playSmokePuff(u38)
    end)
end
function u15.playSmokePuff(_, p39) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u6
        [4] = u4
        [5] = u14
    --]]
    local v40 = u9.Assets.Effects.SmokePuff:Clone()
    local v41 = {}
    local v42 = p39.PrimaryPart
    if v42 ~= nil then
        v42 = v42.CFrame
    end
    v41.CFrame = v42
    v41.Anchored = true
    v41.CanQuery = false
    v41.CanCollide = false
    v41.Transparency = 1
    v41.Parent = u10
    local u43 = u6("Part", v41)
    u4:setQueryIgnored(u43, true)
    v40.Parent = u43
    u14:playEffects({ v40 }, p39)
    task.delay(5, function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:Destroy()
    end)
end
return {
    ["SmokeStatusEffectHandler"] = u15
}