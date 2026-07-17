-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "FishingRodController";
    end,

    __index = ProjectileSourceController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: ProjectileSourceController (copy), u2 (copy)
    ProjectileSourceController.constructor(p5);
    p5.Name = "FishingRodController";
    p5.animationMaid = u2.new();
    p5.activeFishing = false;
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: ProjectileSourceController (copy), ClientSyncEvents (copy), Players (copy), default (copy)
    ProjectileSourceController.KnitStart(p6);
    ClientSyncEvents.ProjectileDestroy:connect(function(p7) -- Line: 36
        -- upvalues: Players (ref), default (ref)
        if p7.projectileType ~= "fisherman_bobber" then
            return nil;
        end;

        if p7.projectile:GetAttribute("ProjectileShooter") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        default.Client:Get("PullFishingRod"):SendToServer({
            success = false
        });
    end);
end;

function u3.onEnable(u8, p9, u10) -- Line: 48
    -- upvalues: ProjectileSourceController (copy), ClientSyncEvents (copy), Players (copy), default (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient2 (copy)
    ProjectileSourceController.onEnable(u8, p9, u10);
    u8.maid:GiveTask(ClientSyncEvents.ProjectileLaunched:connect(function(p11) -- Line: 50
        -- upvalues: Players (ref), u8 (copy)
        if p11.projectileType ~= "fisherman_bobber" then
            return nil;
        end;

        if p11.projectile:GetAttribute("ProjectileShooter") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u8.activeFishing = true;
    end));
    u8.maid:GiveTask(ClientSyncEvents.ProjectileDestroy:connect(function(p12) -- Line: 60
        -- upvalues: Players (ref), u8 (copy)
        if p12.projectileType ~= "fisherman_bobber" then
            return nil;
        end;

        if p12.projectile:GetAttribute("ProjectileShooter") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u8.animationMaid:DoCleaning();
        u8.activeFishing = false;
    end));
    u8.maid:GiveTask(function() -- Line: 71
        -- upvalues: u8 (copy), default (ref)
        u8.activeFishing = false;
        task.spawn(function() -- Line: 73
            -- upvalues: default (ref)
            default.Client:Get("PullFishingRod"):SendToServer({
                success = false
            });
        end);
    end);
    u8.animationMaid:DoCleaning();
    u8.maid:GiveTask(u8.animationMaid);
    task.spawn(function() -- Line: 81
        -- upvalues: u8 (copy), default (ref), u10 (copy), GameAnimationUtil (ref), Players (ref), AnimationType (ref), KnitClient2 (ref)
        u8.maid:GiveTask(default.Client:WaitFor("FishFound"):expect():Connect(function(p13) -- Line: 82
            -- upvalues: u10 (ref), u8 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), KnitClient2 (ref), default (ref)
            if not u10() then
                return nil;
            end;

            local idleAnimation = u8.idleAnimation;

            if idleAnimation ~= nil then
                idleAnimation:Stop();
            end;

            u8.idleAnimation = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_PULLING, {
                looped = true
            });

            if u8.idleAnimation then
                u8.animationMaid:GiveTask(function() -- Line: 94
                    -- upvalues: u8 (ref)
                    local idleAnimation2 = u8.idleAnimation;

                    if idleAnimation2 ~= nil then
                        idleAnimation2 = idleAnimation2:Stop();
                    end;

                    return idleAnimation2;
                end);
            end;

            KnitClient2.Controllers.FishingMinigameController:startMinigame(p13.dropData, function(p14) -- Line: 102
                -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), default (ref), u8 (ref)
                local v15;

                if p14.win then
                    v15 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_CATCH_SUCCESS, {
                        looped = false
                    });
                    default.Client:Get("PullFishingRod"):SendToServer({
                        success = true
                    });
                else
                    v15 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_CATCH_FAIL, {
                        looped = false
                    });
                    default.Client:Get("PullFishingRod"):SendToServer({
                        success = false
                    });
                end;

                if v15 then
                    u8.animationMaid:GiveTask(v15);
                end;

                local idleAnimation2 = u8.idleAnimation;

                if idleAnimation2 ~= nil then
                    idleAnimation2:Stop();
                end;
            end);
        end));
    end);
end;

function u3.canLaunch(p16) -- Line: 131
    return not p16.activeFishing;
end;

function u3.onStartCharging(p17) -- Line: 134
end;

function u3.onStopCharging(p18) -- Line: 136
end;

function u3.onLaunch(u19, p20) -- Line: 138
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    u19.animationMaid:DoCleaning();
    u19.idleAnimation = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_IDLE, {
        looped = true
    });

    if u19.idleAnimation then
        u19.animationMaid:GiveTask(function() -- Line: 144
            -- upvalues: u19 (copy)
            local idleAnimation = u19.idleAnimation;

            if idleAnimation ~= nil then
                idleAnimation = idleAnimation:Stop();
            end;

            return idleAnimation;
        end);
    end;

    local u21 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_CAST, {
        looped = false
    });

    if u21 then
        u19.animationMaid:GiveTask(function() -- Line: 156
            -- upvalues: u21 (copy)
            return u21:Stop();
        end);
    end;

    if u21 ~= nil then
        u21:GetMarkerReachedSignal("cast"):Wait();
    end;

    return p20() and true or false;
end;

function u3.onStartReload(p22, p23) -- Line: 169
end;

function u3.isRelevantItem(p24, p25) -- Line: 171
    -- upvalues: ItemType (copy)
    return p25.itemType == ItemType.FISHING_ROD;
end;

KnitClient.CreateController(u3.new());

return nil;