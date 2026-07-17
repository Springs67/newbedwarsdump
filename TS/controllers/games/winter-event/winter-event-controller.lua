-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v2.InOutQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v6.Lighting;
local Players = v6.Players;
local RunService = v6.RunService;
local SoundService = v6.SoundService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ViewmodelMode = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local PingType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type").PingType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SceneKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinterEventEnvironment = RuntimeLib.import(script, script.Parent, "winter-event-environment").WinterEventEnvironment;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "WinterEventController";
    end,

    __index = GameKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 48
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 52
    -- upvalues: GameKnitController (copy), GameType (copy), u5 (copy), u3 (copy)
    GameKnitController.constructor(p9, { GameType.WINTER_EVENT });
    p9.Name = "WinterEventController";
    p9.currMaxHeightPerc = 0;
    p9.actionBarTextLabel = u5.createRef();
    p9.climbActive = false;
    p9.winterEffectStrengthLocked = false;
    p9.atmosphereHidden = false;
    p9.footstepModifierMaid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 62
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p10);
end;

function u7.onGameInit(p11) -- Line: 65
    p11:setup();
end;

function u7.setup(u12) -- Line: 68
    -- upvalues: u4 (copy), Workspace (copy), SoundService (copy), Lighting (copy), RunService (copy), ClientSyncEvents (copy), MatchState (copy), ClientStore (copy), default2 (copy), RandomUtil (copy), SoundManager (copy), GameSound (copy), SceneKey (copy), u3 (copy), default (copy), InOutQuad (copy), Linear (copy), Flamework (copy), PingType (copy), Players (copy)
    u12.winterEffectStrength = u4("NumberValue", {
        Name = "WinterStormStrength",
        Value = 0.05,
        Parent = Workspace
    });
    u12.winterEventSoundGroup = u4("SoundGroup", {
        Name = "WinterEvent",
        Volume = 0.35,
        Parent = SoundService
    });
    u12.blurEffect = u4("BlurEffect", {
        Parent = Lighting
    });

    if not RunService:IsStudio() then
        u12:forceFirstPersonMode();
    end;

    u12:setupWinterEffects();
    ClientSyncEvents.MatchStateChange:connect(function(p13) -- Line: 86
        -- upvalues: MatchState (ref), u12 (copy)
        if p13.matchState == MatchState.RUNNING then
            u12:playIntroMusicPiece();
        end;
    end);
    ClientStore.changed:connect(function(p14, p15) -- Line: 91
        -- upvalues: u12 (copy)
        if p14.Game.spectatingPlayer ~= p15.Game.spectatingPlayer then
            task.spawn(function() -- Line: 93
                -- upvalues: u12 (ref)
                u12:enableThirdPersonMode();
            end);
        end;
    end);
    default2.Client:Get("WinterEventStatusUpdate"):Connect(function(p16) -- Line: 98
        -- upvalues: RandomUtil (ref), SoundManager (ref), GameSound (ref), SceneKey (ref), u3 (ref), default (ref), InOutQuad (ref), Linear (ref), u12 (copy), Flamework (ref), PingType (ref), Workspace (ref), Players (ref)
        if p16.gameStarted then
            local v17 = false;
            local v18 = 0;

            while true do
                if true then
                    if v17 then
                        v18 = v18 + 1;
                    else
                        v17 = true;
                    end;
                end;

                if v18 >= 3 then
                    break;
                end;

                local v19 = RandomUtil.fromList(unpack(p16.gameStarted.icePositions));
                local icePositions = p16.gameStarted.icePositions;
                local v20 = (table.find(p16.gameStarted.icePositions, v19) or 0) - 1;
                table.remove(icePositions, v20 + 1);
                SoundManager:playSound(RandomUtil.fromList(GameSound.ICICLE_IMPACT_1, GameSound.ICICLE_IMPACT_2), {
                    position = v19
                });
            end;

            task.delay(4.5, function() -- Line: 123
                -- upvalues: SceneKey (ref), SoundManager (ref), GameSound (ref), u3 (ref), default (ref), InOutQuad (ref), Linear (ref)
                local v21 = game.Workspace:WaitForChild(SceneKey.WINTER_MINIGAME_MOUNTAIN);
                v21:WaitForChild("Effect"):WaitForChild("LightBeam");
                local LightBeam = v21.Effect.LightBeam;
                LightBeam.Transparency = 0;
                local Position = LightBeam.Position;
                SoundManager:playSound(GameSound.WINTER_EVENT_LIGHT_SHINE, {
                    volumeMultiplier = 1.3,
                    rollOffMinDistance = 10000,
                    rollOffMaxDistance = 11000,
                    position = LightBeam.Position
                });
                local u22 = u3.new();
                u22:GiveTask(function() -- Line: 137
                    -- upvalues: LightBeam (copy)
                    return LightBeam:Destroy();
                end);
                default(4, InOutQuad, function(p23) -- Line: 141
                    -- upvalues: LightBeam (copy), Position (copy)
                    local Size = LightBeam.Size;
                    LightBeam.Size = Vector3.new(p23 * 400, Size.Y, Size.Z);
                    LightBeam.Position = Position + Vector3.new(0, p23 * 400 / 2, 0);
                end);
                task.delay(6, function() -- Line: 156
                    -- upvalues: default (ref), Linear (ref), LightBeam (copy), Position (copy), u22 (copy)
                    default(3, Linear, function(p24) -- Line: 158
                        -- upvalues: LightBeam (ref), Position (ref)
                        local Size = LightBeam.Size;
                        LightBeam.Size = Vector3.new((1 - p24) * 400, Size.Y, Size.Z);
                        LightBeam.Position = Position + Vector3.new(0, (1 - p24) * 400 / 2, 0);
                        LightBeam.Transparency = p24;
                    end);
                    task.delay(4, function() -- Line: 165
                        -- upvalues: u22 (ref)
                        u22:DoCleaning();
                    end);
                end);
            end);
        end;

        if p16.minigameStarted then
            u12.climbActive = false;

            if u12.destinationIndicator then
                u12.destinationIndicator:destroy();
                u12.destinationIndicator = nil;
            end;

            u12.gameStartTime = nil;
        end;

        if p16.nextGameStartTime ~= nil or p16.climbStarted then
            if p16.nextGameStartTime ~= nil then
                u12.gameStartTime = p16.nextGameStartTime;
            end;

            if not u12.climbActive then
                u12.climbActive = true;

                if p16.platformPosition then
                    u12.destinationIndicator = Flamework.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):createIndicator(p16.platformPosition + Vector3.new(0, 6, 0), PingType.GENERIC, nil, {
                        hidePlayerIcon = true,
                        indicatorLifetime = 180
                    });
                end;

                while true do
                    local v25 = task.wait(0.1);

                    if v25 == 0 or (v25 ~= v25 or not v25) then
                        break;
                    end;

                    local gameStartTime = u12.gameStartTime;
                    local v26;

                    if gameStartTime == 0 or (gameStartTime ~= gameStartTime or not gameStartTime) then
                        v26 = nil;
                    else
                        v26 = u12.gameStartTime - Workspace:GetServerTimeNow();
                    end;

                    if v26 ~= nil and v26 <= 0 or not u12.climbActive then
                        u12:updateActionBar("Good luck!", Color3.fromRGB(116, 255, 102));
                        u12.climbActive = false;
                        u12.gameStartTime = nil;

                        return;
                    end;

                    local v27;

                    if v26 == nil then
                        v27 = "";
                    else
                        local v28 = math.floor(v26);
                        v27 = " (" .. tostring(v28) .. "s)";
                    end;

                    local v29 = Players.LocalPlayer:GetAttribute("ArrivedAtGame");

                    if v29 == 0 or (v29 ~= v29 or (v29 == "" or not v29)) then
                        u12:updateActionBar("Get to the next challenge!" .. v27);
                    else
                        u12:updateActionBar("Waiting for other climbers.." .. v27, Color3.fromRGB(116, 255, 102));
                    end;
                end;
            end;
        end;
    end);
    default2.Client:Get("MinigamePlayerEliminated"):Connect(function(p30) -- Line: 224
        -- upvalues: Players (ref), u12 (copy)
        if p30 == Players.LocalPlayer.UserId then
            u12:hideActionBar();
        end;
    end);
    task.spawn(function() -- Line: 229
        -- upvalues: Workspace (ref), u12 (copy), default (ref), Linear (ref)
        while true do
            local v31 = task.wait(1);

            if v31 == 0 or (v31 ~= v31 or not v31) then
                break;
            end;

            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera ~= nil then
                CurrentCamera = CurrentCamera.CFrame.Position;
            end;

            if CurrentCamera then
                local v32 = math.clamp((CurrentCamera.Y - 238) / 436, 0, 1);

                if u12.currMaxHeightPerc < v32 then
                    u12.currMaxHeightPerc = v32;
                    local Value = u12.winterEffectStrength.Value;
                    local u33 = v32 * 0.95 + 0.05;
                    default(1, Linear, function(p34) -- Line: 248
                        -- upvalues: u12 (ref), Value (copy), u33 (copy)
                        if u12.winterEffectStrengthLocked then
                            return nil;
                        end;

                        u12.winterEffectStrength.Value = Value * (1 - p34) + u33 * p34;
                    end);
                end;
            end;
        end;
    end);
end;

function u7.tweenWinterEffectStrength(u35, u36, p37) -- Line: 258
    -- upvalues: default (copy), Linear (copy)
    u35.winterEffectStrengthLocked = true;
    local Value = u35.winterEffectStrength.Value;
    default(p37, Linear, function(p38) -- Line: 261
        -- upvalues: u35 (copy), Value (copy), u36 (copy)
        u35.winterEffectStrength.Value = (1 - p38) * Value + p38 * u36;
    end);
end;

function u7.updateActionBar(p39, p40, p41) -- Line: 265
    -- upvalues: KnitClient (copy), Flamework (copy), u5 (copy), ColorUtil (copy), default (copy), Linear (copy)
    if KnitClient.Controllers.MinigameController:isEliminated() then
        return nil;
    end;

    if not p39.actionBarMaid then
        p39.actionBarMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createFragment({
            WinterEventHelperText = u5.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextColor3 = p41 or ColorUtil.WHITE,
                Text = p40,
                [u5.Ref] = p39.actionBarTextLabel,
                Size = UDim2.fromScale(1, 0.04),
                TextScaled = true,
                Font = "GothamBold"
            })
        }));
    end;

    local u42 = p39.actionBarTextLabel:getValue();

    if u42 then
        local u43 = math.random();
        u42:SetAttribute("RefreshId", u43);
        u42.Text = p40;
        u42.TextColor3 = p41 or ColorUtil.WHITE;
        local TextTransparency = u42.TextTransparency;

        if TextTransparency ~= 0 then
            local u44 = nil;
            u44 = default(0.6, Linear, function(p45) -- Line: 291
                -- upvalues: u42 (copy), u43 (copy), u44 (ref), TextTransparency (copy)
                if u42:GetAttribute("RefreshId") ~= u43 then
                    u44:Cancel();

                    return nil;
                end;

                u42.TextTransparency = (1 - p45) * TextTransparency;
            end);
        end;

        task.delay(5, function() -- Line: 299
            -- upvalues: u42 (copy), u43 (copy), default (ref), Linear (ref)
            if u42:GetAttribute("RefreshId") ~= u43 then
                return nil;
            end;

            local u46 = nil;
            u46 = default(2, Linear, function(p47) -- Line: 304
                -- upvalues: u42 (ref), u43 (ref), u46 (ref)
                if u42:GetAttribute("RefreshId") ~= u43 then
                    u46:Cancel();

                    return nil;
                end;

                u42.TextTransparency = p47;
            end);
        end);
    end;
end;

function u7.hideActionBar(p48) -- Line: 314
    local actionBarMaid = p48.actionBarMaid;

    if actionBarMaid ~= nil then
        actionBarMaid:DoCleaning();
    end;

    p48.actionBarMaid = nil;
    local v49 = p48.actionBarTextLabel:getValue();

    if v49 ~= nil then
        v49 = v49.Text;
    end;

    if v49 ~= "" and v49 then
        p48.actionBarTextLabel:getValue().Text = "";
    end;
end;

function u7.setupWinterEffects(u50) -- Line: 328
    -- upvalues: KnitClient (copy), WinterEventEnvironment (copy), SoundManager (copy), GameSound (copy), Lighting (copy)
    KnitClient.Controllers.SnowWeatherParticleController:enable(0.2);
    KnitClient.Controllers.EnvironmentController:setupEnvironment(WinterEventEnvironment);
    local u51 = SoundManager:playModifiableSound(GameSound.AMBIENCE_SNOW, {
        looped = true
    });
    u50.backgroundMusic = SoundManager:playModifiableSound(GameSound.WINTER_EVENT_BACKGROUND_MUSIC, {
        looped = true
    });

    if u51 then
        u51.SoundGroup = u50.winterEventSoundGroup;
    end;

    if u50.backgroundMusic then
        u50.backgroundMusic.SoundGroup = u50.winterEventSoundGroup;
    end;

    local function u57() -- Line: 343
        -- upvalues: u50 (copy), u51 (copy), Lighting (ref), WinterEventEnvironment (ref), KnitClient (ref)
        local v52 = math.clamp(u50.winterEffectStrength.Value, 0, 1);

        if u51 then
            u51.Volume = v52 * 1.5;
        end;

        if u50.backgroundMusic then
            local v53 = math.max(0.75 - v52, 0);
            local v54 = u50.backgroundMusic:GetAttribute("Silent");

            if v54 == 0 or (v54 ~= v54 or (v54 == "" or not v54)) then
                u50.backgroundMusic.Volume = v53;
            else
                u50.backgroundMusic:SetAttribute("DesiredVolume", v53);
            end;
        end;

        local v55 = math.clamp((v52 - 0.05) / 0.95, 0, 1);
        u50.atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere");

        if u50.atmosphere and not u50.atmosphereHidden then
            u50.atmosphere.Color = WinterEventEnvironment.Atmosphere.Color:Lerp(Color3.fromRGB(236, 255, 249), v55);
            u50.atmosphere.Density = WinterEventEnvironment.Atmosphere.Density * (1 - v55) + v55 * 0.7;
            u50.atmosphere.Offset = WinterEventEnvironment.Atmosphere.Offset * (1 - v55) + v55 * 1;
            u50.atmosphere.Haze = WinterEventEnvironment.Atmosphere.Haze * (1 - v55) + v55 * 4.5;
        end;

        local v56 = Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect");

        if v56 then
            v56.InFocusRadius = WinterEventEnvironment.DepthOfFieldEffect.InFocusRadius * (1 - v55) + v55 * 150;
        end;

        u50.blurEffect.Size = math.clamp((v52 - 0.7) / 0.30000000000000004, 0, 1) * 2.5;
        KnitClient.Controllers.SnowWeatherParticleController:setIntensity(v52);
    end;

    u50.winterEffectStrength.Changed:Connect(function() -- Line: 374
        -- upvalues: u57 (copy)
        u57();
    end);
    u57();
end;

function u7.playIntroMusicPiece(u58) -- Line: 379
    -- upvalues: SoundManager (copy), GameSound (copy)
    local v59 = SoundManager:playModifiableSound(GameSound.WINTER_EVENT_INTRO_MUSIC, {
        fadeInTime = 1.2
    });

    if v59 then
        v59.SoundGroup = u58.winterEventSoundGroup;

        if u58.backgroundMusic then
            u58.backgroundMusic:SetAttribute("DesiredVolume", u58.backgroundMusic.Volume);
            u58.backgroundMusic:SetAttribute("Silent", true);
            SoundManager:tweenSoundVolume(u58.backgroundMusic, 0, 1);
            task.delay(17, function() -- Line: 390
                -- upvalues: u58 (copy), SoundManager (ref)
                local backgroundMusic = u58.backgroundMusic;

                if backgroundMusic ~= nil then
                    backgroundMusic = backgroundMusic.IsPlaying;
                end;

                if not backgroundMusic then
                    return nil;
                end;

                local backgroundMusic2 = u58.backgroundMusic;
                local backgroundMusic3 = u58.backgroundMusic;

                if backgroundMusic3 ~= nil then
                    backgroundMusic3 = backgroundMusic3:GetAttribute("DesiredVolume");
                end;

                SoundManager:tweenSoundVolume(backgroundMusic2, backgroundMusic3, 1);
                task.delay(1, function() -- Line: 405
                    -- upvalues: u58 (ref)
                    if not u58.backgroundMusic then
                        return nil;
                    end;

                    u58.backgroundMusic:SetAttribute("Silent", false);
                end);
            end);
        end;
    end;
end;

function u7.forceFirstPersonMode(p60) -- Line: 415
    -- upvalues: KnitClient (copy), ViewmodelMode (copy), Players (copy)
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(true);
    p60.footstepModifierMaid:GiveTask(KnitClient.Controllers.FootstepsController.footstepModifier:addModifier({
        localVolumeMultiplier = 5,
        localFootstepFrequency = 0.13513513513513511
    }));
    KnitClient.Controllers.ScreenWobbleController:enableScreenWobble();
    KnitClient.Controllers.ViewmodelController:setViewModelMode(ViewmodelMode.SHOW_ARMS);
    Players.LocalPlayer.CameraMaxZoomDistance = 0;
    Players.LocalPlayer.CameraMinZoomDistance = 0;
end;

function u7.enableThirdPersonMode(p61, p62) -- Line: 426
    -- upvalues: KnitClient (copy), Players (copy)
    local v63 = p62 == nil and 14 or p62;
    KnitClient.Controllers.MobileShiftLockController:blockShiftLock(false);
    KnitClient.Controllers.ScreenWobbleController:disableScreenWobble();
    p61.footstepModifierMaid:DoCleaning();
    Players.LocalPlayer.CameraMaxZoomDistance = 16;
    Players.LocalPlayer.CameraMinZoomDistance = v63 > 16 and 16 or v63;
    task.delay(0.1, function() -- Line: 439
        -- upvalues: Players (ref)
        Players.LocalPlayer.CameraMinZoomDistance = 0;
    end);
end;

function u7.getClimbSoundGroup(p64) -- Line: 443
    return p64.winterEventSoundGroup;
end;

function u7.hideAtmosphere(p65) -- Line: 446
    p65.atmosphereHidden = true;

    if p65.atmosphere then
        p65.atmosphere.Density = 0;
    end;
end;

function u7.setStaticWinterEffectStrength(p66, p67) -- Line: 452
    p66.winterEffectStrengthLocked = true;
    p66.winterEffectStrength.Value = p67;
end;

function u7.disableStaticWinterEffectStrength(p68) -- Line: 456
    p68.winterEffectStrengthLocked = false;
end;

function u7.showAtmosphere(p69) -- Line: 459
    p69.atmosphereHidden = false;
end;

KnitClient.CreateController(u7.new());

return nil;