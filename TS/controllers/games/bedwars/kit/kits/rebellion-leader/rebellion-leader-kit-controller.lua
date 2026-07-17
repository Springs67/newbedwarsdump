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
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local AuraType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "rebellion-leader", "rebellion-leader-util").AuraType;
local HalloweenAbilityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType;
local HalloweenAbilityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil;
local HalloweenBalanceConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "RebellionLeaderKitController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 44
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy)
    BaseKitController.constructor(p6, BedwarsKit.REBELLION_LEADER);
    p6.Name = "RebellionLeaderKitController";
    p6.abilityMounted = false;
    p6.auraMap = {};
    p6.halloweenRadiusStackMap = {};
    p6.abilityMaid = u2.new();
end;

function u4.onKitLocalActivated(p7, p8) -- Line: 56
    if p7.abilityMounted then
        return nil;
    end;

    p7.abilityMounted = true;
    p7:mountABilityButton();
end;

function u4.onKitLocalDeactivated(p9) -- Line: 63
    p9.abilityMaid:DoCleaning();
    p9.abilityMounted = false;
end;

function u4.onKitReplicationActivated(u10, p11) -- Line: 67
    -- upvalues: default2 (copy), KnitClient2 (copy), BedwarsKitSkin (copy), Players (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), WeldUtil (copy), AuraType (copy), GameSound (copy), SoundManager (copy), ClientSyncEvents (copy), StatusEffectType (copy), EntityUtil (copy), HalloweenAbilityType (copy), HalloweenAbilityUtil (copy), HalloweenBalanceConfig (copy)
    p11:GiveTask(default2.Client:Get("UpdateRebellionAura"):Connect(function(p12) -- Line: 68
        -- upvalues: KnitClient2 (ref), BedwarsKitSkin (ref), Players (ref), ReplicatedStorage (ref), GameAnimationUtil (ref), AnimationType (ref), WeldUtil (ref), u10 (copy), AuraType (ref), GameSound (ref), SoundManager (ref)
        local v13;

        if p12.player.Character then
            v13 = KnitClient2.Controllers.KitController:getKitSkin(p12.player.Character) == BedwarsKitSkin.GREAT_WOLF_SILAS;
        else
            v13 = false;
        end;

        if p12.player == Players.LocalPlayer and (p12.player.Character and p12.newAura) then
            local u14;

            if v13 then
                u14 = ReplicatedStorage.Assets.Effects.GreatWolfRebellionFlag:Clone();
            else
                u14 = ReplicatedStorage.Assets.Effects.RebellionFlag:Clone();
            end;

            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REBELLION_WAVE_FLAG);
            u14.Parent = p12.player.Character;
            WeldUtil:weldAccessory(p12.player.Character, u14);
            task.delay(1, function() -- Line: 75
                -- upvalues: u14 (copy)
                u14:Destroy();
            end);
        end;

        if p12.player.Team ~= Players.LocalPlayer.Team then
            return nil;
        end;

        u10:mountAuraEffect(p12.player);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character or p12.newAura ~= AuraType.HEALING then
            if Character and p12.newAura == AuraType.DAMAGE then
                local v15;

                if v13 then
                    v15 = GameSound.WOLF_REBELLION_ATTACK;
                else
                    v15 = GameSound.REBELLION_ATTACK;
                end;

                SoundManager:playSound(v15, {
                    rollOffMaxDistance = 220,
                    volumeMultiplier = 0.5,
                    position = Character
                });
            end;

            return;
        end;

        local v16;

        if v13 then
            v16 = GameSound.WOLF_REBELLION_HEAL;
        else
            v16 = GameSound.REBELLION_HEAL;
        end;

        SoundManager:playSound(v16, {
            rollOffMaxDistance = 220,
            volumeMultiplier = 0.5,
            position = Character
        });
    end));
    p11:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p17) -- Line: 108
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), KnitClient2 (ref), BedwarsKitSkin (ref), GameSound (ref), SoundManager (ref)
        if p17.statusEffect ~= StatusEffectType.TRIUMPH then
            return nil;
        end;

        local v18 = EntityUtil:getPlayerFromEntityInstance(p17.entityInstance);
        local v19;

        if v18 == nil then
            v19 = v18;
        else
            v19 = v18.Character;
        end;

        if not v19 then
            return nil;
        end;

        local v20;

        if KnitClient2.Controllers.KitController:getKitSkin(v18.Character) == BedwarsKitSkin.GREAT_WOLF_SILAS then
            v20 = GameSound.WOLF_REBELLION_GAIN_STACK;
        else
            v20 = GameSound.REBELLION_GAIN_STACK;
        end;

        SoundManager:playSound(v20, {
            volumeMultiplier = 0.5,
            parent = v18.Character.PrimaryPart
        });
    end));
    p11:GiveTask(default2.Client:Get("RebellionBuffAllyEffect"):Connect(function(p21) -- Line: 127
        -- upvalues: AuraType (ref), ReplicatedStorage (ref)
        local u22;

        if p21.auraType == AuraType.HEALING then
            u22 = Color3.new(0.22, 0.91, 0.05);
        else
            u22 = Color3.new(0.82, 0.91, 0.05);
        end;

        local players = p21.players;

        local function v25(p23) -- Line: 130
            -- upvalues: ReplicatedStorage (ref), u22 (copy)
            local u24 = ReplicatedStorage.Assets.Effects.AuraParticle:Clone();
            local Specs = u24:WaitForChild("Specs", 1);
            local Character = p23.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not (Character and Specs) then
                return nil;
            end;

            Specs.Color = ColorSequence.new(u22);
            Specs.Parent = Character;
            Specs:Emit(3);
            task.delay(1, function() -- Line: 144
                -- upvalues: Specs (copy), u24 (copy)
                Specs:Destroy();
                u24:Destroy();
            end);
        end;

        for i, v in players do
            v25(v, i - 1, players);
        end;
    end));
    p11:GiveTask(default2.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p26) -- Line: 153
        -- upvalues: HalloweenAbilityType (ref), EntityUtil (ref), HalloweenAbilityUtil (ref), u10 (copy), HalloweenBalanceConfig (ref)
        if p26.halloweenAbilityType == HalloweenAbilityType.SILAS_AURA_RADIUS then
            local v27 = EntityUtil:getEntity(p26.player);

            if not v27 then
                return nil;
            end;

            local v28 = v27:getPlayer();

            if not v28 then
                return nil;
            end;

            local v29 = HalloweenAbilityUtil:getAbilityStacks(v28, p26.halloweenAbilityType);
            u10.halloweenRadiusStackMap[p26.player] = v29;
            local v30 = 1 + v29 * HalloweenBalanceConfig.SILAS_AURA_RADIUS_PERCENT / 100;

            if u10.currentEffect then
                u10.currentEffect.Size = Vector3.new(v30 * u10.currentEffect.Size.X, u10.currentEffect.Size.Y, v30 * u10.currentEffect.Size.Z);
            end;
        end;
    end));
    p11:GiveTask(default2.Client:GetNamespace("Halloween2024Remotes"):Get("SilasHexActivate"):Connect(function(p31) -- Line: 173
        -- upvalues: Players (ref), EntityUtil (ref), SoundManager (ref), GameSound (ref)
        local v32 = Players.LocalPlayer == p31.player;
        local v33 = EntityUtil:getEntity(p31.player);

        if v33 ~= nil then
            v33 = v33:getInstance();
        end;

        local SILAS_HALLOWEEN_HEX = GameSound.SILAS_HALLOWEEN_HEX;
        local v34 = {};

        if v32 then
            v33 = nil;
        elseif v33 ~= nil then
            v33 = v33.PrimaryPart;

            if v33 ~= nil then
                v33 = v33.Position;
            end;
        end;

        v34.position = v33;
        SoundManager:playSound(SILAS_HALLOWEEN_HEX, v34);
    end));
    p11:GiveTask(default2.Client:GetNamespace("Halloween2024Remotes"):Get("SilasBuffActivate"):Connect(function(p35) -- Line: 200
        -- upvalues: Players (ref), EntityUtil (ref), SoundManager (ref), GameSound (ref)
        local v36 = Players.LocalPlayer == p35.player;
        local v37 = EntityUtil:getEntity(p35.player);

        if v37 ~= nil then
            v37 = v37:getInstance();
        end;

        local SILAS_HALLOWEEN_BUFF = GameSound.SILAS_HALLOWEEN_BUFF;
        local v38 = {};

        if v36 then
            v37 = nil;
        elseif v37 ~= nil then
            v37 = v37.PrimaryPart;

            if v37 ~= nil then
                v37 = v37.Position;
            end;
        end;

        v38.position = v37;
        SoundManager:playSound(SILAS_HALLOWEEN_BUFF, v38);
    end));
    p11:GiveTask(default2.Client:GetNamespace("Halloween2024Remotes"):Get("SilasEnemyHexed"):Connect(function(u39) -- Line: 227
        -- upvalues: u10 (copy)
        task.delay(0.2, function() -- Line: 228
            -- upvalues: u10 (ref), u39 (copy)
            u10:mountSilasHexedEffect(u39.entityInstance);
        end);
    end));
    p11:GiveTask(default2.Client:GetNamespace("Halloween2024Remotes"):Get("SilasAllyBuffed"):Connect(function(u40) -- Line: 232
        -- upvalues: u10 (copy)
        task.delay(0.2, function() -- Line: 233
            -- upvalues: u10 (ref), u40 (copy)
            u10:mountSilasAllyBuffEffect(u40.entityInstance, u40.auraType);
        end);
    end));
end;

function u4.onKitReplicationDeactivated(p41) -- Line: 238
end;

function u4.onInnateAbilityEnabled(p42, p43, p44) -- Line: 240
end;

function u4.onAbilityUsed(p45, p46, p47) -- Line: 242
    -- upvalues: AbilityId (copy), Players (copy), KnitClient2 (copy), BedwarsKitSkin (copy), GameSound (copy), SoundManager (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p47.ability == AbilityId.REBELLION_SHIELD then
        local v48 = Players:GetPlayerFromCharacter(p47.userCharacter);
        local PrimaryPart = p47.userCharacter.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        local v49 = KnitClient2.Controllers.KitController:getKitSkin(p47.userCharacter) == BedwarsKitSkin.GREAT_WOLF_SILAS;

        if PrimaryPart then
            local v50;

            if v49 then
                v50 = GameSound.WOLF_REBELLION_SHIELD;
            else
                v50 = GameSound.REBELLION_SHIELD;
            end;

            SoundManager:playSound(v50, {
                rollOffMaxDistance = 220,
                position = PrimaryPart
            });
        end;

        if v48 then
            p45:releasePulse(v48);

            if v48 == Players.LocalPlayer then
                GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.REBELLION_POINT_SWORD);
            end;
        end;
    end;
end;

function u4.mountABilityButton(p51) -- Line: 266
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local abilityMaid = p51.abilityMaid;
    local v52 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local REBELLION_AURA_SWAP = AbilityId.REBELLION_AURA_SWAP;
    local v53 = {};

    for i, v in AbilityMeta[AbilityId.REBELLION_AURA_SWAP].triggerConfig do
        v53[i] = v;
    end;

    abilityMaid:GiveTask(v52:enableAbility(REBELLION_AURA_SWAP, v53):expect());
    local abilityMaid2 = p51.abilityMaid;
    local v54 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local REBELLION_SHIELD = AbilityId.REBELLION_SHIELD;
    local v55 = {};

    for i, v in AbilityMeta[AbilityId.REBELLION_SHIELD].triggerConfig do
        v55[i] = v;
    end;

    abilityMaid2:GiveTask(v54:enableAbility(REBELLION_SHIELD, v55):expect());
end;

function u4.mountSilasAllyBuffEffect(p56, p57, p58) -- Line: 284
    -- upvalues: AuraType (copy), ReplicatedStorage (copy), Workspace (copy), WeldUtil (copy)
    if not p57 then
        return nil;
    end;

    local u59;

    if p58 == AuraType.HEALING then
        u59 = ReplicatedStorage.Assets.Effects.SilasHealBuffEffect:Clone();
    else
        u59 = nil;
    end;

    if p58 == AuraType.DAMAGE then
        u59 = ReplicatedStorage.Assets.Effects.SilasDamageBuffEffect:Clone();
    end;

    if not u59 then
        return nil;
    end;

    u59.Parent = Workspace;
    u59.Massless = true;
    u59.CFrame = p57.HumanoidRootPart.CFrame;
    WeldUtil:weldParts(p57.HumanoidRootPart, u59);
    task.delay(2, function() -- Line: 304
        -- upvalues: u59 (ref)
        if u59 then
            u59:Destroy();
        end;
    end);
end;

function u4.mountSilasHexedEffect(p60, p61) -- Line: 310
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), WeldUtil (copy)
    if not p61 then
        return nil;
    end;

    local u62 = ReplicatedStorage.Assets.Effects.SilasHexedEffect:Clone();
    u62.Parent = Workspace;
    u62.Massless = true;
    u62.CFrame = p61.HumanoidRootPart.CFrame;
    WeldUtil:weldParts(p61.HumanoidRootPart, u62);
    task.delay(2, function() -- Line: 321
        -- upvalues: u62 (copy)
        u62:Destroy();
    end);
end;

function u4.mountAuraEffect(u63, u64) -- Line: 325
    -- upvalues: HalloweenBalanceConfig (copy), AuraType (copy), ReplicatedStorage (copy), BedwarsKitSkinMeta (copy), u2 (copy), Workspace (copy), Players (copy), RunService (copy)
    local v65 = u63.auraMap[u64];

    if v65 ~= nil then
        v65.maid:DoCleaning();
    end;

    local v66 = u64:GetAttribute("LeaderAuraType");
    local Character = u64.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    local u67 = Character;

    if not u67 then
        return nil;
    end;

    local v68;

    if u63.halloweenRadiusStackMap[u64] == nil then
        v68 = 0;
    else
        local v69 = u63.halloweenRadiusStackMap[u64];

        if v69 == 0 or (v69 ~= v69 or not v69) then
            return nil;
        end;

        v68 = 1 + v69 * HalloweenBalanceConfig.SILAS_AURA_RADIUS_PERCENT / 100;
    end;

    local u70;

    if v66 == AuraType.HEALING then
        local RebellionHealingAura = ReplicatedStorage.Assets.Effects.RebellionHealingAura;
        local v71 = u63:getSkin(u64);

        if v71 then
            local v72 = BedwarsKitSkinMeta[v71];
            local rebellion_leader = v72.rebellion_leader;

            if rebellion_leader ~= nil then
                rebellion_leader = rebellion_leader.auraEffect;

                if rebellion_leader ~= nil then
                    rebellion_leader = rebellion_leader.healingAura;
                end;
            end;

            if rebellion_leader then
                RebellionHealingAura = v72.rebellion_leader.auraEffect.healingAura;
            end;
        end;

        u70 = RebellionHealingAura:Clone();
    else
        if v66 ~= AuraType.DAMAGE then
            return nil;
        end;

        local RebellionDamageAura = ReplicatedStorage.Assets.Effects.RebellionDamageAura;
        local v73 = u63:getSkin(u64);

        if v73 then
            local v74 = BedwarsKitSkinMeta[v73];
            local rebellion_leader = v74.rebellion_leader;

            if rebellion_leader ~= nil then
                rebellion_leader = rebellion_leader.auraEffect;

                if rebellion_leader ~= nil then
                    rebellion_leader = rebellion_leader.damageAura;
                end;
            end;

            if rebellion_leader then
                RebellionDamageAura = v74.rebellion_leader.auraEffect.damageAura;
            end;
        end;

        u70 = RebellionDamageAura:Clone();
    end;

    if v68 > 0 then
        u70.Size = Vector3.new(v68 * u70.Size.X, u70.Size.Y, v68 * u70.Size.Z);
    end;

    local u75 = u2.new();
    u70.Parent = Workspace;
    u70:PivotTo(u67);
    u75:GiveTask(u70);
    u75:GiveTask(function() -- Line: 401
        -- upvalues: u63 (copy)
        u63.currentEffect = nil;
    end);
    local u76 = 0;
    u63.auraMap[u64] = {
        maid = u75,
        effect = u70
    };

    if u64 == Players.LocalPlayer then
        local UI = u70:WaitForChild("UI", 1);

        if UI ~= nil then
            UI = UI:WaitForChild("Logo", 1);
        end;

        if UI then
            UI.ImageTransparency = 0.5;
        end;
    end;

    u75:GiveTask(RunService.Heartbeat:Connect(function(p77) -- Line: 422
        -- upvalues: u64 (copy), u67 (ref), u70 (ref), u75 (copy), u63 (copy), u76 (ref)
        local Character2 = u64.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame;
            end;
        end;

        u67 = Character2;

        if not (u67 and u70) then
            u75:DoCleaning();
            u63.auraMap[u64] = nil;

            return nil;
        end;

        u76 = u76 + p77;
        u70.Position = u67.Position - Vector3.new(0, 3, 0);
        u70.CFrame = u70.CFrame * CFrame.Angles(0, 0.006135923151542565, 0);
    end));
end;

function u4.releasePulse(p78, p79) -- Line: 447
    -- upvalues: HalloweenAbilityUtil (copy), HalloweenAbilityType (copy)
    p78:SwordCrossEffect(p79);
    local v80 = p78.auraMap[p79];

    if v80 ~= nil then
        v80 = v80.effect;
    end;

    if v80 then
        local v81;

        if v80 == nil then
            v81 = v80;
        else
            v81 = v80:WaitForChild("1", 1);
        end;

        if v81 then
            local function _(p82) -- Line: 464
                if p82.Name == "pulsing" and p82:IsA("ParticleEmitter") then
                    p82:Emit(1);
                end;
            end;

            for i, child in v81:GetChildren() do
                local _ = i - 1;

                if child.Name == "pulsing" and child:IsA("ParticleEmitter") then
                    child:Emit(1);
                end;
            end;
        end;

        if HalloweenAbilityUtil:isActive(p79, HalloweenAbilityType.SILAS_AURA_DEBUFF) then
            local u83;

            if v80 == nil then
                u83 = v80;
            else
                u83 = v80:WaitForChild("1", 1);

                if u83 ~= nil then
                    u83 = u83:WaitForChild("hexPulse");
                end;
            end;

            task.delay(0.2, function() -- Line: 482
                -- upvalues: u83 (copy)
                if u83 then
                    u83:Emit(1);
                end;
            end);
        end;

        local function _(u84) -- Line: 489
            if u84:IsA("ParticleEmitter") then
                u84.Enabled = true;
                task.delay(6.5, function() -- Line: 492
                    -- upvalues: u84 (copy)
                    u84.Enabled = false;
                end);
            end;
        end;

        for i, child in v80:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
                task.delay(6.5, function() -- Line: 492
                    -- upvalues: child (copy)
                    child.Enabled = false;
                end);
            end;
        end;
    end;
end;

function u4.SwordCrossEffect(p85, u86) -- Line: 502
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), default (copy), InQuad (copy)
    local u87 = ReplicatedStorage.Assets.Effects.SwordCross:Clone();
    local Character = u86.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position + Vector3.new(0, 9, 0);
        end;
    end;

    local u88 = Character;
    local CurrentCamera = Workspace.CurrentCamera;
    local Left = u87:WaitForChild("Left", 1);
    local Right = u87:WaitForChild("Right", 1);

    if not (Left and (Right and (CurrentCamera and u88))) then
        return nil;
    end;

    local Position = CurrentCamera.CFrame.Position;
    local v89 = Vector3.new(0, u88.Y, 0);
    u87:PivotTo(CFrame.new(u88, Position * Vector3.new(1, 0, 1) + v89) * CFrame.Angles(0, 0, 0));
    u87.Parent = Workspace;
    local u92 = RunService.Heartbeat:Connect(function(p90) -- Line: 529
        -- upvalues: u86 (copy), u88 (ref), u87 (copy), CurrentCamera (copy)
        local Character2 = u86.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position + Vector3.new(0, 9, 0);
            end;
        end;

        u88 = Character2;

        if not u88 then
            return nil;
        end;

        local Position2 = CurrentCamera.CFrame.Position;
        local v91 = Vector3.new(0, u88.Y, 0);
        u87:PivotTo(CFrame.new(u88, Position2 * Vector3.new(1, 0, 1) + v91) * CFrame.Angles(0, 0, 0));
    end);
    task.delay(0.2, function() -- Line: 552
        -- upvalues: u87 (copy)
        local PrimaryPart = u87.PrimaryPart;

        if PrimaryPart ~= nil then
            local function _(p93) -- Line: 556
                if p93:IsA("ParticleEmitter") then
                    p93:Emit(15);
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
    task.delay(0.8, function() -- Line: 566
        -- upvalues: u87 (copy), u92 (copy)
        u87:Destroy();
        u92:Disconnect();
    end);
    default(0.2, InQuad, function(p94) -- Line: 570
        -- upvalues: Left (copy)
        Left.Position = p94;
    end, Left.CFrame.Position, u87.PrimaryPart.CFrame.Position);
    default(0.2, InQuad, function(p95) -- Line: 573
        -- upvalues: Right (copy)
        Right.Position = p95;
    end, Right.CFrame.Position, u87.PrimaryPart.CFrame.Position);
end;

function u4.getSkin(p96, p97) -- Line: 577
    -- upvalues: KnitClient (copy)
    local v98;

    if p97.Character then
        v98 = KnitClient.Controllers.KitSkinController:getKitSkin(p97.Character);
    else
        v98 = nil;
    end;

    return v98;
end;

KnitClient.CreateController(u4.new());

return nil;