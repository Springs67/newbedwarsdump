-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "RocketLauncherController";
    end,

    __index = ProjectileSourceController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 24
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.constructor(p3, ...);
    p3.Name = "RocketLauncherController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p4);
end;

function u1.onEnable(p5, p6, p7) -- Line: 31
    -- upvalues: ProjectileSourceController (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    ProjectileSourceController.onEnable(p5, p6, p7);
    p5:setupYield(function() -- Line: 33
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u8 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.ROCKET_LAUNCHER_IDLE, {
            looped = true
        });

        return function() -- Line: 37
            -- upvalues: u8 (copy)
            local v9 = u8;

            if v9 ~= nil then
                v9:Stop();
            end;
        end;
    end);
end;

function u1.onStartCharging(p10) -- Line: 45
end;

function u1.onStopCharging(p11) -- Line: 47
end;

function u1.onLaunch(u12) -- Line: 49
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    task.spawn(function() -- Line: 50
        -- upvalues: u12 (copy), GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        u12.shootAnimation = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.ROCKET_LAUNCHER_SHOT, {
            looped = false
        });
    end);

    return true;
end;

function u1.onStartReload(p13, p14) -- Line: 57
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    if p13.shootAnimation and p13.shootAnimation.IsPlaying then
        p13.shootAnimation.Stopped:Wait();
    end;

    if not p14() then
        return nil;
    end;

    local u15 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.ROCKET_LAUNCHER_RELOAD, {
        looped = false
    });
    p13.maid:GiveTask(function() -- Line: 67
        -- upvalues: u15 (copy)
        local v16 = u15;

        if v16 ~= nil then
            v16:Stop();
        end;
    end);
end;

function u1.isRelevantItem(p17, p18) -- Line: 74
    -- upvalues: ItemType (copy)
    return p18.itemType == ItemType.ROCKET_LAUNCHER;
end;

KnitClient.CreateController(u1.new());

return nil;