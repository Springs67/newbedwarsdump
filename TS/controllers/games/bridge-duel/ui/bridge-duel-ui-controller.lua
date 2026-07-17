-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BridgeDuelRoundCountdownGui = RuntimeLib.import(script, script.Parent, "bridge-duel-countdown-ui").BridgeDuelRoundCountdownGui;
local BridgeDuelScoresGui = RuntimeLib.import(script, script.Parent, "bridge-duel-scores-ui").BridgeDuelScoresGui;
local BridgeDuelTouchdownBillboardUI = RuntimeLib.import(script, script.Parent, "bridge-duel-touchdown-billboard-ui").BridgeDuelTouchdownBillboardUI;
local BridgeDuelTouchdownPopupGui = RuntimeLib.import(script, script.Parent, "bridge-duel-touchdown-popup-ui").BridgeDuelTouchdownPopupGui;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "BridgeDuelUiController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 38
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "BridgeDuelUiController";
end;

function u5.KnitStart(u8) -- Line: 46
    -- upvalues: KnitController (copy), default (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TeamController (copy), u3 (copy), BridgeDuelTouchdownBillboardUI (copy), Players (copy), ClientSyncEvents (copy), KnitClient2 (copy), MatchState (copy), QueueType (copy)
    KnitController.KnitStart(u8);
    default.Client:Get("BridgeDuelStartNewRoundCountdown"):Connect(function(p9) -- Line: 49
        -- upvalues: Workspace (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        local v10 = p9.endTime - Workspace:GetServerTimeNow();
        local v11 = os.time() + v10;

        if v11 < os.time() then
            return nil;
        end;

        local roundNumber = p9.roundNumber;

        if roundNumber == 1 then
            u8:showCountdownUI(v11, "MATCH WILL START IN");
        elseif roundNumber == 9 then
            u8:showCountdownUI(v11, "FINAL ROUND");
        elseif p9.matchPoint then
            u8:showCountdownUI(v11, "MATCH POINT");
        else
            u8:showCountdownUI(v11);
        end;

        while os.time() < v11 do
            task.wait(0.1);
        end;

        u8:hideCountdownUI();
        SoundManager:playSound(GameSound.BRIDGE_DUEL_WHISTLE);
    end);
    default.Client:Get("BridgeDuelOnTouchdownSpawn"):Connect(function(p12) -- Line: 84
        -- upvalues: TeamController (ref), u3 (ref), BridgeDuelTouchdownBillboardUI (ref), Players (ref)
        local v13 = p12.touchdownZone:GetAttribute("TouchdownZoneTeamID");

        if v13 == "" or not v13 then
            return nil;
        end;

        local v14 = TeamController:getTeamById(v13);

        if not v14 then
            return nil;
        end;

        u3.mount(u3.createElement("BillboardGui", {
            StudsOffsetWorldSpace = Vector3.new(0, 24, 0),
            ResetOnSpawn = false,
            MaxDistance = 200,
            Adornee = p12.touchdownZone,
            Size = UDim2.fromScale(7, 3.5)
        }, { u3.createElement(BridgeDuelTouchdownBillboardUI, {
                team = v14
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "BridgeDuelTouchdownBillboard");
    end);
    default.Client:Get("BridgeDuelTouchdownEffects"):Connect(function(p15) -- Line: 106
        -- upvalues: u8 (copy)
        u8:showTouchdownPopup(p15.player, p15.color, p15.scores);
        task.delay(5, function() -- Line: 108
            -- upvalues: u8 (ref)
            u8:hideTouchdownPopup();
        end);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p16) -- Line: 113
        -- upvalues: KnitClient2 (ref), MatchState (ref), QueueType (ref), u8 (copy)
        local v17 = KnitClient2.Controllers.MatchController:getQueueType();

        if p16.matchState == MatchState.RUNNING and v17 == QueueType.BRIDGE_DUEL then
            u8:showScoreHud();

            return;
        end;

        u8:hideTouchdownPopup();
        u8:hideScoreHud();
    end);
end;

function u5.showScoreHud(p18) -- Line: 123
    -- upvalues: DeviceUtil (copy), Flamework (copy), BridgeDuelScoresGui (copy)
    if DeviceUtil.isMobileControls() then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "BridgeDuelScoresGui",
            app = BridgeDuelScoresGui
        }, {});
    end;
end;

function u5.hideScoreHud(p19) -- Line: 132
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelScoresGui") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelScoresGui");
    end;
end;

function u5.showCountdownUI(p20, p21, p22) -- Line: 137
    -- upvalues: Flamework (copy), BridgeDuelRoundCountdownGui (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "BridgeDuelRoundCountdownGui",
        app = BridgeDuelRoundCountdownGui
    }, {
        DisableSounds = false,
        EndTime = p21,
        FrameProps = {},
        AnnouncementText = p22
    });
end;

function u5.hideCountdownUI(p23) -- Line: 148
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelRoundCountdownGui") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelRoundCountdownGui");
    end;
end;

function u5.showTouchdownPopup(p24, p25, p26, u27) -- Line: 153
    -- upvalues: KnitClient (copy), Flamework (copy), BridgeDuelTouchdownPopupGui (copy), Players (copy), TweenService (copy), TeamColorHex (copy), ColorUtil (copy)
    local v28 = KnitClient.Controllers.TeamController:getPlayerTeam(p25);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "BridgeDuelTouchdownPopupGui",
        app = BridgeDuelTouchdownPopupGui
    }, {
        scoringPlayer = p25,
        teamColor = p26,
        scores = u27,
        scoringTeam = v28
    });
    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui");
    local u29;

    if PlayerGui == nil then
        u29 = PlayerGui;
    else
        u29 = PlayerGui:FindFirstChild("BridgeDuelTouchdownPopupGui");

        if u29 ~= nil then
            u29 = u29:FindFirstChild("BridgeDuelTouchdownPopup");

            if u29 ~= nil then
                u29 = u29:FindFirstChild("TouchdownPlayerText");
            end;
        end;
    end;

    local u30;

    if PlayerGui == nil then
        u30 = PlayerGui;
    else
        u30 = PlayerGui:FindFirstChild("BridgeDuelTouchdownPopupGui");

        if u30 ~= nil then
            u30 = u30:FindFirstChild("BridgeDuelTouchdownScoresPopup");

            if u30 ~= nil then
                u30 = u30:FindFirstChild("TouchdownScoresTextOne");
            end;
        end;
    end;

    local v31;

    if PlayerGui == nil then
        v31 = PlayerGui;
    else
        v31 = PlayerGui:FindFirstChild("BridgeDuelTouchdownPopupGui");

        if v31 ~= nil then
            v31 = v31:FindFirstChild("BridgeDuelTouchdownScoresPopup");

            if v31 ~= nil then
                v31 = v31:FindFirstChild("TouchdownScoresTextDash");
            end;
        end;
    end;

    if PlayerGui ~= nil then
        PlayerGui = PlayerGui:FindFirstChild("BridgeDuelTouchdownPopupGui");

        if PlayerGui ~= nil then
            PlayerGui = PlayerGui:FindFirstChild("BridgeDuelTouchdownScoresPopup");

            if PlayerGui ~= nil then
                PlayerGui = PlayerGui:FindFirstChild("TouchdownScoresTextTwo");
            end;
        end;
    end;

    local u32 = { u30, v31, PlayerGui };
    TweenService:Create(u29, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        TextStrokeTransparency = 0,
        TextTransparency = 0
    }):Play();

    local function v34(p33) -- Line: 215
        -- upvalues: TweenService (ref)
        TweenService:Create(p33, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextStrokeTransparency = 0,
            TextTransparency = 0
        }):Play();
    end;

    for i, v in u32 do
        v34(v, i - 1, u32);
    end;

    local lightBlue = TeamColorHex.lightBlue;
    local orange = TeamColorHex.orange;

    if v28.id == "1" then
        task.delay(1.5, function() -- Line: 228
            -- upvalues: TweenService (ref), u30 (copy), ColorUtil (ref), lightBlue (copy), u27 (copy)
            local v35 = TweenService:Create(u30, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextStrokeTransparency = 1,
                TextTransparency = 1
            });
            v35.Completed:Connect(function() -- Line: 233
                -- upvalues: u30 (ref), ColorUtil (ref), lightBlue (ref), u27 (ref)
                u30.Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(lightBlue)) .. "\">" .. tostring(u27[1]) .. "</font>";
            end);
            v35:Play();
        end);
        task.delay(2, function() -- Line: 238
            -- upvalues: TweenService (ref), u30 (copy)
            TweenService:Create(u30, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextStrokeTransparency = 0,
                TextTransparency = 0
            }):Play();
        end);
    else
        task.delay(1.5, function() -- Line: 246
            -- upvalues: TweenService (ref), PlayerGui (copy), ColorUtil (ref), orange (copy), u27 (copy)
            local v36 = TweenService:Create(PlayerGui, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextStrokeTransparency = 1,
                TextTransparency = 1
            });
            v36.Completed:Connect(function() -- Line: 251
                -- upvalues: PlayerGui (ref), ColorUtil (ref), orange (ref), u27 (ref)
                PlayerGui.Text = "<font color=\"" .. ColorUtil.richTextColor(ColorUtil.hexColor(orange)) .. "\">" .. tostring(u27[2]) .. "</font>";
            end);
            v36:Play();
        end);
        task.delay(2, function() -- Line: 256
            -- upvalues: TweenService (ref), PlayerGui (copy)
            TweenService:Create(PlayerGui, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextStrokeTransparency = 0,
                TextTransparency = 0
            }):Play();
        end);
    end;

    task.delay(4, function() -- Line: 264
        -- upvalues: TweenService (ref), u29 (copy), u32 (copy)
        local v37 = TweenService:Create(u29, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextStrokeTransparency = 1,
            TextTransparency = 1
        });

        local function v39(p38) -- Line: 269
            -- upvalues: TweenService (ref)
            TweenService:Create(p38, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextStrokeTransparency = 1,
                TextTransparency = 1
            }):Play();
        end;

        for i, v in u32 do
            v39(v, i - 1, u32);
        end;

        v37:Play();
    end);
end;

function u5.hideTouchdownPopup(p40) -- Line: 282
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("BridgeDuelTouchdownPopupGui") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("BridgeDuelTouchdownPopupGui");
    end;
end;

KnitClient.CreateController(u5.new());

return nil;