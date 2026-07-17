-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local AuraType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "rebellion-leader", "rebellion-leader-util").AuraType;
local HalloweenBalanceConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local HalloweenUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType;
local HalloweenUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "HalloweenSilasController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 44
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 48
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p6, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p6.Name = "HalloweenSilasController";
    p6.abilityMounted = false;
    p6.auraMap = {};
    p6.halloweenRadiusStackMap = {};
    p6.inited = false;
end;

function u4.KnitStart(p7) -- Line: 56
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p7);
end;

function u4.onGameInit(u8) -- Line: 59
    -- upvalues: default2 (copy), HalloweenKit (copy), KnitClient2 (copy), BedwarsKitSkin (copy), Players (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), WeldUtil (copy), AuraType (copy), GameSound (copy), SoundManager (copy), ClientSyncEvents (copy), AbilityId (copy), StatusEffectType (copy), EntityUtil (copy), HalloweenUpgradeType (copy), HalloweenUpgradeUtil (copy), HalloweenBalanceConfig (copy)
    default2.Client:Get("HalloweenSetKit"):Connect(function(p9) -- Line: 60
        -- upvalues: u8 (copy), HalloweenKit (ref)
        if not u8.inited then
            if p9.kit == HalloweenKit.REBELLION_LEADER then
                u8:mountABilityButton();
            end;

            u8.inited = true;
        end;
    end);
    default2.Client:Get("UpdateRebellionAura"):Connect(function(p10) -- Line: 68
        -- upvalues: KnitClient2 (ref), BedwarsKitSkin (ref), Players (ref), ReplicatedStorage (ref), GameAnimationUtil (ref), AnimationType (ref), WeldUtil (ref), u8 (copy), AuraType (ref), GameSound (ref), SoundManager (ref)
        local v11;

        if p10.player.Character then
            v11 = KnitClient2.Controllers.KitController:getKitSkin(p10.player.Character) == BedwarsKitSkin.GREAT_WOLF_SILAS;
        else
            v11 = false;
        end;

        if p10.player == Players.LocalPlayer and (p10.player.Character and p10.newAura) then
            local u12;

            if v11 then
                u12 = ReplicatedStorage.Assets.Effects.GreatWolfRebellionFlag:Clone();
            else
                u12 = ReplicatedStorage.Assets.Effects.RebellionFlag:Clone();
            end;

            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REBELLION_WAVE_FLAG);
            u12.Parent = p10.player.Character;
            WeldUtil:weldAccessory(p10.player.Character, u12);
            task.delay(1, function() -- Line: 75
                -- upvalues: u12 (copy)
                u12:Destroy();
            end);
        end;

        if p10.player.Team ~= Players.LocalPlayer.Team then
            return nil;
        end;

        u8:mountAuraEffect(p10.player);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character or p10.newAura ~= AuraType.HEALING then
            if Character and p10.newAura == AuraType.DAMAGE then
                local v13;

                if v11 then
                    v13 = GameSound.WOLF_REBELLION_ATTACK;
                else
                    v13 = GameSound.REBELLION_ATTACK;
                end;

                SoundManager:playSound(v13, {
                    rollOffMaxDistance = 220,
                    volumeMultiplier = 0.5,
                    position = Character
                });
            end;

            return;
        end;

        local v14;

        if v11 then
            v14 = GameSound.WOLF_REBELLION_HEAL;
        else
            v14 = GameSound.REBELLION_HEAL;
        end;

        SoundManager:playSound(v14, {
            rollOffMaxDistance = 220,
            volumeMultiplier = 0.5,
            position = Character
        });
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p15) -- Line: 108
        -- upvalues: AbilityId (ref), Players (ref), KnitClient2 (ref), BedwarsKitSkin (ref), GameSound (ref), SoundManager (ref), u8 (copy), GameAnimationUtil (ref), AnimationType (ref)
        if p15.ability == AbilityId.REBELLION_SHIELD then
            local v16 = Players:GetPlayerFromCharacter(p15.userCharacter);
            local PrimaryPart = p15.userCharacter.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            local v17 = KnitClient2.Controllers.KitController:getKitSkin(p15.userCharacter) == BedwarsKitSkin.GREAT_WOLF_SILAS;

            if PrimaryPart then
                local v18;

                if v17 then
                    v18 = GameSound.WOLF_REBELLION_SHIELD;
                else
                    v18 = GameSound.REBELLION_SHIELD;
                end;

                SoundManager:playSound(v18, {
                    rollOffMaxDistance = 220,
                    position = PrimaryPart
                });
            end;

            if v16 then
                u8:releasePulse(v16);

                if v16 == Players.LocalPlayer then
                    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REBELLION_POINT_SWORD);
                end;
            end;
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p19) -- Line: 132
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), KnitClient2 (ref), BedwarsKitSkin (ref), GameSound (ref), SoundManager (ref)
        if p19.statusEffect ~= StatusEffectType.TRIUMPH then
            return nil;
        end;

        local v20 = EntityUtil:getPlayerFromEntityInstance(p19.entityInstance);
        local v21;

        if v20 == nil then
            v21 = v20;
        else
            v21 = v20.Character;
        end;

        if not v21 then
            return nil;
        end;

        local v22;

        if KnitClient2.Controllers.KitController:getKitSkin(v20.Character) == BedwarsKitSkin.GREAT_WOLF_SILAS then
            v22 = GameSound.WOLF_REBELLION_GAIN_STACK;
        else
            v22 = GameSound.REBELLION_GAIN_STACK;
        end;

        SoundManager:playSound(v22, {
            volumeMultiplier = 0.5
        });
    end);
    default2.Client:Get("RebellionBuffAllyEffect"):Connect(function(p23) -- Line: 150
        -- upvalues: AuraType (ref), ReplicatedStorage (ref)
        local u24;

        if p23.auraType == AuraType.HEALING then
            u24 = Color3.new(0.22, 0.91, 0.05);
        else
            u24 = Color3.new(0.82, 0.91, 0.05);
        end;

        local players = p23.players;

        local function v27(p25) -- Line: 153
            -- upvalues: ReplicatedStorage (ref), u24 (copy)
            local u26 = ReplicatedStorage.Assets.Effects.AuraParticle:Clone();
            local Specs = u26:WaitForChild("Specs", 1);
            local Character = p25.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not (Character and Specs) then
                return nil;
            end;

            Specs.Color = ColorSequence.new(u24);
            Specs.Parent = Character;
            Specs:Emit(3);
            task.delay(1, function() -- Line: 167
                -- upvalues: Specs (copy), u26 (copy)
                Specs:Destroy();
                u26:Destroy();
            end);
        end;

        for i, v in players do
            v27(v, i - 1, players);
        end;
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("GiveSkillUpgrade"):Connect(function(p28) -- Line: 177
        -- upvalues: HalloweenUpgradeType (ref), EntityUtil (ref), HalloweenUpgradeUtil (ref), u8 (copy), HalloweenBalanceConfig (ref)
        if p28.halloweenUpgradeType == HalloweenUpgradeType.SILAS_AURA_RADIUS then
            local v29 = EntityUtil:getEntity(p28.player);

            if not v29 then
                return nil;
            end;

            local v30 = v29:getPlayer();

            if not v30 then
                return nil;
            end;

            local v31 = HalloweenUpgradeUtil:getAbilityStacks(v30, p28.halloweenUpgradeType);
            u8.halloweenRadiusStackMap[p28.player] = v31;
            local v32 = 1 + v31 * HalloweenBalanceConfig.SILAS_AURA_RADIUS_PERCENT / 100;

            if u8.currentEffect then
                u8.currentEffect.Size = Vector3.new(v32 * u8.currentEffect.Size.X, u8.currentEffect.Size.Y, v32 * u8.currentEffect.Size.Z);
            end;
        end;
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SilasHexActivate"):Connect(function(p33) -- Line: 198
        -- upvalues: Players (ref), EntityUtil (ref), SoundManager (ref), GameSound (ref)
        local v34 = Players.LocalPlayer == p33.player;
        local v35 = EntityUtil:getEntity(p33.player);

        if v35 ~= nil then
            v35 = v35:getInstance();
        end;

        local SILAS_HALLOWEEN_HEX = GameSound.SILAS_HALLOWEEN_HEX;
        local v36 = {};

        if v34 then
            v35 = nil;
        elseif v35 ~= nil then
            v35 = v35.PrimaryPart;

            if v35 ~= nil then
                v35 = v35.Position;
            end;
        end;

        v36.position = v35;
        SoundManager:playSound(SILAS_HALLOWEEN_HEX, v36);
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SilasBuffActivate"):Connect(function(p37) -- Line: 225
        -- upvalues: Players (ref), EntityUtil (ref), SoundManager (ref), GameSound (ref)
        local v38 = Players.LocalPlayer == p37.player;
        local v39 = EntityUtil:getEntity(p37.player);

        if v39 ~= nil then
            v39 = v39:getInstance();
        end;

        local SILAS_HALLOWEEN_BUFF = GameSound.SILAS_HALLOWEEN_BUFF;
        local v40 = {};

        if v38 then
            v39 = nil;
        elseif v39 ~= nil then
            v39 = v39.PrimaryPart;

            if v39 ~= nil then
                v39 = v39.Position;
            end;
        end;

        v40.position = v39;
        SoundManager:playSound(SILAS_HALLOWEEN_BUFF, v40);
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SilasEnemyHexed"):Connect(function(u41) -- Line: 253
        -- upvalues: u8 (copy)
        task.delay(0.2, function() -- Line: 254
            -- upvalues: u8 (ref), u41 (copy)
            u8:mountSilasHexedEffect(u41.entityInstance);
        end);
    end);
    default2.Client:GetNamespace("Halloween2025Remotes"):Get("SilasAllyBuffed"):Connect(function(u42) -- Line: 258
        -- upvalues: u8 (copy)
        task.delay(0.2, function() -- Line: 259
            -- upvalues: u8 (ref), u42 (copy)
            u8:mountSilasAllyBuffEffect(u42.entityInstance, u42.auraType);
        end);
    end);
end;

function u4.mountABilityButton(p43) -- Line: 264
    -- upvalues: Flamework (copy), AbilityId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.REBELLION_AURA_SWAP, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = "rbxassetid://94018856518848"
        }
    }):expect();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.REBELLION_SHIELD, {
        abilityType = "KitSecondary",
        abilityButton = {
            icon = "rbxassetid://133802871831157"
        }
    }):expect();
end;

function u4.mountSilasAllyBuffEffect(p44, p45, p46) -- Line: 278
    -- upvalues: AuraType (copy), ReplicatedStorage (copy), Workspace (copy), WeldUtil (copy)
    if not p45 then
        return nil;
    end;

    local u47;

    if p46 == AuraType.HEALING then
        u47 = ReplicatedStorage.Assets.Effects.SilasHealBuffEffect:Clone();
    else
        u47 = nil;
    end;

    if p46 == AuraType.DAMAGE then
        u47 = ReplicatedStorage.Assets.Effects.SilasDamageBuffEffect:Clone();
    end;

    if not u47 then
        return nil;
    end;

    u47.Parent = Workspace;
    u47.Massless = true;
    u47.CFrame = p45.HumanoidRootPart.CFrame;
    WeldUtil:weldParts(p45.HumanoidRootPart, u47);
    task.delay(2, function() -- Line: 298
        -- upvalues: u47 (ref)
        if u47 then
            u47:Destroy();
        end;
    end);
end;

function u4.mountSilasHexedEffect(p48, p49) -- Line: 304
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), WeldUtil (copy)
    if not p49 then
        return nil;
    end;

    local u50 = ReplicatedStorage.Assets.Effects.SilasHexedEffect:Clone();
    u50.Parent = Workspace;
    u50.Massless = true;
    u50.CFrame = p49.HumanoidRootPart.CFrame;
    WeldUtil:weldParts(p49.HumanoidRootPart, u50);
    task.delay(2, function() -- Line: 315
        -- upvalues: u50 (copy)
        u50:Destroy();
    end);
end;

function u4.mountAuraEffect(u51, u52) -- Line: 319
    -- upvalues: HalloweenBalanceConfig (copy), AuraType (copy), ReplicatedStorage (copy), BedwarsKitSkinMeta (copy), u2 (copy), Workspace (copy), Players (copy), RunService (copy)
    local v53 = u51.auraMap[u52];

    if v53 ~= nil then
        v53.maid:DoCleaning();
    end;

    local v54 = u52:GetAttribute("LeaderAuraType");
    local Character = u52.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    local u55 = Character;

    if not u55 then
        return nil;
    end;

    local v56;

    if u51.halloweenRadiusStackMap[u52] == nil then
        v56 = 0;
    else
        local v57 = u51.halloweenRadiusStackMap[u52];

        if v57 == 0 or (v57 ~= v57 or not v57) then
            return nil;
        end;

        v56 = 1 + v57 * HalloweenBalanceConfig.SILAS_AURA_RADIUS_PERCENT / 100;
    end;

    local u58;

    if v54 == AuraType.HEALING then
        local RebellionHealingAura = ReplicatedStorage.Assets.Effects.RebellionHealingAura;
        local v59 = u51:getSkin(u52);

        if v59 then
            local v60 = BedwarsKitSkinMeta[v59];
            local rebellion_leader = v60.rebellion_leader;

            if rebellion_leader ~= nil then
                rebellion_leader = rebellion_leader.auraEffect;

                if rebellion_leader ~= nil then
                    rebellion_leader = rebellion_leader.healingAura;
                end;
            end;

            if rebellion_leader then
                RebellionHealingAura = v60.rebellion_leader.auraEffect.healingAura;
            end;
        end;

        u58 = RebellionHealingAura:Clone();
    else
        if v54 ~= AuraType.DAMAGE then
            return nil;
        end;

        local RebellionDamageAura = ReplicatedStorage.Assets.Effects.RebellionDamageAura;
        local v61 = u51:getSkin(u52);

        if v61 then
            local v62 = BedwarsKitSkinMeta[v61];
            local rebellion_leader = v62.rebellion_leader;

            if rebellion_leader ~= nil then
                rebellion_leader = rebellion_leader.auraEffect;

                if rebellion_leader ~= nil then
                    rebellion_leader = rebellion_leader.damageAura;
                end;
            end;

            if rebellion_leader then
                RebellionDamageAura = v62.rebellion_leader.auraEffect.damageAura;
            end;
        end;

        u58 = RebellionDamageAura:Clone();
    end;

    if v56 > 0 then
        u58.Size = Vector3.new(v56 * u58.Size.X, u58.Size.Y, v56 * u58.Size.Z);
    end;

    local u63 = u2.new();
    u58.Parent = Workspace;
    u58:PivotTo(u55);
    u63:GiveTask(u58);
    u63:GiveTask(function() -- Line: 395
        -- upvalues: u51 (copy)
        u51.currentEffect = nil;
    end);
    local u64 = 0;
    u51.auraMap[u52] = {
        maid = u63,
        effect = u58
    };

    if u52 == Players.LocalPlayer then
        local UI = u58:WaitForChild("UI", 1);

        if UI ~= nil then
            UI = UI:WaitForChild("Logo", 1);
        end;

        if UI then
            UI.ImageTransparency = 0.5;
        end;
    end;

    u63:GiveTask(RunService.Heartbeat:Connect(function(p65) -- Line: 416
        -- upvalues: u52 (copy), u55 (ref), u58 (ref), u63 (copy), u51 (copy), u64 (ref)
        local Character2 = u52.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame;
            end;
        end;

        u55 = Character2;

        if not (u55 and u58) then
            u63:DoCleaning();
            u51.auraMap[u52] = nil;

            return nil;
        end;

        u64 = u64 + p65;
        u58.Position = u55.Position - Vector3.new(0, 3, 0);
        u58.CFrame = u58.CFrame * CFrame.Angles(0, 0.006135923151542565, 0);
    end));
end;

function u4.releasePulse(p66, p67) -- Line: 441
    -- upvalues: HalloweenUpgradeUtil (copy), HalloweenUpgradeType (copy)
    p66:SwordCrossEffect(p67);
    local v68 = p66.auraMap[p67];

    if v68 ~= nil then
        v68 = v68.effect;
    end;

    if v68 then
        local v69;

        if v68 == nil then
            v69 = v68;
        else
            v69 = v68:WaitForChild("1", 1);
        end;

        if v69 then
            local function _(p70) -- Line: 458
                if p70.Name == "pulsing" and p70:IsA("ParticleEmitter") then
                    p70:Emit(1);
                end;
            end;

            for i, child in v69:GetChildren() do
                local _ = i - 1;

                if child.Name == "pulsing" and child:IsA("ParticleEmitter") then
                    child:Emit(1);
                end;
            end;
        end;

        if HalloweenUpgradeUtil:isActive(p67, HalloweenUpgradeType.SILAS_AURA_DEBUFF) then
            local u71;

            if v68 == nil then
                u71 = v68;
            else
                u71 = v68:WaitForChild("1", 1);

                if u71 ~= nil then
                    u71 = u71:WaitForChild("hexPulse");
                end;
            end;

            task.delay(0.2, function() -- Line: 476
                -- upvalues: u71 (copy)
                if u71 then
                    u71:Emit(1);
                end;
            end);
        end;

        local function _(u72) -- Line: 483
            if u72:IsA("ParticleEmitter") then
                u72.Enabled = true;
                task.delay(6.5, function() -- Line: 486
                    -- upvalues: u72 (copy)
                    u72.Enabled = false;
                end);
            end;
        end;

        for i, child in v68:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
                task.delay(6.5, function() -- Line: 486
                    -- upvalues: child (copy)
                    child.Enabled = false;
                end);
            end;
        end;
    end;
end;

function u4.SwordCrossEffect(p73, u74) -- Line: 496
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), default (copy), InQuad (copy)
    local u75 = ReplicatedStorage.Assets.Effects.SwordCross:Clone();
    local Character = u74.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position + Vector3.new(0, 9, 0);
        end;
    end;

    local u76 = Character;
    local CurrentCamera = Workspace.CurrentCamera;
    local Left = u75:WaitForChild("Left", 1);
    local Right = u75:WaitForChild("Right", 1);

    if not (Left and (Right and (CurrentCamera and u76))) then
        return nil;
    end;

    local Position = CurrentCamera.CFrame.Position;
    local v77 = Vector3.new(0, u76.Y, 0);
    u75:PivotTo(CFrame.new(u76, Position * Vector3.new(1, 0, 1) + v77) * CFrame.Angles(0, 0, 0));
    u75.Parent = Workspace;
    local u80 = RunService.Heartbeat:Connect(function(p78) -- Line: 523
        -- upvalues: u74 (copy), u76 (ref), u75 (copy), CurrentCamera (copy)
        local Character2 = u74.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position + Vector3.new(0, 9, 0);
            end;
        end;

        u76 = Character2;

        if not u76 then
            return nil;
        end;

        local Position2 = CurrentCamera.CFrame.Position;
        local v79 = Vector3.new(0, u76.Y, 0);
        u75:PivotTo(CFrame.new(u76, Position2 * Vector3.new(1, 0, 1) + v79) * CFrame.Angles(0, 0, 0));
    end);
    task.delay(0.2, function() -- Line: 546
        -- upvalues: u75 (copy)
        local PrimaryPart = u75.PrimaryPart;

        if PrimaryPart ~= nil then
            local function _(p81) -- Line: 550
                if p81:IsA("ParticleEmitter") then
                    p81:Emit(15);
                end;
            end;

            for i, child in PrimaryPart:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child:Emit(15);
                end;
            end;
        end;
    end);
    task.delay(0.8, function() -- Line: 560
        -- upvalues: u75 (copy), u80 (copy)
        u75:Destroy();
        u80:Disconnect();
    end);
    default(0.2, InQuad, function(p82) -- Line: 564
        -- upvalues: Left (copy)
        Left.Position = p82;
    end, Left.CFrame.Position, u75.PrimaryPart.CFrame.Position);
    default(0.2, InQuad, function(p83) -- Line: 567
        -- upvalues: Right (copy)
        Right.Position = p83;
    end, Right.CFrame.Position, u75.PrimaryPart.CFrame.Position);
end;

function u4.getSkin(p84, p85) -- Line: 571
    -- upvalues: KnitClient (copy)
    local v86;

    if p85.Character then
        v86 = KnitClient.Controllers.KitSkinController:getKitSkin(p85.Character);
    else
        v86 = nil;
    end;

    return v86;
end;

KnitClient.CreateController(u4.new());

return nil;