-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "HellSaberController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 38
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 42
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "HellSaberController";
    p6.animationMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 47
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), default2 (copy), ClientSyncEvents (copy), Workspace (copy), Players (copy), RuntimeLib (copy), EntityUtil (copy), ChargeState (copy), getItemMeta (copy), GameAnimationUtil (copy)
    HandKnitController.KnitStart(u7);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.INFERNAL_SABER, {
        animations = { AnimationType.INFERNO_SWORD_CHARGE },
        sounds = { GameSound.INFERNAL_SWORD_CHARGE }
    });
    default2.Client:Get("HellBladeSpinEffect"):Connect(function(p8) -- Line: 53
        -- upvalues: u7 (copy)
        u7:playEffects(p8.player);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(u9) -- Line: 56
        -- upvalues: ItemType (ref), Workspace (ref), Players (ref), default2 (ref), KnitClient (ref), AnimationType (ref), RuntimeLib (ref), EntityUtil (ref)
        if u9.weapon.Name ~= ItemType.INFERNAL_SABER then
            return nil;
        end;

        if u9.chargedAttack.chargeTime >= 0.5 then
            local u10 = Workspace:GetServerTimeNow() + 0.25;
            Players.LocalPlayer:SetAttribute("IsCasting", u10);
            task.delay(0.25, function() -- Line: 63
                -- upvalues: Players (ref), u10 (copy)
                if Players.LocalPlayer:GetAttribute("IsCasting") == u10 then
                    return Players.LocalPlayer:SetAttribute("IsCasting", false);
                end;
            end);
            default2.Client:Get("HellBladeRelease"):SendToServer({
                chargeTime = u9.chargedAttack.chargeTime,
                player = u9.fromPlayer,
                weapon = u9.weapon
            });
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_INFERNO_SWORD_SPIN);
            local v11;

            if u9.chargedAttack.chargeTime >= 1.5 then
                v11 = u9.fromPlayer:GetAttribute("EmberUpgraded");
            else
                v11 = false;
            end;

            if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
                task.wait(0.2);
                RuntimeLib.Promise.defer(function() -- Line: 77
                    -- upvalues: EntityUtil (ref), u9 (copy), ItemType (ref), KnitClient (ref), AnimationType (ref)
                    local v12 = false;
                    local v13 = 0;

                    while true do
                        if v12 then
                            v13 = v13 + 1;
                        else
                            v12 = true;
                        end;

                        if v13 >= 3 then
                            return;
                        end;

                        local v14 = EntityUtil:getEntity(u9.fromPlayer);

                        if v14 ~= nil then
                            v14 = v14:getItemInHand();

                            if v14 ~= nil then
                                v14 = v14.Name;
                            end;
                        end;

                        if v14 ~= ItemType.INFERNAL_SABER then
                            return nil;
                        end;

                        task.wait(0.3);
                        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_INFERNO_SWORD_SPIN);
                    end;
                end);
            end;
        end;
    end);
    local u15 = nil;
    local u16 = nil;
    ClientSyncEvents.SwordCharge:connect(function(p17) -- Line: 110
        -- upvalues: ItemType (ref), u7 (copy), ChargeState (ref), Players (ref), getItemMeta (ref), u15 (ref), GameAnimationUtil (ref), AnimationType (ref), u16 (ref), KnitClient (ref)
        if p17.itemType ~= ItemType.INFERNAL_SABER then
            return nil;
        end;

        local chargingSound = u7.chargingSound;

        if chargingSound ~= nil then
            chargingSound:Stop();
        end;

        if p17.chargeState == ChargeState.Charging then
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

            local sword = getItemMeta(p17.itemType).sword;

            if sword ~= nil then
                sword = sword.chargedAttack;
            end;

            if not sword then
                return nil;
            end;

            u7:playChargeSound(Players.LocalPlayer.Character);
            u15 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.INFERNO_SWORD_CHARGE));
            u15:Play();
            u15:AdjustSpeed(1.83);
            u15:GetMarkerReachedSignal("end"):Connect(function() -- Line: 144
                -- upvalues: u15 (ref)
                local v18 = u15;

                if v18 ~= nil then
                    v18:AdjustSpeed(0);
                end;
            end);
            u16 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_INFERNO_SWORD_CHARGE);

            if u16 then
                u16:GetMarkerReachedSignal("end"):Connect(function() -- Line: 153
                    -- upvalues: u16 (ref)
                    local v19 = u16;

                    if v19 ~= nil then
                        v19:AdjustSpeed(0);
                    end;
                end);
            end;

            u7.animationMaid:GiveTask(function() -- Line: 160
                -- upvalues: u15 (ref), u16 (ref)
                local v20 = u15;

                if v20 ~= nil then
                    v20:Stop();
                end;

                local v21 = u15;

                if v21 ~= nil then
                    v21:Destroy();
                end;

                local v22 = u16;

                if v22 ~= nil then
                    v22:Stop();
                end;

                local v23 = u16;

                if v23 ~= nil then
                    v23:Destroy();
                end;
            end);
        elseif p17.chargeState == ChargeState.Charged then
            local chargingSound2 = u7.chargingSound;

            if chargingSound2 ~= nil then
                chargingSound2:Stop();
            end;
        end;

        if p17.chargeState == ChargeState.Idle then
            local v24 = u15;

            if v24 ~= nil then
                v24:Stop();
            end;

            local v25 = u15;

            if v25 ~= nil then
                v25:Destroy();
            end;

            local v26 = u16;

            if v26 ~= nil then
                v26:Stop();
            end;

            local v27 = u16;

            if v27 ~= nil then
                v27:Destroy();
            end;

            u7.animationMaid:DoCleaning();
        end;
    end);
end;

function u4.isRelevantItem(p28, p29) -- Line: 205
    -- upvalues: ItemType (copy)
    return p29.itemType == ItemType.INFERNAL_SABER;
end;

function u4.onEnable(p30, p31) -- Line: 208
end;

function u4.onDisable(p32) -- Line: 210
end;

function u4.playChargeSound(u33, p34) -- Line: 212
    -- upvalues: GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy)
    local INFERNAL_SWORD_CHARGE = GameSound.INFERNAL_SWORD_CHARGE;
    local v35 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p34)];

    if v35.ember then
        INFERNAL_SWORD_CHARGE = v35.ember.swordChargeSound;
    end;

    u33.chargingSound = SoundManager:playSound(INFERNAL_SWORD_CHARGE);

    if u33.chargingSound then
        u33.animationMaid:GiveTask(function() -- Line: 221
            -- upvalues: u33 (copy)
            local chargingSound = u33.chargingSound;

            if chargingSound ~= nil then
                chargingSound:Stop();
            end;
        end);
    end;
end;

function u4.playEffects(u36, p37) -- Line: 229
    -- upvalues: EntityUtil (copy), u2 (copy), ReplicatedStorage (copy), scaleModel (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Workspace (copy), GameQueryUtil (copy), ModelUtil (copy), InOutExpo (copy), RunService (copy), default (copy)
    local u38 = EntityUtil:getEntity(p37);

    if u38 == nil then
        return nil;
    end;

    local u39 = u2.new();
    local u40 = ReplicatedStorage.Assets.Effects.InfernalSwordSpin:Clone();
    u40:PivotTo(u38:getInstance():GetPrimaryPartCFrame());
    scaleModel(u40, 0.04);
    local v41 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(u38:getInstance())];
    local ember = v41.ember;

    if ember ~= nil then
        ember = ember.spinEffectColors;
    end;

    if ember then
        local ember2 = v41.ember;

        if ember2 ~= nil then
            ember2 = ember2.spinEffectColors.ring1;
        end;

        if ember2 then
            local ember3 = v41.ember;

            if ember3 ~= nil then
                ember3 = ember3.spinEffectColors.ring1;
            end;

            u40["ring.001"].Color = ember3;
        end;

        local ember3 = v41.ember;

        if ember3 ~= nil then
            ember3 = ember3.spinEffectColors.ring2;
        end;

        if ember3 then
            local ember4 = v41.ember;

            if ember4 ~= nil then
                ember4 = ember4.spinEffectColors.ring2;
            end;

            u40["ring.002"].Color = ember4;
        end;

        local ember4 = v41.ember;

        if ember4 ~= nil then
            ember4 = ember4.spinEffectColors.ring3;
        end;

        if ember4 then
            local ember5 = v41.ember;

            if ember5 ~= nil then
                ember5 = ember5.spinEffectColors.ring3;
            end;

            u40["ring.003"].Color = ember5;
        end;
    end;

    u40.Parent = Workspace;

    for _, child in u40:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    ModelUtil.tweenModelSize(u40, 0, InOutExpo, 10);
    local u42 = 0;
    local u44 = RunService.Heartbeat:Connect(function(p43) -- Line: 287
        -- upvalues: u38 (copy), u36 (copy), u39 (copy), u42 (ref), u40 (copy), default (ref)
        u38:getInstance():GetPrimaryPartCFrame();

        if not u36:validPlayerConditions(u38) then
            u39:DoCleaning();

            return nil;
        end;

        u42 = u42 + p43;

        if u40.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;
    end);
    task.delay(0.1, function() -- Line: 299
        -- upvalues: u39 (copy), u44 (copy), u40 (copy)
        u39:DoCleaning();
        u44:Disconnect();
        u40:Destroy();

        return nil;
    end);
end;

function u4.validPlayerConditions(p45, p46) -- Line: 306
    -- upvalues: ItemType (copy)
    if not p46:isAlive() then
        return false;
    end;

    local v47 = p46:getItemInHand();

    if v47 ~= nil then
        v47 = v47.Name;
    end;

    if v47 == ItemType.INFERNAL_SABER then
        return p46:getInstance().PrimaryPart ~= nil;
    end;

    return false;
end;

KnitClient.CreateController(u4.new());

return nil;