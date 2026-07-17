-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local PingType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type").PingType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CircleProgressBar = RuntimeLib.import(script, script.Parent, "ui", "circle-progress-bar").CircleProgressBar;
local ScoreBoardWrapper = RuntimeLib.import(script, script.Parent, "ui", "point-capture-score-ui").ScoreBoardWrapper;
local PointStatusUI = RuntimeLib.import(script, script.Parent, "ui", "point-status-ui").PointStatusUI;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "PointCaptureController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: GameKnitController (copy), GameType (copy), GameSound (copy)
    GameKnitController.constructor(p8, { GameType.CAPTURE_THE_POINTS });
    p8.Name = "PointCaptureController";
    p8.pointMap = {};
    p8.neutralColor = Color3.fromRGB(166, 163, 163);
    p8.capturePointAudioMaidMap = {};
    p8.captureProgressIncreaseSounds = {
        GameSound.DOMINATION_CAPTURING_1,
        GameSound.DOMINATION_CAPTURING_2,
        GameSound.DOMINATION_CAPTURING_3,
        GameSound.DOMINATION_CAPTURING_4,
        GameSound.DOMINATION_CAPTURING_5,
        GameSound.DOMINATION_CAPTURING_6,
        GameSound.DOMINATION_CAPTURING_7,
        GameSound.DOMINATION_CAPTURING_8,
        GameSound.DOMINATION_CAPTURING_9,
        GameSound.DOMINATION_CAPTURING_10,
        GameSound.DOMINATION_CAPTURING_10
    };
    p8.captureProgressIncreaseLoops = {
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4_LOOP
    };
    p8.captureProgressDecreaseSounds = {
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4
    };
    p8.captureProgressDecreaseLoops = {
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4_LOOP
    };
end;

function u6.KnitStart(u9) -- Line: 54
    -- upvalues: GameKnitController (copy), u2 (copy), default (copy), ClientStore (copy), MatchState (copy), QueueType (copy), u4 (copy), ScoreBoardWrapper (copy), Players (copy), PointStatusUI (copy)
    GameKnitController.KnitStart(u9);
    local u10 = u2.new();
    default.Client:Get("CreateCapturePoint"):Connect(function(p11) -- Line: 57
        -- upvalues: u9 (copy)
        u9:setupPoints(p11.position, p11.id);
    end);
    default.Client:Get("ResourcePointProgressUpdate"):Connect(function(p12) -- Line: 60
        -- upvalues: u9 (copy)
        u9:updateProgress(p12.resourcePoint);
    end);
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p13, p14, p15) -- Line: 63
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), u4 (ref), ScoreBoardWrapper (ref), Players (ref), u10 (copy)
        local queueType = ClientStore:getState().Game.queueType;

        if p13 == MatchState.RUNNING and queueType == QueueType.CAPTURE_POINTS then
            local u16 = u4.mount(ScoreBoardWrapper(), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u10:GiveTask(function() -- Line: 67
                -- upvalues: u4 (ref), u16 (copy)
                u4.unmount(u16);
            end);
        end;

        if p13 == MatchState.POST then
            u10:DoCleaning();
        end;
    end);
    default.Client:Get("CapturePointSetUpComplete"):Connect(function(p17) -- Line: 75
        -- upvalues: u4 (ref), PointStatusUI (ref), Players (ref), u10 (copy)
        local u18 = u4.mount(u4.createElement(PointStatusUI, {
            points = p17.points
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u10:GiveTask(function() -- Line: 79
            -- upvalues: u4 (ref), u18 (copy)
            u4.unmount(u18);
        end);
    end);
end;

function u6.setupPoints(p19, p20, p21) -- Line: 84
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), ClientSyncEvents (copy)
    local v22 = ReplicatedStorage.Assets.Effects.DominationPoint:Clone();
    v22:PivotTo(CFrame.new(p20 - Vector3.new(0, 1, 0)));
    v22.Parent = Workspace;
    local top = v22:WaitForChild("top", 3);
    top.Transparency = 1;
    top.Anchored = true;
    top.CanCollide = false;
    top.CanQuery = false;
    top.CanTouch = false;
    top.Position = p20 - Vector3.new(0, 5, 0);
    top.Color = p19.neutralColor;
    local v23 = p19:createSign(p20 + Vector3.new(0, 9, 0), p21);
    p19.pointMap[p20] = {
        worldPosition = p20,
        startPosition = p20 - Vector3.new(0, 5, 0),
        part = top,
        progress = 0,
        id = p21,
        billboard = v23
    };
    ClientSyncEvents.PointSetup:fire(p21);
end;

function u6.createSign(p24, p25, p26) -- Line: 122
    -- upvalues: u3 (copy), Workspace (copy), u4 (copy), CircleProgressBar (copy), ColorUtil (copy)
    local v27 = u3("Part", {
        Name = "POINT",
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        Transparency = 1,
        CFrame = CFrame.new(p25),
        Parent = Workspace
    });

    return u4.mount(u4.createElement("BillboardGui", {
        StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5),
        ResetOnSpawn = false,
        MaxDistance = 300,
        AlwaysOnTop = true,
        Adornee = v27,
        Size = UDim2.fromScale(6, 6)
    }, { u4.createElement(CircleProgressBar, {
            progress = 0,
            color = ColorUtil.WHITE,
            id = p26
        }) }), v27);
end;

function u6.updateProgress(p28, p29) -- Line: 148
    -- upvalues: SoundManager (copy), GameSound (copy), PingType (copy), TweenService (copy), ClientSyncEvents (copy)
    local v30 = p28.pointMap[p29.worldPosition];

    if not v30 then
        return nil;
    end;

    local startPosition = v30.startPosition;

    if startPosition ~= nil then
        startPosition = startPosition + Vector3.new(0, p29.progress, 0);
    end;

    if not (v30.part and startPosition) then
        return nil;
    end;

    p28:handleProgressAudio(p29, v30.part.Position.Y > startPosition.Y);
    local capturedByTeam = v30.capturedByTeam;

    if capturedByTeam == "" then
        capturedByTeam = false;
    end;

    local v31 = not capturedByTeam;

    if v31 then
        v31 = p29.capturedByTeam;

        if v31 ~= "" and v31 then
            v31 = p29.progress >= 100;
        end;
    end;

    if v31 ~= "" and v31 then
        if p28:isFriendlyTeam(p29.capturedByTeam) then
            SoundManager:playSound(GameSound.DOMINATION_CAPTURED_BY_TEAM, {
                volumeMultiplier = 0.3
            });
        else
            SoundManager:playSound(GameSound.DOMINATION_CAPTURED_BY_ENEMY, {
                volumeMultiplier = 0.3
            });
        end;

        local v32;

        if p28:isFriendlyTeam(p29.capturedByTeam) then
            v32 = PingType.POINT_CAPTURED_BY_TEAM;
        else
            v32 = PingType.POINT_CAPTURED_BY_ENEMY;
        end;

        p28:createPing(v32, v30.worldPosition);
    end;

    local capturingTeam = p29.capturingTeam;

    if capturingTeam ~= "" and capturingTeam then
        if p29.capturedByTeam == nil and v30.capturingTeam ~= p29.capturingTeam then
            p28:changeColor(p29.capturingTeam, v30.part.Parent);
        end;

        local capturingTeam2 = v30.capturingTeam;

        if capturingTeam2 == "" then
            capturingTeam2 = false;
        end;

        local v33 = not capturingTeam2 and not p28:isFriendlyTeam(p29.capturingTeam);

        if v33 then
            local capturedByTeam2 = v30.capturedByTeam;

            if capturedByTeam2 == "" then
                capturedByTeam2 = false;
            end;

            if not capturedByTeam2 or v30.capturedByTeam ~= p29.capturingTeam then
                p28:createPing(PingType.POINT_CAPTURING_BY_ENEMY, v30.worldPosition);
            end;
        end;
    end;

    TweenService:Create(v30.part, TweenInfo.new(0.9), {
        Position = startPosition
    }):Play();
    local capturedByTeam2 = v30.capturedByTeam;

    if capturedByTeam2 == "" then
        capturedByTeam2 = false;
    end;

    local v34 = not capturedByTeam2 and p29.capturedByTeam;

    if v34 == "" or not v34 then
        local capturedByTeam3 = v30.capturedByTeam;

        if capturedByTeam3 ~= "" and capturedByTeam3 then
            local capturedByTeam4 = p29.capturedByTeam;

            if capturedByTeam4 == "" then
                capturedByTeam4 = false;
            end;

            capturedByTeam3 = not capturedByTeam4;
        end;

        if capturedByTeam3 ~= "" and capturedByTeam3 then
            ClientSyncEvents.PointCaptured:fire(v30.id, nil);
            p28:handleCapturedEffect(v30.part.Parent, false);
        end;
    else
        ClientSyncEvents.PointCaptured:fire(v30.id, p29.capturedByTeam);
        p28:handleCapturedEffect(v30.part.Parent, true);
    end;

    v30.capturedByTeam = p29.capturedByTeam;
    v30.capturingTeam = p29.capturingTeam;
    v30.progress = p29.progress;
end;

function u6.handleProgressAudio(p35, p36, p37) -- Line: 238
    -- upvalues: u2 (copy), SoundManager (copy)
    if p36.progress == 100 then
        return nil;
    end;

    local progress = p36.progress;
    local v38 = p35.capturePointAudioMaidMap[p36.worldPosition];

    if v38 == nil then
        v38 = u2.new();
    else
        v38:DoCleaning();
    end;

    p35.capturePointAudioMaidMap[p36.worldPosition] = v38;
    local v39 = progress >= 10 and progress < 30 and 0 or (progress >= 30 and progress < 60 and 1 or (progress >= 60 and progress < 90 and 2 or (progress >= 90 and progress <= 100 and 3 or 0)));
    local v40 = progress >= 10 and progress < 30 and 0 or (progress >= 30 and progress < 60 and 1 or (progress >= 60 and progress < 90 and 2 or (progress >= 90 and progress <= 100 and 3 or 0)));
    local u41 = SoundManager:playSound(p35.captureProgressIncreaseLoops[v40 + 1], {
        rollOffMaxDistance = 120,
        volumeMultiplier = 0.5,
        position = p36.worldPosition
    });

    if p37 then
        SoundManager:playSound(p35.captureProgressDecreaseSounds[v39 + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p36.worldPosition
        });
        u41 = SoundManager:playSound(p35.captureProgressDecreaseLoops[v40 + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p36.worldPosition
        });
    else
        SoundManager:playSound(p35.captureProgressIncreaseSounds[math.floor(progress / 10) + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p36.worldPosition
        });
    end;

    v38:GiveTask(function() -- Line: 282
        -- upvalues: u41 (ref)
        local v42 = u41;

        if v42 ~= nil then
            v42:Stop();
        end;
    end);
end;

function u6.getPoints(p43) -- Line: 289
    local u44 = {};

    local function _(p45, p46) -- Line: 292
        -- upvalues: u44 (copy)
        table.insert(u44, p45.id);
    end;

    for _, v in p43.pointMap do
        table.insert(u44, v.id);
    end;

    return u44;
end;

function u6.isFriendlyTeam(p47, p48) -- Line: 301
    -- upvalues: TeamController (copy), Players (copy)
    local v49 = TeamController:getPlayerTeam(Players.LocalPlayer);

    if v49 ~= nil then
        v49 = v49.id;
    end;

    return p48 == v49;
end;

function u6.createPing(p50, p51, p52) -- Line: 309
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):notificationPing(p52, p51);
end;

function u6.changeColor(p53, p54, p55) -- Line: 313
    local u56;

    if p53:isFriendlyTeam(p54) then
        u56 = Color3.fromRGB(0, 255, 0);
    else
        u56 = Color3.fromRGB(255, 0, 0);
    end;

    local function _(p57) -- Line: 316
        -- upvalues: u56 (copy)
        if p57:IsA("Beam") or p57:IsA("ParticleEmitter") then
            p57.Color = ColorSequence.new(u56, u56);
        end;

        if p57:IsA("ImageLabel") then
            p57.ImageColor3 = u56;
        end;
    end;

    for i, descendant in p55:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Beam") or descendant:IsA("ParticleEmitter") then
            descendant.Color = ColorSequence.new(u56, u56);
        end;

        if descendant:IsA("ImageLabel") then
            descendant.ImageColor3 = u56;
        end;
    end;
end;

function u6.handleCapturedEffect(p58, p59, u60) -- Line: 328
    local function _(p61) -- Line: 330
        -- upvalues: u60 (copy)
        if p61:IsA("ParticleEmitter") then
            p61.Enabled = u60;
        end;
    end;

    for i, descendant in p59:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = u60;
        end;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;