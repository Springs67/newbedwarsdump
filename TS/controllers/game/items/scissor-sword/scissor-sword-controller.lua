-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ScissorSwordBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scissor-sword-balance").ScissorSwordBalance;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ScissorSwordComboHandler = RuntimeLib.import(script, script.Parent, "scissor-sword-combo-handler").ScissorSwordComboHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "ScissorSwordController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: HandKnitController (copy), ItemType (copy), getItemMeta (copy), AnimationType (copy), u2 (copy), ScissorSwordComboHandler (copy)
    HandKnitController.constructor(p5);
    p5.Name = "ScissorSwordController";
    p5.scissorSwordMeta = {
        [ItemType.HERO_SCISSOR_SWORD] = getItemMeta(ItemType.HERO_SCISSOR_SWORD),
        [ItemType.VILLAIN_SCISSOR_SWORD] = getItemMeta(ItemType.VILLAIN_SCISSOR_SWORD)
    };
    p5.swordSwingAnimations = { AnimationType.SCISSOR_SWORD_SWING_1, AnimationType.SCISSOR_SWORD_SWING_2 };
    p5.animationSequenceBufferSec = 0.5;
    p5.connectionMaid = u2.new();
    p5.lastSwingHadTarget = false;
    p5.sequenceIndex = 0;
    p5.comboHandler = ScissorSwordComboHandler.new();
end;

function u3.KnitStart(p6) -- Line: 49
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), AnimationType (copy)
    HandKnitController.KnitStart(p6);
    local PreloadController = KnitClient.Controllers.PreloadController;
    local HERO_SCISSOR_SWORD = ItemType.HERO_SCISSOR_SWORD;
    local v7 = {
        sounds = {
            GameSound.SCISSOR_SWORD_SLASH_FAST_HERO,
            GameSound.SCISSOR_SWORD_SLASH_SLOW_HERO,
            GameSound.SCISSOR_SWORD_SLASH_FAST_VILLAIN,
            GameSound.SCISSOR_SWORD_SLASH_SLOW_VILLAIN
        }
    };
    local v8 = {};
    local v9 = #v8;
    local swordSwingAnimations = p6.swordSwingAnimations;
    local v10 = #swordSwingAnimations;
    table.move(swordSwingAnimations, 1, v10, v9 + 1, v8);
    v8[v9 + v10 + 1] = AnimationType.FP_SWING_SWORD;
    v7.animations = v8;
    PreloadController:preloadForItemType(HERO_SCISSOR_SWORD, v7);
    local PreloadController2 = KnitClient.Controllers.PreloadController;
    local VILLAIN_SCISSOR_SWORD = ItemType.VILLAIN_SCISSOR_SWORD;
    local v11 = {
        sounds = {
            GameSound.SCISSOR_SWORD_SLASH_FAST_HERO,
            GameSound.SCISSOR_SWORD_SLASH_SLOW_HERO,
            GameSound.SCISSOR_SWORD_SLASH_FAST_VILLAIN,
            GameSound.SCISSOR_SWORD_SLASH_SLOW_VILLAIN
        }
    };
    local v12 = {};
    local v13 = #v12;
    local swordSwingAnimations2 = p6.swordSwingAnimations;
    local v14 = #swordSwingAnimations2;
    table.move(swordSwingAnimations2, 1, v14, v13 + 1, v12);
    v12[v13 + v14 + 1] = AnimationType.FP_SWING_SWORD;
    v11.animations = v12;
    PreloadController2:preloadForItemType(VILLAIN_SCISSOR_SWORD, v11);
end;

function u3.isRelevantItem(p15, p16) -- Line: 82
    return p15.scissorSwordMeta[p16.itemType] ~= nil;
end;

function u3.onEnable(u17, u18, p19) -- Line: 87
    -- upvalues: ClientSyncEvents (copy), SoundManager (copy), ChargeState (copy), AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), ItemType (copy), Flamework (copy), CooldownId (copy), ScissorSwordBalance (copy), GameSound (copy)
    local _ = u17.scissorSwordMeta[u18.itemType];
    u17.comboHandler:enable();
    u17.connectionMaid:GiveTask(function() -- Line: 92
        -- upvalues: u17 (copy)
        return u17.comboHandler:disable();
    end);
    u17.connectionMaid:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p20) -- Line: 95
        -- upvalues: u17 (copy), SoundManager (ref), u18 (copy)
        if u17.animationRunning and u17.lastSwingHadTarget then
            p20:setCancelled(true);
        end;

        if u17.animationRunning then
            return nil;
        end;

        if not u17.animationRunning then
            if p20.targetEntity then
                local soundPlaying = u17.soundPlaying;

                if soundPlaying ~= nil then
                    soundPlaying:Stop();
                end;

                u17.soundPlaying = SoundManager:playSound(u17:getHitSound(u18.itemType, p20.attackSpeed));
            end;

            u17.animationRunning = u17:playSwingAnimation(p20.swordType, u17.sequenceIndex);
            local v21 = u17;
            v21.sequenceIndex = v21.sequenceIndex + 1;
            u17.lastSwingHadTarget = p20.targetEntity and true or false;

            if not u17.lastSwingHadTarget then
                u17.animationRunning = nil;

                return nil;
            end;

            if u17.animationRunning then
                u17.animationRunning:AdjustSpeed(u17.animationRunning.Length / p20.attackSpeed);
                u17.connectionMaid:GiveTask(u17.animationRunning.Stopped:Once(function() -- Line: 124
                    -- upvalues: u17 (ref)
                    u17.animationRunning = nil;
                end));
            end;
        end;
    end));
    u17.connectionMaid:GiveTask(ClientSyncEvents.SwordCharge:connect(function(p22) -- Line: 130
        -- upvalues: u17 (copy), ChargeState (ref), AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), ItemType (ref), Flamework (ref), CooldownId (ref), ScissorSwordBalance (ref), SoundManager (ref), GameSound (ref)
        if u17.scissorSwordMeta[p22.itemType] ~= nil and p22.chargeState == ChargeState.Charged then
            if p22.chargeState == ChargeState.Charged then
                u17.animationRunning = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.SCISSOR_SWORD_COMBO_STRIKE));
                KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.BEAR_CLAWS_FLURRY);

                if u17.animationRunning then
                    u17.connectionMaid:GiveTask(u17.animationRunning.Stopped:Once(function() -- Line: 142
                        -- upvalues: u17 (ref)
                        u17.animationRunning = nil;
                    end));
                end;

                local v23;

                if p22.itemType == ItemType.HERO_SCISSOR_SWORD then
                    v23 = Color3.fromRGB(255, 224, 112);
                else
                    v23 = Color3.fromRGB(88, 46, 158);
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.SCISSOR_SWORD_CHARGED_SWING, ScissorSwordBalance.COMBO_STRIKE_COOLDOWN_SEC, {
                    cooldownBar = {
                        color = v23
                    }
                });

                return;
            end;

            if p22.chargeState == ChargeState.Charging then
                local soundPlaying = u17.soundPlaying;

                if soundPlaying ~= nil then
                    soundPlaying:Stop();
                end;

                u17.soundPlaying = SoundManager:playSound(GameSound.SCISSOR_SWORD_CHARGE_UP);
            end;
        end;
    end));
end;

function u3.onDisable(p24) -- Line: 162
    p24.connectionMaid:DoCleaning();
end;

function u3.getSwingAnimations(p25) -- Line: 165
    -- upvalues: AnimationType (copy), KnitClient (copy)
    local v26 = { AnimationType.FP_SWING_SWORD };

    if KnitClient.Controllers.ViewmodelController:isVisible() then
        return v26;
    end;

    return p25.swordSwingAnimations;
end;

function u3.getHitSound(p27, p28, p29) -- Line: 169
    -- upvalues: ItemType (copy), GameSound (copy)
    if p28 == ItemType.HERO_SCISSOR_SWORD then
        if p29 <= 0.4 then
            return GameSound.SCISSOR_SWORD_SLASH_FAST_HERO;
        end;

        return GameSound.SCISSOR_SWORD_SLASH_SLOW_HERO;
    end;

    if p29 <= 0.4 then
        return GameSound.SCISSOR_SWORD_SLASH_FAST_VILLAIN;
    end;

    return GameSound.SCISSOR_SWORD_SLASH_SLOW_VILLAIN;
end;

function u3.playSwingAnimation(p30, p31, p32) -- Line: 176
    -- upvalues: KnitClient (copy), GameAnimationUtil (copy), Players (copy)
    local v33 = p30:getSwingAnimations();
    local v34 = v33[p32 % #v33 + 1];

    if KnitClient.Controllers.ViewmodelController:isVisible() then
        return KnitClient.Controllers.ViewmodelController:playAnimation(v34);
    end;

    return GameAnimationUtil:playAnimation(Players.LocalPlayer, v34);
end;

KnitClient.CreateController(u3.new());

return nil;