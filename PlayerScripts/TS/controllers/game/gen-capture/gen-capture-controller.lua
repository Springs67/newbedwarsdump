-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CapturePointBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "capture-point-balance").CapturePointBalance;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "GenCaptureController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: KnitController (copy), CapturePointBalance (copy), GameSound (copy)
    KnitController.constructor(p5);
    p5.Name = "GenCaptureController";
    p5.capturePoints = {};
    p5.capturePointRange = Vector3.new(CapturePointBalance.CAPTURE_POINT_RANGE, 0, CapturePointBalance.CAPTURE_POINT_RANGE);
    p5.capturePointsDisabled = true;
    p5.neutralColor = Color3.fromRGB(166, 163, 163);
    p5.diamondGenBlockOffset = Vector3.new(0, -9, 0);
    p5.capturePointAudioMaidMap = {};
    p5.globalDiamondGenBlocks = {};
    p5.captureProgressIncreaseSounds = {
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4
    };
    p5.captureProgressIncreaseLoops = {
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_1_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_2_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_3_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_INCREASE_STAGE_4_LOOP
    };
    p5.captureProgressDecreaseSounds = {
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4
    };
    p5.captureProgressDecreaseLoops = {
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_1_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_2_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_3_LOOP,
        GameSound.CAPTURE_POINT_PROGRESS_DECREASE_STAGE_4_LOOP
    };
end;

function u3.KnitStart(u6) -- Line: 50
    -- upvalues: KnitController (copy), default (copy), BlockEngine (copy), ItemType (copy), u1 (copy), KnitClient (copy), FireworkType (copy), SoundManager (copy), GameSound (copy), GamePlayerUtil (copy), Players (copy), TeamController (copy), CapturePointBalance (copy), TweenService (copy)
    KnitController.KnitStart(u6);
    default.Client:OnEvent("CapturePointProgressUpdate", function(p7) -- Line: 52
        -- upvalues: u6 (copy)
        local capturePoint = p7.capturePoint;
        local v8 = u6.capturePoints[capturePoint.worldPosition];

        if v8 ~= nil then
            local v9;

            if v8 == nil then
                v9 = v8;
            else
                v9 = v8.progress;
            end;

            if v9 < capturePoint.progress then
                u6:handleProgressAudio(capturePoint, false);
            else
                local v10;

                if v8 == nil then
                    v10 = v8;
                else
                    v10 = v8.progress;
                end;

                if capturePoint.progress < v10 then
                    u6:handleProgressAudio(capturePoint, true);
                end;
            end;

            v8.progress = capturePoint.progress;
        end;

        u6:updateCapturePointIndicatorPosition(capturePoint);
    end);
    default.Client:OnEvent("InitializeCapturePoint", function(p11) -- Line: 79
        -- upvalues: u6 (copy), BlockEngine (ref), ItemType (ref)
        u6.capturePointsDisabled = false;
        local capturePoint = p11.capturePoint;
        local worldPosition = capturePoint.worldPosition;
        local v12 = BlockEngine:getBlockPosition(worldPosition + u6.diamondGenBlockOffset);
        local v13 = BlockEngine:getStore():getBlockAt(v12);

        if v13 ~= nil and v13.Name == ItemType.DIAMOND_BLOCK then
            if u6.globalDiamondGenBlocks[v12] ~= nil then
                return nil;
            end;

            u6.globalDiamondGenBlocks[v12] = v13;
        end;

        if u6.capturePoints[worldPosition] ~= nil then
            return nil;
        end;

        u6:setupCapturePoint(capturePoint);
        u6.capturePoints[worldPosition] = capturePoint;
    end);
    default.Client:OnEvent("RemoveCapturePoints", function() -- Line: 100
        -- upvalues: u6 (copy), u1 (ref)
        u6.capturePointsDisabled = true;
        local capturePoints = u6.capturePoints;

        local function v16(p14) -- Line: 103
            -- upvalues: u6 (ref), u1 (ref)
            local capturePointLock = p14.capturePointLock;

            if capturePointLock ~= nil then
                capturePointLock:Destroy();
            end;

            local capturePointProgressIndicator = p14.capturePointProgressIndicator;

            if capturePointProgressIndicator ~= nil then
                capturePointProgressIndicator:Destroy();
            end;

            u6.capturePoints[p14.worldPosition] = nil;
            local v15 = u6.capturePointAudioMaidMap[p14.worldPosition];

            if v15 == nil then
                u1.new();

                return;
            end;

            v15:DoCleaning();
        end;

        for i, v in capturePoints do
            v16(v, i, capturePoints);
        end;
    end);
    default.Client:OnEvent("CapturePointCaptured", function(p17) -- Line: 129
        -- upvalues: KnitClient (ref), FireworkType (ref), SoundManager (ref), GameSound (ref), u6 (copy), GamePlayerUtil (ref), Players (ref), TeamController (ref), CapturePointBalance (ref), TweenService (ref)
        if p17.capturePoint.capturedByTeam ~= nil then
            KnitClient.Controllers.FireworkController:playFireworkEffect(p17.capturePoint.worldPosition + Vector3.new(0, -7, 0), FireworkType.NEW_YEARS, {
                sizeMultiplier = 0.4,
                volumeMultiplier = 0
            });
            SoundManager:playSound(GameSound.CAPTURE_POINT_GOAL_REACHED, {
                volumeMultiplier = 0.3,
                rollOffMaxDistance = 240,
                position = p17.capturePoint.worldPosition
            });
        end;

        local u18 = u6.capturePoints[p17.capturePoint.worldPosition];

        if u18 ~= nil then
            u18 = u18.capturePointProgressIndicator;
        end;

        local u19 = u6.capturePoints[p17.capturePoint.worldPosition];

        if u19 ~= nil then
            u19 = u19.capturePointLock;
        end;

        if u18 == nil then
            return nil;
        end;

        if u19 == nil then
            return nil;
        end;

        local v20 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
        local capturedByTeam = p17.capturePoint.capturedByTeam;

        if capturedByTeam == nil then
            return nil;
        end;

        local v21 = TeamController:getTeamById(capturedByTeam);

        if v21 ~= nil then
            v21 = v21.color;
        end;

        if v21 == nil then
            return nil;
        end;

        if capturedByTeam == nil then
            v21 = u6.neutralColor;
        end;

        u18.Color = v21;

        if v20 ~= capturedByTeam then
            u19.Transparency = 0;
            u18.Transparency = 0.5;
            task.delay(CapturePointBalance.CAPTURE_POINT_COOLDOWN_DURATION - 1.5, function() -- Line: 184
                -- upvalues: TweenService (ref), u18 (copy), u19 (copy)
                local v22 = TweenService:Create(u18, TweenInfo.new(1.5), {
                    Transparency = 0
                });
                local v23 = TweenService:Create(u19, TweenInfo.new(1.5), {
                    Transparency = 1
                });
                v22:Play();
                v23:Play();
            end);
        end;
    end);
end;

function u3.setupCapturePoint(p24, p25) -- Line: 198
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), BlockEngine (copy)
    local worldPosition = p25.worldPosition;
    local capturePointProgressStart = p25.capturePointProgressStart;
    local v26 = ReplicatedStorage.Assets.Effects.CapturePointProgressIndicator:Clone();
    v26.Anchored = true;
    v26.CanCollide = false;
    v26.CanQuery = false;
    v26.CanTouch = false;
    v26.Position = capturePointProgressStart;
    v26.Parent = Workspace;
    v26.Color = p24.neutralColor;
    local CapturePointLock = v26:FindFirstChild("CapturePointLock");
    p25.capturePointProgressIndicator = v26;

    if CapturePointLock ~= nil then
        CapturePointLock.Transparency = 1;
        p25.capturePointLock = CapturePointLock;
    end;

    local v27 = BlockEngine:getBlockPosition(worldPosition + p24.diamondGenBlockOffset);
    local v28 = p24.globalDiamondGenBlocks[v27];

    if v28 ~= nil then
        if not p24.capturePointsDisabled then
            v28.Transparency = 1;

            return;
        end;

        v28.Transparency = 0;
    end;
end;

function u3.updateCapturePointIndicatorPosition(u29, u30) -- Line: 228
    -- upvalues: GamePlayerUtil (copy), Players (copy), CapturePointBalance (copy), u1 (copy), RunService (copy)
    local progress = u30.progress;
    local capturePointProgressStart = u30.capturePointProgressStart;

    if capturePointProgressStart == nil then
        return nil;
    end;

    local u31 = u29.capturePoints[u30.worldPosition];

    if u31 ~= nil then
        u31 = u31.capturePointProgressIndicator;
    end;

    if u31 == nil then
        return nil;
    end;

    if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId() == u30.capturedByTeam then
        progress = CapturePointBalance.CAPTURE_POINT_GOAL - progress;
    end;

    local v32 = capturePointProgressStart - Vector3.new(0, progress, 0);
    local u33 = u1.new();
    local u34 = 0;
    local u35 = 1;
    local u36 = CFrame.new(u31.Position);
    local u37 = CFrame.new(v32);
    u33:GiveTask(RunService.Heartbeat:Connect(function(p38) -- Line: 255
        -- upvalues: u31 (copy), u33 (copy), u34 (ref), progress (ref), CapturePointBalance (ref), u35 (ref), u36 (copy), u37 (copy), u29 (copy), u30 (copy)
        if u31.Parent == nil then
            u33:DoCleaning();

            return nil;
        end;

        u34 = u34 + p38;

        if progress == CapturePointBalance.CAPTURE_POINT_GOAL - 1 then
            u35 = 0.45;
        elseif progress == CapturePointBalance.CAPTURE_POINT_GOAL then
            u35 = 0.1;
        else
            u35 = 1;
        end;

        local v39 = u34 / u35;

        if v39 >= 1 then
            u33:DoCleaning();

            return nil;
        end;

        local v40 = u36:Lerp(u37, v39);
        local _ = v40 * CFrame.Angles(0, 0, 0);
        u31:PivotTo(v40);
        u29:updateCapturePointColors(u30);
    end));
end;

function u3.updateCapturePointColors(p41, p42) -- Line: 283
    -- upvalues: GamePlayerUtil (copy), Players (copy), TeamController (copy), CapturePointBalance (copy)
    GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
    local v43 = p41.capturePoints[p42.worldPosition];

    if v43 ~= nil then
        v43 = v43.capturePointProgressIndicator;
    end;

    if v43 == nil then
        return nil;
    end;

    local capturedByTeam = p42.capturedByTeam;

    if capturedByTeam == nil then
        return nil;
    end;

    local v44 = TeamController:getTeamById(capturedByTeam);

    if v44 ~= nil then
        v44 = v44.color;
    end;

    if v44 == nil then
        return nil;
    end;

    if capturedByTeam == nil then
        v44 = p41.neutralColor;
    end;

    local v45 = p42.progress / CapturePointBalance.CAPTURE_POINT_GOAL;
    v43.Color = Color3.new(p41:colorLerp(v44.R, p41.neutralColor.R, v45), p41:colorLerp(v44.G, p41.neutralColor.G, v45), p41:colorLerp(v44.B, p41.neutralColor.B, v45));
end;

function u3.colorLerp(p46, p47, p48, p49) -- Line: 312
    return p47 * (1 - p49) + p48 * p49;
end;

function u3.handleProgressAudio(p50, p51, p52) -- Line: 315
    -- upvalues: u1 (copy), CapturePointBalance (copy), SoundManager (copy)
    local progress = p51.progress;
    local v53 = p50.capturePointAudioMaidMap[p51.worldPosition];

    if v53 == nil then
        v53 = u1.new();
    else
        v53:DoCleaning();
    end;

    p50.capturePointAudioMaidMap[p51.worldPosition] = v53;
    local v54 = progress >= 1 and progress < 3 and 0 or (progress >= 3 and progress < 6 and 1 or (progress >= 6 and progress < 9 and 2 or (progress >= 9 and progress <= CapturePointBalance.CAPTURE_POINT_GOAL and 3 or 0)));
    local v55 = progress >= 1 and progress < 3 and 0 or (progress >= 3 and progress < 6 and 1 or (progress >= 6 and progress < 9 and 2 or (progress >= 9 and progress <= CapturePointBalance.CAPTURE_POINT_GOAL and 3 or 0)));
    local u56 = SoundManager:playSound(p50.captureProgressIncreaseLoops[v55 + 1], {
        rollOffMaxDistance = 120,
        volumeMultiplier = 0.5,
        position = p51.worldPosition
    });

    if p52 then
        SoundManager:playSound(p50.captureProgressDecreaseSounds[v54 + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p51.worldPosition
        });
        u56 = SoundManager:playSound(p50.captureProgressDecreaseLoops[v55 + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p51.worldPosition
        });
    else
        SoundManager:playSound(p50.captureProgressIncreaseSounds[v54 + 1], {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.5,
            position = p51.worldPosition
        });
    end;

    v53:GiveTask(function() -- Line: 356
        -- upvalues: u56 (ref)
        local v57 = u56;

        if v57 ~= nil then
            v57:Stop();
        end;
    end);
end;

function u3.updateCapturePointBaseBlocks(p58, p59) -- Line: 363
    -- upvalues: BlockEngine (copy)
    local v60 = p59 + p58.capturePointRange * 0.5;
    p58:getBlocksInRegion3((Region3.new(BlockEngine:getBlockPosition(p59 - p58.capturePointRange * 0.5), BlockEngine:getBlockPosition(v60))));
    local v61 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(p59 + Vector3.new(2, -8, 2)));

    if v61 == nil then
        return nil;
    end;

    v61.Color = Color3.fromRGB(0, 0, 0);
end;

function u3.getBlocksInRegion3(p62, p63) -- Line: 382
    -- upvalues: BlockEngine (copy)
    return BlockEngine:getStore():getBlocksInRegion3(p63);
end;

KnitClient.CreateController(u3.new());

return nil;