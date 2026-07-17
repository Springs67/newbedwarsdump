-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v3.InExpo;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local PhysicsService = v7.PhysicsService;
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local TinkerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "tinker", "tinker-util").TinkerBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local TinkerArmorComponent = RuntimeLib.import(script, script.Parent, "tinker-armor-component").TinkerArmorComponent;
local _ = {
    ItemType.WOOD_CHAINSAW,
    ItemType.IRON_CHAINSAW,
    ItemType.DIAMOND_CHAINSAW,
    ItemType.EMERALD_CHAINSAW,
    ItemType.VOID_CHAINSAW
};
local u8 = {
    BedwarsImageId.WOOD_TINKER_MECH,
    BedwarsImageId.IRON_TINKER_MECH,
    BedwarsImageId.DIAMOND_TINKER_MECH,
    BedwarsImageId.EMERALD_TINKER_MECH,
    BedwarsImageId.VOID_TINKER_MECH
};
local u9 = {
    GameSound.TINKER_FOOTSTEP_1,
    GameSound.TINKER_FOOTSTEP_2,
    GameSound.TINKER_FOOTSTEP_3,
    GameSound.TINKER_FOOTSTEP_4
};
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "TinkerKitController";
    end,

    __index = BaseKitController
});
u10.__index = u10;

function u10.new(...) -- Line: 58
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 62
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy), GameSound (copy), u8 (copy), u4 (copy)
    BaseKitController.constructor(p12, BedwarsKit.TINKER, {
        animations = {
            AnimationType.TINKER_PLACE_BLOCK,
            AnimationType.TINKER_BREAK_BLOCK,
            AnimationType.SIT_ON_DODO_BIRD,
            AnimationType.TINKER_AIM,
            AnimationType.TINKER_ATTACK,
            AnimationType.TINKER_HEAVY_ATTACK,
            AnimationType.SUMMON_SNOW
        },
        sounds = {
            GameSound.TINKER_FOOTSTEP_1,
            GameSound.TINKER_FOOTSTEP_2,
            GameSound.TINKER_FOOTSTEP_3,
            GameSound.TINKER_FOOTSTEP_4,
            GameSound.TINKER_MACHINE_DEPLOY,
            GameSound.TINKER_EXIT,
            GameSound.DRILL_ATTACK_1,
            GameSound.TINKER_HEAVY_ATTACK,
            GameSound.FIREWORK_LAUNCH,
            GameSound.DRILL_DEPLOY,
            GameSound.REPAIR_LOOP
        },
        imageIds = u8
    });
    p12.Name = "TinkerKitController";
    p12.userMap = {};
    p12.abilityMaid = u4.new();
    p12.selfDestructionEnabled = false;
    p12.whirlingDeathEnabled = false;
    p12.mounted = false;
    p12.handItemMap = {};
    p12.animationMap = {
        ["rbxassetid://4866397461"] = AnimationType.TINKER_PLACE_BLOCK,
        ["rbxassetid://6322507715"] = AnimationType.TINKER_BREAK_BLOCK
    };
    p12.lastAttack = -1;
    p12.animationMaid = u4.new();
    p12.aimAnimationMap = {};
    p12.footStepMaid = {};
    p12.tinkerSummonMaid = u4.new();
end;

function u10.KnitStart(p13) -- Line: 85
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p13);
end;

function u10.onKitLocalActivated(p14, p15) -- Line: 88
end;

function u10.onKitLocalDeactivated(p16) -- Line: 90
end;

function u10.onKitReplicationActivated(u17, p18) -- Line: 92
    -- upvalues: WatchCharacter (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), default2 (copy), KnitClient2 (copy), u4 (copy), ClientSyncEvents (copy), EntityUtil (copy), getItemMeta (copy), WeldUtil (copy), GameSound (copy), u9 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), Flamework (copy), u6 (copy), TinkerArmorComponent (copy), Workspace (copy), AbilityId (copy), RuntimeLib (copy), PlayerEntity (copy), KnitClient (copy), BedwarsKit (copy)
    WatchCharacter(function(p19, p20) -- Line: 94
        -- upvalues: Players (ref), u17 (copy), GameAnimationUtil (ref), AnimationType (ref), default2 (ref), KnitClient2 (ref)
        if p19 ~= Players.LocalPlayer then
            return nil;
        end;

        local Humanoid = p20:WaitForChild("Humanoid", 3);

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator", 3);
        end;

        if Humanoid then
            Humanoid.AnimationPlayed:Connect(function(p21) -- Line: 104
                -- upvalues: u17 (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), default2 (ref), KnitClient2 (ref)
                if u17.userMap[Players.LocalPlayer] == nil then
                    return nil;
                end;

                local Animation = p21.Animation;

                if Animation ~= nil then
                    Animation = Animation.Name;
                end;

                local v22 = Animation == "WalkAnim";

                if not v22 then
                    local Animation2 = p21.Animation;

                    if Animation2 ~= nil then
                        Animation2 = Animation2.Name;
                    end;

                    v22 = Animation2 == "RunAnim";
                end;

                if v22 then
                    return nil;
                end;

                local Animation2 = p21.Animation;

                if Animation2 ~= nil then
                    Animation2 = Animation2.AnimationId;
                end;

                if Animation2 == "" then
                    Animation2 = false;
                end;

                local v23 = not Animation2;

                if not v23 then
                    local Animation3 = p21.Animation;

                    if Animation3 ~= nil then
                        Animation3 = Animation3.AnimationId;
                    end;

                    v23 = Animation3 == GameAnimationUtil:getAssetId(AnimationType.SIT_ON_DODO_BIRD);
                end;

                if v23 then
                    return nil;
                end;

                local v24 = u17.animationMap[p21.Animation.AnimationId];
                local v25 = u17.userMap[Players.LocalPlayer];
                local v26;

                if v24 == 0 or v24 ~= v24 then
                    v26 = v24;
                elseif v24 then
                    v26 = v25;
                else
                    v26 = v24;
                end;

                if v26 ~= 0 and (v26 == v26 and v26) then
                    default2.Client:Get("TinkerAnimationRequest"):SendToServer({
                        animation = v24
                    });
                    KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v25, v24, 2, false);
                end;

                p21:Stop();
                p21:Destroy();
            end);
        end;
    end);
    default2.Client:Get("TinkerAnimation"):Connect(function(p27) -- Line: 164
        -- upvalues: Players (ref), u17 (copy), KnitClient2 (ref)
        if p27.player == Players.LocalPlayer then
            return nil;
        end;

        local v28 = u17.userMap[p27.player];

        if v28 then
            local animation = p27.animation;
            local config = p27.config;

            if config ~= nil then
                config = config.speed;
            end;

            if p27 ~= nil then
                p27 = p27.config;

                if p27 ~= nil then
                    p27 = p27.looped;
                end;
            end;

            KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v28, animation, config, p27);
        end;
    end);
    default2.Client:Get("TinkerAimAnimation"):Connect(function(p29) -- Line: 188
        -- upvalues: Players (ref), u4 (ref), u17 (copy), KnitClient2 (ref), AnimationType (ref)
        if p29.player == Players.LocalPlayer then
            return nil;
        end;

        if not p29.beginAiming then
            local v30 = u17.aimAnimationMap[p29.player];

            if not v30 then
                return nil;
            end;

            v30:DoCleaning();

            return;
        end;

        local v31 = u4.new();
        local v32 = u17.userMap[p29.player];

        if not v32 then
            return nil;
        end;

        local u33 = KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v32, AnimationType.TINKER_AIM);

        if not u33 then
            return nil;
        end;

        v31:GiveTask(function() -- Line: 204
            -- upvalues: u33 (copy)
            u33:AdjustSpeed(1);
        end);
        v31:GiveTask(u33:GetMarkerReachedSignal("stop"):Connect(function() -- Line: 207
            -- upvalues: u33 (copy)
            u33:AdjustSpeed(0);
        end));
        u17.aimAnimationMap[p29.player] = v31;
    end);
    p18:GiveTask(ClientSyncEvents.GenericMountMounted:connect(function(p34) -- Line: 223
        -- upvalues: EntityUtil (ref), getItemMeta (ref), WeldUtil (ref), u17 (copy), GameSound (ref), u9 (ref), BedwarsKitSkinMeta (ref), SoundManager (ref), KnitClient2 (ref), Players (ref), Flamework (ref), u6 (ref), TinkerArmorComponent (ref)
        local v35 = string.match(p34.mountType, "tinker");

        if v35 ~= 0 and (v35 == v35 and (v35 ~= "" and v35)) then
            local v36 = EntityUtil:getEntity(p34.player);
            local v37 = v36 and v36:getHandItemInstanceFromCharacter();

            if v37 then
                if not getItemMeta(v37.Name).sword then
                    local v38 = v37:Clone();
                    local Handle = v38:FindFirstChild("Handle");

                    if Handle ~= nil then
                        Handle = Handle:FindFirstChild("RightGripAttachment");
                    end;

                    if Handle then
                        Handle.Name = "Grip";
                    end;

                    v38.Parent = p34.model;
                    WeldUtil:weldAccessory(p34.model, v38);
                    u17.handItemMap[p34.model] = v38;
                end;

                v37:Destroy();
            end;

            local v39 = u17:getSkin(p34.player);
            local TINKER_MACHINE_DEPLOY = GameSound.TINKER_MACHINE_DEPLOY;
            local v40 = u9;
            local v41;

            if v39 then
                local v42 = BedwarsKitSkinMeta[v39];

                if v42 ~= nil then
                    v42 = v42.tinker;

                    if v42 ~= nil then
                        v42 = v42.sound;

                        if v42 ~= nil then
                            v42 = v42.spawn;
                        end;
                    end;
                end;

                if v42 ~= "" then
                    TINKER_MACHINE_DEPLOY = v42 or TINKER_MACHINE_DEPLOY;
                end;

                v41 = BedwarsKitSkinMeta[v39];

                if v41 ~= nil then
                    v41 = v41.tinker;

                    if v41 ~= nil then
                        v41 = v41.sound;

                        if v41 ~= nil then
                            v41 = v41.footsteps;
                        end;
                    end;
                end;

                if not v41 then
                    v41 = v40;
                end;
            else
                v41 = v40;
            end;

            local v43 = {};
            local Character = p34.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            v43.position = Character;
            SoundManager:playSound(TINKER_MACHINE_DEPLOY, v43);
            u17.userMap[p34.player] = p34.model;
            local v44 = KnitClient2.Controllers.FootstepsController:hookCharacter(p34.player, p34.player.Character, {
                walk = v41,
                run = v41
            });
            u17.footStepMaid[p34.player] = v44;

            if p34.player == Players.LocalPlayer then
                u17.tinkerSummonMaid:DoCleaning();
                u17.mounted = true;
                u17:mountSelfRepairAbility();

                if u17.selfDestructionEnabled then
                    task.delay(0.5, function() -- Line: 314
                        -- upvalues: u17 (ref)
                        u17:mountSelfDestructionAbility();
                    end);
                end;

                if u17.whirlingDeathEnabled then
                    task.delay(0.2, function() -- Line: 319
                        -- upvalues: u17 (ref)
                        u17:mountDeathWhirlAbility();
                    end);
                end;

                u17.abilityMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u6.createElement(TinkerArmorComponent, {
                    player = p34.player
                })));
                Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 3, 0);
            end;
        end;
    end));
    p18:GiveTask(ClientSyncEvents.GenericMountDismounted:connect(function(p45) -- Line: 332
        -- upvalues: u17 (copy), Players (ref), GameSound (ref), SoundManager (ref)
        local v46 = string.match(p45.mountType, "tinker");

        if v46 ~= 0 and (v46 == v46 and (v46 ~= "" and v46)) then
            u17.userMap[p45.player] = nil;
            local v47 = u17.footStepMaid[p45.player];

            if v47 ~= nil then
                v47:DoCleaning();
            end;
        end;

        local v48 = string.match(p45.mountType, "tinker");

        if v48 ~= 0 and (v48 == v48 and (v48 ~= "" and v48)) then
            v48 = p45.player == Players.LocalPlayer;
        end;

        if v48 ~= 0 and (v48 == v48 and (v48 ~= "" and v48)) then
            u17:dismountCleanUp();
            local v49 = u17:getSkinMeta(p45.player);

            if v49 ~= nil then
                v49 = v49.tinker;

                if v49 ~= nil then
                    v49 = v49.sound;

                    if v49 ~= nil then
                        v49 = v49.exit;
                    end;
                end;
            end;

            if v49 == "" or not v49 then
                v49 = GameSound.TINKER_EXIT;
            end;

            SoundManager:playSound(v49);
            Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0);
        end;
    end));
    p18:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p50) -- Line: 369
        -- upvalues: u17 (copy), Players (ref), Workspace (ref), GameSound (ref), SoundManager (ref), KnitClient2 (ref), AnimationType (ref)
        local v51 = u17.userMap[Players.LocalPlayer];

        if not v51 then
            return nil;
        end;

        if u17.lastAttack + 0.35 > Workspace:GetServerTimeNow() then
            return nil;
        end;

        u17.lastAttack = Workspace:GetServerTimeNow();
        local v52 = u17:getSkinMeta(Players.LocalPlayer);

        if v52 ~= nil then
            v52 = v52.tinker;

            if v52 ~= nil then
                v52 = v52.sound;

                if v52 ~= nil then
                    v52 = v52.attack;
                end;
            end;
        end;

        if v52 == "" or not v52 then
            v52 = GameSound.DRILL_ATTACK_1;
        end;

        SoundManager:playSound(v52);
        KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v51, AnimationType.TINKER_ATTACK, 1.85);
    end));
    default2.Client:Get("TinkerSwordSwing"):Connect(function(p53) -- Line: 395
        -- upvalues: Players (ref), u17 (copy), Workspace (ref), KnitClient2 (ref), AnimationType (ref)
        if p53.player == Players.LocalPlayer then
            return nil;
        end;

        local v54 = u17.userMap[p53.player];

        if not v54 then
            return nil;
        end;

        if u17.lastAttack + 0.4 > Workspace:GetServerTimeNow() then
            return nil;
        end;

        u17.lastAttack = Workspace:GetServerTimeNow();
        KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v54, AnimationType.TINKER_ATTACK, 1.5);
    end);
    default2.Client:Get("TinkerSelfDestruction"):Connect(function(p55) -- Line: 411
        -- upvalues: u17 (copy)
        u17:selfDestructEffect(p55.player, p55.active, p55.endTime, p55.secret);
    end);
    default2.Client:Get("TinkerUnlockAbility"):Connect(function(p56) -- Line: 414
        -- upvalues: AbilityId (ref), u17 (copy)
        local ability = p56.ability;

        if ability == AbilityId.TINKER_SELF_DESTRUCTION then
            u17.selfDestructionEnabled = true;
            u17:mountSelfDestructionAbility();

            return;
        end;

        if ability ~= AbilityId.WHIRLING_DEATH then
            return;
        end;

        u17.whirlingDeathEnabled = true;
        u17:mountDeathWhirlAbility();
    end);
    p18:GiveTask(ClientSyncEvents.HandItemRendered:connect(function(p57) -- Line: 430
        -- upvalues: Players (ref), u17 (copy), getItemMeta (ref), WeldUtil (ref)
        local v58 = Players:GetPlayerFromCharacter(p57.entity);

        if not v58 then
            return nil;
        end;

        local v59 = u17.userMap[v58];

        if not v59 then
            return nil;
        end;

        local v60 = u17.handItemMap[v59];

        if v60 ~= nil then
            v60:Destroy();
        end;

        if getItemMeta(p57.itemType).sword then
            p57.tool:Destroy();

            return nil;
        end;

        local v61 = p57.tool:Clone();
        local Handle = v61:FindFirstChild("Handle");

        if Handle ~= nil then
            Handle = Handle:FindFirstChild("RightGripAttachment");
        end;

        if Handle then
            Handle.Name = "Grip";
        end;

        v61.Parent = v59;
        WeldUtil:weldAccessory(v59, v61);
        u17.handItemMap[v59] = v61;
        p57.tool:Destroy();
    end));
    p18:GiveTask(ClientSyncEvents.EntityChangeHeldItem:connect(function(p62) -- Line: 464
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), u17 (copy)
        if RuntimeLib.instanceof(p62.entity, PlayerEntity) then
            local v63 = p62.entity:getPlayer();
            local v64 = u17.userMap[v63];

            if not v64 then
                return nil;
            end;

            if not p62.item then
                local v65 = u17.handItemMap[v64];

                if v65 ~= nil then
                    v65:Destroy();
                end;
            end;
        end;
    end));
    p18:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p66) -- Line: 489
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), u17 (copy), default2 (ref), KnitClient2 (ref), AnimationType (ref)
        if p66:isCancelled() then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.TINKER) then
            return nil;
        end;

        local v67 = u17.userMap[Players.LocalPlayer];

        if not v67 then
            return nil;
        end;

        default2.Client:Get("TinkerAimRequest"):SendToServer({
            beginAiming = true
        });
        local u68 = KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v67, AnimationType.TINKER_AIM);

        if not u68 then
            return nil;
        end;

        u17.animationMaid:GiveTask(function() -- Line: 509
            -- upvalues: u68 (copy)
            local v69 = u68;

            if v69 ~= nil then
                v69:AdjustSpeed(1);
            end;
        end);
        u17.animationMaid:GiveTask(u68:GetMarkerReachedSignal("stop"):Connect(function() -- Line: 515
            -- upvalues: u68 (copy)
            u68:AdjustSpeed(0);
        end));
    end));
    p18:GiveTask(ClientSyncEvents.ProjectileTargetingEnded:connect(function(p70) -- Line: 519
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), u17 (copy), default2 (ref)
        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.TINKER) then
            return nil;
        end;

        if not u17.userMap[Players.LocalPlayer] then
            return nil;
        end;

        default2.Client:Get("TinkerAimRequest"):SendToServer({
            beginAiming = false
        });
        u17.animationMaid:DoCleaning();
    end));
    p18:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p71) -- Line: 534
        -- upvalues: Players (ref), AbilityId (ref), GameSound (ref), u17 (copy), KnitClient2 (ref), AnimationType (ref), SoundManager (ref)
        if p71.userCharacter == Players.LocalPlayer.Character and p71.ability == AbilityId.WHIRLING_DEATH then
            local TINKER_HEAVY_ATTACK = GameSound.TINKER_HEAVY_ATTACK;
            local v72 = u17:getSkinMeta(Players.LocalPlayer);

            if v72 ~= nil then
                v72 = v72.tinker;

                if v72 ~= nil then
                    v72 = v72.sound;

                    if v72 ~= nil then
                        v72 = v72.spin;
                    end;
                end;
            end;

            if v72 ~= "" then
                TINKER_HEAVY_ATTACK = v72 or TINKER_HEAVY_ATTACK;
            end;

            local v73 = u17.userMap[Players.LocalPlayer];

            if not v73 then
                return nil;
            end;

            KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v73, AnimationType.TINKER_HEAVY_ATTACK, 2);
            SoundManager:playSound(TINKER_HEAVY_ATTACK);
        end;
    end));
    default2.Client:Get("TinkerSummonEffect"):Connect(function(p74) -- Line: 561
        -- upvalues: u17 (copy)
        u17:tinkerSummonEffect(p74.player, p74.mountType);
    end);
    p18:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SelfRepairing"):Connect(function() -- Line: 565
        -- upvalues: Players (ref), u17 (copy)
        local v75 = Players.LocalPlayer:GetAttribute("SelfRepairing");

        if v75 == 0 or (v75 ~= v75 or (v75 == "" or not v75)) then
            u17:stopSelfRepairEffect();

            return;
        end;

        u17:startSelfRepairEffect();
    end));
end;

function u10.onKitReplicationDeactivated(p76) -- Line: 574
end;

function u10.onInnateAbilityEnabled(p77, p78, p79) -- Line: 576
end;

function u10.onAbilityUsed(p80, p81, p82) -- Line: 578
end;

function u10.mountSelfRepairAbility(p83) -- Line: 580
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local abilityMaid = p83.abilityMaid;
    local v84 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local TINKER_SELF_REPAIR = AbilityId.TINKER_SELF_REPAIR;
    local v85 = {};

    for i, v in AbilityMeta[AbilityId.TINKER_SELF_REPAIR].triggerConfig do
        v85[i] = v;
    end;

    abilityMaid:GiveTask(v84:enableAbility(TINKER_SELF_REPAIR, v85):expect());
    p83.enabledSelfRepairAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.TINKER_SELF_REPAIR);
end;

function u10.mountSelfDestructionAbility(p86) -- Line: 591
    -- upvalues: Players (copy), u8 (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if not p86.mounted then
        return nil;
    end;

    local v87 = Players.LocalPlayer:GetAttribute("TinkerMachineLevel");
    local v88 = u8[(v87 == nil and 1 or v87) - 1 + 1];
    local abilityMaid = p86.abilityMaid;
    local v89 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local TINKER_SELF_DESTRUCTION = AbilityId.TINKER_SELF_DESTRUCTION;
    local v90 = {};

    for i, v in AbilityMeta[AbilityId.TINKER_SELF_DESTRUCTION].triggerConfig do
        v90[i] = v;
    end;

    v90.abilityButton = {
        icon = v88
    };
    abilityMaid:GiveTask(v89:enableAbility(TINKER_SELF_DESTRUCTION, v90):expect());
end;

function u10.mountDeathWhirlAbility(p91) -- Line: 613
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if not p91.mounted then
        return nil;
    end;

    local abilityMaid = p91.abilityMaid;
    local v92 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local WHIRLING_DEATH = AbilityId.WHIRLING_DEATH;
    local v93 = {};

    for i, v in AbilityMeta[AbilityId.WHIRLING_DEATH].triggerConfig do
        v93[i] = v;
    end;

    abilityMaid:GiveTask(v92:enableAbility(WHIRLING_DEATH, v93):expect());
end;

function u10.mountTinkerSummonAbility(p94) -- Line: 626
    -- upvalues: Players (copy), u8 (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local v95 = Players.LocalPlayer:GetAttribute("TinkerMachineLevel");
    local v96 = u8[(v95 == nil and 1 or v95) - 1 + 1];
    local tinkerSummonMaid = p94.tinkerSummonMaid;
    local v97 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local TINKER_SUMMON = AbilityId.TINKER_SUMMON;
    local v98 = {};

    for i, v in AbilityMeta[AbilityId.TINKER_SUMMON].triggerConfig do
        v98[i] = v;
    end;

    v98.abilityButton = {
        icon = v96
    };
    tinkerSummonMaid:GiveTask(v97:enableAbility(TINKER_SUMMON, v98):expect());
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(AbilityId.TINKER_SUMMON, 15);
end;

function u10.dismountCleanUp(p99) -- Line: 646
    p99.mounted = false;
    p99.abilityMaid:DoCleaning();
    p99:mountTinkerSummonAbility();
end;

function u10.selfDestructEffect(p100, p101, p102, u103, u104) -- Line: 651
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), u5 (copy), PhysicsService (copy), Workspace (copy), SoundManager (copy), GameSound (copy), KnockbackUtil (copy), Players (copy), default2 (copy), TinkerBalance (copy)
    local v105 = KnitClient.Controllers.MountController:getMountModelFromPlayer(p101);
    local v106;

    if v105 == nil then
        v106 = v105;
    else
        v106 = v105.PrimaryPart;

        if v106 ~= nil then
            v106 = v106.CFrame;
        end;
    end;

    if not (v105 and v106) then
        return nil;
    end;

    local u107 = ReplicatedStorage.Assets.Mounts:FindFirstChild(v105.Name);

    if u107 ~= nil then
        u107 = u107:Clone();
    end;

    if not u107 then
        return nil;
    end;

    u5("Humanoid", {
        Parent = u107
    }):ChangeState(Enum.HumanoidStateType.Running);
    u107.PrimaryPart.CanCollide = true;
    u107.PrimaryPart.Massless = false;
    PhysicsService:SetPartCollisionGroup(u107.PrimaryPart, "FallingBlocks");
    PhysicsService:SetPartCollisionGroup(u107.PrimaryPart, "ItemDrops");
    u107:PivotTo(v106);
    u107.PrimaryPart.Anchored = false;
    u107.Parent = Workspace;
    local u108 = u5("Highlight", {
        Enabled = false,
        FillTransparency = 0.5,
        OutlineTransparency = 0,
        DepthMode = Enum.HighlightDepthMode.Occluded,
        FillColor = Color3.fromRGB(255, 59, 59),
        OutlineColor = Color3.fromRGB(255, 59, 59),
        Parent = u107
    });
    task.delay(0.5, function() -- Line: 692
        -- upvalues: SoundManager (ref), GameSound (ref), u107 (copy), Workspace (ref), u103 (copy), u108 (copy)
        SoundManager:playSound(GameSound.TNT_HISS_1, {
            position = u107.PrimaryPart.Position
        });
        local v109 = 0;

        while u107 and Workspace:GetServerTimeNow() < u103 do
            if v109 % 2 == 0 then
                u108.Enabled = true;
                SoundManager:playSound(GameSound.COUNTDOWN_TICK, {
                    position = u107:GetPivot().Position
                });
            else
                u108.Enabled = false;
            end;

            task.wait(0.2 - v109 * 0.01);
            v109 = v109 + 1;
        end;
    end);
    local PrimaryPart = u107.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    local u110 = PrimaryPart;
    local v111 = p102 and u104;

    if v111 ~= "" and v111 then
        KnockbackUtil.applyKnockbackDirection(u107.PrimaryPart, u107.PrimaryPart.Mass, u107.PrimaryPart.CFrame.LookVector.Unit * 50, {
            horizontal = 1,
            vertical = 1
        });
        local v112 = {};
        local v113 = u107.PrimaryPart:GetMass() * Workspace.Gravity * 0.5;
        v112.Force = Vector3.new(0, v113, 0);
        v112.Parent = u107.PrimaryPart;
        u5("BodyForce", v112);
        local u114 = u5("Part", {
            Transparency = 1,
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            CFrame = u107.PrimaryPart.CFrame,
            Parent = Workspace
        });
        u5("AlignOrientation", {
            Parent = u114,
            Attachment0 = u5("Attachment", {
                Parent = u114
            }),
            Attachment1 = u5("Attachment", {
                Parent = u107.PrimaryPart
            })
        });

        if p101 == Players.LocalPlayer then
            task.delay(u103 - Workspace:GetServerTimeNow() - 0.2, function() -- Line: 745
                -- upvalues: u107 (copy), u110 (ref), default2 (ref), u104 (copy), u114 (copy)
                local PrimaryPart2 = u107.PrimaryPart;

                if PrimaryPart2 ~= nil then
                    PrimaryPart2 = PrimaryPart2.Position;
                end;

                local v115 = PrimaryPart2 or u110;

                if v115 then
                    default2.Client:Get("TinkerActiveExplosion"):SendToServer({
                        position = v115,
                        secret = u104
                    });
                end;

                u114:Destroy();
            end);
        end;
    end;

    task.delay(TinkerBalance.TIME_TO_SELF_DESTRUCT, function() -- Line: 764
        -- upvalues: u107 (copy), u110 (ref)
        local PrimaryPart2 = u107.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        u110 = PrimaryPart2;
        u107:Destroy();
    end);

    return u107;
end;

function u10.tinkerSummonEffect(u116, u117, p118) -- Line: 774
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy), SoundManager (copy), GameSound (copy), TinkerBalance (copy), InExpo (copy), u9 (copy), RandomUtil (copy), EffectUtil (copy), ScreenShakeUtil (copy)
    local Character = u117.Character;
    local u119;

    if Character == nil then
        u119 = Character;
    else
        u119 = Character.PrimaryPart;

        if u119 ~= nil then
            u119 = u119.CFrame;
        end;
    end;

    if not u119 then
        return nil;
    end;

    local u120 = ReplicatedStorage.Assets.Mounts:FindFirstChild(p118);

    if u120 ~= nil then
        u120 = u120:Clone();
    end;

    if not u120 then
        return nil;
    end;

    local v121 = Character:GetPivot();
    local LookVector = Character:GetPivot().LookVector;
    local v122 = Vector3.new(5);
    local v123 = Character:GetPivot();
    local LookVector2 = Character:GetPivot().LookVector;
    local v124 = Vector3.new(5);
    local u125 = v123 + Vector3.new(0, 0, 0) + LookVector2 * v124;
    u120.Parent = Workspace;
    u120.PrimaryPart.Anchored = true;
    u120:PivotTo(v121 + Vector3.new(0, 35, 0) + LookVector * v122);
    AnimationUtil:playAnimation(u117, GameAnimationUtil:getAssetId(AnimationType.SUMMON_SNOW));
    local u126 = ReplicatedStorage.Assets.Effects.NewYearsFireworkRocket:Clone();
    u126.Parent = Workspace;
    u126:PivotTo(u119);
    local u127 = u119.Position + Vector3.new(0, 48, 0);
    default(1, Linear, function(p128) -- Line: 819
        -- upvalues: u119 (copy), u127 (copy), u126 (copy)
        local v129 = u119.Position:Lerp(u127, p128);
        u126:PivotTo(CFrame.new(v129));
        u126.Transparency = p128;
    end):Play();
    SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
        position = u119.Position
    });
    task.wait(0.5);
    local SUMMON_DURATION = TinkerBalance.SUMMON_DURATION;
    default(SUMMON_DURATION, InExpo, function(p130) -- Line: 831
        -- upvalues: u120 (copy)
        u120:PivotTo(p130);
    end, u120.PrimaryPart.CFrame, u125);
    task.delay(SUMMON_DURATION - 0.15, function() -- Line: 835
        -- upvalues: u9 (ref), u116 (copy), u117 (copy), SoundManager (ref), RandomUtil (ref), u125 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), ScreenShakeUtil (ref)
        local v131 = u9;
        local v132 = u116:getSkinMeta(u117);

        if v132 ~= nil then
            v132 = v132.tinker;

            if v132 ~= nil then
                v132 = v132.sound;

                if v132 ~= nil then
                    v132 = v132.footsteps;
                end;
            end;
        end;

        if v132 then
            v131 = u116:getSkinMeta(u117).tinker.sound.footsteps;
        end;

        SoundManager:playSound(RandomUtil.fromList(unpack(v131)), {
            position = u125.Position
        });
        local v133 = ReplicatedStorage.Assets.Effects.DustLandEffect:Clone();
        v133.Parent = Workspace;
        v133.CFrame = u125;
        EffectUtil:playEffects({ v133 }, nil, {
            destroyAfterSec = 3
        });
        ScreenShakeUtil.shake(u125.Position, Vector3.new(0, -1, 0), {
            duration = 0.22,
            magnitude = 0.6
        });
    end);
    task.delay(SUMMON_DURATION + 0.4, function() -- Line: 868
        -- upvalues: u120 (copy)
        u120:Destroy();
    end);
end;

function u10.startSelfRepairEffect(p134) -- Line: 872
    -- upvalues: SoundManager (copy), GameSound (copy), KnitClient (copy), Players (copy)
    SoundManager:playSound(GameSound.DRILL_DEPLOY);
    p134.selfRepairingSound = SoundManager:playSound(GameSound.REPAIR_LOOP, {
        looped = true,
        volumeMultiplier = 0.5
    });
    local v135 = KnitClient.Controllers.MountController:getMountModelFromPlayer(Players.LocalPlayer);

    if v135 ~= nil then
        v135 = v135.PrimaryPart;
    end;

    local function _(p136) -- Line: 884
        if p136:IsA("ParticleEmitter") then
            p136.Enabled = true;
        end;
    end;

    for i, descendant in v135:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
        end;
    end;
end;

function u10.stopSelfRepairEffect(p137) -- Line: 893
    -- upvalues: KnitClient (copy), Players (copy)
    local selfRepairingSound = p137.selfRepairingSound;

    if selfRepairingSound ~= nil then
        selfRepairingSound:Stop();
    end;

    local selfRepairingSound2 = p137.selfRepairingSound;

    if selfRepairingSound2 ~= nil then
        selfRepairingSound2:Destroy();
    end;

    local v138 = KnitClient.Controllers.MountController:getMountModelFromPlayer(Players.LocalPlayer);

    if v138 ~= nil then
        v138 = v138.PrimaryPart;
    end;

    local function _(p139) -- Line: 908
        if p139:IsA("ParticleEmitter") then
            p139.Enabled = false;
        end;
    end;

    for i, descendant in v138:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = false;
        end;
    end;
end;

function u10.getSkin(p140, p141) -- Line: 917
    -- upvalues: KnitClient (copy)
    local v142;

    if p141.Character then
        v142 = KnitClient.Controllers.KitSkinController:getKitSkin(p141.Character);
    else
        v142 = nil;
    end;

    return v142;
end;

function u10.getSkinMeta(p143, p144) -- Line: 924
    -- upvalues: BedwarsKitSkinMeta (copy)
    local v145 = p143:getSkin(p144);

    if v145 then
        return BedwarsKitSkinMeta[v145];
    end;

    return nil;
end;

KnitClient.CreateController(u10.new());

return nil;