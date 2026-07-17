-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local AUGMENT_UPGRADE_EFFECT_DURATION = RuntimeLib.import(script, script.Parent, "armor-enchant", "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION;
local u1 = {
    [StatusEffectType.ENCHANT_FIRE] = GameSound.FIRE_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_STATIC] = GameSound.STATIC_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_CRITICAL_STRIKE] = GameSound.CRIT_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_FOREST] = GameSound.FOREST_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_CLOUD] = GameSound.CLOUD_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_SOUL_REAVER] = GameSound.SOUL_REAVER_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_EXECUTE] = GameSound.EXECUTE_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_CLEAVE] = GameSound.CLEAVE_ENCHANT_APPLY,
    [StatusEffectType.ENCHANT_BERSERKER] = GameSound.BERSERKER_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_ABSORPTION] = GameSound.ABSORPTION_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_BLOCKING] = GameSound.BLOCKING_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_SAFEGUARD] = GameSound.SOUND_BARRIER_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_FROST] = GameSound.FROST_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_ENDURANCE] = GameSound.ENDURANCE_ENCHANT_APPLY,
    [StatusEffectType.ARMOR_ENCHANT_SWIFT] = GameSound.SWIFT_ENCHANT_APPLY,
    [StatusEffectType.TOOL_ENCHANT_CRITICAL_STRIKE] = GameSound.SHATTER_STRIKE_ENCHANT_APPLY,
    [StatusEffectType.TOOL_ENCHANT_EXPLOSIVE] = GameSound.EXPLOSIVE_ENCHANT_APPLY,
    [StatusEffectType.TOOL_ENCHANT_HEAVY_HITTER] = GameSound.HEAVY_HITTER_ENCHANT_APPLY,
    [StatusEffectType.TOOL_ENCHANT_EFFICIENCY] = GameSound.EFFICIENCY_ENCHANT_APPLY,
    [StatusEffectType.GROUNDED] = GameSound.GROUNDED_EFFECT_APPLY
};
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "EnchantSoundController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 43
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 47
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "EnchantSoundController";
end;

function u2.KnitStart(p5) -- Line: 51
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Players (copy), u1 (copy), StatusEffectType (copy), AUGMENT_UPGRADE_EFFECT_DURATION (copy), SoundManager (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 53
        -- upvalues: Players (ref), u1 (ref), StatusEffectType (ref), AUGMENT_UPGRADE_EFFECT_DURATION (ref), SoundManager (ref)
        local v7 = Players:GetPlayerFromCharacter(p6.entityInstance);

        if v7 and v7 == Players.LocalPlayer then
            local u8 = u1[p6.statusEffect];

            if u8 == "" or not u8 then
                return nil;
            end;

            local u9 = (p6.statusEffect == StatusEffectType.TOOL_ENCHANT_EXPLOSIVE or p6.statusEffect == StatusEffectType.ARMOR_ENCHANT_SWIFT) and 0.6 or 1;
            task.delay(AUGMENT_UPGRADE_EFFECT_DURATION - 0.05, function() -- Line: 65
                -- upvalues: SoundManager (ref), u8 (copy), u9 (ref)
                SoundManager:playSound(u8, {
                    volumeMultiplier = u9
                });
            end);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;