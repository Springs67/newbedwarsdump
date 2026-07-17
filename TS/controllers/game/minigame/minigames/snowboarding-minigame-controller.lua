-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MinigameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SnowboardingMinigameCountdownGUI = RuntimeLib.import(script, script.Parent, "snowboarding-minigame-countdown-gui").SnowboardingMinigameCountdownGUI;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "SnowboardingMinigameController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "SnowboardingMinigameController";
    p6.avalancheMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 46
    -- upvalues: KnitController (copy), default2 (copy), MinigameType (copy), Workspace (copy), Players (copy), default (copy), InOutQuad (copy), SoundManager (copy), GameSound (copy), CollectionService (copy), ReplicatedStorage (copy)
    KnitController.KnitStart(u7);
    default2.Client:WaitFor("MinigameStarted"):expect():Connect(function(p8) -- Line: 49
        -- upvalues: MinigameType (ref), u7 (copy)
        if p8.minigame.type == MinigameType.SNOWBOARDING then
            u7:onMinigameStart();
        end;
    end);
    default2.Client:WaitFor("MinigameEnded"):expect():Connect(function(p9) -- Line: 55
        -- upvalues: MinigameType (ref), u7 (copy)
        if p9.minigame.type == MinigameType.SNOWBOARDING then
            u7:onMinigameEnded();
        end;
    end);
    default2.Client:WaitFor("SnowboardingMinigameCountdown"):expect():Connect(function(u10) -- Line: 60
        -- upvalues: Workspace (ref), Players (ref), default (ref), InOutQuad (ref), u7 (copy), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 61
            -- upvalues: Workspace (ref), Players (ref), default (ref), InOutQuad (ref), u10 (copy), u7 (ref), SoundManager (ref), GameSound (ref)
            local CameraType = Workspace.CurrentCamera.CameraType;
            Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
            task.delay(5, function() -- Line: 65
                -- upvalues: Workspace (ref), CameraType (copy)
                Workspace.CurrentCamera.CameraType = CameraType;
            end);
            local LocalPlayer = Players.LocalPlayer;

            if LocalPlayer ~= nil then
                LocalPlayer = LocalPlayer.Character;
            end;

            if LocalPlayer ~= nil then
                LocalPlayer = LocalPlayer:GetPivot().Position + Vector3.new(0, 1, -12);
            end;

            if LocalPlayer == nil then
                LocalPlayer = Workspace.CurrentCamera:GetPivot().Position;
            end;

            local u11 = CFrame.new(Vector3.new(0, 5020, 100)) * CFrame.Angles(0, 0, 0);
            Workspace.CurrentCamera:PivotTo(u11);
            local u12 = CFrame.new(LocalPlayer) * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0);
            task.delay(2, function() -- Line: 95
                -- upvalues: default (ref), InOutQuad (ref), Workspace (ref), u11 (copy), u12 (copy)
                default(3, InOutQuad, function(p13) -- Line: 96
                    -- upvalues: Workspace (ref), u11 (ref), u12 (ref)
                    Workspace.CurrentCamera:PivotTo(u11:Lerp(u12, p13));
                end, 0, 1);
            end);
            local v14 = u10.endTime - Workspace:GetServerTimeNow();
            local v15 = os.time() + v14;

            if v15 < os.time() then
                return nil;
            end;

            u7:showCountdownUI(v15);

            while os.time() < v15 do
                task.wait(0.1);
            end;

            u7:hideCountdownUI();
            SoundManager:playSound(GameSound.BRIDGE_DUEL_WHISTLE);
        end);
    end);
    CollectionService:GetInstanceAddedSignal("SnowboardingAvalanche"):Connect(function(p16) -- Line: 117
        -- upvalues: u7 (copy)
        u7.avalanche = p16;
    end);
    default2.Client:Get("SnowboardingMinigamePlayerFinishedRace"):Connect(function(p17) -- Line: 121
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref)
        local _ = p17.player == Players.LocalPlayer;
        SoundManager:playSound(GameSound.CONFETTI);
        local u18 = ReplicatedStorage.Assets.Effects.ConfettiBedBreakParticle:Clone();
        local Character = p17.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character then
            u18:PivotTo(CFrame.new(Character.Position + Vector3.new(0, 3, 0)));
            u18.Parent = Workspace;
            u18.ConfettiParticle:Emit(80);
            task.delay(5, function() -- Line: 142
                -- upvalues: u18 (copy)
                u18:Destroy();
            end);
        end;
    end);
end;

function u4.onMinigameStart(u19) -- Line: 148
    -- upvalues: KnitClient (copy), Players (copy), SoundManager (copy), GameSound (copy), RunService (copy), MathExtras (copy)
    KnitClient.Controllers.WinterEventController:setStaticWinterEffectStrength(0.35);
    task.delay(6, function() -- Line: 151
        -- upvalues: Players (ref), u19 (copy), SoundManager (ref), GameSound (ref), RunService (ref), MathExtras (ref)
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;
        end;

        if LocalPlayer and u19.avalanche then
            local u20 = SoundManager:playModifiableSound(GameSound.SNOWBOARD_AVALANCHE_LOOP, {
                looped = true
            });
            u19.avalancheMaid:GiveTask(function() -- Line: 162
                -- upvalues: u20 (copy)
                u20:Stop();
                u20:Destroy();
            end);
            local u21 = (1 / 0);
            local Pivot = u19.avalanche:FindFirstChild("Pivot");

            if Pivot ~= nil then
                Pivot = Pivot:FindFirstChild("DistancePart1");
            end;

            local Pivot2 = u19.avalanche:FindFirstChild("Pivot");

            if Pivot2 ~= nil then
                Pivot2 = Pivot2:FindFirstChild("DistancePart2");
            end;

            local Pivot3 = u19.avalanche:FindFirstChild("Pivot");

            if Pivot3 ~= nil then
                Pivot3 = Pivot3:FindFirstChild("DistancePart3");
            end;

            local Pivot4 = u19.avalanche:FindFirstChild("Pivot");

            if Pivot4 ~= nil then
                Pivot4 = Pivot4:FindFirstChild("DistancePart4");
            end;

            local Pivot5 = u19.avalanche:FindFirstChild("Pivot");

            if Pivot5 ~= nil then
                Pivot5 = Pivot5:FindFirstChild("DistancePart5");
            end;

            local u22 = {
                Pivot,
                Pivot2,
                Pivot3,
                Pivot4,
                Pivot5
            };

            if LocalPlayer then
                local u23 = nil;
                u23 = RunService.Heartbeat:Connect(function() -- Line: 190
                    -- upvalues: u19 (ref), LocalPlayer (copy), u23 (ref), u21 (ref), u22 (copy), MathExtras (ref), u20 (copy)
                    if not (u19.avalanche and LocalPlayer) then
                        u23:Disconnect();

                        return nil;
                    end;

                    u21 = (1 / 0);

                    for _, v in u22 do
                        local Magnitude = (LocalPlayer:GetPivot().Position - v.Position).Magnitude;

                        if Magnitude < u21 then
                            u21 = Magnitude;
                        end;
                    end;

                    local v24 = MathExtras:rangeMap(u21, { 500, 20 }, { 0, 1 });
                    u20.Volume = MathExtras:rangeMap(math.clamp(v24, 0, 1), { 0, 1 }, { 0.3, 1 });
                end);
                u19.avalancheMaid:GiveTask(function() -- Line: 209
                    -- upvalues: u23 (ref)
                    u23:Disconnect();
                end);
            end;
        end;
    end);
end;

function u4.onMinigameEnded(p25) -- Line: 216
    -- upvalues: KnitClient (copy)
    p25.avalancheMaid:DoCleaning();
    KnitClient.Controllers.WinterEventController:disableStaticWinterEffectStrength();
end;

function u4.showCountdownUI(p26, p27, p28) -- Line: 220
    -- upvalues: Flamework (copy), SnowboardingMinigameCountdownGUI (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "SnowboardingMinigameCountdownGui",
        app = SnowboardingMinigameCountdownGUI
    }, {
        DisableSounds = false,
        EndTime = p27,
        FrameProps = {},
        AnnouncementText = p28
    });
end;

function u4.hideCountdownUI(p29) -- Line: 231
    -- upvalues: Flamework (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("SnowboardingMinigameCountdownGui") then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("SnowboardingMinigameCountdownGui");
    end;
end;

KnitClient.CreateController(u4.new());

return nil;