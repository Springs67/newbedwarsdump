-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local LumenBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "lumen", "lumen-balance").LumenBalance;
local OverpoweredGameBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "overpowered", "overpowered-game-balance").OverpoweredGameBalance;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "HeavenlySwordController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p7);
    p7.Name = "HeavenlySwordController";
    p7.animationMaid = u3.new();
    p7.multiShotMaid = u3.new();
end;

function u5.KnitStart(u8) -- Line: 49
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), default (copy), ClientSyncEvents (copy), KnitClient2 (copy), QueueType (copy), OverpoweredGameBalance (copy), LumenBalance (copy), ChargeState (copy), Players (copy), getItemMeta (copy), GameAnimationUtil (copy)
    KnitController.KnitStart(u8);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HEAVENLY_SWORD, {
        animations = { AnimationType.HEAVENLY_SWORD_CHARGE, AnimationType.HEAVENLY_SWORD_SWING },
        sounds = { GameSound.LIGHT_SWORD_CHARGE }
    });
    default.Client:Get("PlayerLightSwordSwing"):Connect(function(p9) -- Line: 55
        -- upvalues: u8 (copy)
        u8:playEffect(p9.cFrame, p9.shooter);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(p10) -- Line: 58
        -- upvalues: ItemType (ref), u8 (copy), KnitClient2 (ref), QueueType (ref), OverpoweredGameBalance (ref), LumenBalance (ref), AnimationType (ref), KnitClient (ref)
        if p10.weapon.Name ~= ItemType.HEAVENLY_SWORD then
            return nil;
        end;

        local chargedAttack = p10.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeTime;
        end;

        if chargedAttack == 0 or (chargedAttack ~= chargedAttack or not chargedAttack) then
            return nil;
        end;

        local v11 = 1;

        if not u8.queueType then
            u8.queueType = KnitClient2.Controllers.MatchController:getQueueType();
        end;

        if u8.queueType == QueueType.OVERPOWERED then
            v11 = OverpoweredGameBalance.SwordChargeTimeMultiplier;
        end;

        if p10.chargedAttack.chargeTime < LumenBalance.MIN_CHARGE_TIME * v11 then
            KnitClient2.Controllers.DefaultProjectileSourceController:clearProjectileHandler();

            return nil;
        end;

        local v12 = p10.fromPlayer:GetAttribute("LumenUpgraded");

        if p10.chargedAttack.chargeTime <= LumenBalance.MAX_CHARGE_TIME * v11 or (v12 == 0 or (v12 ~= v12 or (v12 == "" or not v12))) then
            u8:fire(p10.fromPlayer, p10.weapon, p10.chargedAttack.chargeTime);
        end;

        if p10.chargedAttack.chargeTime < LumenBalance.MAX_CHARGE_TIME * v11 then
            v12 = false;
        end;

        if v12 ~= 0 and (v12 == v12 and (v12 ~= "" and v12)) then
            u8:playAnimation(AnimationType.BEAR_CLAWS_FLURRY);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.BEAR_CLAWS_FLURRY);
            u8:fireMultiple(p10.fromPlayer, p10.weapon, p10.chargedAttack.chargeTime);
        end;
    end);
    local u13 = nil;
    local u14 = nil;
    ClientSyncEvents.SwordCharge:connect(function(u15) -- Line: 93
        -- upvalues: ItemType (ref), ChargeState (ref), Players (ref), getItemMeta (ref), u8 (copy), u13 (ref), GameAnimationUtil (ref), AnimationType (ref), u14 (ref), KnitClient (ref)
        if u15.itemType ~= ItemType.HEAVENLY_SWORD then
            return nil;
        end;

        task.spawn(function() -- Line: 97
            -- upvalues: u15 (copy), ChargeState (ref), Players (ref), getItemMeta (ref), u8 (ref), u13 (ref), GameAnimationUtil (ref), AnimationType (ref), u14 (ref), KnitClient (ref)
            if u15.chargeState == ChargeState.Charging then
                Players.LocalPlayer:SetAttribute("IsCharging", true);
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

                local v16 = getItemMeta(u15.itemType);
                local sword = v16.sword;

                if sword ~= nil then
                    sword = sword.chargedAttack;
                end;

                if not sword then
                    return nil;
                end;

                u8:playSound();
                local sword2 = v16.sword;

                if sword2 ~= nil then
                    sword2 = sword2.chargedAttack.walkSpeedModifier;

                    if sword2 ~= nil then
                        sword2 = sword2.delay;
                    end;
                end;

                task.wait(sword2 == nil and 0 or sword2);
                local v17 = Players.LocalPlayer:GetAttribute("IsCharging");

                if v17 == 0 or (v17 ~= v17 or (v17 == "" or not v17)) then
                    return nil;
                end;

                u13 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.HEAVENLY_SWORD_CHARGE));
                u13:Play();
                u13:AdjustSpeed(0.683);
                u13:GetMarkerReachedSignal("end"):Connect(function() -- Line: 142
                    -- upvalues: u13 (ref)
                    local v18 = u13;

                    if v18 ~= nil then
                        v18:AdjustSpeed(0);
                    end;
                end);
                u14 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HEAVENLY_SWORD_CHARGE);

                if u14 then
                    u14:GetMarkerReachedSignal("end"):Connect(function() -- Line: 151
                        -- upvalues: u14 (ref)
                        local v19 = u14;

                        if v19 ~= nil then
                            v19:AdjustSpeed(0);
                        end;
                    end);
                end;

                u8.animationMaid:GiveTask(function() -- Line: 158
                    -- upvalues: u13 (ref), u14 (ref)
                    local v20 = u13;

                    if v20 ~= nil then
                        v20:Stop();
                    end;

                    local v21 = u13;

                    if v21 ~= nil then
                        v21:Destroy();
                    end;

                    local v22 = u14;

                    if v22 ~= nil then
                        v22:Stop();
                    end;

                    local v23 = u14;

                    if v23 ~= nil then
                        v23:Destroy();
                    end;
                end);
            else
                local _ = u15.chargeState == ChargeState.Charged;
            end;

            if u15.chargeState == ChargeState.Idle then
                Players.LocalPlayer:SetAttribute("IsCharging", false);
                local v24 = u13;

                if v24 ~= nil then
                    v24:Stop();
                end;

                local v25 = u13;

                if v25 ~= nil then
                    v25:Destroy();
                end;

                local v26 = u14;

                if v26 ~= nil then
                    v26:Stop();
                end;

                local v27 = u14;

                if v27 ~= nil then
                    v27:Destroy();
                end;

                u8.animationMaid:DoCleaning();
            end;
        end);
    end);
end;

function u5.fire(p28, p29, p30, p31) -- Line: 201
    -- upvalues: getItemMeta (copy), ItemType (copy), KnitClient2 (copy), ProjectileHandler (copy), GameSound (copy), EntityUtil (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), QueueType (copy), OverpoweredGameBalance (copy), LumenBalance (copy), SoundManager (copy)
    local v32 = getItemMeta(ItemType.HEAVENLY_SWORD);

    if not v32 then
        return nil;
    end;

    local v33 = KnitClient2.Controllers.DefaultProjectileSourceController:getProjectileHandler() or ProjectileHandler.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 2, 0), 0, nil);
    KnitClient2.Controllers.DefaultProjectileSourceController:clearProjectileHandler();
    local v34 = nil;
    local LIGHT_SWORD_ATTACK = GameSound.LIGHT_SWORD_ATTACK;
    local v35 = EntityUtil:getEntity(p29);

    if v35 ~= nil then
        v35 = v35:getInstance();
    end;

    if v35 then
        local v36 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v35)];

        if v36.lumen then
            LIGHT_SWORD_ATTACK = v36.lumen.swordAttackSound;
            v34 = v36.lumen.heavenlySwordWave;
        end;

        local v37 = p28.queueType ~= QueueType.OVERPOWERED and 1 or OverpoweredGameBalance.SwordChargeTimeMultiplier;

        if LumenBalance.MAX_CHARGE_TIME * v37 - (LumenBalance.MAX_CHARGE_TIME * v37 - LumenBalance.MIN_CHARGE_TIME * v37) / 2.5 <= p31 then
            v34 = ItemType.HEAVENLY_SWORD;

            if v36.lumen then
                v34 = v36.lumen.heavenlySwordWave1;
            end;
        end;
    end;

    SoundManager:playSound(LIGHT_SWORD_ATTACK);
    KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.HEAVENLY_SWORD, v34, v33, p30, v32.projectileSource);
end;

function u5.fireMultiple(u38, u39, u40, p41) -- Line: 239
    -- upvalues: getItemMeta (copy), ItemType (copy), EntityUtil (copy), KnitClient2 (copy), ProjectileHandler (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Workspace (copy), RuntimeLib (copy), GameSound (copy), SoundManager (copy)
    local u42 = getItemMeta(ItemType.HEAVENLY_SWORD);
    local u43 = 0.3;
    local u44 = nil;
    local u45 = EntityUtil:getEntity(u39);

    if not u42 then
        return nil;
    end;

    local u46 = KnitClient2.Controllers.DefaultProjectileSourceController:getProjectileHandler() or ProjectileHandler.new(1, 1, "sword_wave", nil, nil, Vector3.new(0, 0, 0));
    local v47 = EntityUtil:getEntity(u39);

    if v47 ~= nil then
        v47 = v47:getInstance();
    end;

    if v47 then
        local v48 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v47)];

        if v48.lumen then
            u44 = v48.lumen.heavenlySwordWave;
        end;
    end;

    u39:SetAttribute("IsCasting", Workspace:GetServerTimeNow() + 1.2);
    u38.multiShotMaid:GiveTask(function() -- Line: 265
        -- upvalues: u39 (copy)
        u39:SetAttribute("IsCasting", false);
    end);
    KnitClient2.Controllers.DefaultProjectileSourceController:clearProjectileHandler();
    RuntimeLib.Promise.defer(function() -- Line: 270
        -- upvalues: u45 (copy), ItemType (ref), u38 (copy), u43 (ref), u44 (ref), EntityUtil (ref), u39 (copy), KnitClient (ref), BedwarsKitSkinMeta (ref), GameSound (ref), SoundManager (ref), KnitClient2 (ref), u46 (ref), u40 (copy), u42 (copy)
        local v49 = false;
        local v50 = 0;

        while true do
            if v49 then
                v50 = v50 + 1;
            else
                v49 = true;
            end;

            if v50 >= 4 then
                u38.multiShotMaid:DoCleaning();

                return;
            end;

            local v51 = u45;

            if v51 ~= nil then
                v51 = v51:getItemInHand();

                if v51 ~= nil then
                    v51 = v51.Name;
                end;
            end;

            if v51 ~= ItemType.HEAVENLY_SWORD then
                u38.multiShotMaid:DoCleaning();

                return nil;
            end;

            if v50 == 3 then
                u43 = u43 + 0.1;
                u44 = ItemType.HEAVENLY_SWORD;
                local v52 = EntityUtil:getEntity(u39);

                if v52 ~= nil then
                    v52 = v52:getInstance();
                end;

                if v52 then
                    local v53 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v52)];

                    if v53.lumen then
                        u44 = v53.lumen.heavenlySwordWave1;
                    end;
                end;
            end;

            local LIGHT_SWORD_ATTACK = GameSound.LIGHT_SWORD_ATTACK;
            local v54 = EntityUtil:getEntity(u39);

            if v54 ~= nil then
                v54 = v54:getInstance();
            end;

            if v54 then
                local v55 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v54)];

                if v55.lumen then
                    LIGHT_SWORD_ATTACK = v55.lumen.swordAttackSound;
                end;
            end;

            SoundManager:playSound(LIGHT_SWORD_ATTACK);
            KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.HEAVENLY_SWORD, u44, u46, u40, u42.projectileSource);
            task.wait(u43);
        end;
    end);
end;

function u5.playAnimation(p56, p57) -- Line: 331
    -- upvalues: AnimationUtil (copy), Players (copy), GameAnimationUtil (copy)
    local v58 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(p57));

    if v58 ~= nil then
        v58:AdjustSpeed(1);
    end;
end;

function u5.playSound(p59) -- Line: 338
    -- upvalues: GameSound (copy), EntityUtil (copy), Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy)
    local LIGHT_SWORD_CHARGE = GameSound.LIGHT_SWORD_CHARGE;
    local v60 = EntityUtil:getEntity(Players.LocalPlayer);

    if v60 ~= nil then
        v60 = v60:getInstance();
    end;

    if v60 then
        local v61 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v60)];

        if v61.lumen then
            LIGHT_SWORD_CHARGE = v61.lumen.swordChargeSound;
        end;
    end;

    local u62 = SoundManager:playSound(LIGHT_SWORD_CHARGE);

    if u62 then
        p59.animationMaid:GiveTask(function() -- Line: 354
            -- upvalues: u62 (copy)
            u62:Stop();
        end);
    end;
end;

function u5.playEffect(p63, p64, p65) -- Line: 359
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Workspace (copy)
    if not p64 then
        return nil;
    end;

    local HeavenlySwordEffect = ReplicatedStorage.Assets.Effects.HeavenlySwordEffect;
    local v66 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p65)];

    if v66.lumen then
        HeavenlySwordEffect = v66.lumen.heavenlySwordEffect;
    end;

    local u67 = HeavenlySwordEffect:Clone();
    u67:PivotTo(p64);
    u67.Parent = Workspace;
    u67:PivotTo(p64 * CFrame.new(0, 0, -6));
    task.delay(0.15, function() -- Line: 376
        -- upvalues: u67 (copy)
        u67:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;