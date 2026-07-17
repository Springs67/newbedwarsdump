-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ActionUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SummonerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util");
local summoner_getPlayerSpellData = v6.summoner_getPlayerSpellData;
local summoner_getPlayerSpellLevel = v6.summoner_getPlayerSpellLevel;
local summoner_getTotalCastTimeRequired = v6.summoner_getTotalCastTimeRequired;
local HalloweenBalanceConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-balance-config").HalloweenBalanceConfig;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local HalloweenUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType;
local HalloweenUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-util").HalloweenUpgradeUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local SummonerKitCastBarUI = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "summoner", "ui", "summoner-kit-cast-bar-ui").SummonerKitCastBarUI;
local SummonerKitLevelUI = RuntimeLib.import(script, script.Parent.Parent.Parent, "bedwars", "kit", "kits", "summoner", "ui", "summoner-kit-level-ui").SummonerKitLevelUI;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 47, Name: __tostring
        return "HalloweenKaidaController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 53
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 57
    -- upvalues: GameKnitController (copy), GameType (copy), u3 (copy)
    GameKnitController.constructor(p9, { GameType.HALLOWEEN_2025_EVENT_PVE });
    p9.Name = "HalloweenKaidaController";
    p9.localChargingMaid = u3.new();
    p9.levelUpUiMaid = u3.new();
    p9.initializedUI = false;
    p9.inited = false;
    p9.playerCastingDataMap = {};
    p9.debugging = false;
end;

function u7.KnitStart(p10) -- Line: 67
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p10);
end;

function u7.onGameInit(u11) -- Line: 70
    -- upvalues: default (copy), HalloweenKit (copy)
    default.Client:Get("HalloweenSetKit"):Connect(function(p12) -- Line: 71
        -- upvalues: u11 (copy), HalloweenKit (ref)
        if not u11.inited then
            if p12.kit == HalloweenKit.SUMMONER then
                u11:initializePlayer();
            end;

            u11.inited = true;
        end;
    end);
    default.Client:Get("SummonerStartSummonSpellFromServer"):Connect(function(p13) -- Line: 79
        -- upvalues: u11 (copy)
        u11:startChargingSummon(p13.player, p13.startTime);
    end);
    default.Client:Get("SummonerFinishSummonSpellFromServer"):Connect(function(p14) -- Line: 82
        -- upvalues: u11 (copy)
        u11:finishChargingSummon(p14.player, p14.tier);
    end);
    default.Client:Get("SummonerDeath"):Connect(function(p15) -- Line: 85
        -- upvalues: u11 (copy)
        return u11:cancelSummon(p15.player);
    end);
    default.Client:Get("SummonerCancelSummon"):Connect(function(p16) -- Line: 88
        -- upvalues: u11 (copy)
        return u11:cancelSummon(p16.player);
    end);
end;

function u7.initializePlayer(p17) -- Line: 92
    -- upvalues: Flamework (copy), u4 (copy), SummonerKitLevelUI (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), EntityUtil (copy)
    p17.localChargingMaid:DoCleaning();
    p17:enableStartChargingAbility();

    if not p17.initializedUI then
        p17.initializedUI = true;
        p17.levelUpUiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SummonerKitLevelUI)));
    end;

    ClientSyncEvents.CanUseLocalAbility:connect(function(p18) -- Line: 100
        -- upvalues: Players (ref), AbilityId (ref), EntityUtil (ref)
        if p18.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p18.ability == AbilityId.SUMMONER_START_CHARGING or p18.ability == AbilityId.SUMMONER_FINISH_CHARGING then
            if not EntityUtil:getPlayerFromEntityInstance(p18.userCharacter) then
                p18:setCancelled(true);

                return nil;
            end;

            local v19 = EntityUtil:getEntity(p18.userCharacter);

            if not v19 then
                p18:setCancelled(true);

                return nil;
            end;

            if not v19:isAlive() then
                p18:setCancelled(true);

                return nil;
            end;
        end;
    end);
end;

function u7.startChargingSummon(u20, p21, p22) -- Line: 125
    -- upvalues: Players (copy), KnitClient2 (copy), SummonerKitBalance (copy), KnitClient (copy), ActionUtil (copy), AbilityId (copy), summoner_getPlayerSpellLevel (copy), Flamework (copy), u4 (copy), SummonerKitCastBarUI (copy), summoner_getTotalCastTimeRequired (copy)
    if p21 == Players.LocalPlayer then
        local u23 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = false,
            moveSpeedMultiplier = SummonerKitBalance.CASTING_MOVE_SPEED_MULTIPLIER
        });
        local u24 = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = 0
        });
        u20.localChargingMaid:GiveTask(function() -- Line: 137
            -- upvalues: u23 (copy), u24 (copy)
            u23.Destroy();
            u24.Destroy();
        end);
        u20.localChargingMaid:GiveTask(ActionUtil:disableActions({
            disableSword = true,
            disableAbilities = true,
            disableBlockPlacement = true,
            disableBlockBreaking = true,
            disableAiming = true,
            disableConsumingItems = true,
            player = p21,
            enabledAbilityOverrides = { AbilityId.SUMMONER_FINISH_CHARGING }
        }));
        task.delay(0.25, function() -- Line: 153
            -- upvalues: u20 (copy)
            u20:enableFinishChargingAbility();
        end);
        local v25 = summoner_getPlayerSpellLevel(p21);
        local v26 = v25 == nil and 1 or v25;
        local v27 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SummonerKitCastBarUI, {
            HideOnComplete = true,
            Size = UDim2.fromScale(v26 / 4, 0.03),
            StartTime = p22,
            EndTime = p22 + summoner_getTotalCastTimeRequired(v26),
            ProgressBarConfig = {
                Flip = false,
                GradientRotation = 0,
                BarGradient = ColorSequence.new(Color3.fromRGB(74, 20, 92), Color3.fromRGB(140, 36, 120))
            },
            PlayerSpellLevel = v26
        }));
        u20.localChargingMaid:GiveTask(v27);
    end;

    u20:createExpandingMagicCircle(p21, p22);
end;

function u7.createExpandingMagicCircle(u28, u29, u30) -- Line: 181
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), summoner_getPlayerSpellData (copy), summoner_getPlayerSpellLevel (copy), summoner_getTotalCastTimeRequired (copy), SummonerKitBalance (copy), HalloweenUpgradeUtil (copy), HalloweenUpgradeType (copy), HalloweenBalanceConfig (copy), u3 (copy), EntityUtil (copy), MathExtras (copy), SoundManager (copy), GameSound (copy)
    local Character = u29.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u31 = ReplicatedStorage.Assets.Misc.Kaida.Summoner_SummonCircle:Clone();
    u31.Parent = Workspace;

    if RunService:IsStudio() and (u28.debugging and u31.Pivot.DebugCircle) then
        u31.Pivot.DebugCircle.Transparency = 0;
    end;

    local v32 = u28.playerCastingDataMap[u29];

    if v32 then
        v32.castingMaid:DoCleaning();
        u28.playerCastingDataMap[u29] = nil;
    end;

    local u33 = CFrame.new(Character.Position - Vector3.new(0, 3, 0));
    u31:PivotTo(u33);
    local v34 = summoner_getPlayerSpellData(u29);
    local v35 = summoner_getPlayerSpellLevel(u29);
    local v36 = v35 == nil and 1 or v35;
    local u37 = summoner_getTotalCastTimeRequired(v36);
    local CIRCLE_MIN_RADIUS = SummonerKitBalance.CIRCLE_MIN_RADIUS;
    local maxRadius = v34.maxRadius;
    local v38 = HalloweenUpgradeUtil:getAbilityStacks(u29, HalloweenUpgradeType.KAIDA_RADIUS);

    if v38 > 0 then
        maxRadius = maxRadius + SummonerKitBalance.SPELL_TIER_1_DATA.maxRadius * (v38 * HalloweenBalanceConfig.KAIDA_EXPANSION_PERCENT / 100);
    end;

    local u39 = u3.new();
    local v40 = u3.new();
    local u41 = 0;
    local u42 = true;
    local u43 = nil;
    u43 = RunService.Heartbeat:Connect(function(p44) -- Line: 236
        -- upvalues: u31 (copy), EntityUtil (ref), u29 (copy), u43 (ref), u42 (ref), Workspace (ref), u30 (copy), u37 (copy), MathExtras (ref), CIRCLE_MIN_RADIUS (copy), maxRadius (ref), Character (copy), u33 (ref), u41 (ref)
        local v45 = u31;

        if v45 ~= nil then
            v45 = v45.Parent;
        end;

        local v46 = v45 == nil;

        if not v46 then
            v46 = EntityUtil:getEntity(u29);

            if v46 ~= nil then
                v46 = v46:isDead();
            end;
        end;

        if v46 then
            u43:Disconnect();

            return nil;
        end;

        if u42 then
            local v47 = (Workspace:GetServerTimeNow() - u30) / u37;
            local v48 = MathExtras:lerp(CIRCLE_MIN_RADIUS, maxRadius, (math.clamp(v47, 0, 1))) * 2;
            u33 = CFrame.new(Character.Position - Vector3.new(0, 3, 0));
            u31:PivotTo(u33);
            u31:ScaleTo(v48);
        end;

        u41 = u41 + p44;
        local v49 = u31;

        if v49 ~= nil then
            v49 = v49.Pivot;
        end;

        if v49 then
            local v50 = CFrame.Angles(0, math.rad(u41 * 60), 0);
            u31.Pivot.Ring1.CFrame = u33 * v50;
            local v51 = CFrame.Angles(0, math.rad(u41 * 10), 0);
            u31.Pivot.Ring2.CFrame = u33 * v51;
            local v52 = CFrame.Angles(0, math.rad(-u41 * 80), 0);
            u31.Pivot.Ring3.CFrame = u33 * v52;
            local v53 = CFrame.Angles(0, math.rad(u41 * 30), 0);
            u31.Pivot.PortalBottom.CFrame = u33 * v53;
            local v54 = CFrame.Angles(0, math.rad(u41 * -30), 0);
            u31.Pivot.PortalTop.CFrame = u33 * v54;
        end;
    end);
    v40:GiveTask(u43);
    u28.playerCastingDataMap[u29] = {
        finishedCasting = false,
        castingMaid = u39,
        summonMaid = v40,
        circleParent = u31
    };
    u39:GiveTask(function() -- Line: 298
        -- upvalues: u42 (ref), u28 (copy), u29 (copy), u31 (copy)
        u42 = false;
        local v55 = u28.playerCastingDataMap[u29];

        if v55 and (not v55.finishedCasting and u31) then
            u31:Destroy();
        end;
    end);
    local SUMMONER_SUMMON_CHANNEL_LOOP = GameSound.SUMMONER_SUMMON_CHANNEL_LOOP;
    local v56 = {
        looped = true,
        parent = u31.PrimaryPart
    };
    local PrimaryPart = u31.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    v56.position = PrimaryPart;
    u39:GiveTask((SoundManager:playSound(SUMMONER_SUMMON_CHANNEL_LOOP, v56)));
    local v57 = summoner_getTotalCastTimeRequired(v36);
    task.delay(v57 + 0.1, function() -- Line: 344
        -- upvalues: u39 (copy)
        u39:DoCleaning();
    end);
end;

function u7.finishChargingSummon(p58, p59, p60) -- Line: 349
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), HalloweenUpgradeUtil (copy), HalloweenUpgradeType (copy), TweenService (copy), HalloweenBalanceConfig (copy), MathExtras (copy)
    if p59 == Players.LocalPlayer then
        p58.localChargingMaid:DoCleaning();
        p58:enableStartChargingAbility();
    end;

    local u61 = p58.playerCastingDataMap[p59];

    if not u61 then
        return nil;
    end;

    u61.finishedCasting = true;
    u61.castingMaid:DoCleaning();
    local circleParent = u61.circleParent;
    SoundManager:playSound(GameSound.SUMMONER_SUMMON_FINISH, {
        position = circleParent.Pivot.Position
    });
    local u62 = ReplicatedStorage.Assets.Misc.Kaida.Summoner_DragonHead:Clone();
    u62.Parent = Workspace;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local function _(p63) -- Line: 382
            if p63:IsA("MeshPart") then
                p63.Transparency = 0.6;
            end;
        end;

        for i, child in u62:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.Transparency = 0.6;
            end;
        end;
    end;

    u61.summonMaid:GiveTask(function() -- Line: 393
    end);
    local LookVector = u62.PrimaryPart.CFrame.LookVector;

    if p59.Character then
        LookVector = Vector3.new(p59.Character.PrimaryPart.CFrame.LookVector.X, 0, p59.Character.PrimaryPart.CFrame.LookVector.Z).Unit;
    end;

    math.atan2(LookVector.X, LookVector.Z);
    local Position = circleParent:GetPivot().Position;
    u62:PivotTo((CFrame.new(Position - Vector3.new(0, 13, 0))));
    local u64 = AnimationUtil:playAnimation(u62.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.SUMMONER_DRAGON_ATTACK), {
        looped = false,
        speed = 1.2
    });

    if u64 then
        local u65 = false;
        local u66 = RunService.Heartbeat:Connect(function() -- Line: 414
            -- upvalues: u64 (copy), u65 (ref), circleParent (copy), u62 (ref)
            if u64.TimePosition > 0.1 and not u65 then
                local Position2 = circleParent:GetPivot().Position;
                u62:PivotTo((CFrame.new(Position2 - Vector3.new(0, 0, 0))));
                u65 = true;
            end;
        end);
        u64.Stopped:Connect(function() -- Line: 423
            -- upvalues: u66 (copy), u62 (ref)
            u66:Disconnect();
            u62:Destroy();
        end);
    end;

    task.delay(2, function() -- Line: 428
        -- upvalues: u62 (ref)
        u62:Destroy();
    end);
    local v67 = HalloweenUpgradeUtil:isActive(p59, HalloweenUpgradeType.KAIDA_UNIQUE_FIRE) and true or false;

    if circleParent.Pivot.ParticleCircle then
        local u68 = { circleParent.Pivot.ParticleCircle.Fire1, circleParent.Pivot.ParticleCircle.Fire2, circleParent.Pivot.ParticleCircle.Fire3 };

        local function _(p69) -- Line: 438
            p69.Enabled = true;
        end;

        for i, v in u68 do
            local _ = i - 1;
            v.Enabled = true;
        end;

        if not v67 then
            task.delay(0.3, function() -- Line: 446
                -- upvalues: u68 (copy)
                local function _(p70) -- Line: 447
                    p70.Enabled = false;
                end;

                for i, v in u68 do
                    local _ = i - 1;
                    v.Enabled = false;
                end;
            end);
        end;
    end;

    task.wait(2.2);

    if v67 then
        task.spawn(function() -- Line: 462
            -- upvalues: TweenService (ref), circleParent (copy), HalloweenBalanceConfig (ref), u61 (copy), RunService (ref), MathExtras (ref)
            local v71 = Color3.fromRGB(117, 20, 23);
            local PortalRing1 = circleParent.Pivot.PortalBottom:FindFirstChild("PortalRing1");

            if PortalRing1 ~= nil then
                PortalRing1 = PortalRing1:FindFirstChild("UI");

                if PortalRing1 ~= nil then
                    PortalRing1 = PortalRing1:FindFirstChild("Logo");
                end;
            end;

            TweenService:Create(PortalRing1, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local UI = circleParent.Pivot.PortalBottom:FindFirstChild("UI");

            if UI ~= nil then
                UI = UI:FindFirstChild("Logo");
            end;

            TweenService:Create(UI, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local PortalWhite = circleParent.Pivot.PortalTop:FindFirstChild("PortalWhite");

            if PortalWhite ~= nil then
                PortalWhite = PortalWhite:FindFirstChild("UI");

                if PortalWhite ~= nil then
                    PortalWhite = PortalWhite:FindFirstChild("Logo");
                end;
            end;

            TweenService:Create(PortalWhite, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local UI2 = circleParent.Pivot.PortalTop:FindFirstChild("UI");

            if UI2 ~= nil then
                UI2 = UI2:FindFirstChild("Logo");
            end;

            TweenService:Create(UI2, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local UI3 = circleParent.Pivot.Ring1:FindFirstChild("UI");

            if UI3 ~= nil then
                UI3 = UI3:FindFirstChild("Logo");
            end;

            TweenService:Create(UI3, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local UI4 = circleParent.Pivot.Ring2:FindFirstChild("UI");

            if UI4 ~= nil then
                UI4 = UI4:FindFirstChild("Logo");
            end;

            TweenService:Create(UI4, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            local UI5 = circleParent.Pivot.Ring3:FindFirstChild("UI");

            if UI5 ~= nil then
                UI5 = UI5:FindFirstChild("Logo");
            end;

            TweenService:Create(UI5, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ImageColor3 = v71
            }):Play();
            task.wait(HalloweenBalanceConfig.KAIDA_UNIQUE_FIRE_DURATION);

            if u61 and u61.circleParent then
                local u72 = u61.circleParent:GetScale();
                local u73 = 0;
                local u74 = nil;
                u74 = RunService.Heartbeat:Connect(function(p75) -- Line: 537
                    -- upvalues: u73 (ref), MathExtras (ref), u72 (copy), u61 (ref), u74 (ref), circleParent (ref)
                    u73 = u73 + p75;
                    local v76 = math.clamp(u73 / 0.75, 0, 1);
                    local v77 = MathExtras:lerp(u72, 0.01, v76);
                    local v78 = u61;

                    if v78 ~= nil then
                        v78.circleParent:ScaleTo(v77);
                    end;

                    if v76 >= 1 then
                        u74:Disconnect();
                        local v79 = u61;

                        if v79 ~= nil then
                            v79.castingMaid:DoCleaning();
                        end;

                        local v80 = u61;

                        if v80 ~= nil then
                            v80.summonMaid:DoCleaning();
                        end;

                        circleParent:Destroy();
                    end;
                end);
            end;
        end);
    elseif u61 and u61.circleParent then
        local u81 = u61.circleParent:GetScale();
        local u82 = 0;
        local u83 = nil;
        u83 = RunService.Heartbeat:Connect(function(p84) -- Line: 568
            -- upvalues: u82 (ref), MathExtras (ref), u81 (copy), u61 (copy), u83 (ref), circleParent (copy)
            u82 = u82 + p84;
            local v85 = math.clamp(u82 / 0.75, 0, 1);
            local v86 = MathExtras:lerp(u81, 0.01, v85);
            local v87 = u61;

            if v87 ~= nil then
                v87.circleParent:ScaleTo(v86);
            end;

            if v85 >= 1 then
                u83:Disconnect();
                local v88 = u61;

                if v88 ~= nil then
                    v88.castingMaid:DoCleaning();
                end;

                local v89 = u61;

                if v89 ~= nil then
                    v89.summonMaid:DoCleaning();
                end;

                circleParent:Destroy();
            end;
        end);
    end;

    p58.playerCastingDataMap[p59] = nil;
end;

function u7.enableStartChargingAbility(u90) -- Line: 596
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if u90.abilityRef ~= nil then
        u90.abilityRef.Destroy();
    end;

    task.defer(function() -- Line: 600
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref), u90 (copy)
        local v91 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SUMMONER_START_CHARGING = AbilityId.SUMMONER_START_CHARGING;
        local v92 = {};

        for i, v in AbilityMeta[AbilityId.SUMMONER_START_CHARGING].triggerConfig do
            v92[i] = v;
        end;

        v91:enableAbility(SUMMONER_START_CHARGING, v92):andThen(function(p93) -- Line: 608
            -- upvalues: u90 (ref)
            u90.abilityRef = p93;
        end);
    end);
end;

function u7.enableFinishChargingAbility(u94) -- Line: 614
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if u94.abilityRef ~= nil then
        u94.abilityRef.Destroy();
    end;

    task.defer(function() -- Line: 618
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref), u94 (copy)
        local v95 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SUMMONER_FINISH_CHARGING = AbilityId.SUMMONER_FINISH_CHARGING;
        local v96 = {};

        for i, v in AbilityMeta[AbilityId.SUMMONER_FINISH_CHARGING].triggerConfig do
            v96[i] = v;
        end;

        v95:enableAbility(SUMMONER_FINISH_CHARGING, v96):andThen(function(p97) -- Line: 626
            -- upvalues: u94 (ref)
            u94.abilityRef = p97;
        end);
    end);
end;

function u7.isPlayerCastingSpell(p98, p99) -- Line: 632
    local v100 = p98.playerCastingDataMap[p99];

    if v100 == nil then
        return false;
    end;

    return not v100.finishedCasting;
end;

function u7.cancelSummon(p101, p102) -- Line: 644
    -- upvalues: isUsingKit (copy), BedwarsKit (copy), Players (copy)
    if not isUsingKit(p102, BedwarsKit.SUMMONER) then
        return nil;
    end;

    local v103 = p101.playerCastingDataMap[p102];

    if v103 then
        v103.castingMaid:DoCleaning();
        p101.playerCastingDataMap[p102] = nil;
    end;

    if p102 == Players.LocalPlayer then
        p101.localChargingMaid:DoCleaning();
    end;
end;

KnitClient.CreateController(u7.new());

return nil;