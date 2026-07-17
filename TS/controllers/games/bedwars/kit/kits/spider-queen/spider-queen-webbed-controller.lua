-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SpiderQueenBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "spider-queen-balance").SpiderQueenBalance;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SpiderQueenWebbedController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "SpiderQueenWebbedController";
    p4.slowMaid = u1.new();
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), StatusEffectUtil (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 32
        -- upvalues: StatusEffectType (ref), Players (ref), StatusEffectUtil (ref), u5 (copy)
        if p6.statusEffect ~= StatusEffectType.SPIDER_WEB_SLOW then
            return nil;
        end;

        local v7 = Players:GetPlayerFromCharacter(p6.entityInstance);

        if not v7 then
            return nil;
        end;

        if v7 ~= Players.LocalPlayer then
            return nil;
        end;

        u5:applySlow(v7, (StatusEffectUtil:getStacks(p6.entityInstance, p6.statusEffect)));
    end);
    ClientSyncEvents.StatusEffectChanged:connect(function(p8) -- Line: 46
        -- upvalues: StatusEffectType (ref), Players (ref), StatusEffectUtil (ref), u5 (copy)
        if p8.statusEffect ~= StatusEffectType.SPIDER_WEB_SLOW then
            return nil;
        end;

        local v9 = Players:GetPlayerFromCharacter(p8.entityInstance);

        if not v9 then
            return nil;
        end;

        if v9 ~= Players.LocalPlayer then
            return nil;
        end;

        u5:applySlow(v9, (StatusEffectUtil:getStacks(p8.entityInstance, p8.statusEffect)));
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p10) -- Line: 60
        -- upvalues: StatusEffectType (ref), Players (ref), u5 (copy)
        if p10.statusEffect ~= StatusEffectType.SPIDER_WEB_SLOW then
            return nil;
        end;

        local v11 = Players:GetPlayerFromCharacter(p10.entityInstance);

        if not v11 then
            return nil;
        end;

        if v11 ~= Players.LocalPlayer then
            return nil;
        end;

        u5.slowMaid:DoCleaning();
    end);
end;

function u2.applySlow(p12, p13, p14) -- Line: 74
    -- upvalues: u1 (copy), KnitClient (copy), SpiderQueenBalance (copy), ClientSyncEvents (copy)
    p12.slowMaid:DoCleaning();
    local u15 = u1.new();
    p12.slowMaid = u15;
    local v16 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 1 - SpiderQueenBalance.SPIDER_WEB_SLOW_PER_STACK * p14
    });
    print("CLIENT Applying slow to player of ", 1 - SpiderQueenBalance.SPIDER_WEB_SLOW_PER_STACK * p14);
    u15:GiveTask(v16);
    local duration = ClientSyncEvents.DebuffDurationModifierCheck:fire(SpiderQueenBalance.SPIDER_WEB_SLOW_DURATION).duration;
    task.delay(duration, function() -- Line: 84
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);
end;

KnitClient.CreateController(u2.new());

return nil;