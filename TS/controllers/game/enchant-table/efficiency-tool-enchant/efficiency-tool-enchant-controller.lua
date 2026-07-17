-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EnchantBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local BlockBreakController = RuntimeLib.import(script, script.Parent.Parent.Parent, "block-break-controller").BlockBreakController;
local u1 = {
    GameSound.EFFICIENCY_TOOL_ENCHANT_HIT_1,
    GameSound.EFFICIENCY_TOOL_ENCHANT_HIT_2,
    GameSound.EFFICIENCY_TOOL_ENCHANT_HIT_3,
    GameSound.EFFICIENCY_TOOL_ENCHANT_HIT_4
};
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "EfficiencyToolEnchantController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 27
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "EfficiencyToolEnchantController";
end;

function u2.KnitStart(p5) -- Line: 35
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), BlockBreakController (copy), EnchantBalance (copy), InventoryUtil (copy), Players (copy), getItemMeta (copy), EntityUtil (copy), StatusEffectUtil (copy), u1 (copy), SoundManager (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 37
        -- upvalues: StatusEffectType (ref), BlockBreakController (ref), EnchantBalance (ref)
        local v7 = p6.statusEffect == StatusEffectType.TOOL_ENCHANT_EFFICIENCY and BlockBreakController:getBlockBreaker();

        if v7 then
            v7:setCooldown(v7:getCooldown() * (1 - EnchantBalance.EFFICIENCY_TOOL_PERCENT / 100));
        end;
    end);
    ClientSyncEvents.DamageBlock:connect(function(p8) -- Line: 46
        -- upvalues: InventoryUtil (ref), Players (ref), getItemMeta (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), u1 (ref), SoundManager (ref)
        if p8:isCancelled() then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand then
            local v9 = getItemMeta(hand.itemType);
            local v10 = EntityUtil:getEntity(Players.LocalPlayer);

            if v10 ~= nil then
                v10 = v10:getInstance();
            end;

            if v9.breakBlock and (v10 and StatusEffectUtil:isActive(v10, StatusEffectType.TOOL_ENCHANT_EFFICIENCY)) then
                SoundManager:playSound(u1[math.random(0, #u1 - 1) + 1], {
                    volumeMultiplier = 0.2
                });
            end;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p11) -- Line: 67
        -- upvalues: StatusEffectType (ref), BlockBreakController (ref)
        if p11.statusEffect == StatusEffectType.TOOL_ENCHANT_EFFICIENCY and BlockBreakController:getBlockBreaker() then
            BlockBreakController:setDefaultCooldown();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;