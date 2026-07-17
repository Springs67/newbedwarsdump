-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local CustomKitTypes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes;
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CustomKitGame_KitSelectionGUI = RuntimeLib.import(script, script.Parent, "ui", "custom-kit-game-kit-selection-gui").CustomKitGame_KitSelectionGUI;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "CustomKitGameController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 41
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 45
    -- upvalues: GameKnitController (copy), GameType (copy), u3 (copy)
    GameKnitController.constructor(p9, { GameType.CUSTOM_KIT, GameType.CUSTOM_KIT_CREATOR });
    p9.Name = "CustomKitGameController";
    p9.localPlayer_kits = {};
    p9.localPlayer_selectedKit = nil;
    p9.allPlayers_selectedKits = {};
    p9.allPlayers_customAbilities = {};
    p9.abilityMaid = u3.new();
    p9.kitSelectGUIMaid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 55
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p10);
end;

function u7.onGameInit(u11) -- Line: 58
    -- upvalues: default (copy), KnitClient (copy), QueueType (copy), KnitClient2 (copy), MatchState (copy), CustomKitTypes (copy), CustomKitUtil (copy), Workspace (copy), u4 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), RunService (copy)
    default.Client:Get("CustomKitCreation_SendProfileDataToClient"):Connect(function(p12) -- Line: 60
        -- upvalues: u11 (copy), KnitClient (ref), QueueType (ref), KnitClient2 (ref), MatchState (ref)
        u11.localPlayer_kits = p12.customKits;

        if KnitClient.Controllers.MatchController:getQueueType() == QueueType.CUSTOM_KIT and (KnitClient2.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING and KnitClient2.Controllers.MatchController:getMatchState() ~= MatchState.POST) then
            u11:mountKitSelectionUI();
        end;
    end);
    default.Client:Get("CustomKitGame_SendAllPlayerCustomAbilitiesToClient"):Connect(function(p13) -- Line: 70
        -- upvalues: u11 (copy)
        local function _(p14, p15) -- Line: 72
            -- upvalues: u11 (ref)
            u11:setupFinalizedCustomKit(p15, p14);
        end;

        for i, v in p13.kits do
            u11:setupFinalizedCustomKit(i, v);
        end;
    end);
    default.Client:Get("CustomKitGame_SelectCustomKit"):Connect(function(p16) -- Line: 79
        -- upvalues: u11 (copy)
        u11:setupFinalizedCustomKit(p16.playerId, p16.customKit);
    end);
    default.Client:Get("CustomKitGame_AbilityProjectileHit"):Connect(function(p17) -- Line: 82
        -- upvalues: u11 (copy), CustomKitTypes (ref), CustomKitUtil (ref)
        local v18 = u11.allPlayers_customAbilities[p17.abilityId];

        if not v18 then
            return nil;
        end;

        if v18.targetType ~= CustomKitTypes.TargetType.PROJECTILE then
            return nil;
        end;

        local v19 = CustomKitUtil.getAbilityPropertyValue(v18, CustomKitTypes.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS);

        if v19 == nil then
            return nil;
        end;

        local statusEffect = v18.statusEffect;

        if statusEffect == CustomKitTypes.StatusEffectType.DECAY then
            u11:decayProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.SILENCE then
            u11:silenceProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.ZAPPED then
            u11:zapProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.POISON then
            u11:poisonProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.DIZZY then
            u11:dizzyProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.GROUNDED then
            u11:groundedProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect == CustomKitTypes.StatusEffectType.REGEN then
            u11:regenProjectileOnhit(p17.position, v19);

            return;
        end;

        if statusEffect ~= CustomKitTypes.StatusEffectType.SHIELD then
            return;
        end;

        u11:shieldProjectileOnhit(p17.position, v19);
    end);
    default.Client:Get("CustomKitGame_ProjectileAbilityUsed"):Connect(function(p20) -- Line: 151
    end);
    default.Client:Get("CustomKitGame_AoeAbilityUsed"):Connect(function(p21) -- Line: 152
        -- upvalues: u11 (copy), CustomKitUtil (ref), CustomKitTypes (ref), Workspace (ref), u4 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v22 = u11.allPlayers_customAbilities[p21.abilityId];

        if not v22 then
            print("[CustomKitGameController] No ability found for id: " .. p21.abilityId);

            return nil;
        end;

        local v23 = CustomKitUtil.getAbilityPropertyValue(v22, CustomKitTypes.AbilityPropertyKey.AOE_RADIUS);

        if v23 == nil then
            print("[CustomKitGameController] No radius found for AOE ability: " .. v22.name);

            return nil;
        end;

        local Character = p21.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            print("[CustomKitGameController] No position found for AOE ability: " .. v22.name);

            return nil;
        end;

        local u24 = u4("Part", {
            Size = Vector3.new(1, v23 * 2, v23 * 2),
            CFrame = CFrame.new(Character) * CFrame.Angles(0, 0, 1.5707963267948966),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Transparency = 0.8,
            Shape = Enum.PartType.Cylinder,
            Parent = Workspace,
            Color = CustomKitUtil.getAbilityColor(v22)
        });
        task.delay(1, function() -- Line: 195
            -- upvalues: u24 (copy)
            u24:Destroy();
        end);
        local statusEffect = v22.statusEffect;

        if statusEffect == CustomKitTypes.StatusEffectType.DECAY then
            u11:decayProjectileOnhit(Character, v23);
            local v25 = AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.VOID_DRAGON_TRANSFORM));

            if v25 ~= nil then
                v25:AdjustSpeed(2);
            end;
        else
            if statusEffect == CustomKitTypes.StatusEffectType.SILENCE then
                u11:silenceProjectileOnhit(Character, v23);
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.KICKER_STOMP));

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.ZAPPED then
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.WIZARD_LIGHTNING_CAST));
                u11:zapProjectileOnhit(Character, v23);

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.POISON then
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.CACTUS_CAST));
                u11:poisonProjectileOnhit(Character, v23);

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.DIZZY then
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.AIRBENDER_CAST));
                u11:dizzyProjectileOnhit(Character, v23);

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.GROUNDED then
                local v26 = AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.DRAGON_SWORD_ULT));

                if v26 ~= nil then
                    v26:AdjustSpeed(3);
                end;

                u11:groundedProjectileOnhit(Character, v23);

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.SHIELD then
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.INFERNAL_SHIELD_SLAM));
                u11:shieldProjectileOnhit(Character, v23);

                return;
            end;

            if statusEffect == CustomKitTypes.StatusEffectType.REGEN then
                AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.WAND_CAST));
                u11:regenProjectileOnhit(Character, v23);
            end;
        end;
    end);
    default.Client:Get("CustomKitGame_AuraAbilityUsed"):Connect(function(u27) -- Line: 249
        -- upvalues: u11 (copy), CustomKitTypes (ref), CustomKitUtil (ref), Workspace (ref), u4 (ref), ReplicatedStorage (ref), RunService (ref)
        local v28 = u11.allPlayers_customAbilities[u27.abilityId];

        if not v28 then
            print("[CustomKitGameController] No ability found for id: " .. u27.abilityId);

            return nil;
        end;

        if v28.targetType ~= CustomKitTypes.TargetType.AURA then
            print("[CustomKitGameController] Ability " .. v28.name .. " is not an aura ability.");

            return nil;
        end;

        local v29 = CustomKitUtil.getAbilityPropertyValue(v28, CustomKitTypes.AbilityPropertyKey.AURA_RADIUS);

        if v29 == nil then
            print("[CustomKitGameController] No radius found for aura level: " .. tostring(v29));

            return nil;
        end;

        local Character = u27.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            print("[CustomKitGameController] No position found for aura ability: " .. v28.name);

            return nil;
        end;

        local u30 = u4("Part", {
            Name = "AURAPART",
            Size = Vector3.new(0.25, v29 * 2, v29 * 2),
            CFrame = CFrame.new(Character) * CFrame.Angles(0, 0, 1.5707963267948966),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Transparency = 0.5,
            Shape = Enum.PartType.Cylinder,
            Parent = Workspace,
            Color = CustomKitUtil.getAbilityColor(v28)
        });
        local statusEffect = v28.statusEffect;

        if statusEffect then
            local CustomEffects = ReplicatedStorage.Assets.Effects.CustomEffects;
            local v31 = nil;

            if statusEffect == CustomKitTypes.StatusEffectType.DECAY then
                v31 = CustomEffects:WaitForChild("Decay", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.POISON then
                v31 = CustomEffects:WaitForChild("Poison", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.REGEN then
                v31 = CustomEffects:WaitForChild("Healing", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.ZAPPED then
                v31 = CustomEffects:WaitForChild("Zap", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.DIZZY then
                v31 = CustomEffects:WaitForChild("Dizzy", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.GROUNDED then
                v31 = CustomEffects:WaitForChild("Grounded", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.SILENCE then
                v31 = CustomEffects:WaitForChild("Silence", 3);
            elseif statusEffect == CustomKitTypes.StatusEffectType.SHIELD then
                v31 = CustomEffects:WaitForChild("Shield", 3);
            end;

            if v31 then
                local v32 = v31:Clone();
                v32.Parent = u30;
                v32.Enabled = true;
            end;
        end;

        local endTime = u27.endTime;
        local u33 = nil;
        u33 = RunService.Heartbeat:Connect(function() -- Line: 326
            -- upvalues: Workspace (ref), endTime (copy), u33 (ref), u30 (copy), u27 (copy)
            if endTime <= Workspace:GetServerTimeNow() then
                u33:Disconnect();
                u30:Destroy();

                return nil;
            end;

            local Character2 = u27.player.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.Position;
                end;
            end;

            if Character2 then
                u30.CFrame = CFrame.new(Character2) * CFrame.Angles(0, 0, 1.5707963267948966);
            end;
        end);
    end);
    default.Client:Get("CustomKitGame_SelfAbilityUsed"):Connect(function(u34) -- Line: 347
        -- upvalues: u11 (copy), u4 (ref), Workspace (ref), CustomKitUtil (ref), ReplicatedStorage (ref), CustomKitTypes (ref), RunService (ref)
        local v35 = u11.allPlayers_customAbilities[u34.abilityId];

        if not v35 then
            print("[CustomKitGameController] No ability found for id: " .. u34.abilityId);

            return nil;
        end;

        local Character = u34.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            print("[CustomKitGameController] No position found for self ability: " .. v35.name);

            return nil;
        end;

        local u36 = u4("Part", {
            Size = Vector3.new(4, 6, 4),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Transparency = 1,
            CFrame = CFrame.new(Character),
            Shape = Enum.PartType.Ball,
            Parent = Workspace,
            Color = CustomKitUtil.getAbilityColor(v35)
        });
        local v37 = v35.statusEffect and v35.statusEffect;

        if v37 then
            local CustomEffects = ReplicatedStorage.Assets.Effects.CustomEffects;
            local v38 = nil;

            if v37 == CustomKitTypes.StatusEffectType.DECAY then
                v38 = CustomEffects:WaitForChild("Decay", 3);
            elseif v37 == CustomKitTypes.StatusEffectType.POISON then
                v38 = CustomEffects:WaitForChild("Poison", 3);
            elseif v37 == CustomKitTypes.StatusEffectType.REGEN then
                v38 = CustomEffects:WaitForChild("Healing", 3);
            elseif v37 == CustomKitTypes.StatusEffectType.ZAPPED then
                v38 = CustomEffects:WaitForChild("Zap", 3);
            end;

            if v38 then
                local v39 = v38:Clone();
                v39.Parent = u36;
                v39.Enabled = true;
            end;
        end;

        local u40 = nil;
        u40 = RunService.Heartbeat:Connect(function() -- Line: 403
            -- upvalues: u34 (copy), u40 (ref), u36 (copy)
            local Character2 = u34.player.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;
            end;

            if not Character2 then
                u40:Disconnect();
                u36:Destroy();

                return nil;
            end;

            u36.CFrame = CFrame.new(u34.player.Character.PrimaryPart.Position);
        end);
        task.delay(1, function() -- Line: 415
            -- upvalues: u40 (ref), u36 (copy)
            u40:Disconnect();
            u36:Destroy();
        end);
    end);
    default.Client:Get("CustomKit_ClientGameInitialized"):SendToServer({});
end;

function u7.setupFinalizedCustomKit(u41, p42, p43) -- Line: 422
    -- upvalues: Players (copy), CustomKitUtil (copy), Flamework (copy)
    u41.allPlayers_selectedKits[p42] = p43;

    local function _(p44) -- Line: 430
        -- upvalues: u41 (copy)
        u41.allPlayers_customAbilities[p44.id] = p44;
    end;

    for i, v in p43.abilities do
        local _ = i - 1;
        u41.allPlayers_customAbilities[v.id] = v;
    end;

    if p42 == Players.LocalPlayer.UserId then
        u41.kitSelectGUIMaid:DoCleaning();
        u41.abilityMaid:DoCleaning();
        u41.localPlayer_selectedKit = p43;

        local function _(p45) -- Line: 446
            -- upvalues: CustomKitUtil (ref), Flamework (ref), u41 (copy)
            local v46 = CustomKitUtil.createAbilityMetaFromCustomAbility(p45);
            local v47 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(p45.id, nil, v46):expect();
            u41.abilityMaid:GiveTask(v47);
        end;

        for i, v in p43.abilities do
            local _ = i - 1;
            local v48 = CustomKitUtil.createAbilityMetaFromCustomAbility(v);
            local v49 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(v.id, nil, v48):expect();
            u41.abilityMaid:GiveTask(v49);
        end;
    end;
end;

function u7.trySelectKit(p50, p51) -- Line: 456
    -- upvalues: default (copy)
    p50.kitSelectGUIMaid:DoCleaning();
    local v52 = (table.find(p50.localPlayer_kits, p51) or 0) - 1;

    if v52 == -1 then
        print("[CustomKitGameController] Kit not found in localPlayerKits: " .. p51.name);

        return false;
    end;

    if default.Client:Get("CustomKitGame_SelectKit"):CallServer({
        kitIndex = v52
    }) then
        p50.localPlayer_selectedKit = p51;

        return true;
    end;

    print("[CustomKitGameController] Failed to select kit: " .. p51.name);

    return false;
end;

function u7.mountKitSelectionUI(u53) -- Line: 476
    -- upvalues: u5 (copy), CustomKitGame_KitSelectionGUI (copy), Players (copy)
    local u55 = u5.mount(u5.createElement(CustomKitGame_KitSelectionGUI, {
        CustomKits = u53.localPlayer_kits,

        OnKitClicked = function(p54) -- Line: 479, Name: OnKitClicked
            -- upvalues: u53 (copy)
            return u53:trySelectKit(p54);
        end
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "CustomKitGame_KitSelectionGUI");
    u53.kitSelectGUIMaid:GiveTask(function() -- Line: 483
        -- upvalues: u5 (ref), u55 (copy)
        u5.unmount(u55);
    end);
end;

function u7.poisonProjectileOnhit(p56, p57, p58) -- Line: 487
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), BedwarsImageId (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.WIND_HIT_SHOUD_1, {
        rollOffMaxDistance = 100,
        position = p57
    });
    local u59 = u3.new();
    local v60 = u4("Part", {
        Size = Vector3.new(4, 4, 4),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        Shape = Enum.PartType.Ball,
        Position = p57,
        Parent = Workspace
    });
    u59:GiveTask(v60);
    local v61 = u4("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3, 0.5), NumberSequenceKeypoint.new(1, 5, 1) }),
        Lifetime = NumberRange.new(5, 5),
        SpreadAngle = Vector2.new(180, 180),
        Speed = NumberRange.new(p58 / 5, p58 / 5),
        Parent = v60
    });
    CollectionService:AddTag(v61, "FirstPersonHidden");
    local v62 = u4("Attachment", {
        Position = Vector3.new(0, -1, 0),
        Orientation = Vector3.new(90, 0, 0),
        Parent = v60
    });
    local v63 = u4("ParticleEmitter", {
        Enabled = false,
        Color = ColorSequence.new(Color3.new(0.07, 0.76, 0.07)),
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.65), NumberSequenceKeypoint.new(0.25, 0.65, 0.2), NumberSequenceKeypoint.new(1, 1) }),
        Texture = BedwarsImageId.SMOKE,
        Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 0.5), NumberSequenceKeypoint.new(1, 4, 1) }),
        Lifetime = NumberRange.new(3, 3),
        SpreadAngle = Vector2.new(10, 180),
        Speed = NumberRange.new(p58 / 3, p58 / 3),
        Parent = v62
    });
    v61:Emit(100);
    v63:Emit(100);
    task.delay(1, function() -- Line: 534
        -- upvalues: u59 (copy)
        u59:DoCleaning();
    end);
end;

function u7.decayProjectileOnhit(p64, p65, u66) -- Line: 538
    -- upvalues: ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), CollectionService (copy)
    local u67 = ReplicatedStorage.Assets.Effects.VoidDragonTransform:Clone();
    SoundManager:playSound(GameSound.VOID_HEALTH_DECAY, {
        rollOffMaxDistance = 100,
        position = p65
    });
    u67.Position = p65;
    u67.Parent = Workspace;
    u67.Anchored = true;
    task.delay(1, function() -- Line: 547
        -- upvalues: u67 (copy)
        u67:Destroy();
    end);
    local v68 = u67:GetDescendants();

    local function v70(p69) -- Line: 551
        -- upvalues: u66 (copy), CollectionService (ref)
        if p69:IsA("ParticleEmitter") then
            p69.Speed = NumberRange.new(u66 / p69.Lifetime.Max, u66 / p69.Lifetime.Max);
            p69:Emit(15);
            CollectionService:AddTag(p69, "FirstPersonHidden");
        end;
    end;

    for i, v in v68 do
        v70(v, i - 1, v68);
    end;
end;

function u7.dizzyProjectileOnhit(p71, p72, p73) -- Line: 562
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.CRAB_BOSS_CLAW_ATTACK, {
        rollOffMaxDistance = 100,
        position = p72
    });
    local u74 = u3.new();
    local v75 = u4("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = Vector3.new(p73, p73, p73),
        Shape = Enum.PartType.Ball,
        Position = p72,
        Parent = Workspace
    });
    u74:GiveTask(v75);
    local Dizzy = ReplicatedStorage.Assets.Effects.CustomEffects:WaitForChild("Dizzy", 3);

    if Dizzy ~= nil then
        Dizzy = Dizzy:Clone();
    end;

    if Dizzy then
        CollectionService:AddTag(Dizzy, "FirstPersonHidden");
        Dizzy.Parent = v75;
        Dizzy:Emit(10 + p73 * 3);
    end;

    task.delay(1, function() -- Line: 593
        -- upvalues: u74 (copy)
        u74:DoCleaning();
    end);
end;

function u7.zapProjectileOnhit(p76, p77, p78) -- Line: 597
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.JELLYFISH_ZAP_1, {
        rollOffMaxDistance = 100,
        position = p77
    });
    local u79 = u3.new();
    local v80 = u4("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = Vector3.new(p78, p78, p78),
        Shape = Enum.PartType.Ball,
        Position = p77,
        Parent = Workspace
    });
    u79:GiveTask(v80);
    local Zap = ReplicatedStorage.Assets.Effects.CustomEffects:WaitForChild("Zap", 3);

    if Zap ~= nil then
        Zap = Zap:Clone();
    end;

    if Zap then
        CollectionService:AddTag(Zap, "FirstPersonHidden");
        Zap.Parent = v80;
        Zap:Emit(10 + p78 * 3);
    end;

    task.delay(1, function() -- Line: 628
        -- upvalues: u79 (copy)
        u79:DoCleaning();
    end);
end;

function u7.groundedProjectileOnhit(p81, p82, u83) -- Line: 632
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local u84 = ReplicatedStorage.Assets.Effects.EggExplosion:Clone();
    u84.Parent = Workspace;
    u84.Position = p82;
    SoundManager:playSound(GameSound.GLUE_ENCHANT_01, {
        rollOffMaxDistance = 220,
        volumeMultiplier = 2,
        position = p82
    });
    local v85 = u84:GetDescendants();

    local function v87(p86) -- Line: 642
        -- upvalues: u83 (copy)
        if p86:IsA("ParticleEmitter") then
            p86:Emit(30);
            p86.Speed = NumberRange.new(u83 / p86.Lifetime.Max, u83 / p86.Lifetime.Max);
            p86:Emit(15);
        end;
    end;

    for i, v in v85 do
        v87(v, i - 1, v85);
    end;

    task.delay(1, function() -- Line: 653
        -- upvalues: u84 (copy)
        return u84:Destroy();
    end);
end;

function u7.silenceProjectileOnhit(p88, p89, p90) -- Line: 657
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.SPEAR_HIT, {
        rollOffMaxDistance = 100,
        position = p89
    });
    local u91 = u3.new();
    local v92 = u4("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = Vector3.new(p90, p90, p90),
        Shape = Enum.PartType.Ball,
        Position = p89,
        Parent = Workspace
    });
    u91:GiveTask(v92);
    local Silence = ReplicatedStorage.Assets.Effects.CustomEffects:WaitForChild("Silence", 3);

    if Silence ~= nil then
        Silence = Silence:Clone();
    end;

    if Silence then
        CollectionService:AddTag(Silence, "FirstPersonHidden");
        Silence.Parent = v92;
        Silence:Emit(10 + p90 * 3);
    end;

    task.delay(1, function() -- Line: 688
        -- upvalues: u91 (copy)
        u91:DoCleaning();
    end);
end;

function u7.regenProjectileOnhit(p93, p94, p95) -- Line: 692
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.HEALING_BACKPACK_USED, {
        rollOffMaxDistance = 100,
        position = p94
    });
    local u96 = u3.new();
    local v97 = u4("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = Vector3.new(p95, p95, p95),
        Shape = Enum.PartType.Ball,
        Position = p94,
        Parent = Workspace
    });
    u96:GiveTask(v97);
    local Healing = ReplicatedStorage.Assets.Effects.CustomEffects:WaitForChild("Healing", 3);

    if Healing ~= nil then
        Healing = Healing:Clone();
    end;

    if Healing then
        CollectionService:AddTag(Healing, "FirstPersonHidden");
        Healing.EmissionDirection = Enum.NormalId.Top;
        Healing.Parent = v97;
        Healing:Emit(10 + p95 * 3);
    end;

    task.delay(1, function() -- Line: 724
        -- upvalues: u96 (copy)
        u96:DoCleaning();
    end);
end;

function u7.shieldProjectileOnhit(p98, p99, p100) -- Line: 728
    -- upvalues: SoundManager (copy), GameSound (copy), u3 (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), CollectionService (copy)
    SoundManager:playSound(GameSound.STONE_SHIELD_REACTIVE, {
        rollOffMaxDistance = 100,
        position = p99
    });
    local u101 = u3.new();
    local v102 = u4("Part", {
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Size = Vector3.new(p100, p100, p100),
        Shape = Enum.PartType.Ball,
        Position = p99,
        Parent = Workspace
    });
    u101:GiveTask(v102);
    local Shield = ReplicatedStorage.Assets.Effects.CustomEffects:WaitForChild("Shield", 3);

    if Shield ~= nil then
        Shield = Shield:Clone();
    end;

    if Shield then
        Shield.EmissionDirection = Enum.NormalId.Top;
        CollectionService:AddTag(Shield, "FirstPersonHidden");
        Shield.Parent = v102;
        Shield:Emit(10 + p100 * 3);
    end;

    task.delay(1, function() -- Line: 760
        -- upvalues: u101 (copy)
        u101:DoCleaning();
    end);
end;

KnitClient.CreateController(u7.new());

return nil;