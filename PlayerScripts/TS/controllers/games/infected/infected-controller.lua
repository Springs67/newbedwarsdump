-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local AnimationUtil = v1.AnimationUtil;
local AnnouncementVariant = v1.AnnouncementVariant;
local ComponentUtil = v1.ComponentUtil;
local ConstraintType = v1.ConstraintType;
local GamepadAction = v1.GamepadAction;
local IndicatorTransparencyFunctions = v1.IndicatorTransparencyFunctions;
local IndicatorUIType = v1.IndicatorUIType;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchPlayer = v1.WatchPlayer;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local StarterPlayer = v6.StarterPlayer;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local CircleCountdownAnnouncement = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local InfectedConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-constants").InfectedConstants;
local InfectedTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-team-id").InfectedTeamId;
local InfectedVariantType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "infected", "infected-variant-type").InfectedVariantType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local HalloweenEventEnvironment = RuntimeLib.import(script, script.Parent.Parent, "halloween-event", "ambient", "halloween-event-environment").HalloweenEventEnvironment;
local InfectedClassSelection = RuntimeLib.import(script, script.Parent, "ui", "infected-class-selection").InfectedClassSelection;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 56, Name: __tostring
        return "InfectionController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 62
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 66
    -- upvalues: GameKnitController (copy), GameType (copy), u4 (copy), LoggerProvider (copy)
    GameKnitController.constructor(p9, { GameType.INFECTED });
    p9.Name = "InfectionController";
    p9.boostMaid = u4.new();
    p9.abilityMaid = u4.new();
    p9.isInfectedClassSelectSetup = false;
    p9.infectedSpawns = {};
    p9.logger = LoggerProvider.getLogger("InfectedController");
end;

function u7.KnitStart(p10) -- Line: 75
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p10);
end;

function u7.onGameInit(u11) -- Line: 78
    -- upvalues: Flamework (copy), AnnouncementVariant (copy), CircleCountdownAnnouncement (copy), default2 (copy), SoundManager (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), u3 (copy), ClientSyncEvents (copy), AbilityId (copy), KnitClient (copy), BedwarsKit (copy), InfectedTeamId (copy), InfectedConstants (copy)
    u11:setupEnvironment();
    u11:setupBaseIndicators();
    u11:setupNameTags();
    u11:setupDeathMarkers();
    u11:setupHumanRevealInterval();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(AnnouncementVariant.countdown.type, CircleCountdownAnnouncement);
    default2.Client:OnEvent("DisruptorPlayEffects", function(p12) -- Line: 86
        -- upvalues: SoundManager (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        SoundManager:playSound(p12.playSound, {
            volumeMultiplier = 0.5,
            position = p12.targetPosition
        });

        if p12.player then
            AnimationUtil:playAnimation(p12.player, GameAnimationUtil:getAssetId(AnimationType.KICKER_STOMP));
        end;
    end);
    default2.Client:WaitFor("GetInfectedSpawns"):andThen(function(p13) -- Line: 95
        return p13:CallServerAsync();
    end):andThen(function(p14) -- Line: 97
        -- upvalues: u11 (copy)
        u11.infectedSpawns = p14;
    end):catch(function(p15) -- Line: 99
        -- upvalues: u11 (copy), Players (ref), u3 (ref)
        u11.logger:Error("Local player {userId} failed to retrieve infected spawn locations with error reason: {err}", Players.LocalPlayer.UserId, u3(p15));
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p16) -- Line: 102
        -- upvalues: Players (ref), AbilityId (ref), KnitClient (ref), BedwarsKit (ref), u11 (copy), InfectedTeamId (ref), InfectedConstants (ref)
        if p16.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p16:isCancelled() then
            return nil;
        end;

        if p16.ability == AbilityId.CAT_POUNCE then
            if KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.INFECTED_RUSH) then
                u11:pounce();

                return nil;
            end;
        elseif p16.ability == AbilityId.PROWLER_MARK and KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.INFECTED_PROWLER) then
            KnitClient.Controllers.HuntersEchoController:playHawkeyeEffect(p16.userCharacter:GetPivot().Position, {
                expansionDurationSec = 0.5,
                myTeamId = InfectedTeamId.INFECTED,
                maxSize = InfectedConstants.MARKED_PLAYER_RANGE,
                revealDuration = InfectedConstants.MARKED_PLAYER_DURATION
            });
        end;
    end);
end;

function u7.setupHumanRevealInterval(p17) -- Line: 125
    -- upvalues: KnitClient2 (copy), RunService (copy), ClientStore (copy), Workspace (copy), KnitClient (copy), getItemMeta (copy), ItemType (copy), InfectedTeamId (copy), MatchState (copy), ClientSyncEvents (copy)
    local u18 = KnitClient2.Controllers.MapController:getCFrame("center"):expect();

    if not u18 then
        return nil;
    end;

    local u19 = false;

    local function u27() -- Line: 132
        -- upvalues: u19 (ref), RunService (ref), ClientStore (ref), Workspace (ref), KnitClient (ref), getItemMeta (ref), ItemType (ref), KnitClient2 (ref), u18 (copy), InfectedTeamId (ref)
        u19 = true;
        local u20 = RunService:IsStudio() and 15 or 45;
        local v21 = RunService:IsStudio() and 30 or 300;
        local startTime = ClientStore:getState().Game.startTime;
        local v22 = Workspace:GetServerTimeNow() - startTime;
        local v23;

        if v22 < v21 then
            v23 = v21 - v22;
        else
            v23 = u20 - (v22 - v21) % u20;
        end;

        local MatchEventController = KnitClient.Controllers.MatchEventController;
        local v24 = {
            id = "InfectedHumanReveal"
        };
        local image = getItemMeta(ItemType.HUNTERS_ECHO).image;
        v24.image = image == nil and "rbxassetid://14978481226" or image;
        v24.name = "Reveal Humans";
        v24.time = Workspace:GetServerTimeNow() + v23;
        v24.isOnTopHud = {
            shouldDisplay = true
        };
        MatchEventController:addMatchEventCountdown(v24);
        task.delay(v21, function() -- Line: 156
            -- upvalues: Workspace (ref), startTime (copy), u20 (ref), KnitClient2 (ref), u18 (ref), InfectedTeamId (ref), KnitClient (ref), getItemMeta (ref), ItemType (ref), u19 (ref)
            while true do
                if Workspace:GetServerTimeNow() - startTime >= 540 then
                    u20 = 20;
                end;

                KnitClient2.Controllers.HuntersEchoController:playHawkeyeEffect(u18.Position, {
                    maxSize = 700,
                    myTeamId = InfectedTeamId.INFECTED
                });
                local MatchEventController2 = KnitClient.Controllers.MatchEventController;
                local v25 = {
                    id = "InfectedHumanReveal"
                };
                local image2 = getItemMeta(ItemType.HUNTERS_ECHO).image;
                v25.image = image2 == nil and "rbxassetid://14978481226" or image2;
                v25.name = "Reveal Humans";
                v25.time = Workspace:GetServerTimeNow() + u20;
                v25.isOnTopHud = {
                    shouldDisplay = true
                };
                MatchEventController2:addMatchEventCountdown(v25);
                local v26 = u19 and task.wait(u20);

                if v26 == 0 or (v26 ~= v26 or not v26) then
                    return;
                end;
            end;
        end);
    end;

    if ClientStore:getState().Game.matchState == MatchState.RUNNING then
        u27();
    end;

    ClientSyncEvents.MatchStateChange:connect(function(p28) -- Line: 194
        -- upvalues: u19 (ref), MatchState (ref), u27 (copy)
        if u19 or p28.matchState ~= MatchState.RUNNING then
            if p28.matchState == MatchState.POST then
                u19 = false;
            end;

            return;
        end;

        u27();
    end);
end;

function u7.setupEnvironment(p29) -- Line: 202
    -- upvalues: KnitClient (copy), HalloweenEventEnvironment (copy), SoundManager (copy), GameSound (copy)
    KnitClient.Controllers.EnvironmentController:setupEnvironment(HalloweenEventEnvironment);
    SoundManager:playSound(GameSound.GRAVEYARD_AMBIENCE_LOOP, {
        looped = true
    });
    KnitClient.Controllers.BackgroundMusicController:startMusic(GameSound.INFECTED_HALLOWEEN_MUSIC);
end;

function u7.setupBaseIndicators(p30) -- Line: 209
    -- upvalues: u4 (copy), ComponentUtil (copy), default (copy), Flamework (copy), IndicatorUIType (copy), BedwarsImageId (copy), IndicatorTransparencyFunctions (copy), ConstraintType (copy), ClientStore (copy), MatchState (copy), Workspace (copy), ClientSyncEvents (copy)
    local function u36(u31) -- Line: 210
        -- upvalues: u4 (ref), ComponentUtil (ref), default (ref), Flamework (ref), IndicatorUIType (ref), BedwarsImageId (ref), IndicatorTransparencyFunctions (ref), ConstraintType (ref)
        local u32 = u4.new();
        local v33 = ComponentUtil:getAllComponents(default);

        local function v35(p34) -- Line: 213
            -- upvalues: Flamework (ref), IndicatorUIType (ref), BedwarsImageId (ref), IndicatorTransparencyFunctions (ref), u31 (copy), ConstraintType (ref), u32 (copy)
            u32:GiveTask((Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):addIndicator({
                uiType = IndicatorUIType.Icon,
                uiConfig = {
                    distanceRelativeToPlayer = true,
                    scaleWithAlpha = true,
                    scaleOnFade = false,
                    icon = BedwarsImageId.BED_RED_RENDER,
                    transparency = IndicatorTransparencyFunctions:combine(IndicatorTransparencyFunctions:fadeOutDistance(75, 125, 0, 0.5), IndicatorTransparencyFunctions:fadeOverTime(u31 - 2, 2))
                },
                attachTo = p34.instance.Position,
                constraintType = ConstraintType.Constrained
            })));
        end;

        for i, v in v33 do
            v35(v, i - 1, v33);
        end;

        task.delay(u31, function() -- Line: 231
            -- upvalues: u32 (copy)
            u32:DoCleaning();
        end);

        return u32;
    end;

    if ClientStore:getState().Game.matchState == MatchState.RUNNING then
        u36(ClientStore:getState().Game.startTime + 45 - Workspace:GetServerTimeNow());

        return;
    end;

    ClientSyncEvents.MatchStateChange:connect(function(p37) -- Line: 244
        -- upvalues: MatchState (ref), u36 (copy)
        if p37.matchState == MatchState.RUNNING then
            u36(45);
        end;
    end);
end;

function u7.setupNameTags(u38) -- Line: 251
    -- upvalues: WatchCharacter (copy), Players (copy), InfectedTeamId (copy), WatchPlayer (copy)
    WatchCharacter(function(p39, p40) -- Line: 253
        -- upvalues: Players (ref), InfectedTeamId (ref), u38 (copy)
        if p39 == Players.LocalPlayer then
            local v41 = p39:GetAttribute("Team");
            local u42 = p39:GetAttribute("InfectedVariantType");

            if v41 == InfectedTeamId.INFECTED then
                task.delay(0.5, function() -- Line: 258
                    -- upvalues: u38 (ref), u42 (copy)
                    u38:applyInfectedBoosts(u42);
                end);
                u38:applyAbilities(u42);

                if not u38.isInfectedClassSelectSetup then
                    u38:setupInfectedClassSelect();
                end;
            end;
        else
            u38:checkHideNameTag(p39);
        end;
    end);
    WatchPlayer(function(u43, p44) -- Line: 271
        -- upvalues: Players (ref), u38 (copy)
        p44:GiveTask(u43:GetAttributeChangedSignal("Team"):Connect(function(p45) -- Line: 272
            -- upvalues: u43 (copy), Players (ref), u38 (ref)
            if u43 ~= Players.LocalPlayer then
                u38:checkHideNameTag(u43);

                return;
            end;

            local function _(p46) -- Line: 279
                -- upvalues: u38 (ref)
                u38:checkHideNameTag(p46);
            end;

            for i, v in Players:GetPlayers() do
                local _ = i - 1;
                u38:checkHideNameTag(v);
            end;
        end));
    end);
end;

function u7.setupDeathMarkers(p47) -- Line: 289
    -- upvalues: default2 (copy), EntityUtil (copy), KnitClient2 (copy), Players (copy), Flamework (copy), IndicatorUIType (copy), BedwarsImageId (copy), IndicatorTransparencyFunctions (copy), ConstraintType (copy)
    default2.Client:Get("EntityDeathEvent"):Connect(function(p48) -- Line: 291
        -- upvalues: EntityUtil (ref), KnitClient2 (ref), Players (ref), Flamework (ref), IndicatorUIType (ref), BedwarsImageId (ref), IndicatorTransparencyFunctions (ref), ConstraintType (ref)
        local v49 = EntityUtil:getEntity(p48.entityInstance);

        if v49 ~= nil then
            v49 = v49:getPlayer();
        end;

        if not v49 then
            return nil;
        end;

        local teamIdBefore = p48.teamIdBefore;
        local v50;

        if teamIdBefore == "" or not teamIdBefore then
            v50 = KnitClient2.Controllers.TeamController:getPlayerTeam(v49);
        else
            v50 = KnitClient2.Controllers.TeamController:getTeamById(p48.teamIdBefore);
        end;

        local v51 = KnitClient2.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v50 ~= v51 then
            return nil;
        end;

        local v52 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController");
        local v53 = {
            uiType = IndicatorUIType.Icon
        };
        local v54 = {
            icon = BedwarsImageId.SKULL_VECTOR_ICON
        };

        if v51 ~= nil then
            v51 = v51.color;
        end;

        v54.color3 = v51;
        v54.transparency = IndicatorTransparencyFunctions:combine(IndicatorTransparencyFunctions:fadeOutDistance(75, 125, 0, 0.5), IndicatorTransparencyFunctions:fadeOverTime(4, 1));
        v54.distanceRelativeToPlayer = true;
        v54.scaleWithAlpha = true;
        v54.scaleOnFade = false;
        v53.uiConfig = v54;
        v53.attachTo = p48.cframe.Position;
        v53.constraintType = ConstraintType.Constrained;
        local u55 = v52:addIndicator(v53);
        task.delay(6, function() -- Line: 329
            -- upvalues: u55 (copy)
            u55:destroy();
        end);
    end);
end;

function u7.checkHideNameTag(p56, p57) -- Line: 334
    -- upvalues: Players (copy), EntityUtil (copy)
    local v58 = p57.Team ~= Players.LocalPlayer.Team and EntityUtil:getEntity(p57);

    if v58 then
        v58:hideNametag();
    end;
end;

function u7.leap(p59, p60, p61) -- Line: 342
    -- upvalues: KnitClient2 (copy), StarterPlayer (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), KnitClient (copy), AnimationType (copy)
    p60.HumanoidRootPart.CFrame = CFrame.lookAt(p60.HumanoidRootPart.Position, p60.HumanoidRootPart.Position + p61 * Vector3.new(1, 0, 1));
    p60.Humanoid.JumpHeight = 0.5;
    p60.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
    local PrimaryPart = p60.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.AssemblyMass;
    end;

    p60.HumanoidRootPart:ApplyImpulse(p61.Unit * Vector3.new(1, 0, 1) * (PrimaryPart == nil and 1 or PrimaryPart) * 70);
    KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    SoundManager:playSound(RandomUtil.fromList(unpack({ GameSound.CAT_POUNCE_1, GameSound.CAT_POUNCE_2, GameSound.CAT_POUNCE_3 })), {
        position = p60.HumanoidRootPart.Position
    });
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.DAGGER_CHARGE);
end;

function u7.pounce(p62) -- Line: 369
    -- upvalues: Players (copy), Workspace (copy), KnitClient (copy), AnimationType (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    p62:leap(Character, Workspace.CurrentCamera.CFrame.LookVector);
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
end;

function u7.applyAbilities(p63, p64) -- Line: 378
    -- upvalues: Flamework (copy), InfectedVariantType (copy), KnitClient (copy), AbilityId (copy), BedwarsImageId (copy), Workspace (copy)
    local function _(p65) -- Line: 381
        p65.maid:DoCleaning();
    end;

    for _, v in Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities() do
        v.maid:DoCleaning();
    end;

    p63.abilityMaid:DoCleaning();

    if p64 == InfectedVariantType.TANK then
        p63.abilityMaid:GiveTask(KnitClient.Controllers.FootstepsController.footstepModifier:addModifier({
            localVolumeMultiplier = 3
        }));
    end;

    if p64 == InfectedVariantType.RUSH then
        p63.abilityMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CAT_POUNCE, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.CAT_POUNCE
            },

            getExtraData = function() -- Line: 401, Name: getExtraData
                -- upvalues: Workspace (ref)
                return {
                    direction = Workspace.CurrentCamera.CFrame.LookVector
                };
            end
        }):expect());
        p63.abilityMaid:GiveTask(KnitClient.Controllers.FootstepsController.footstepModifier:addModifier({
            localVolumeMultiplier = 0.25
        }));
    end;

    if p64 == InfectedVariantType.DISRUPTOR then
        p63.abilityMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.DISRUPTOR_EXPLOSION_EMP, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.DISRUPTOR_EMP
            }
        }):expect());
    end;

    if p64 == InfectedVariantType.PROWLER then
        p63.abilityMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.PROWLER_MARK, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = BedwarsImageId.BOUNTY_HUNTER_MARKER
            }
        }):expect());
    end;
end;

function u7.applyInfectedBoosts(p66, p67) -- Line: 430
    -- upvalues: InfectedVariantType (copy), KnitClient2 (copy)
    p66.boostMaid:DoCleaning();
    local v68 = p67 == InfectedVariantType.TANK and 0.95 or (p67 == InfectedVariantType.RUSH and 1.25 or ((p67 == InfectedVariantType.DISRUPTOR or false or p67 == InfectedVariantType.PROWLER) and 1 or 0));
    p66.boostMaid:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
        airJumps = 1,
        jumpHeightMultiplier = 1.4
    }));
    p66.boostMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = v68
    }));
end;

function u7.setupInfectedClassSelect(u69) -- Line: 459
    -- upvalues: RunService (copy), Players (copy), InfectedConstants (copy), Flamework (copy)
    u69.isInfectedClassSelectSetup = true;
    RunService.Heartbeat:Connect(function() -- Line: 462
        -- upvalues: Players (ref), u69 (copy), InfectedConstants (ref), Flamework (ref)
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        local Position = Character:GetPivot().Position;

        local function _(p70) -- Line: 469
            -- upvalues: Position (copy), InfectedConstants (ref)
            return (Position - p70.Position).Magnitude <= InfectedConstants.CLASS_SELECT_SPAWN_RADIUS;
        end;

        local v71 = false;

        for i, v in u69.infectedSpawns do
            local _ = i - 1;

            if (Position - v.Position).Magnitude <= InfectedConstants.CLASS_SELECT_SPAWN_RADIUS then
                v71 = true;
                break;
            end;
        end;

        if v71 then
            if not u69.actionButton then
                u69:enableClassSelectButton();
            end;

            return;
        end;

        local actionButton = u69.actionButton;

        if actionButton ~= nil then
            actionButton:DoCleaning();
        end;

        u69.actionButton = nil;
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("InfectedClassSelection");
    end);
end;

function u7.enableClassSelectButton(p72) -- Line: 497
    -- upvalues: Flamework (copy), u5 (copy), ActionButton (copy), GamepadAction (copy), InfectedClassSelection (copy)
    p72.actionButton = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(ActionButton, {
        actionName = "ClassSelectToggle",
        text = "Change Class",
        interactionKey = Enum.KeyCode.B,
        gamepadInteractionKey = GamepadAction.CloseMenu,

        onActivated = function() -- Line: 502, Name: onActivated
            -- upvalues: Flamework (ref), InfectedClassSelection (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "InfectedClassSelection",
                app = InfectedClassSelection
            }, {});
        end
    }));
end;

KnitClient.CreateController(u7.new());

return nil;