-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ActionUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SummonerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util");
local summoner_getPlayerSpellData = v6.summoner_getPlayerSpellData;
local summoner_getPlayerSpellLevel = v6.summoner_getPlayerSpellLevel;
local summoner_getTotalCastTimeRequired = v6.summoner_getTotalCastTimeRequired;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SummonerKitCastBarUI = RuntimeLib.import(script, script.Parent, "ui", "summoner-kit-cast-bar-ui").SummonerKitCastBarUI;
local SummonerKitLevelUI = RuntimeLib.import(script, script.Parent, "ui", "summoner-kit-level-ui").SummonerKitLevelUI;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "SummonerKitController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 50
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 54
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), u3 (copy)
    BaseKitController.constructor(p9, BedwarsKit.SUMMONER, {
        sounds = {
            GameSound.SUMMONER_SUMMON_CHANNEL_LOOP,
            GameSound.SUMMONER_SUMMON_FINISH,
            GameSound.SUMMONER_CLAW_ATTACK_1,
            GameSound.SUMMONER_CLAW_ATTACK_2,
            GameSound.SUMMONER_CLAW_ATTACK_3,
            GameSound.SUMMONER_CLAW_ATTACK_4
        }
    });
    p9.Name = "SummonerKitController";
    p9.localChargingMaid = u3.new();
    p9.levelUpUiMaid = u3.new();
    p9.initializedUI = false;
    p9.playerCastingDataMap = {};
    p9.debugging = false;
end;

function u7.KnitStart(p10) -- Line: 65
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(u11, p12) -- Line: 68
    -- upvalues: ClientSyncEvents (copy), AbilityId (copy), EntityUtil (copy), isUsingKit (copy), BedwarsKit (copy), KnitClient (copy), MatchState (copy), WatchCharacter (copy), Players (copy)
    p12:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p13) -- Line: 69
        -- upvalues: AbilityId (ref), EntityUtil (ref), isUsingKit (ref), BedwarsKit (ref), KnitClient (ref), MatchState (ref)
        if p13.ability == AbilityId.SUMMONER_START_CHARGING or p13.ability == AbilityId.SUMMONER_FINISH_CHARGING then
            local v14 = EntityUtil:getPlayerFromEntityInstance(p13.userCharacter);

            if not v14 then
                p13:setCancelled(true);

                return nil;
            end;

            if not isUsingKit(v14, BedwarsKit.SUMMONER) then
                p13:setCancelled(true);

                return nil;
            end;

            local v15 = EntityUtil:getEntity(p13.userCharacter);

            if not v15 then
                p13:setCancelled(true);

                return nil;
            end;

            if not v15:isAlive() then
                p13:setCancelled(true);

                return nil;
            end;

            if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
                p13:setCancelled(true);

                return nil;
            end;
        end;
    end));
    p12:GiveTask(WatchCharacter(function(p16, p17, p18) -- Line: 100
        -- upvalues: Players (ref), isUsingKit (ref), BedwarsKit (ref), u11 (copy)
        if p16 ~= Players.LocalPlayer then
            return nil;
        end;

        if not isUsingKit(p16, BedwarsKit.SUMMONER) then
            return nil;
        end;

        u11:initializePlayer();
    end));
end;

function u7.onKitLocalDeactivated(p19) -- Line: 110
    -- upvalues: Players (copy)
    p19.levelUpUiMaid:DoCleaning();
    p19.playerCastingDataMap[Players.LocalPlayer] = nil;
    local abilityRef = p19.abilityRef;

    if abilityRef ~= nil then
        abilityRef.Destroy();
    end;

    p19.abilityRef = nil;
    p19.localChargingMaid:DoCleaning();
    p19.initializedUI = false;
end;

function u7.onKitReplicationActivated(u20, p21) -- Line: 123
    -- upvalues: default (copy)
    p21:GiveTask(default.Client:Get("SummonerStartSummonSpellFromServer"):Connect(function(p22) -- Line: 125
        -- upvalues: u20 (copy)
        u20:startChargingSummon(p22.player, p22.startTime);
    end));
    p21:GiveTask(default.Client:Get("SummonerFinishSummonSpellFromServer"):Connect(function(p23) -- Line: 129
        -- upvalues: u20 (copy)
        u20:finishChargingSummon(p23.player, p23.tier);
    end));
    local u25 = default.Client:Get("SummonerDeath"):Connect(function(p24) -- Line: 133
        -- upvalues: u20 (copy)
        return u20:cancelSummon(p24.player);
    end);
    p21:GiveTask(function() -- Line: 136
        -- upvalues: u25 (copy)
        return u25:Disconnect();
    end);
    p21:GiveTask(default.Client:Get("SummonerCancelSummon"):Connect(function(p26) -- Line: 140
        -- upvalues: u20 (copy)
        return u20:cancelSummon(p26.player);
    end));
end;

function u7.onKitReplicationDeactivated(p27) -- Line: 144
end;

function u7.onInnateAbilityEnabled(p28, p29, p30) -- Line: 146
end;

function u7.onAbilityUsed(p31, p32, p33) -- Line: 148
end;

function u7.initializePlayer(p34) -- Line: 150
    -- upvalues: Flamework (copy), u4 (copy), SummonerKitLevelUI (copy)
    p34.localChargingMaid:DoCleaning();
    p34:enableStartChargingAbility();

    if not p34.initializedUI then
        p34.initializedUI = true;
        p34.levelUpUiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SummonerKitLevelUI)));
    end;
end;

function u7.startChargingSummon(u35, p36, p37) -- Line: 159
    -- upvalues: Players (copy), KnitClient2 (copy), SummonerKitBalance (copy), KnitClient (copy), ActionUtil (copy), AbilityId (copy), summoner_getPlayerSpellLevel (copy), summoner_getTotalCastTimeRequired (copy), ClientSyncEvents (copy), Flamework (copy), u4 (copy), SummonerKitCastBarUI (copy)
    if p36 == Players.LocalPlayer then
        local u38 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = false,
            moveSpeedMultiplier = SummonerKitBalance.CASTING_MOVE_SPEED_MULTIPLIER
        });
        local u39 = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = 0
        });
        u35.localChargingMaid:GiveTask(function() -- Line: 171
            -- upvalues: u38 (copy), u39 (copy)
            u38.Destroy();
            u39.Destroy();
        end);
        u35.localChargingMaid:GiveTask(ActionUtil:disableActions({
            disableSword = true,
            disableAbilities = true,
            disableBlockPlacement = true,
            disableBlockBreaking = true,
            disableAiming = true,
            disableConsumingItems = true,
            player = p36,
            enabledAbilityOverrides = { AbilityId.SUMMONER_FINISH_CHARGING }
        }));
        task.delay(0.25, function() -- Line: 187
            -- upvalues: u35 (copy)
            u35:enableFinishChargingAbility();
        end);
        local v40 = summoner_getPlayerSpellLevel(p36);
        local v41 = v40 == nil and 1 or v40;
        local v42 = summoner_getTotalCastTimeRequired(v41);
        local castTime = ClientSyncEvents.CastTimeModifierCheck:fire(v42).castTime;
        local v43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SummonerKitCastBarUI, {
            HideOnComplete = true,
            Size = UDim2.fromScale(v41 / 4, 0.03),
            StartTime = p37,
            EndTime = p37 + castTime,
            ProgressBarConfig = {
                Flip = false,
                GradientRotation = 0,
                BarGradient = ColorSequence.new(Color3.fromRGB(74, 20, 92), Color3.fromRGB(140, 36, 120))
            },
            PlayerSpellLevel = v41
        }));
        u35.localChargingMaid:GiveTask(v43);
    end;

    u35:createExpandingMagicCircle(p36, p37);
end;

function u7.createExpandingMagicCircle(u44, u45, u46) -- Line: 217
    -- upvalues: ReplicatedStorage (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Workspace (copy), KnitClient2 (copy), RunService (copy), summoner_getPlayerSpellData (copy), summoner_getPlayerSpellLevel (copy), summoner_getTotalCastTimeRequired (copy), ClientSyncEvents (copy), SummonerKitBalance (copy), u3 (copy), EntityUtil (copy), MathExtras (copy), GameSound (copy), SoundManager (copy)
    local Character = u45.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local Summoner_SummonCircle = ReplicatedStorage.Assets.Misc.Kaida.Summoner_SummonCircle;
    local Character2 = u45.Character;

    if Character2 then
        local v47 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character2)];
        local kaida = v47.kaida;

        if kaida ~= nil then
            kaida = kaida.summon_circle;
        end;

        if kaida then
            Summoner_SummonCircle = v47.kaida;

            if Summoner_SummonCircle ~= nil then
                Summoner_SummonCircle = Summoner_SummonCircle.summon_circle;
            end;
        end;
    end;

    local u48 = Summoner_SummonCircle:Clone();
    u48.Parent = Workspace;

    if KnitClient2.Controllers.SummonerKitSkinController:isPrismaticSkin(u45) then
        KnitClient.Controllers.SummonerKitSkinController:applyCircleRGB(u48);
    end;

    if RunService:IsStudio() and (u44.debugging and u48.Pivot.DebugCircle) then
        u48.Pivot.DebugCircle.Transparency = 0;
    end;

    local v49 = u44.playerCastingDataMap[u45];

    if v49 then
        v49.castingMaid:DoCleaning();
        u44.playerCastingDataMap[u45] = nil;
    end;

    local u50 = CFrame.new(Character.Position - Vector3.new(0, 3, 0));
    u48:PivotTo(u50);
    local v51 = summoner_getPlayerSpellData(u45);
    local v52 = summoner_getPlayerSpellLevel(u45);
    local v53 = v52 == nil and 1 or v52;
    local v54 = summoner_getTotalCastTimeRequired(v53);
    local castTime = ClientSyncEvents.CastTimeModifierCheck:fire(v54).castTime;
    local CIRCLE_MIN_RADIUS = SummonerKitBalance.CIRCLE_MIN_RADIUS;
    local maxRadius = v51.maxRadius;
    local u55 = u3.new();
    local u56 = u3.new();
    local u57 = 0;
    local u58 = true;
    local u59 = nil;
    u59 = RunService.Heartbeat:Connect(function(p60) -- Line: 287
        -- upvalues: u48 (copy), EntityUtil (ref), u45 (copy), u59 (ref), u58 (ref), Workspace (ref), u46 (copy), castTime (ref), MathExtras (ref), CIRCLE_MIN_RADIUS (copy), maxRadius (copy), Character (copy), u50 (ref), u57 (ref)
        local v61 = u48;

        if v61 ~= nil then
            v61 = v61.Parent;
        end;

        local v62 = v61 == nil;

        if not v62 then
            v62 = EntityUtil:getEntity(u45);

            if v62 ~= nil then
                v62 = v62:isDead();
            end;
        end;

        if v62 then
            u59:Disconnect();

            return nil;
        end;

        if u58 then
            local v63 = (Workspace:GetServerTimeNow() - u46) / castTime;
            local v64 = MathExtras:lerp(CIRCLE_MIN_RADIUS, maxRadius, (math.clamp(v63, 0, 1))) * 2;
            u50 = CFrame.new(Character.Position - Vector3.new(0, 3, 0));
            u48:PivotTo(u50);
            u48:ScaleTo(v64);
        end;

        u57 = u57 + p60;
        local v65 = u48;

        if v65 ~= nil then
            v65 = v65.Pivot;
        end;

        if v65 then
            local v66 = CFrame.Angles(0, math.rad(u57 * 60), 0);
            u48.Pivot.Ring1.CFrame = u50 * v66;
            local v67 = CFrame.Angles(0, math.rad(u57 * 10), 0);
            u48.Pivot.Ring2.CFrame = u50 * v67;
            local v68 = CFrame.Angles(0, math.rad(-u57 * 80), 0);
            u48.Pivot.Ring3.CFrame = u50 * v68;
            local v69 = CFrame.Angles(0, math.rad(u57 * 30), 0);
            u48.Pivot.PortalBottom.CFrame = u50 * v69;
            local v70 = CFrame.Angles(0, math.rad(u57 * -30), 0);
            u48.Pivot.PortalTop.CFrame = u50 * v70;
        end;
    end);
    u56:GiveTask(u59);
    u44.playerCastingDataMap[u45] = {
        finishedCasting = false,
        castingMaid = u55,
        summonMaid = u56,
        circleParent = u48
    };
    u55:GiveTask(function() -- Line: 349
        -- upvalues: u58 (ref), u44 (copy), u45 (copy), u48 (copy)
        u58 = false;
        local v71 = u44.playerCastingDataMap[u45];

        if v71 and (not v71.finishedCasting and u48) then
            u48:Destroy();
        end;
    end);
    local SUMMONER_SUMMON_CHANNEL_LOOP = GameSound.SUMMONER_SUMMON_CHANNEL_LOOP;
    local v72 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(u45);
    local v73;

    if v72 == nil then
        v73 = v72;
    else
        v73 = v72.kaida;

        if v73 ~= nil then
            v73 = v73.summonChannelLoopSound;
        end;
    end;

    if v73 ~= "" and v73 then
        SUMMONER_SUMMON_CHANNEL_LOOP = v72.kaida.summonChannelLoopSound;
    end;

    local v74 = {
        looped = true,
        parent = u48.PrimaryPart
    };
    local PrimaryPart = u48.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    v74.position = PrimaryPart;
    u55:GiveTask((SoundManager:playSound(SUMMONER_SUMMON_CHANNEL_LOOP, v74)));
    local v75 = summoner_getTotalCastTimeRequired(v53);
    local castTime2 = ClientSyncEvents.CastTimeModifierCheck:fire(v75).castTime;
    task.delay(castTime2 + 0.1, function() -- Line: 408
        -- upvalues: u55 (copy), u56 (copy)
        u55:DoCleaning();
        u56:DoCleaning();
    end);
end;

function u7.finishChargingSummon(p76, p77, p78) -- Line: 413
    -- upvalues: Players (copy), GameSound (copy), KnitClient (copy), SoundManager (copy), ReplicatedStorage (copy), BedwarsKitSkinMeta (copy), KnitClient2 (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), MathExtras (copy)
    if p77 == Players.LocalPlayer then
        p76.localChargingMaid:DoCleaning();
        p76:enableStartChargingAbility();
    end;

    local u79 = p76.playerCastingDataMap[p77];

    if not u79 then
        return nil;
    end;

    u79.finishedCasting = true;
    u79.castingMaid:DoCleaning();
    local circleParent = u79.circleParent;
    local SUMMONER_SUMMON_FINISH = GameSound.SUMMONER_SUMMON_FINISH;
    local v80 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p77);
    local v81;

    if v80 == nil then
        v81 = v80;
    else
        v81 = v80.kaida;

        if v81 ~= nil then
            v81 = v81.summonFinishSound;
        end;
    end;

    if v81 ~= "" and v81 then
        SUMMONER_SUMMON_FINISH = v80.kaida.summonFinishSound;
    end;

    SoundManager:playSound(SUMMONER_SUMMON_FINISH, {
        position = circleParent.Pivot.Position
    });
    local v82;

    if v80 == nil then
        v82 = v80;
    else
        v82 = v80.kaida;

        if v82 ~= nil then
            v82 = v82.summonFinishOverlaySound;
        end;
    end;

    if v82 ~= "" and v82 then
        SoundManager:playSound(v80.kaida.summonFinishOverlaySound, {
            position = circleParent.Pivot.Position
        });
    end;

    local Summoner_DragonHead = ReplicatedStorage.Assets.Misc.Kaida.Summoner_DragonHead;
    local Character = p77.Character;

    if Character then
        local v83 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];
        local kaida = v83.kaida;

        if kaida ~= nil then
            kaida = kaida.dragon_head;
        end;

        if kaida then
            Summoner_DragonHead = v83.kaida;

            if Summoner_DragonHead ~= nil then
                Summoner_DragonHead = Summoner_DragonHead.dragon_head;
            end;
        end;
    end;

    local u84 = Summoner_DragonHead:Clone();

    if KnitClient2.Controllers.SummonerKitSkinController:isPrismaticSkin(p77) then
        KnitClient2.Controllers.SummonerKitSkinController:applyDragonHeadRGB(u84);
    end;

    u84.Parent = Workspace;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local function _(p85) -- Line: 490
            if p85:IsA("MeshPart") then
                p85.Transparency = 0.6;
            end;
        end;

        for i, child in u84:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.Transparency = 0.6;
            end;
        end;
    end;

    local LookVector = u84.PrimaryPart.CFrame.LookVector;

    if p77.Character then
        LookVector = Vector3.new(p77.Character.PrimaryPart.CFrame.LookVector.X, 0, p77.Character.PrimaryPart.CFrame.LookVector.Z).Unit;
    end;

    math.atan2(LookVector.X, LookVector.Z);
    local Position = circleParent:GetPivot().Position;
    u84:PivotTo((CFrame.new(Position - Vector3.new(0, 13, 0))));
    local u86 = AnimationUtil:playAnimation(u84.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_DRAGON_ATTACK), {
        looped = false,
        speed = 1.2
    });

    if u86 then
        local u87 = false;
        local u88 = RunService.Heartbeat:Connect(function() -- Line: 526
            -- upvalues: u86 (copy), u87 (ref), circleParent (copy), u84 (ref)
            if u86.TimePosition > 0.1 and not u87 then
                local Position2 = circleParent:GetPivot().Position;
                u84:PivotTo((CFrame.new(Position2 - Vector3.new(0, 0, 0))));
                u87 = true;
            end;
        end);
        u86.Stopped:Connect(function() -- Line: 535
            -- upvalues: u88 (copy), u84 (ref)
            u88:Disconnect();
            u84:Destroy();
        end);
    end;

    if circleParent.Pivot:FindFirstChild("ParticleCircle") then
        local u89 = { circleParent.Pivot.ParticleCircle.Fire1, circleParent.Pivot.ParticleCircle.Fire2, circleParent.Pivot.ParticleCircle.Fire3 };

        local function _(p90) -- Line: 543
            p90.Enabled = true;
        end;

        for i, v in u89 do
            local _ = i - 1;
            v.Enabled = true;
        end;

        task.delay(0.3, function() -- Line: 549
            -- upvalues: u89 (copy)
            local function _(p91) -- Line: 550
                p91.Enabled = false;
            end;

            for i, v in u89 do
                local _ = i - 1;
                v.Enabled = false;
            end;
        end);
    end;

    task.wait(2.2);

    if u79 and u79.circleParent then
        local u92 = u79.circleParent:GetScale();
        local u93 = 0;
        local u94 = nil;
        u94 = RunService.Heartbeat:Connect(function(p95) -- Line: 568
            -- upvalues: u93 (ref), MathExtras (ref), u92 (copy), u79 (copy), u94 (ref), circleParent (copy), u84 (ref)
            u93 = u93 + p95;
            local v96 = math.clamp(u93 / 0.75, 0, 1);
            local v97 = MathExtras:lerp(u92, 0.01, v96);
            local v98 = u79;

            if v98 ~= nil then
                v98.circleParent:ScaleTo(v97);
            end;

            if v96 >= 1 then
                u94:Disconnect();
                local v99 = u79;

                if v99 ~= nil then
                    v99.castingMaid:DoCleaning();
                end;

                local v100 = u79;

                if v100 ~= nil then
                    v100.summonMaid:DoCleaning();
                end;

                local v101 = circleParent;

                if v101 ~= nil then
                    v101:Destroy();
                end;

                local v102 = u84;

                if v102 ~= nil then
                    v102:Destroy();
                end;
            end;
        end);
    end;

    p76.playerCastingDataMap[p77] = nil;
end;

function u7.enableStartChargingAbility(u103) -- Line: 602
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if u103.abilityRef ~= nil then
        u103.abilityRef.Destroy();
    end;

    task.defer(function() -- Line: 606
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref), u103 (copy)
        local v104 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SUMMONER_START_CHARGING = AbilityId.SUMMONER_START_CHARGING;
        local v105 = {};

        for i, v in AbilityMeta[AbilityId.SUMMONER_START_CHARGING].triggerConfig do
            v105[i] = v;
        end;

        v104:enableAbility(SUMMONER_START_CHARGING, v105):andThen(function(p106) -- Line: 614
            -- upvalues: u103 (ref)
            u103.abilityRef = p106;
        end);
    end);
end;

function u7.enableFinishChargingAbility(u107) -- Line: 620
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if u107.abilityRef ~= nil then
        u107.abilityRef.Destroy();
    end;

    task.defer(function() -- Line: 624
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref), u107 (copy)
        local v108 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SUMMONER_FINISH_CHARGING = AbilityId.SUMMONER_FINISH_CHARGING;
        local v109 = {};

        for i, v in AbilityMeta[AbilityId.SUMMONER_FINISH_CHARGING].triggerConfig do
            v109[i] = v;
        end;

        v108:enableAbility(SUMMONER_FINISH_CHARGING, v109):andThen(function(p110) -- Line: 632
            -- upvalues: u107 (ref)
            u107.abilityRef = p110;
        end);
    end);
end;

function u7.isPlayerCastingSpell(p111, p112) -- Line: 638
    local v113 = p111.playerCastingDataMap[p112];

    if v113 == nil then
        return false;
    end;

    return not v113.finishedCasting;
end;

function u7.cancelSummon(p114, p115) -- Line: 650
    -- upvalues: isUsingKit (copy), BedwarsKit (copy), Players (copy)
    if not isUsingKit(p115, BedwarsKit.SUMMONER) then
        return nil;
    end;

    local v116 = p114.playerCastingDataMap[p115];

    if v116 then
        v116.castingMaid:DoCleaning();
        p114.playerCastingDataMap[p115] = nil;
    end;

    if p115 == Players.LocalPlayer then
        p114.localChargingMaid:DoCleaning();
    end;
end;

KnitClient.CreateController(u7.new());

return nil;