-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BEAR_CLAWS_FLURRY = AnimationType.BEAR_CLAWS_FLURRY;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "BearClawsController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy), ItemType (copy), ChargeState (copy)
    KnitController.constructor(p4);
    p4.Name = "BearClawsController";
    p4.bearClawsType = ItemType.BEAR_CLAWS;
    p4.chargeState = ChargeState.Idle;
end;

function u2.KnitStart(u5) -- Line: 39
    -- upvalues: KnitController (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.SwordCharge:connect(function(p6) -- Line: 41
        -- upvalues: u5 (copy)
        if p6.itemType == u5.bearClawsType then
            if u5:isCharging(p6.chargeState) then
                u5:handleCharging();
            elseif u5:isCharged(p6.chargeState) then
                u5:handleChargedSwipe();
            end;
        end;

        u5.chargeState = p6.chargeState;
    end);
end;

function u2.isCharging(p7, p8) -- Line: 53
    -- upvalues: ChargeState (copy)
    return p8 == ChargeState.Charging;
end;

function u2.isCharged(p9, p10) -- Line: 56
    -- upvalues: ChargeState (copy)
    local v11;

    if p9.chargeState == ChargeState.Charged then
        v11 = p10 == ChargeState.Idle;
    else
        v11 = false;
    end;

    return v11;
end;

function u2.handleCharging(p12) -- Line: 59
end;

function u2.handleChargedSwipe(p13) -- Line: 61
    p13:playFlurryAnimation();
    p13:playFlurrySound();
end;

function u2.playFlurryAnimation(p14) -- Line: 65
    -- upvalues: AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), BEAR_CLAWS_FLURRY (copy), KnitClient (copy)
    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(BEAR_CLAWS_FLURRY));
    KnitClient.Controllers.ViewmodelController:playAnimation(BEAR_CLAWS_FLURRY);
end;

function u2.playFlurrySound(p15) -- Line: 69
    -- upvalues: SoundManager (copy), GameSound (copy)
    task.delay(0.33, function() -- Line: 70
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.BEAR_CLAWS_FLURRY);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;