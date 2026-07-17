-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "FryingPanController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "FryingPanController";
    p4.animationMaid = u1.new();
end;

function u2.KnitStart(u5) -- Line: 35
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), ClientSyncEvents (copy), EntityUtil (copy), Players (copy), ChargeState (copy), getItemMeta (copy), GameAnimationUtil (copy), SoundManager (copy)
    KnitController.KnitStart(u5);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.FRYING_PAN, {
        animations = { AnimationType.PAN_CHARGE },
        sounds = { GameSound.FRYING_PAN_CHARGE, GameSound.FRYING_PAN_HIT }
    });
    local u6 = nil;
    ClientSyncEvents.SwordCharge:connect(function(p7) -- Line: 42
        -- upvalues: EntityUtil (ref), Players (ref), ItemType (ref), ChargeState (ref), getItemMeta (ref), u6 (ref), GameAnimationUtil (ref), AnimationType (ref), u5 (copy), SoundManager (ref), GameSound (ref)
        EntityUtil:getEntity(Players.LocalPlayer);

        if p7.itemType ~= ItemType.FRYING_PAN then
            return nil;
        end;

        if p7.chargeState == ChargeState.Charging then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChild("Humanoid");

                if Character ~= nil then
                    Character = Character:FindFirstChild("Animator");
                end;
            end;

            if not Character then
                return nil;
            end;

            local v8 = getItemMeta(p7.itemType);
            local sword = v8.sword;

            if sword ~= nil then
                sword = sword.chargedAttack;
            end;

            if not sword then
                return nil;
            end;

            u6 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PAN_CHARGE));
            local v9 = u6.Length / v8.sword.chargedAttack.maxChargeTimeSec;
            u6:Play();
            u6:AdjustSpeed(v9);
            u6:GetMarkerReachedSignal("end"):Connect(function() -- Line: 71
                -- upvalues: u6 (ref)
                local v10 = u6;

                if v10 ~= nil then
                    v10:AdjustSpeed(0);
                end;
            end);
            u5.animationMaid:GiveTask(function() -- Line: 77
                -- upvalues: u6 (ref)
                local v11 = u6;

                if v11 ~= nil then
                    v11:Stop();
                end;

                local v12 = u6;

                if v12 ~= nil then
                    v12:Destroy();
                end;
            end);
            local u13 = SoundManager:playSound(GameSound.FRYING_PAN_CHARGE);

            if u13 then
                u5.animationMaid:GiveTask(function() -- Line: 89
                    -- upvalues: u13 (copy)
                    u13:Stop();
                end);
            end;
        else
            local _ = p7.chargeState == ChargeState.Charged;
        end;

        if p7.chargeState == ChargeState.Idle then
            u5.animationMaid:DoCleaning();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;