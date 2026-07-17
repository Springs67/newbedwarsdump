-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "catrom", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutSine = v3.InOutSine;
local Linear = v3.Linear;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v6.ContextActionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util");
local CardConstants = v7.CardConstants;
local CardUpgradeType = v7.CardUpgradeType;
local CardUtil = v7.CardUtil;
local RaycastUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "raycast", "raycast-util").RaycastUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local CardSelectionApp = RuntimeLib.import(script, script.Parent, "ui", "card-selection").CardSelectionApp;
local CardTarget = RuntimeLib.import(script, script.Parent, "ui", "card-target").CardTarget;
local CardKit = RuntimeLib.import(script, script.Parent, "ui", "card-tracker").CardKit;
local CardUpgradesApp = RuntimeLib.import(script, script.Parent, "ui", "card-upgrades").CardUpgradesApp;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "FortunaController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 58
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 62
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p10, BedwarsKit.CARD);
    p10.Name = "FortunaController";
    p10.cards = {};
    p10.cardAnims = {};
    p10.upgradeAvailable = false;
    p10.seeUpgradesAbilityMounted = false;
    p10.currentTier = 0;
    p10.isPreloaded = false;
end;

function u8.KnitStart(p11) -- Line: 72
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p11);
end;

function u8.onKitLocalActivated(u12, p13) -- Line: 75
    -- upvalues: ClientSyncEvents (copy), AbilityId (copy), default2 (copy), ClientStore (copy)
    p13:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 77
        -- upvalues: AbilityId (ref), u12 (copy)
        if p14:isCancelled() then
            return nil;
        end;

        if p14.ability ~= AbilityId.CARD_THROW then
            return nil;
        end;

        if not u12.target then
            p14:setCancelled(true);
        end;
    end));
    local u16 = default2.Client:Get("CardUpgradeUpdate"):Connect(function(p15) -- Line: 88
        -- upvalues: u12 (copy), ClientStore (ref)
        u12.upgradeAvailable = p15.upgradeAvailable;

        if p15.upgradeAvailable and p15.currentTier > u12.currentTier then
            u12.currentTier = p15.currentTier;
            u12:playUpgradeEffect();
        end;

        ClientStore:dispatch({
            type = "KitCardSetAvailableUpgrades",
            availableUpgrades = p15.availableUpgrades
        });
        ClientStore:dispatch({
            type = "KitCardSetUpgrades",
            upgrades = p15.upgrades
        });

        if not u12.seeUpgradesAbilityMounted and #p15.upgrades > 0 then
            u12:mountSeeUpgradesAbility();
            u12.seeUpgradesAbilityMounted = true;
        end;
    end);
    p13:GiveTask(function() -- Line: 109
        -- upvalues: u16 (copy)
        u16:Disconnect();
    end);
    p13:GiveTask(u12:initializeAll());
end;

function u8.onKitLocalDeactivated(p17) -- Line: 115
end;

function u8.onKitReplicationActivated(u18, p19) -- Line: 117
    -- upvalues: ClientSyncEvents (copy), RuntimeLib (copy), PlayerEntity (copy), default2 (copy), Players (copy), KnitClient (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy)
    p19:GiveTask(ClientSyncEvents.SharedStatefulEntityDeath:connect(function(p20) -- Line: 119
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), u18 (copy)
        if p20:isCancelled() then
            return nil;
        end;

        if RuntimeLib.instanceof(p20.entity, PlayerEntity) then
            u18:destroyCards((p20.entity:getPlayer()));
        end;
    end));
    local u22 = default2.Client:Get("CardThrow"):Connect(function(p21) -- Line: 129
        -- upvalues: Players (ref), u18 (copy)
        if p21.throwerPlayer == Players.LocalPlayer then
            u18:removeTarget();
        end;

        u18:useAbility(p21.throwerPlayer, p21.targetEntityInstance, p21.deck);
    end);
    p19:GiveTask(function() -- Line: 135
        -- upvalues: u22 (copy)
        u22:Disconnect();
    end);
    p19:GiveTask(KnitClient.Controllers.KitController:watchKit(function(p23, p24) -- Line: 139
        -- upvalues: BedwarsKit (ref), u18 (copy), KnitClient (ref), GameSound (ref), AnimationType (ref)
        if p24 == BedwarsKit.CARD and not u18.isPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                sounds = {
                    GameSound.CARD_UPGRADE_AVAILABLE,
                    GameSound.CARD_UPGRADE_SELECT,
                    GameSound.CARD_TURN,
                    GameSound.CARD_THROW_1,
                    GameSound.CARD_THROW_2,
                    GameSound.CARD_THROW_3,
                    GameSound.CARD_THROW_4,
                    GameSound.CARD_THROW_5
                },
                animations = { AnimationType.CARD_THROW }
            });
            u18.isPreloaded = true;
        end;
    end));
end;

function u8.onKitReplicationDeactivated(p25) -- Line: 149
end;

function u8.onInnateAbilityEnabled(p26, p27, p28) -- Line: 151
end;

function u8.onAbilityUsed(p29, p30, p31) -- Line: 153
    -- upvalues: Players (copy), AbilityId (copy), default2 (copy), Flamework (copy), CardUpgradesApp (copy), UILayers (copy)
    if p31:isCancelled() then
        return nil;
    end;

    if p30 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local ability = p31.ability;

    if ability == AbilityId.CARD_THROW then
        default2.Client:Get("AttemptCardThrow"):SendToServer({
            targetEntityInstance = p29.target
        });

        return;
    end;

    if ability ~= AbilityId.CARD_UPGRADES then
        return;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "CardUpgrades",
        app = CardUpgradesApp,
        layer = UILayers.MAIN
    }, {
        AppId = "CardUpgrades"
    });
end;

function u8.playUpgradeEffect(p32) -- Line: 182
    -- upvalues: ReplicatedStorage (copy), Players (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v33 = ReplicatedStorage.Assets.Effects.CardUpgrade:Clone();
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    v33.Parent = Character;

    if Character then
        v33:PivotTo(Character:GetPivot());
        EffectUtil:playEffects({ v33 }, nil, {
            sizeMultiplier = 1,
            destroyAfterSec = 1
        });
    end;

    SoundManager:playSound(GameSound.CARD_UPGRADE_AVAILABLE, {
        position = nil
    });
end;

function u8.initializeAll(u34) -- Line: 202
    -- upvalues: Players (copy), u4 (copy), u5 (copy), CardKit (copy), RunService (copy), Workspace (copy), EntityUtil (copy), GameWorldUtil (copy), CardConstants (copy), RaycastUtil (copy), CardTarget (copy), ContextActionService (copy), Flamework (copy), CardSelectionApp (copy), UILayers (copy)
    local LocalPlayer = Players.LocalPlayer;
    local v35 = u4.new();
    local u36 = u5.mount(u5.createElement(CardKit), LocalPlayer:WaitForChild("PlayerGui"));
    v35:GiveTask(function() -- Line: 207
        -- upvalues: u5 (ref), u36 (copy)
        u5.unmount(u36);
    end);
    local u37 = 0;
    v35:GiveTask(RunService.Heartbeat:Connect(function(p38) -- Line: 212
        -- upvalues: u37 (ref), Workspace (ref), u34 (copy), LocalPlayer (copy), EntityUtil (ref), GameWorldUtil (ref), CardConstants (ref), Players (ref), RaycastUtil (ref), u5 (ref), CardTarget (ref)
        u37 = u37 + p38;

        if u37 < 0.05 then
            return nil;
        end;

        u37 = u37 - 0.05;
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u34:removeTarget();

            return nil;
        end;

        local Character = LocalPlayer.Character;
        local v39;

        if Character == nil then
            v39 = Character;
        else
            v39 = Character.PrimaryPart;

            if v39 ~= nil then
                v39 = v39.Position;
            end;
        end;

        if not v39 then
            u34:removeTarget();

            return nil;
        end;

        local v40 = EntityUtil:getLocalPlayerEntity();

        if not v40 then
            u34:removeTarget();

            return nil;
        end;

        local v41 = GameWorldUtil.getEntitiesWithinRadius(CurrentCamera.Position, CardConstants.BASE_RANGE);
        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local LookVector = CurrentCamera.LookVector;
        local v42 = (1 / 0);
        local v43 = nil;

        for _, v in v41 do
            local v44 = Players:GetPlayerFromCharacter(v:getInstance());

            if v44 ~= nil then
                v44 = v44:HasTag("PlayerHidden");
            end;

            if not v44 and v40:canAttack(v) then
                local Position = v:getInstance():GetPivot().Position;

                if (Position - CurrentCamera.Position):Dot(LookVector) >= 0 then
                    local v45 = Unit:ClosestPoint(Position);
                    local Magnitude = (Position - v45).Magnitude;

                    if CardConstants.BASE_RANGE >= Magnitude then
                        local v46 = Magnitude + (Unit.Origin - v45).Magnitude / 3;

                        if v42 > v46 and RaycastUtil.isUnblocked(Character, v) then
                            v43 = v:getInstance();
                            v42 = v46;
                        end;
                    end;
                end;
            end;
        end;

        if u34.target ~= v43 then
            u34:removeTarget();

            if v43 then
                u34.targetIcon = u5.mount(u5.createElement(CardTarget), v43.PrimaryPart);
            end;
        end;

        u34.target = v43;
    end));

    local function v50(p47, p48, p49) -- Line: 296
        -- upvalues: u34 (copy), Flamework (ref), CardSelectionApp (ref), UILayers (ref)
        if p48 == Enum.UserInputState.Begin and u34.upgradeAvailable then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "CardSelection",
                app = CardSelectionApp,
                layer = UILayers.MAIN
            }, {
                AppId = "CardSelection"
            });
        end;
    end;

    local v51 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitSecondary") or {};
    ContextActionService:BindAction("card-upgrade-open", v50, false, unpack(v51));
    v35:GiveTask(function() -- Line: 309
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("card-upgrade-open");
    end);

    return v35;
end;

function u8.mountSeeUpgradesAbility(p52) -- Line: 314
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local v53 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local CARD_UPGRADES = AbilityId.CARD_UPGRADES;
    local v54 = {};

    for i, v in AbilityMeta[AbilityId.CARD_UPGRADES].triggerConfig do
        v54[i] = v;
    end;

    v53:enableAbility(CARD_UPGRADES, v54):expect();
end;

function u8.removeTarget(p55) -- Line: 323
    -- upvalues: u5 (copy)
    p55.target = nil;

    if p55.targetIcon then
        u5.unmount(p55.targetIcon);
    end;
end;

function u8.useAbility(u56, u57, u58, u59) -- Line: 329
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), CardUtil (copy), CardUpgradeType (copy)
    local Character = u57.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u56:destroyCards(u57);
    local v60 = AnimationUtil:playAnimation(u57, GameAnimationUtil:getAssetId(AnimationType.CARD_THROW), {
        looped = false
    });

    if v60 ~= nil then
        v60:AdjustSpeed(1.3 * u59.throw.speedMultiplier);
    end;

    local v61 = CardUtil.getThrowValues(u59);
    local u62 = v61.delay * 0.5;
    local u63 = v61.delay - u62;
    local v64 = false;
    local v65 = 0;

    while true do
        if v64 then
            v65 = v65 + 1;
        else
            v64 = true;
        end;

        if v65 >= u59.throw.cardCount then
            return;
        end;

        local u66 = v61.interval * v65;
        local v67 = 7.5;

        if table.find(u59.upgrades, CardUpgradeType.OVERSIZED) ~= nil then
            v67 = v67 * 2.5;
        end;

        if table.find(u59.upgrades, CardUpgradeType.MINISIZED) ~= nil then
            v67 = v67 / 2;
        end;

        local v68 = -(0.05 * (u59.throw.cardCount - 1) / 2);
        local Position = Character.CFrame.Position;
        local v69 = math.sin((v65 * 0.05 + v68) * v67) * 3.5;
        local v70 = math.cos((v65 * 0.05 + v68) * v67) * 3.5;
        local v71 = Position + Vector3.new(v69, 0, v70);
        local v72 = v71.Z - Character.CFrame.Position.Z;
        local v73 = v71.X - Character.CFrame.Position.X;
        local v74 = select(2, CFrame.new(v71, Character.Position):ToOrientation());
        local u75 = u56:createCard(u57, Character, v72, v73, -math.deg(v74), u66, u62, u59);
        task.spawn(function() -- Line: 385
            -- upvalues: u66 (copy), u62 (copy), u63 (copy), u56 (copy), u75 (copy), u57 (copy), u58 (copy), u59 (copy)
            task.wait(u66 + u62 + u63);
            u56:throwCard(u75, u57, u58, u59);
        end);
    end;
end;

function u8.throwCard(p76, u77, p78, p79, p80) -- Line: 392
    -- upvalues: CardUtil (copy), EntityUtil (copy), TweenService (copy), u2 (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), default (copy), InOutSine (copy)
    local v81 = CardUtil.getThrowValues(p80);
    local v82 = math.random() * 0.1 + 0.05;

    if math.random() < 0.5 then
        v82 = v82 * -1;
    end;

    if not u77 then
        return nil;
    end;

    local v83 = EntityUtil:getEntity(p79);
    local v84 = EntityUtil:getEntity(p78);

    if v83 ~= nil then
        v83 = v83:isAlive();
    end;

    local v85 = not v83;

    if not v85 then
        if v84 ~= nil then
            v84 = v84:isAlive();
        end;

        v85 = not v84;
    end;

    if v85 then
        p76:destroyCards(p78);

        return nil;
    end;

    local Position = p79:GetPivot().Position;
    local v86 = (u77.Position - Position).Magnitude / 100;
    local v87 = v82 * v86;
    local v88 = Vector3.new((u77.Position.X + Position.X) / 2, (u77.Position.Y + Position.Y) / 2, (u77.Position.Z + Position.Z) / 2);
    local v89 = math.random(0, 8) * v86;
    local v90 = v88 + Vector3.new(v87, v89, v87);
    local v91 = Vector3.new((u77.Position.X + Position.X) / (2 + v87), (u77.Position.Y + Position.Y) / 2, (u77.Position.Z + Position.Z) / (2 + v87));
    local v92 = p76.cardAnims[u77];

    if v92 then
        v92:Disconnect();
        local v93 = TweenService:Create(u77, TweenInfo.new(v81.raiseDuration, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
            Position = u77.Position + Vector3.new(0, 1, 0)
        });
        v93:Play();
        v93.Completed:Wait();
        local u94 = u2.new({
            u77.Position,
            v91,
            v90,
            p79:GetPivot().Position
        }, nil);
        local Tail = u77:WaitForChild("Tail");
        local OuterTail = u77:WaitForChild("OuterTail");
        local EffectTail = u77:WaitForChild("EffectTail");
        Tail.Enabled = true;
        OuterTail.Enabled = true;
        EffectTail.Enabled = true;
        SoundManager:playSound(RandomUtil.fromList(unpack({
            GameSound.CARD_THROW_1,
            GameSound.CARD_THROW_2,
            GameSound.CARD_THROW_3,
            GameSound.CARD_THROW_4,
            GameSound.CARD_THROW_5
        })), {
            position = u77.Position
        });
        default(v81.throwDuration, InOutSine, function(p95) -- Line: 456
            -- upvalues: u77 (copy), u94 (copy)
            u77.Transparency = p95;
            local v96 = u94:SolvePosition(p95);
            local v97 = v96 + u94:SolveVelocity(p95) * Vector3.new(1, 1, 0);
            u77.CFrame = CFrame.lookAt(v96, v97);
        end, 0, 1):Wait();
        u77:Destroy();
    end;
end;

function u8.createCard(u98, p99, u100, u101, u102, u103, p104, u105, u106) -- Line: 469
    -- upvalues: ReplicatedStorage (copy), CardUpgradeType (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TweenService (copy), default (copy), Linear (copy), RunService (copy)
    local v107 = u98.cards[p99];
    local u108 = v107 == nil and {} or v107;
    u98.cards[p99] = u108;
    local u109 = ReplicatedStorage.Assets.Misc.Card:Clone();
    local upgrades = u106.upgrades;

    local function v111(p110) -- Line: 484
        -- upvalues: CardUpgradeType (ref), u109 (copy), u108 (copy), u106 (copy)
        if p110 == CardUpgradeType.OVERSIZED then
            u109.Size = u109.Size * Vector3.new(3, 3, 3);

            return;
        end;

        if p110 == CardUpgradeType.MINISIZED then
            u109.Size = u109.Size * Vector3.new(0.5, 0.5, 0.5);

            return;
        end;

        if p110 == CardUpgradeType.LIFE_STEAL then
            u109.Color = Color3.fromHex("6ad400");

            return;
        end;

        if p110 == CardUpgradeType.FIRE then
            u109.Upgrades.Fire.Enabled = true;

            return;
        end;

        if p110 ~= CardUpgradeType.EXPLOSION or #u108 ~= u106.throw.cardCount - 1 then
            return;
        end;

        u109.Upgrades.Smoke.Enabled = true;
    end;

    for i, v in upgrades do
        v111(v, i - 1, upgrades);
    end;

    u109.Transparency = 1;
    u109.Tail.Enabled = false;
    u109.OuterTail.Enabled = false;
    u109.EffectTail.Enabled = false;
    u109.PointLight.Brightness = math.min(4, 4 / (u106.throw.cardCount / 5));
    u109.Parent = Workspace;
    table.insert(u108, u109);
    local u112 = false;
    local u113 = 0;
    local u114 = math.random() * 0.15000000000000002 + 0.05;
    local u115 = CFrame.Angles(0, math.rad(u103), 0);
    u109:PivotTo(u100.CFrame * CFrame.new((Vector3.new(u102, u113 + 1.15, -u101))));
    task.delay(p104, function() -- Line: 536
        -- upvalues: SoundManager (ref), GameSound (ref), u100 (copy), TweenService (ref), u109 (copy), u105 (copy)
        SoundManager:playSound(GameSound.CARD_TURN, {
            position = u100.Position
        });
        TweenService:Create(u109, TweenInfo.new(u105, Enum.EasingStyle.Sine), {
            Transparency = 0
        }):Play();
    end);
    task.delay(p104, function() -- Line: 546
        -- upvalues: default (ref), u105 (copy), Linear (ref), u100 (copy), u102 (copy), u113 (ref), u101 (copy), u109 (copy), u103 (copy)
        default(u105, Linear, function(p116) -- Line: 547
            -- upvalues: u100 (ref), u102 (ref), u113 (ref), u101 (ref), u109 (ref)
            local CFrame2 = u100.CFrame;
            local v117 = CFrame.new((Vector3.new(u102, u113 + 1.15, -u101)));
            local v118 = CFrame.Angles(0, math.rad(p116), 0);
            u109.CFrame = CFrame2 * v117 * v118;
        end, 90, u103);
    end);
    task.delay(u105, function() -- Line: 555
        -- upvalues: RunService (ref), u113 (ref), u114 (copy), u112 (ref), u100 (copy), u102 (copy), u101 (copy), u109 (copy), u115 (copy), u98 (copy)
        local v120 = RunService.Heartbeat:Connect(function(p119) -- Line: 556
            -- upvalues: u113 (ref), u114 (ref), u112 (ref), u100 (ref), u102 (ref), u101 (ref), u109 (ref), u115 (ref)
            if u114 <= u113 and not u112 then
                u112 = true;
            end;

            if u113 <= -u114 and u112 then
                u112 = false;
            end;

            if u112 then
                u113 = u113 - p119 / 3;
            end;

            if not u112 then
                u113 = u113 + p119 / 3;
            end;

            u109.CFrame = u100.CFrame * CFrame.new((Vector3.new(u102, u113 + 1.15, -u101))) * u115;
        end);
        u98.cardAnims[u109] = v120;
    end);

    return u109;
end;

function u8.destroyCards(p121, p122) -- Line: 577
    local v123 = p121.cards[p122];

    if not v123 then
        return nil;
    end;

    local function _(p124) -- Line: 584
        return p124:Destroy();
    end;

    for i, v in v123 do
        local _ = i - 1;
        v:Destroy();
    end;

    table.clear(v123);
end;

function u8.lerp(p125, p126, p127, p128) -- Line: 592
    return Vector2.new(p126, 0):Lerp(Vector2.new(p127, 0), p128).X;
end;

KnitClient.CreateController(u8.new());

return nil;