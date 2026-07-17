-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "random-util").RandomUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local StarterPlayer = v4.StarterPlayer;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ScytheUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "scythe-util").ScytheUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "ScytheController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 42
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 46
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "ScytheController";
    p7.transparencyModifier = {
        transparency = 0.75
    };
    p7.readyTime = -1;
    p7.animationMaid = u3.new();
end;

function u5.KnitStart(u8) -- Line: 55
    -- upvalues: HandKnitController (copy), KnitClient (copy), AnimationType (copy), GameSound (copy), ClientSyncEvents (copy), Workspace (copy), ScytheUtil (copy), InventoryUtil (copy), Players (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), SoundManager (copy), RandomUtil (copy), BalanceFile (copy), KnitClient2 (copy), StarterPlayer (copy), getItemMeta (copy), ChargeState (copy)
    HandKnitController.KnitStart(u8);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.SCYTHE_SLASH_1,
            AnimationType.SCYTHE_SLASH_2,
            AnimationType.SCYTHE_SLASH_1_FP,
            AnimationType.SCYTHE_SLASH_2_FP,
            AnimationType.SCYTHE_SPIN_FP,
            AnimationType.SCYTHE_SPIN,
            AnimationType.SCYTHE_PULL_1,
            AnimationType.SCYTHE_PULL_1_FP
        },
        sounds = {
            GameSound.SCYTHE_PULL_1,
            GameSound.SCYTHE_PULL_2,
            GameSound.SCYTHE_SWING_1,
            GameSound.SCYTHE_SWING_2,
            GameSound.SCYTHE_SPIN_1,
            GameSound.SCYTHE_SPIN_2,
            GameSound.SCYTHE_SPIN_3
        }
    });
    ClientSyncEvents.SwordSwing:connect(function(p9) -- Line: 62
        -- upvalues: u8 (copy), Workspace (ref), ScytheUtil (ref), InventoryUtil (ref), Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref)
        if u8.readyTime > Workspace:GetServerTimeNow() then
            return nil;
        end;

        if p9:isCancelled() then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if not ScytheUtil:isScythe(hand) then
            return nil;
        end;

        if not ScytheUtil:isScythe(p9.swordType) then
            return nil;
        end;

        local v10 = EntityUtil:getLocalPlayerEntity();

        if not v10 then
            return nil;
        end;

        if p9.chargedAttack and (p9.chargedAttack.chargeRatio >= 1 and not (StatusEffectUtil:isActive(v10:getInstance(), StatusEffectType.GROUNDED) and StatusEffectUtil:isActive(v10:getInstance(), StatusEffectType.FROSTED))) then
            p9:setCancelled(true);

            return nil;
        end;

        local v11 = Players.LocalPlayer:GetAttribute("IsCasting");

        if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
            return nil;
        end;

        u8.readyTime = Workspace:GetServerTimeNow() + 0.4;
        u8:playLocalAnimation();
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local targetEntity = p9.targetEntity;

        if targetEntity ~= nil then
            targetEntity = targetEntity:getInstance().PrimaryPart;

            if targetEntity ~= nil then
                targetEntity = targetEntity.Position;
            end;
        end;

        if Character and targetEntity then
            Character.CFrame = CFrame.new(Character.Position, targetEntity);
        end;
    end);
    default.Client:Get("ScytheAttacks"):Connect(function(p12) -- Line: 111
        -- upvalues: u8 (copy), EntityUtil (ref)
        u8:playSound(p12.player, p12.count);

        if not EntityUtil:getEntity(p12.player) then
            return nil;
        end;
    end);
    default.Client:Get("ScytheApplyState"):Connect(function(p13) -- Line: 119
        -- upvalues: Players (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref), u8 (copy)
        if p13.player ~= Players.LocalPlayer then
            local v14 = AnimationUtil:playAnimation(p13.player, GameAnimationUtil:getAssetId(AnimationType.SCYTHE_SPIN));

            if v14 ~= nil then
                v14:AdjustSpeed(1.5);
            end;

            local v15 = { GameSound.SCYTHE_SPIN_1, GameSound.SCYTHE_SPIN_2, GameSound.SCYTHE_SPIN_3 };
            local Character = p13.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if Character then
                SoundManager:playSound(RandomUtil.fromList(unpack(v15)), {
                    rollOffMaxDistance = 25,
                    volumeMultiplier = 0.7,
                    position = Character
                });
            end;
        end;

        u8:applyStateEffect(p13.player, 0.7);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(p16) -- Line: 146
        -- upvalues: ScytheUtil (ref), BalanceFile (ref), Players (ref), default (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), KnitClient2 (ref), StarterPlayer (ref), KnitClient (ref), AnimationType (ref), AnimationUtil (ref), GameAnimationUtil (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref)
        if not ScytheUtil:isScythe(p16.weapon.Name) then
            return nil;
        end;

        if p16.chargedAttack.chargeTime >= BalanceFile.SCYTHE_MAX_CHARGE_DURATION then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.AssemblyMass;
                end;
            end;

            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.CFrame.LookVector.Unit;
                end;
            end;

            local Character3 = Players.LocalPlayer.Character;

            if Character == 0 or (Character ~= Character or not (Character and (Character2 and Character3))) then
                return nil;
            end;

            local v17 = Character2.Unit * (30 * Character);
            default.Client:Get("ScytheDash"):SendToServer({
                direction = Character2
            });
            local v18 = EntityUtil:getLocalPlayerEntity();

            if v18 and not (StatusEffectUtil:isActive(v18:getInstance(), StatusEffectType.GROUNDED) or StatusEffectUtil:isActive(v18:getInstance(), StatusEffectType.FROSTED)) then
                Character3.Humanoid.JumpHeight = 0.1;
                Character3.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                Character3.HumanoidRootPart:ApplyImpulse(v17);
                KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
            end;

            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.SCYTHE_SPIN_FP);
            local v19 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.SCYTHE_SPIN));

            if v19 ~= nil then
                v19:AdjustSpeed(1.5);
            end;

            task.delay(0.15, function() -- Line: 190
                -- upvalues: Players (ref), default (ref), GameSound (ref), SoundManager (ref), RandomUtil (ref)
                local Character4 = Players.LocalPlayer.Character;

                if Character4 ~= nil then
                    Character4 = Character4.PrimaryPart;

                    if Character4 ~= nil then
                        Character4 = Character4.Position;
                    end;
                end;

                if Character4 then
                    default.Client:Get("ScytheSpin"):SendToServer({
                        position = Character4
                    });
                end;

                SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.SCYTHE_SPIN_1, GameSound.SCYTHE_SPIN_2, GameSound.SCYTHE_SPIN_3 })), {
                    rollOffMaxDistance = 25,
                    volumeMultiplier = 0.7
                });
            end);
        end;
    end);
    ClientSyncEvents.SwordCharge:connect(function(u20) -- Line: 213
        -- upvalues: ScytheUtil (ref), getItemMeta (ref), ChargeState (ref), Players (ref), Workspace (ref), u8 (copy), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref)
        if not ScytheUtil:isScythe(u20.itemType) then
            return nil;
        end;

        if u20:isCancelled() then
            return nil;
        end;

        getItemMeta(u20.itemType);
        local u21 = nil;
        local u22 = nil;
        local chargeState = u20.chargeState;

        if chargeState == ChargeState.Charged then
            local _ = Players.LocalPlayer.Character;
        elseif chargeState == ChargeState.Charging then
            local u23 = Workspace:GetServerTimeNow();
            u8.chargingStartTime = u23;
            task.delay(1, function() -- Line: 237
                -- upvalues: u23 (copy), u8 (ref), SoundManager (ref), GameSound (ref)
                if u23 == u8.chargingStartTime then
                    SoundManager:playSound(GameSound.SWORD_CHARGE_READY);
                end;
            end);
            task.delay(0.2, function() -- Line: 242
                -- upvalues: u23 (copy), u8 (ref), Players (ref), getItemMeta (ref), u20 (copy), u21 (ref), GameAnimationUtil (ref), AnimationType (ref), u22 (ref), KnitClient (ref)
                if u23 ~= u8.chargingStartTime then
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

                local sword = getItemMeta(u20.itemType).sword;

                if sword ~= nil then
                    sword = sword.chargedAttack;
                end;

                if not sword then
                    return nil;
                end;

                u21 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.HEAVENLY_SWORD_CHARGE));
                u21:Play();
                u21:AdjustSpeed(1);
                u21:GetMarkerReachedSignal("end"):Connect(function() -- Line: 270
                    -- upvalues: u21 (ref)
                    local v24 = u21;

                    if v24 ~= nil then
                        v24:AdjustSpeed(0);
                    end;
                end);
                u22 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HEAVENLY_SWORD_CHARGE);

                if u22 then
                    u22:GetMarkerReachedSignal("end"):Connect(function() -- Line: 279
                        -- upvalues: u22 (ref)
                        local v25 = u22;

                        if v25 ~= nil then
                            v25:AdjustSpeed(0);
                        end;
                    end);
                end;
            end);
            u8.animationMaid:GiveTask(function() -- Line: 287
                -- upvalues: u21 (ref), u22 (ref)
                local v26 = u21;

                if v26 ~= nil then
                    v26:Stop();
                end;

                local v27 = u21;

                if v27 ~= nil then
                    v27:Destroy();
                end;

                local v28 = u22;

                if v28 ~= nil then
                    v28:Stop();
                end;

                local v29 = u22;

                if v29 ~= nil then
                    v29:Destroy();
                end;
            end);
        elseif chargeState == ChargeState.Idle then
            u8.chargingStartTime = nil;
            local v30 = u21;

            if v30 ~= nil then
                v30:Stop();
            end;

            local v31 = u21;

            if v31 ~= nil then
                v31:Destroy();
            end;

            local v32 = u22;

            if v32 ~= nil then
                v32:Stop();
            end;

            local v33 = u22;

            if v33 ~= nil then
                v33:Destroy();
            end;

            u8.animationMaid:DoCleaning();
        end;
    end);
end;

function u5.playSound(p34, p35, p36) -- Line: 331
    -- upvalues: ScytheUtil (copy), RandomUtil (copy), Players (copy), SoundManager (copy)
    local Character = p35.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v37 = ScytheUtil:getAnimation(p36);

    if v37 ~= nil then
        v37 = v37.sound;
    end;

    if not v37 or #v37 == 0 then
        return nil;
    end;

    local v38 = RandomUtil.fromList(unpack(v37));

    if v38 == "" or not v38 then
        return nil;
    end;

    if p35 == Players.LocalPlayer then
        SoundManager:playSound(v38, {
            volumeMultiplier = 0.7
        });

        return;
    end;

    SoundManager:playSound(v38, {
        rollOffMaxDistance = 25,
        volumeMultiplier = 0.7,
        position = Character
    });
end;

function u5.playLocalAnimation(p39) -- Line: 367
    -- upvalues: Players (copy), ScytheUtil (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), getItemMeta (copy), ItemType (copy)
    local v40 = Players.LocalPlayer:GetAttribute("ScytheCount");
    local v41 = ScytheUtil:getAnimation((v40 == nil and 0 or v40) % #ScytheUtil:getScytheAttackSequence());

    if not v41 then
        return nil;
    end;

    local fpAnimation = v41.fpAnimation;

    if fpAnimation ~= 0 and (fpAnimation == fpAnimation and fpAnimation) then
        KnitClient.Controllers.ViewmodelController:playAnimation(v41.fpAnimation);
    end;

    local v42 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(v41.animation));
    local sword = getItemMeta(ItemType.STONE_SCYTHE).sword;

    if sword ~= nil then
        sword = sword.attackSpeed;
    end;

    local v43;

    if v42 == nil then
        v43 = v42;
    else
        v43 = v42.Length;
    end;

    local v44;

    if v43 == 0 or v43 ~= v43 then
        v44 = v43;
    elseif v43 then
        v44 = sword;
    else
        v44 = v43;
    end;

    if v44 ~= 0 and (v44 == v44 and (v44 and v42 ~= nil)) then
        v42:AdjustSpeed(v43 / sword);
    end;
end;

function u5.applyStateEffect(u45, u46, p47) -- Line: 404
    -- upvalues: KnitClient (copy)
    if u46.Character then
        KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(u46.Character):addModifier(u45.transparencyModifier);
        task.delay(p47, function() -- Line: 407
            -- upvalues: u45 (copy), u46 (copy)
            u45:removeState(u46);
        end);
    end;
end;

function u5.removeState(p48, p49) -- Line: 412
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(p49.Character):removeModifier(p48.transparencyModifier);
end;

function u5.isRelevantItem(p50, p51) -- Line: 415
    -- upvalues: ScytheUtil (copy)
    return ScytheUtil:isScythe(p51.itemType);
end;

function u5.onEnable(p52, p53, p54) -- Line: 418
    -- upvalues: Flamework (copy), AbilityId (copy)
    p52:setupDestroyableYield(function() -- Line: 419
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SCYTHE_DASH_AND_SPIN, nil):expect();
    end);
end;

function u5.onDisable(p55) -- Line: 423
end;

KnitClient.CreateController(u5.new());

return nil;