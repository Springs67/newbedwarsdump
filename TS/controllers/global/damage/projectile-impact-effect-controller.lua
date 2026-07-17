-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ProjectileImpactEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "ProjectileImpactEffectController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), ClientSyncEvents (copy), SyncEventPriority (copy), ProjectileMeta (copy), EffectUtil (copy)
    KnitController.KnitStart(u5);
    task.spawn(function() -- Line: 33
        -- upvalues: ReplicatedStorage (ref), u5 (copy), Workspace (ref), GameQueryUtil (ref)
        ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect");
        u5.defaultEffectPart = ReplicatedStorage.Assets.Effects.ProjectileImpactDefault:Clone();
        u5.defaultEffectPart.Anchored = true;
        u5.defaultEffectPart.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(u5.defaultEffectPart, true);
        u5.splashEffectPart = ReplicatedStorage.Assets.Effects.ProjectileImpactSplash:Clone();
        u5.splashEffectPart.Anchored = true;
        u5.splashEffectPart.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(u5.splashEffectPart, true);
        u5.slimesplashEffectPart = ReplicatedStorage.Assets.Effects.ProjectileImpactSlimeSplash:Clone();
        u5.slimesplashEffectPart.Anchored = true;
        u5.slimesplashEffectPart.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(u5.slimesplashEffectPart, true);
    end);
    ClientSyncEvents.LocalProjectileImpact:setPriority(SyncEventPriority.MONITOR):connect(function(p6) -- Line: 50
        -- upvalues: ProjectileMeta (ref), u5 (copy), EffectUtil (ref)
        local v7 = ProjectileMeta[p6.projectile.Name];

        if v7.impactParticles and p6.hitEntity == nil then
            if v7.impactParticles == "default" and u5.defaultEffectPart then
                if p6.projectile:GetAttribute("IgnoreDefaultImpactEffect") == true then
                    return nil;
                end;

                u5.defaultEffectPart.CFrame = CFrame.new(p6.hitPosition);
                EffectUtil:playEffects({ u5.defaultEffectPart }, nil);

                return;
            end;

            if v7.impactParticles == "splash" and u5.splashEffectPart then
                if p6.projectile:GetAttribute("IgnoreDefaultImpactEffect") == true then
                    return nil;
                end;

                u5.splashEffectPart.CFrame = CFrame.new(p6.hitPosition);
                EffectUtil:playEffects({ u5.splashEffectPart }, nil, {
                    particleMultiplier = 0.5
                });

                return;
            end;

            if v7.impactParticles == "slime_splash" and u5.slimesplashEffectPart then
                if p6.projectile:GetAttribute("IgnoreDefaultImpactEffect") == true then
                    return nil;
                end;

                u5.slimesplashEffectPart.CFrame = CFrame.new(p6.hitPosition);
                EffectUtil:playEffects({ u5.slimesplashEffectPart }, nil, {
                    particleMultiplier = 0.5
                });
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;