-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SpiritGardenerEnergyAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").SpiritGardenerEnergyAttr;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SpiritGardenerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-gardener", "spirit-gardener-balance").SpiritGardenerKitBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "SpiritGardenerController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 44
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy), AnimationType (copy)
    BaseKitController.constructor(p7, BedwarsKit.SPIRIT_GARDENER, {
        sounds = {
            GameSound.SPIRIT_GARDENER_CHANNELING_LOOP,
            GameSound.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED,
            GameSound.SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT,
            GameSound.SPIRIT_GARDENER_BUFF_APPLIED
        },
        imageIds = {
            BedwarsImageId.SPIRIT_GARDENER_WATER_ICON,
            BedwarsImageId.SPIRIT_GARDENER_WATER_CANCEL_ICON,
            BedwarsImageId.CRYSTALHEART_SEED,
            BedwarsImageId.SOULVINE_SEED,
            BedwarsImageId.TEARBLOOM_SEED,
            BedwarsImageId.SOULVINE_FLOWER,
            BedwarsImageId.TEARBLOOM_FLOWER
        },
        animations = { AnimationType.SPIRIT_GARDENER_WATER }
    });
    p7.Name = "SpiritGardenerController";
    p7.chargeMaid = {};
end;

function u5.KnitStart(p8) -- Line: 57
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p8);
end;

function u5.onKitLocalActivated(p9, p10) -- Line: 60
    -- upvalues: KnitClient2 (copy), WatchPlayerCharacter (copy), Players (copy), isUsingKit (copy), BedwarsKit (copy)
    local u11 = KnitClient2.Controllers.SpiritGardenerSeedController:listenToPickup();

    if u11 then
        p10:GiveTask(function() -- Line: 63
            -- upvalues: u11 (copy)
            return u11.Destroy();
        end);
    end;

    p10:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function() -- Line: 67
        -- upvalues: isUsingKit (ref), Players (ref), BedwarsKit (ref), KnitClient2 (ref)
        if isUsingKit(Players.LocalPlayer, BedwarsKit.SPIRIT_GARDENER) then
            KnitClient2.Controllers.SpiritGardenerEnergyUiController:mountSpiritEnergyUi();

            return;
        end;

        KnitClient2.Controllers.SpiritGardenerEnergyUiController:unmountSpiritEnergyUi();
    end));
    KnitClient2.Controllers.SpiritGardenerEnergyUiController:mountSpiritEnergyUi();
end;

function u5.onKitLocalDeactivated(p12) -- Line: 76
    -- upvalues: KnitClient2 (copy)
    KnitClient2.Controllers.SpiritGardenerEnergyUiController:unmountSpiritEnergyUi();
end;

function u5.onKitReplicationActivated(u13, p14) -- Line: 79
    -- upvalues: default (copy), Players (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), SpiritGardenerEnergyAttr (copy), GetAttribute (copy), SpiritGardenerKitBalance (copy), EntityUtil (copy)
    default.Client:Get("SpiritGardenerStopChanneling"):Connect(function(p15) -- Line: 80
        -- upvalues: u13 (copy), Players (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        if u13.chargeMaid[p15.entityInstance] ~= nil then
            u13.chargeMaid[p15.entityInstance]:DoCleaning();

            if p15.entityInstance == Players.LocalPlayer.Character then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.SPIRIT_GARDENER_WATER_CANCEL);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SPIRIT_GARDENER_WATER, AbilityMeta[AbilityId.SPIRIT_GARDENER_WATER].triggerConfig);
            end;
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal(SpiritGardenerEnergyAttr.Name):Connect(function() -- Line: 93
        -- upvalues: GetAttribute (ref), Players (ref), SpiritGardenerEnergyAttr (ref), SpiritGardenerKitBalance (ref), u13 (copy), EntityUtil (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref), default (ref)
        local v16 = GetAttribute(Players.LocalPlayer, SpiritGardenerEnergyAttr);
        local v17 = v16 == nil and 0 or v16;

        if v17 < SpiritGardenerKitBalance.WATER_ENERGY_COST_PER_FLOWER_PER_SECOND then
            u13:disableWaterAbility(Players.LocalPlayer);
        else
            u13:enableWaterAbility(Players.LocalPlayer);
        end;

        if v17 < SpiritGardenerKitBalance.WATER_ENERGY_COST_PER_FLOWER_PER_SECOND then
            local v18 = EntityUtil:getEntity(Players.LocalPlayer);

            if v18 ~= nil then
                v18 = v18:getInstance();
            end;

            if v18 and u13.chargeMaid[v18] ~= nil then
                u13.chargeMaid[v18]:DoCleaning();
                u13.chargeMaid[v18] = nil;

                if v18 == Players.LocalPlayer.Character then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.SPIRIT_GARDENER_WATER_CANCEL);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SPIRIT_GARDENER_WATER, AbilityMeta[AbilityId.SPIRIT_GARDENER_WATER].triggerConfig);
                    u13:disableWaterAbility(Players.LocalPlayer);
                    default.Client:Get("ClientSpiritGardenerStopChanneling"):SendToServer({
                        entityInstance = v18
                    });
                end;
            end;
        end;
    end);
end;

function u5.onKitReplicationDeactivated(p19) -- Line: 126
end;

function u5.onInnateAbilityEnabled(p20, p21, p22) -- Line: 128
    -- upvalues: Players (copy)
    p20:disableWaterAbility(Players.LocalPlayer);
end;

function u5.onAbilityUsed(p23, p24, p25) -- Line: 131
    -- upvalues: AbilityId (copy), u3 (copy)
    if p25.ability == AbilityId.SPIRIT_GARDENER_WATER then
        if p23.chargeMaid[p24] == nil then
            p23.chargeMaid[p24] = u3.new();
        end;

        p23:disableActionsOnCharge(p23.chargeMaid[p24], p24);
        p23:playChannelEffects(p24);
    end;

    if p25.ability == AbilityId.SPIRIT_GARDENER_WATER_CANCEL and p23.chargeMaid[p24] ~= nil then
        p23.chargeMaid[p24]:DoCleaning();
        p23.chargeMaid[p24] = nil;
    end;
end;

function u5.disableActionsOnCharge(p26, p27, p28) -- Line: 160
    -- upvalues: Players (copy), KnitClient (copy), ClientSyncEvents (copy)
    if p28 == Players.LocalPlayer.Character then
        local u29 = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = 0
        });
        KnitClient.Controllers.SwordController:toggleSwordSwing(true);
        KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
        local u31 = ClientSyncEvents.BeginProjectileTargeting:connect(function(p30) -- Line: 167
            p30:setCancelled(true);

            return nil;
        end);
        p27:GiveTask(function() -- Line: 171
            -- upvalues: KnitClient (ref), u31 (copy), u29 (copy)
            KnitClient.Controllers.SwordController:toggleSwordSwing(false);
            KnitClient.Controllers.BlockPlacementController:enableBlockPlacer();
            u31:Destroy();
            u29.Destroy();
        end);
    end;
end;

function u5.playChannelEffects(p32, u33) -- Line: 179
    -- upvalues: GameSound (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), SoundManager (copy), RunService (copy), default (copy)
    local SPIRIT_GARDENER_CHANNELING_LOOP = GameSound.SPIRIT_GARDENER_CHANNELING_LOOP;
    local grove = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(u33)].grove;
    local u34;

    if grove then
        u34 = grove.channelEffect:Clone();
        SPIRIT_GARDENER_CHANNELING_LOOP = grove.channelLoopSound;
    else
        u34 = ReplicatedStorage.Assets.Effects.SpiritGardenerChannelEffect:Clone();
    end;

    if not u33 then
        return nil;
    end;

    u34.Parent = u33;
    u34.Massless = true;
    u34.CFrame = u33.HumanoidRootPart.CFrame;
    local u35 = WeldUtil:weldParts(u33.HumanoidRootPart, u34);
    local v36 = u34:GetDescendants();

    local function v38(p37) -- Line: 199
        -- upvalues: u34 (ref), WeldUtil (ref)
        if p37:IsA("ParticleEmitter") then
            p37.Enabled = true;
            p37:Emit(1);
        end;

        if u34 and p37:IsA("Part") then
            p37.CFrame = u34.CFrame - Vector3.new(0, 3, 0);
            WeldUtil:weldParts(u34, p37);
        end;
    end;

    for i, v in v36 do
        v38(v, i - 1, v36);
    end;

    local u39 = AnimationUtil:playAnimation(u33, GameAnimationUtil:getAssetId(AnimationType.SPIRIT_GARDENER_WATER), {
        looped = true
    });

    if Players.LocalPlayer.Character == u33 then
        local u40 = SoundManager:playSound(SPIRIT_GARDENER_CHANNELING_LOOP, {
            volumeMultiplier = 0.5,
            looped = true
        });
        p32.chargeMaid[u33]:GiveTask(function() -- Line: 224
            -- upvalues: u40 (copy)
            u40:Stop();
        end);
    end;

    u39.Priority = Enum.AnimationPriority.Action4;
    p32.chargeMaid[u33]:GiveTask(function() -- Line: 231
        -- upvalues: u35 (copy), u39 (copy), u34 (ref)
        local v41 = u35;

        if v41 ~= nil then
            v41:Destroy();
        end;

        local v42 = u39;

        if v42 ~= nil then
            v42:Stop();
        end;

        local v43 = u34;

        if v43 ~= nil then
            v43:Destroy();
        end;
    end);
    local PrimaryPart = u33.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    local Position = PrimaryPart.Position;
    p32.chargeMaid[u33]:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 252
        -- upvalues: Position (copy), PrimaryPart (copy), default (ref), u33 (copy)
        if not Position or (PrimaryPart.Position - Position).Magnitude > 0.6 then
            default.Client:Get("ClientSpiritGardenerStopChanneling"):SendToServer({
                entityInstance = u33
            });
        end;
    end));
end;

function u5.disableWaterAbility(p44, p45) -- Line: 260
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), AbilityState (copy)
    if p45 ~= Players.LocalPlayer then
        return nil;
    end;

    p44.waterAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SPIRIT_GARDENER_WATER);

    if not p44.waterAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p44.waterAbility, AbilityState.DISABLED);
end;

function u5.enableWaterAbility(p46, p47) -- Line: 270
    -- upvalues: Players (copy), Flamework (copy), AbilityState (copy)
    if p47 ~= Players.LocalPlayer then
        return nil;
    end;

    if not p46.waterAbility then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p46.waterAbility, AbilityState.READY);
end;

KnitClient.CreateController(u5.new());

return nil;