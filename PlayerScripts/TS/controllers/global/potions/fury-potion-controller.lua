-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BlackMarketeerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "black-marketeer-balance").BlackMarketeerBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "FuryPotionController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "FuryPotionController";
    p3.entityInstanceMaid = {};
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), BlackMarketeerBalance (copy)
    KnitController.KnitStart(p4);
    ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGH):connect(function(p5) -- Line: 32
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), BlackMarketeerBalance (ref)
        local v6 = EntityUtil:getLocalPlayerEntity();

        if not v6 then
            return nil;
        end;

        if not StatusEffectUtil:isActive(v6:getInstance(), StatusEffectType.FURY_POTION) then
            return nil;
        end;

        p5.attackSpeed = p5.attackSpeed * (1 - (BlackMarketeerBalance.FURY_POTION_ATTACK_SPEED_MULTIPLIER - 1));
        p5.config = {
            respectAttackSpeedOverride = true
        };
    end);
end;

KnitClient.CreateController(u1.new());

return nil;