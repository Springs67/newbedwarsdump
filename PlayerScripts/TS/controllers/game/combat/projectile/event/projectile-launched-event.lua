-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local CancellableEvent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "ProjectileLaunchedEvent";
    end,

    __index = CancellableEvent
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6, p7, p8, p9) -- Line: 21
    -- upvalues: CancellableEvent (copy), StatusEffectUtil (copy)
    CancellableEvent.constructor(p3);
    p3.projectileType = p4;
    p3.projectile = p5;
    p3.launchVelocity = p6;
    p3.origin = p7;
    p3.shooter = p8;
    p3.launchData = p9;
    p3.statusEffects = {};

    if p8 and p8 ~= "__UNDEFINED_EVENT_PARAMETER" then
        p3.statusEffects = StatusEffectUtil:getAllActive(p8);
    end;
end;

function u1.isLocalShooter(p10) -- Line: 37
    -- upvalues: Players (copy)
    local v11;

    if p10.shooter == nil then
        v11 = false;
    else
        v11 = p10.shooter == Players.LocalPlayer.Character;
    end;

    return v11;
end;

function u1.getShooterHandItem(p12) -- Line: 40
    -- upvalues: Players (copy), InventoryUtil (copy)
    if not p12.shooter then
        return nil;
    end;

    local v13 = Players:GetPlayerFromCharacter(p12.shooter);

    if v13 then
        return InventoryUtil.getInventory(v13).hand;
    end;

    return nil;
end;

function u1.hasStatusEffect(p14, u15) -- Line: 50
    local function _(p16) -- Line: 52
        -- upvalues: u15 (copy)
        return p16.statusEffect == u15;
    end;

    local v17 = nil;

    for i, v in p14.statusEffects do
        local _ = i - 1;

        if v.statusEffect == u15 == true then
            v17 = v;
            break;
        end;
    end;

    return v17 ~= nil;
end;

function u1.getActiveStatusEffects(p18) -- Line: 66
    return p18.statusEffects;
end;

return {
    ProjectileLaunchedEvent = u1
};