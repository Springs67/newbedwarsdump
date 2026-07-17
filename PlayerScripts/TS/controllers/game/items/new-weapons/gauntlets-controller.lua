-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Lighting = v4.Lighting;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local ViewmodelMode = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "gauntlets-util");
local GAUNTLETS_ATTACK_COOLDOWN = v5.GAUNTLETS_ATTACK_COOLDOWN;
local GAUNTLETS_ATTACK_INDEX = v5.GAUNTLETS_ATTACK_INDEX;
local GAUNTLETS_CHARGE_TIME = v5.GAUNTLETS_CHARGE_TIME;
local GAUNTLETS_COMBO_TOTAL = v5.GAUNTLETS_COMBO_TOTAL;
local GauntletsUtil = v5.GauntletsUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 45, Name: __tostring
        return "GauntletsController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 51
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 55
    -- upvalues: HandKnitController (copy), u2 (copy), ItemType (copy)
    HandKnitController.constructor(p8);
    p8.Name = "GauntletsController";
    p8.readyTime = -1;
    p8.animationMaid = u2.new();
    p8.leftHandMap = {};
    p8.handsMap = {};
    p8.nonPunchableBlocks = {
        [ItemType.BED] = true,
        [ItemType.FLAG] = true,
        [ItemType.PINATA] = true,
        [ItemType.DAMAGE_BANNER] = true,
        [ItemType.DEFENSE_BANNER] = true,
        [ItemType.HEAL_BANNER] = true,
        [ItemType.FORGE] = true,
        [ItemType.ENCHANT_TABLE] = true,
        [ItemType.VENDING_MACHINE] = true,
        [ItemType.MERCHANT_REGION] = true,
        [ItemType.BEEHIVE] = true,
        [ItemType.PUMPKIN] = true,
        [ItemType.CARROT] = true,
        [ItemType.MELON] = true,
        [ItemType.BREWING_CAULDRON] = true,
        [ItemType.ALTAR_BLOCK_ONE] = true,
        [ItemType.ALTAR_BLOCK_TWO] = true,
        [ItemType.ALTAR_BLOCK_THREE] = true
    };
end;

function u6.KnitStart(u9) -- Line: 83
    -- upvalues: HandKnitController (copy), KnitClient (copy), AnimationType (copy), GameSound (copy), WatchCharacter (copy), GAUNTLETS_COMBO_TOTAL (copy), SharedSyncEvents (copy), Players (copy), GauntletsUtil (copy), ClientSyncEvents (copy), Workspace (copy), GAUNTLETS_ATTACK_COOLDOWN (copy), default2 (copy), GAUNTLETS_CHARGE_TIME (copy), AnimationUtil (copy), GameAnimationUtil (copy), default (copy), Linear (copy), EntityUtil (copy), ItemType (copy), ChargeState (copy), SoundManager (copy)
    HandKnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.GAUNTLETS_JAB,
            AnimationType.GAUNTLETS_CROSS,
            AnimationType.GAUNTLETS_HOOK,
            AnimationType.GAUNTLETS_UPPERCUT,
            AnimationType.GAUNTLETS_SUPER_PUNCH,
            AnimationType.GAUNTLETS_CHARGE_SUPER_PUNCH,
            AnimationType.GAUNTLETS_IDLE,
            AnimationType.GAUNTLETS_JAB_1ST,
            AnimationType.GAUNTLETS_CROSS_1ST,
            AnimationType.GAUNTLETS_HOOK_1ST,
            AnimationType.GAUNTLETS_UPPERCUT_1ST,
            AnimationType.GAUNTLETS_SUPER_PUNCH_1ST,
            AnimationType.GAUNTLETS_CHARGE_SUPER_PUNCH_1ST,
            AnimationType.GAUNTLETS_IDLE_1ST
        },
        sounds = {
            GameSound.GAUNTLETS_JAB_IMPACT_1,
            GameSound.GAUNTLETS_JAB_IMPACT_2,
            GameSound.GAUNTLETS_JAB_IMPACT_3,
            GameSound.GAUNTLETS_JAB_IMPACT_4,
            GameSound.GAUNTLETS_CROSS_IMPACT_1,
            GameSound.GAUNTLETS_CROSS_IMPACT_2,
            GameSound.GAUNTLETS_CROSS_IMPACT_3,
            GameSound.GAUNTLETS_CROSS_IMPACT_4,
            GameSound.GAUNTLETS_HOOK_IMPACT_1,
            GameSound.GAUNTLETS_HOOK_IMPACT_2,
            GameSound.GAUNTLETS_HOOK_IMPACT_3,
            GameSound.GAUNTLETS_HOOK_IMPACT_4,
            GameSound.GAUNTLETS_UPPERCUT_IMPACT_1,
            GameSound.GAUNTLETS_UPPERCUT_IMPACT_2,
            GameSound.GAUNTLETS_UPPERCUT_IMPACT_3,
            GameSound.GAUNTLETS_UPPERCUT_IMPACT_4,
            GameSound.GAUNTLETS_JAB_SWING_1,
            GameSound.GAUNTLETS_JAB_SWING_2,
            GameSound.GAUNTLETS_JAB_SWING_3,
            GameSound.GAUNTLETS_JAB_SWING_4,
            GameSound.GAUNTLETS_CROSS_SWING_1,
            GameSound.GAUNTLETS_CROSS_SWING_2,
            GameSound.GAUNTLETS_CROSS_SWING_3,
            GameSound.GAUNTLETS_CROSS_SWING_4,
            GameSound.GAUNTLETS_HOOK_SWING_1,
            GameSound.GAUNTLETS_HOOK_SWING_2,
            GameSound.GAUNTLETS_HOOK_SWING_3,
            GameSound.GAUNTLETS_HOOK_SWING_4,
            GameSound.GAUNTLETS_UPPERCUT_SWING_1,
            GameSound.GAUNTLETS_UPPERCUT_SWING_2,
            GameSound.GAUNTLETS_UPPERCUT_SWING_3,
            GameSound.GAUNTLETS_UPPERCUT_SWING_4,
            GameSound.GAUNTLETS_CHARGE_PUNCH_IMPACT,
            GameSound.GAUNTLETS_CHARGE_PUNCH_SWING,
            GameSound.GAUNTLETS_CHARGE_PUNCH_CHARGE,
            GameSound.GAUNTLETS_CHARGING_LOOP,
            GameSound.GAUNTLETS_COMBO_ACTIVATE
        }
    });
    WatchCharacter(function(u10, p11, p12) -- Line: 90
        -- upvalues: GAUNTLETS_COMBO_TOTAL (ref), u9 (copy)
        local function u14() -- Line: 91
            -- upvalues: u10 (copy), GAUNTLETS_COMBO_TOTAL (ref), u9 (ref)
            local v13 = u10:GetAttribute(GAUNTLETS_COMBO_TOTAL);

            if v13 ~= 0 and (v13 == v13 and v13) then
                v13 = v13 >= 10;
            end;

            if v13 == 0 or (v13 ~= v13 or not v13) then
                u9:enableComboParticles(u10, false);

                return;
            end;

            u9:enableComboParticles(u10, true);
        end;

        p12:GiveTask(u10:GetAttributeChangedSignal(GAUNTLETS_COMBO_TOTAL):Connect(function() -- Line: 103
            -- upvalues: u14 (copy)
            u14();
        end));
        p12:GiveTask(function() -- Line: 106
            -- upvalues: u9 (ref), u10 (copy)
            return u9:enableComboParticles(u10, false);
        end);
        u14();
    end);
    SharedSyncEvents.HandItemRendered:connect(function(p15) -- Line: 112
        -- upvalues: Players (ref), GauntletsUtil (ref), u9 (copy)
        local v16 = Players:GetPlayerFromCharacter(p15.entity);

        if not v16 or v16 == Players.LocalPlayer then
            return nil;
        end;

        if not GauntletsUtil:hasGauntletsEquipped(v16) then
            return nil;
        end;

        u9:equipLeftHand(v16);
    end);
    ClientSyncEvents.SwordSwing:connect(function(p17) -- Line: 125
        -- upvalues: u9 (copy), Workspace (ref), GauntletsUtil (ref), Players (ref), GAUNTLETS_ATTACK_COOLDOWN (ref)
        if p17:isCancelled() then
            return nil;
        end;

        if u9.readyTime > Workspace:GetServerTimeNow() then
            return nil;
        end;

        if not GauntletsUtil:hasGauntletsEquipped(Players.LocalPlayer) then
            return nil;
        end;

        if p17.chargedAttack and p17.chargedAttack.chargeRatio >= 1 then
            p17:setCancelled(true);

            return nil;
        end;

        u9.readyTime = Workspace:GetServerTimeNow() + GAUNTLETS_ATTACK_COOLDOWN;
        u9:playAttackSequenceLocalAnimation();

        if p17.targetEntity == nil then
            u9:playLocalSwingSound();
        end;
    end);
    default2.Client:OnEvent("GauntletsAttack", function(p18) -- Line: 150
        -- upvalues: u9 (copy)
        u9:playImpactSound(p18.player, p18.index);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(u19) -- Line: 154
        -- upvalues: GAUNTLETS_CHARGE_TIME (ref), GauntletsUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u9 (copy), Players (ref), default (ref), Linear (ref), Workspace (ref), EntityUtil (ref), KnitClient (ref), default2 (ref)
        if not u19.chargedAttack then
            return nil;
        end;

        if u19.chargedAttack.chargeTime < GAUNTLETS_CHARGE_TIME then
            return nil;
        end;

        local Character = u19.fromPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        if not GauntletsUtil:hasGauntletsEquipped(u19.fromPlayer, true) then
            return nil;
        end;

        local u20 = AnimationUtil:playAnimation(u19.fromPlayer, GameAnimationUtil:getAssetId(AnimationType.GAUNTLETS_SUPER_PUNCH));
        u20:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 172
            -- upvalues: u9 (ref), u19 (copy), u20 (copy)
            u9:playImpactEffect(u19.fromPlayer);
            local Speed = u20.Speed;
            u20:AdjustSpeed(0.02);
            task.delay(0.08, function() -- Line: 176
                -- upvalues: u20 (ref), Speed (copy)
                u20:AdjustSpeed(Speed);
            end);
        end);

        if u19.fromPlayer == Players.LocalPlayer then
            default(0.24, Linear, function(p21) -- Line: 181
                -- upvalues: u19 (copy), Workspace (ref)
                local Character2 = u19.fromPlayer.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;
                end;

                if not Character2 then
                    return nil;
                end;

                local CurrentCamera = Workspace.CurrentCamera;

                if CurrentCamera ~= nil then
                    CurrentCamera = CurrentCamera.CFrame.LookVector;
                end;

                if not CurrentCamera then
                    return nil;
                end;

                local v22 = CFrame.new(u19.fromPlayer.Character:GetPivot().Position) * CFrame.lookAt(Vector3.new(0, 0, 0), CurrentCamera);
                u19.fromPlayer.Character:PivotTo(u19.fromPlayer.Character:GetPivot():Lerp(v22, p21));
            end);
        end;

        task.delay(0, function() -- Line: 205
            -- upvalues: u19 (copy), Workspace (ref), GauntletsUtil (ref), u9 (ref), Players (ref), EntityUtil (ref), KnitClient (ref), AnimationType (ref), default2 (ref)
            local Character2 = u19.fromPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;
            end;

            if not Character2 then
                return nil;
            end;

            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera ~= nil then
                CurrentCamera = CurrentCamera.CFrame.LookVector;
            end;

            if not CurrentCamera then
                return nil;
            end;

            local v23 = u19.fromPlayer.Character.PrimaryPart:GetPivot();
            local v24 = GauntletsUtil:getRegionInFrontOfPlayer(u19.fromPlayer.Character, v23.Position, CurrentCamera);

            if not v24 then
                return nil;
            end;

            for _, v in u9:predictDamagedBlocks(u19.fromPlayer, v24) do
                u9:addCrackToBlock(u9:calculateNormalId(v23.Position, v.blockPosition), v);
            end;

            if u19.fromPlayer == Players.LocalPlayer then
                local Character3 = Players.LocalPlayer.Character;

                if Character3 ~= nil then
                    Character3 = Character3.PrimaryPart;
                end;

                if not Character3 then
                    return nil;
                end;

                if not EntityUtil:getEntity(Players.LocalPlayer) then
                    return nil;
                end;

                if not GauntletsUtil:hasGauntletsEquipped(Players.LocalPlayer, true) then
                    return nil;
                end;

                KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.GAUNTLETS_SUPER_PUNCH_1ST);
                default2.Client:Get("RequestGauntletsChargedAttack"):SendToServer({
                    blockDestroyTime = Workspace:GetServerTimeNow() + 0.5,
                    unitLookVector = CurrentCamera
                });
            end;
        end);
    end);
    ClientSyncEvents.SwordCharge:connect(function(p25) -- Line: 256
        -- upvalues: ItemType (ref), EntityUtil (ref), Players (ref), KnitClient (ref), ChargeState (ref), Workspace (ref), u9 (copy), GAUNTLETS_CHARGE_TIME (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p25.itemType ~= ItemType.MYTHIC_GAUNTLETS then
            return nil;
        end;

        if p25:isCancelled() then
            return nil;
        end;

        local u26 = EntityUtil:getEntity(Players.LocalPlayer);

        if u26 ~= nil then
            u26 = u26:getHandItemInstanceFromCharacter();
        end;

        if not u26 or u26.Name ~= ItemType.MYTHIC_GAUNTLETS then
            return nil;
        end;

        local v27 = KnitClient.Controllers.ViewmodelController:getViewModel();

        if v27 ~= nil then
            v27 = v27:WaitForChild(ItemType.MYTHIC_GAUNTLETS, 1);
        end;

        if not v27 then
            return nil;
        end;

        local u28 = nil;
        local u29 = nil;
        local chargeState = p25.chargeState;

        if chargeState ~= ChargeState.Charged then
            if chargeState == ChargeState.Charging then
                local u30 = Workspace:GetServerTimeNow();
                u9.chargingStartTime = u30;
                task.delay(GAUNTLETS_CHARGE_TIME, function() -- Line: 290
                    -- upvalues: u30 (copy), u9 (ref), u26 (copy)
                    if u30 == u9.chargingStartTime then
                        u26.Handle.Effect.Attachment.Pulse.Enabled = true;
                    end;
                end);
                task.delay(0.2, function() -- Line: 295
                    -- upvalues: u30 (copy), u9 (ref), Players (ref), SoundManager (ref), GameSound (ref), u26 (copy), u28 (ref), GameAnimationUtil (ref), AnimationType (ref), u29 (ref), KnitClient (ref)
                    if u30 ~= u9.chargingStartTime then
                        return nil;
                    end;

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

                    SoundManager:playSound(GameSound.GAUNTLETS_CHARGE_PUNCH_CHARGE, {
                        volumeMultiplier = 1.1,
                        playbackSpeedMultiplier = 1.25
                    });
                    u9:setEffectEnabled(u26, true);
                    u28 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GAUNTLETS_CHARGE_SUPER_PUNCH));
                    u28:Play();
                    u28:GetMarkerReachedSignal("end"):Connect(function() -- Line: 318
                        -- upvalues: u28 (ref)
                        local v31 = u28;

                        if v31 ~= nil then
                            v31:AdjustSpeed(0);
                        end;
                    end);
                    u29 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.GAUNTLETS_CHARGE_SUPER_PUNCH_1ST);

                    if u29 then
                        u29:GetMarkerReachedSignal("end"):Connect(function() -- Line: 327
                            -- upvalues: u29 (ref)
                            local v32 = u29;

                            if v32 ~= nil then
                                v32:AdjustSpeed(0);
                            end;
                        end);
                    end;
                end);
                u9.animationMaid:GiveTask(function() -- Line: 335
                    -- upvalues: u28 (ref), u29 (ref), u9 (ref), u26 (copy)
                    local v33 = u28;

                    if v33 ~= nil then
                        v33:Stop();
                    end;

                    local v34 = u28;

                    if v34 ~= nil then
                        v34:Destroy();
                    end;

                    local v35 = u29;

                    if v35 ~= nil then
                        v35:Stop();
                    end;

                    local v36 = u29;

                    if v36 ~= nil then
                        v36:Destroy();
                    end;

                    u9:setEffectEnabled(u26, false);
                    u26.Handle.Effect.Attachment.Pulse.Enabled = false;
                end);
            elseif chargeState == ChargeState.Idle then
                u9.chargingStartTime = nil;
                u9.animationMaid:DoCleaning();
            end;
        end;
    end);
end;

function u6.enableComboParticles(p37, p38, p39) -- Line: 365
    -- upvalues: Players (copy), EntityUtil (copy), KnitClient (copy), GauntletsUtil (copy), CollectionService (copy)
    local v40 = p38 == Players.LocalPlayer;
    local v41 = EntityUtil:getEntity(p38);

    if not v41 then
        return nil;
    end;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and p39 then
        return nil;
    end;

    local v42 = v41:getHandItemInstanceFromCharacter();

    if not (v42 and GauntletsUtil:hasGauntletsEquipped(p38)) then
        return nil;
    end;

    local Fire = v42:WaitForChild("Handle"):WaitForChild("ComboAttachment"):WaitForChild("Fire");

    if not Fire then
        return nil;
    end;

    if v40 then
        CollectionService:AddTag(Fire, "FirstPersonHidden");
    end;

    Fire.Enabled = p39;
    local v43 = p37.handsMap[v42];

    if not v43 then
        return nil;
    end;

    local Fire2 = v43:WaitForChild("Handle"):WaitForChild("ComboAttachment"):WaitForChild("Fire");

    if not Fire2 then
        return nil;
    end;

    if v40 then
        CollectionService:AddTag(Fire2, "FirstPersonHidden");
    end;

    Fire2.Enabled = p39;
end;

function u6.predictDamagedBlocks(u44, u45, p46) -- Line: 403
    -- upvalues: BlockEngine (copy), getItemMeta (copy)
    local v47 = BlockEngine:getStore():getBlocksInRegion3(p46);
    local u48 = {};
    local u49 = {};

    local function v57(p50) -- Line: 407
        -- upvalues: getItemMeta (ref), BlockEngine (ref), u44 (copy), u45 (copy), u49 (copy), u48 (copy)
        local Name = p50.Name;
        local v51 = getItemMeta(Name);
        local block = v51.block;

        if block ~= nil then
            block = block.unbreakable;
        end;

        if not block then
            block = v51.block;

            if block ~= nil then
                block = block.unbreakableByTeammates;
            end;

            if not block then
                block = v51.block;

                if block ~= nil then
                    block = block.breakableOnlyByOwner;
                end;
            end;
        end;

        if block then
            return nil;
        end;

        local v52 = p50:GetAttribute("Health");
        local v53 = p50:GetAttribute("Data");
        local v54 = v53 == nil and 0 or v53;
        local v55 = {
            blockPosition = BlockEngine:getBlockPosition(p50.Position)
        };

        if u44.nonPunchableBlocks[Name] ~= nil or not BlockEngine:isBlockBreakable(v55, u45) then
            return nil;
        end;

        table.insert(u49, {
            blockPosition = v55.blockPosition,
            blockType = Name,
            blockData = v54
        });

        if v52 <= 30 then
            table.insert(u48, {
                blockPosition = v55.blockPosition,
                blockType = Name,
                blockData = v54
            });

            return;
        end;

        local v56 = p50:GetAttribute("Health");

        if v56 == nil then
            return nil;
        end;

        if v56 - 29 > 0 then
            return;
        end;

        table.insert(u48, {
            blockPosition = v55.blockPosition,
            blockType = Name,
            blockData = v54
        });
    end;

    for i in v47 do
        v57(i, i, v47);
    end;

    return u49;
end;

function u6.playImpactEffect(p58, p59) -- Line: 483
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), ScreenShakeUtil (copy), u3 (copy), Lighting (copy), default (copy), Linear (copy), Workspace (copy)
    local v60 = p59 == Players.LocalPlayer;
    local Character = p59.Character;

    if Character ~= nil then
        Character = Character:GetPivot();
    end;

    if not Character then
        return nil;
    end;

    local GAUNTLETS_CHARGE_PUNCH_IMPACT = GameSound.GAUNTLETS_CHARGE_PUNCH_IMPACT;
    local v61 = {
        rollOffMaxDistance = 100,
        rollOffMinDistance = 40,
        volumeMultiplier = 1.25
    };
    local v62;

    if v60 then
        v62 = nil;
    else
        v62 = Character.Position;
    end;

    v61.position = v62;
    SoundManager:playSound(GAUNTLETS_CHARGE_PUNCH_IMPACT, v61);

    if v60 then
        ScreenShakeUtil.shakeScreenDirection(Vector2.new(-0.2, 1), {
            magnitude = 0.75,
            duration = 0.25,
            cycles = 2
        });
        local u63 = u3("DepthOfFieldEffect", {
            Name = "GauntletsDepthOfField",
            InFocusRadius = 20,
            FocusDistance = 0,
            FarIntensity = 0,
            Parent = Lighting
        });
        local u65 = default(0.14, Linear, function(p64) -- Line: 512
            -- upvalues: u63 (copy)
            u63.FarIntensity = (math.sqrt(p64) - p64) / 1.2 * 0.8;
        end);
        task.spawn(function() -- Line: 516
            -- upvalues: u65 (copy), u63 (copy)
            u65:Wait();
            u63:Destroy();
        end);
    end;

    local u66 = u3("Part", {
        CanCollide = false,
        CanQuery = false,
        Anchored = true,
        Transparency = 1,
        CFrame = Character + Character.LookVector.Unit * 5,
        Parent = Workspace
    });
    local u67 = u3("PointLight", {
        Name = "GauntletsPunchPointLight",
        Range = 12,
        Brightness = 0,
        Color = Color3.fromRGB(240, 26, 69),
        Parent = u66
    });
    local u69 = default(0.24, Linear, function(p68) -- Line: 539
        -- upvalues: u67 (copy)
        u67.Brightness = (math.sqrt(p68) - p68) / 1.2 * 4 * 8;
    end);
    task.spawn(function() -- Line: 543
        -- upvalues: u69 (copy), u67 (copy), u66 (copy)
        u69:Wait();
        u67.Brightness = 0;
        u67.Enabled = false;
        u66:Destroy();
    end);
end;

function u6.playImpactSound(p70, p71, p72) -- Line: 550
    -- upvalues: GauntletsUtil (copy), RandomUtil (copy), Players (copy), SoundManager (copy)
    local Character = p71.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v73 = GauntletsUtil:getAnimation(p72);

    if v73 ~= nil then
        v73 = v73.impactSound;
    end;

    if not v73 or #v73 == 0 then
        return nil;
    end;

    local v74 = RandomUtil.fromList(unpack(v73));

    if v74 == "" or not v74 then
        return nil;
    end;

    if p71 == Players.LocalPlayer then
        SoundManager:playSound(v74, {
            volumeMultiplier = 0.85
        });

        return;
    end;

    SoundManager:playSound(v74, {
        rollOffMaxDistance = 25,
        volumeMultiplier = 0.85,
        position = Character
    });
end;

function u6.playLocalSwingSound(p75) -- Line: 586
    -- upvalues: Players (copy), GAUNTLETS_ATTACK_INDEX (copy), GauntletsUtil (copy), RandomUtil (copy), SoundManager (copy)
    local v76 = Players.LocalPlayer:GetAttribute(GAUNTLETS_ATTACK_INDEX);
    local v77 = GauntletsUtil:getAnimation((v76 == nil and 0 or v76) % #GauntletsUtil:getGauntletsAttackSequence());

    if v77 ~= nil then
        v77 = v77.swingSound;
    end;

    if not v77 or #v77 == 0 then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(v77)), {
        volumeMultiplier = 1
    });
end;

function u6.playAttackSequenceLocalAnimation(p78) -- Line: 606
    -- upvalues: Players (copy), GAUNTLETS_ATTACK_INDEX (copy), GauntletsUtil (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), getItemMeta (copy), ItemType (copy)
    local v79 = Players.LocalPlayer:GetAttribute(GAUNTLETS_ATTACK_INDEX);
    local v80 = GauntletsUtil:getAnimation((v79 == nil and 0 or v79) % #GauntletsUtil:getGauntletsAttackSequence());

    if not v80 then
        return nil;
    end;

    local fpAnimation = v80.fpAnimation;

    if fpAnimation ~= 0 and (fpAnimation == fpAnimation and fpAnimation) then
        KnitClient.Controllers.ViewmodelController:playAnimation(v80.fpAnimation);
    end;

    local v81 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(v80.animation));
    local sword = getItemMeta(ItemType.WOOD_GAUNTLETS).sword;

    if sword ~= nil then
        sword = sword.attackSpeed;
    end;

    local v82;

    if v81 == nil then
        v82 = v81;
    else
        v82 = v81.Length;
    end;

    local v83;

    if v82 == 0 or v82 ~= v82 then
        v83 = v82;
    elseif v82 then
        v83 = sword;
    else
        v83 = v82;
    end;

    if v83 ~= 0 and (v83 == v83 and (v83 and v81 ~= nil)) then
        v81:AdjustSpeed(v82 / sword);
    end;
end;

function u6.equipLeftHand(u84, p85) -- Line: 643
    -- upvalues: EntityUtil (copy), GauntletsUtil (copy), ReplicatedStorage (copy), WeldUtil (copy), Players (copy), ItemType (copy)
    local v86 = EntityUtil:getEntity(p85);

    if not v86 then
        return nil;
    end;

    local u87 = v86:getHandItemInstanceFromCharacter();

    if not (u87 and GauntletsUtil:hasGauntletsEquipped(p85)) then
        return nil;
    end;

    local Character = p85.Character;

    if not Character then
        return nil;
    end;

    local u88 = ReplicatedStorage.Assets.GauntletsModels:FindFirstChild(u87.Name .. "_left");

    if u88 ~= nil then
        u88 = u88:Clone();
    end;

    if not u88 then
        return nil;
    end;

    u88.Parent = Character;
    WeldUtil:weldCharacterAccessories(Character);
    u84.leftHandMap[Players.LocalPlayer] = u88;
    u84.handsMap[u87] = u88;
    u84:enableComboParticles(p85, false);

    if u87.Name == ItemType.MYTHIC_GAUNTLETS then
        u84:setEffectEnabled(u87, false);
    end;

    local function _(p89) -- Line: 675
        p89:SetAttribute("VisibleInViewmodel", true);
    end;

    for i, descendant in u88:GetDescendants() do
        local _ = i - 1;
        descendant:SetAttribute("VisibleInViewmodel", true);
    end;

    u87.Destroying:Connect(function() -- Line: 681
        -- upvalues: u88 (copy), u84 (copy), u87 (copy)
        local v90 = u88;

        if v90 ~= nil then
            v90:Destroy();
        end;

        u84.handsMap[u87] = nil;
    end);
end;

function u6.calculateNormalId(p91, p92, p93) -- Line: 689
    -- upvalues: BlockEngine (copy)
    local Unit = (p92 - BlockEngine:getWorldPosition(p93)).Unit;
    local Right = Enum.NormalId.Right;
    local v94 = 1.1;
    local v95 = 1.1;

    for _, v in Enum.NormalId:GetEnumItems() do
        if v ~= Enum.NormalId.Top and v ~= Enum.NormalId.Bottom then
            local v96 = Vector3.FromNormalId(v) - Unit;

            if math.abs(v96.X) < v94 and math.abs(v96.Z) < v95 then
                v94 = math.abs(v96.X);
                v95 = math.abs(v96.Z);
                Right = v;
            end;
        end;
    end;

    return Right;
end;

function u6.addCrackToBlock(p97, p98, p99) -- Line: 710
    -- upvalues: ReplicatedStorage (copy), BlockEngine (copy), EffectUtil (copy), default (copy), Linear (copy)
    local u100 = ReplicatedStorage.Assets.Effects.GauntletsPunchCrack:Clone();
    u100.Crack.SurfaceGui.Face = p98;
    local v101 = BlockEngine:getWorldPosition(p99.blockPosition);
    local v102 = BlockEngine:getStore():getBlockAt(p99.blockPosition);

    if not v102 then
        return nil;
    end;

    u100:PivotTo(CFrame.new(v101));
    u100.Parent = v102;
    EffectUtil:playEffects({ u100 }, nil);
    task.delay(0.1, function() -- Line: 721
        -- upvalues: u100 (copy), default (ref), Linear (ref)
        local ImageLabel = u100.Crack.SurfaceGui.ImageLabel;
        local Brightness = u100.Crack.SurfaceGui.Brightness;
        default(0.2, Linear, function(p103) -- Line: 724
            -- upvalues: u100 (ref), Brightness (copy), ImageLabel (copy)
            u100.Crack.SurfaceGui.Brightness = Brightness * (1 - p103);
            ImageLabel.ImageTransparency = 0.4 + p103 * 0.6;
        end):Wait();
        task.delay(0.5, function() -- Line: 729
            -- upvalues: u100 (ref)
            u100:Destroy();
        end);
    end);
end;

function u6.setEffectEnabled(p104, p105, p106) -- Line: 734
    -- upvalues: KnitClient (copy)
    if not p105.Handle then
        return nil;
    end;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and p106 then
        return nil;
    end;

    p105.Handle.Effect.Attachment.Ball.Enabled = p106;
    p105.Handle.Effect.Attachment.Waves.Enabled = p106;
    p105.Handle.Effect.Bits.Enabled = p106;
    p105.Handle.Effect.Charge.Enabled = p106;
    p105.Handle.Effect.SmallCharge.Enabled = p106;
    p105.Handle.Effect.Trail.Enabled = p106;

    if not p106 then
        p105.Handle.Effect.Attachment.Pulse.Enabled = p106;
    end;
end;

function u6.isRelevantItem(p107, p108) -- Line: 752
    -- upvalues: GauntletsUtil (copy)
    return GauntletsUtil:isGauntlets(p108.itemType);
end;

function u6.onEnable(p109, p110, p111) -- Line: 755
    -- upvalues: Players (copy), KnitClient (copy), ViewmodelMode (copy)
    p109:equipLeftHand(Players.LocalPlayer);
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
end;

function u6.onDisable(p112) -- Line: 759
    -- upvalues: Players (copy), KnitClient (copy), ViewmodelMode (copy)
    local v113 = p112.leftHandMap[Players.LocalPlayer];

    if v113 ~= nil then
        v113:Destroy();
    end;

    p112.leftHandMap[Players.LocalPlayer] = nil;
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.DEFAULT);
end;

KnitClient.CreateController(u6.new());

return nil;