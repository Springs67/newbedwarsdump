local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ProjectileImpactEffectController"
    end,
    ["__index"] = u9
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p15)
    p15.Name = "ProjectileImpactEffectController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u7
        [4] = u2
        [5] = u8
        [6] = u4
        [7] = u10
        [8] = u11
    --]]
    u9.KnitStart(u16)
    task.spawn(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u16
            [3] = u7
            [4] = u2
        --]]
        u6:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect")
        u16.defaultEffectPart = u6.Assets.Effects.ProjectileImpactDefault:Clone()
        u16.defaultEffectPart.Anchored = true
        u16.defaultEffectPart.Parent = u7
        u2:setQueryIgnored(u16.defaultEffectPart, true)
        u16.splashEffectPart = u6.Assets.Effects.ProjectileImpactSplash:Clone()
        u16.splashEffectPart.Anchored = true
        u16.splashEffectPart.Parent = u7
        u2:setQueryIgnored(u16.splashEffectPart, true)
    end)
    u8.LocalProjectileImpact:setPriority(u4.MONITOR):connect(function(p17) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
            [3] = u11
        --]]
        local v18 = u10[p17.projectile.Name]
        if v18.impactParticles and p17.hitEntity == nil then
            if v18.impactParticles == "default" and u16.defaultEffectPart then
                if p17.projectile:GetAttribute("IgnoreDefaultImpactEffect") == true then
                    return nil
                end
                u16.defaultEffectPart.CFrame = CFrame.new(p17.hitPosition)
                u11:playEffects({ u16.defaultEffectPart }, nil)
                return
            end
            if v18.impactParticles == "splash" and u16.splashEffectPart then
                if p17.projectile:GetAttribute("IgnoreDefaultImpactEffect") == true then
                    return nil
                end
                u16.splashEffectPart.CFrame = CFrame.new(p17.hitPosition)
                u11:playEffects({ u16.splashEffectPart }, nil, {
                    ["particleMultiplier"] = 0.5
                })
            end
        end
    end)
end
v3.CreateController(u12.new())
return nil