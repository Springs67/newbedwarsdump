-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ScissorSwordBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scissor-sword-balance").ScissorSwordBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ScissorSwordComboHandler";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: u1 (copy)
    p4.comboCount = 0;
    p4.lastComboTime = 0;
    p4.eventMaid = u1.new();
end;

function u2.enable(u5) -- Line: 27
    -- upvalues: EntityDamageEventZap (copy), Players (copy), ScissorSwordBalance (copy), ClientSyncEvents (copy), SyncEventPriority (copy)
    local u22 = EntityDamageEventZap.On(function(p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19) -- Line: 28
        -- upvalues: Players (ref), u5 (copy), ScissorSwordBalance (ref)
        if p10 ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local v20 = os.time();

        if u5.lastComboTime + ScissorSwordBalance.COMBO_TIME_WINDOW_SEC < v20 then
            u5.comboCount = 0;
        else
            local v21 = u5;
            v21.comboCount = v21.comboCount + 1;
        end;

        u5.lastComboTime = v20;
    end);
    u5.eventMaid:GiveTask(function() -- Line: 42
        -- upvalues: u22 (copy)
        u22();
    end);
    u5.eventMaid:GiveTask(ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p23) -- Line: 45
        -- upvalues: u5 (copy)
        if p23:isCancelled() or not u5:isScissorSword(p23.swordType) then
            return nil;
        end;

        p23.attackSpeed = u5:getAttackSpeedFromComboCount();
    end));
end;

function u2.disable(p24) -- Line: 53
    p24.eventMaid:DoCleaning();
end;

function u2.isScissorSword(p25, p26) -- Line: 56
    -- upvalues: ItemType (copy)
    return p26 == ItemType.VILLAIN_SCISSOR_SWORD and true or p26 == ItemType.HERO_SCISSOR_SWORD;
end;

function u2.getAttackSpeedFromComboCount(p27) -- Line: 59
    -- upvalues: ScissorSwordBalance (copy)
    local v28 = 5 / (math.exp((p27.comboCount * -1 + 5) / 3) + 1);

    return ScissorSwordBalance.BASE_ATTACK_SPEED_SEC / v28;
end;

return {
    ScissorSwordComboHandler = u2
};