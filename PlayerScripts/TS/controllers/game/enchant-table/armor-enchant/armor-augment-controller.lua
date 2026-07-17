-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ArmorAugmentController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3, p4) -- Line: 19
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.Name = "ArmorAugmentController";
    p2.armorEnchant = p3;
    p2.statusEffectType = p4;
end;

function v1.KnitStart(u5) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy), KnitClient (copy), ClientSyncEvents (copy), EntityUtil (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("ArmorAugmentUpgraded"):Connect(function(u6) -- Line: 27
        -- upvalues: u5 (copy), AUGMENT_UPGRADE_EFFECT_DURATION (ref), KnitClient (ref)
        if u6.armorEnchantName ~= u5.armorEnchant then
            return nil;
        end;

        u5:onArmorAugmentUpgraded(u6.player);
        task.delay(AUGMENT_UPGRADE_EFFECT_DURATION, function() -- Line: 32
            -- upvalues: KnitClient (ref), u6 (copy)
            KnitClient.Controllers.ArmorAugmentManagerController:refreshArmorModels(u6.player);
        end);
    end);
    default.Client:Get("ArmorAugmentPassiveProced"):Connect(function(p7) -- Line: 36
        -- upvalues: u5 (copy)
        if p7.armorEnchantName ~= u5.armorEnchant then
            return nil;
        end;

        u5:onArmorAugmentProced(p7.player, p7.procedBy);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p8) -- Line: 42
        -- upvalues: u5 (copy), EntityUtil (ref)
        if p8.statusEffect ~= u5.statusEffectType then
            return nil;
        end;

        local v9 = EntityUtil:getPlayerFromEntityInstance(p8.entityInstance);

        if not v9 then
            return nil;
        end;

        u5:onArmorEnchantRemoved(v9);
    end);
end;

return {
    ArmorAugmentController = v1
};