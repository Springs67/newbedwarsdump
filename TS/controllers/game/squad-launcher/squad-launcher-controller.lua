-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local StarterPlayer = v6.StarterPlayer;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local AbilityIndicatorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil;
local SquadLauncherUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "squad-launcher", "squad-launcher-util").SquadLauncherUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SquadLauncherUI = RuntimeLib.import(script, script.Parent, "squad-launcher-ui").SquadLauncherUI;
local u7 = Color3.fromRGB(4, 175, 236);
local u8 = Color3.fromRGB(219, 97, 99);
local u9 = { GameSound.SQUAD_LAUNCH_1, GameSound.SQUAD_LAUNCH_2, GameSound.SQUAD_LAUNCH_3 };
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "SquadLauncherController";
    end,

    __index = KnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 52
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 56
    -- upvalues: KnitController (copy), Workspace (copy), u3 (copy), ExpireList (copy), SquadLauncherUtil (copy)
    KnitController.constructor(p12);
    p12.Name = "SquadLauncherController";
    p12.camera = Workspace.CurrentCamera;
    p12.targetMarked = false;
    p12.aimCameraMaid = u3.new();
    p12.preLaunchMaid = u3.new();
    p12.fakeCharacterMap = {};
    p12.fakeCharacterMaidMap = {};
    p12.fakeCharacterInvisibilityMaidMap = {};
    p12.isLaunchingMap = {};
    p12.launchInitiatedMap = {};
    p12.launchInitiatedTimeMap = {};
    p12.launcherPlayersMap = {};
    p12.launcherPromptMap = {};
    p12.launcherOpenHeadHoleMap = {};
    p12.headHoleMaidMap = {};
    p12.launcherCooldownList = ExpireList.new(SquadLauncherUtil.LAUNCHER_COOLDOWN_TIME);
end;

function u10.KnitStart(u13) -- Line: 75
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient2 (copy), SquadLauncherUtil (copy), DeviceUtil (copy), default (copy), ClientSyncEvents (copy), RuntimeLib (copy), PlayerEntity (copy), Players (copy), Workspace (copy)
    KnitController.KnitStart(u13);
    WatchCollectionTag("squad-launcher", function(u14) -- Line: 77
        -- upvalues: KnitClient2 (ref), SquadLauncherUtil (ref), DeviceUtil (ref), u13 (copy), default (ref)
        local u15 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Initialize Launch Sequence",
            ObjectText = "Squad Launcher",
            RequiresLineOfSight = false,
            Parent = u14,
            MaxActivationDistance = SquadLauncherUtil.PROXIMITY_PROMPT_DISTANCE,
            HoldDuration = SquadLauncherUtil.PROXIMITY_PROMPT_HOLD_DURATION,
            ClickablePrompt = DeviceUtil.isMobileControls()
        });
        u13.launcherPromptMap[u14] = u15;
        local u16 = nil;
        u15.PromptButtonHoldBegan:Connect(function(p17) -- Line: 91
            -- upvalues: default (ref), u14 (copy), u15 (copy), u16 (ref)
            if not default.Client:Get("RequestSquadLauncherProximityHold"):CallServer({
                player = p17,
                squadLauncher = u14
            }) then
                u15:InputHoldEnd();
            end;

            u16 = default.Client:Get("RejectSquadLauncherProximityHold"):Connect(function() -- Line: 99
                -- upvalues: u15 (ref)
                u15:InputHoldEnd();
            end);
        end);
        u15.Triggered:Connect(function(u18) -- Line: 103
            -- upvalues: u13 (ref), u16 (ref), default (ref), u14 (copy)
            if u13.launchInitiatedMap[u18] then
                return nil;
            end;

            u13.launchInitiatedMap[u18] = true;
            u13.preLaunchMaid:GiveTask(function() -- Line: 113
                -- upvalues: u13 (ref), u18 (copy)
                u13.launchInitiatedMap[u18] = false;
            end);
            u16:Disconnect();
            default.Client:Get("RequestEnterSquadLauncher"):CallServer({
                squadLauncher = u14
            });
        end);
    end);
    ClientSyncEvents.SharedStatefulEntityDeath:connect(function(p19) -- Line: 124
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), u13 (copy), Players (ref)
        if not RuntimeLib.instanceof(p19.entity, PlayerEntity) then
            return nil;
        end;

        local v20 = p19.entity:getPlayer();

        if v20 == nil then
            return nil;
        end;

        u13.isLaunchingMap[v20] = false;

        if v20 == Players.LocalPlayer then
            u13.aimCameraMaid:DoCleaning();
            u13.preLaunchMaid:DoCleaning();
        end;
    end);
    default.Client:Get("PlayerLaunched"):Connect(function(u21) -- Line: 138
        -- upvalues: u13 (copy), SquadLauncherUtil (ref), Players (ref)
        u13:launchEffect(u21.player, u21.playerNumber, u21.squadLauncher, u21.target);
        u13.launcherOpenHeadHoleMap[u21.squadLauncher] = 0;
        local v22 = u13.launcherPlayersMap[u21.squadLauncher];

        if v22 ~= nil then
            local function _(p23) -- Line: 147
                -- upvalues: u21 (copy)
                return p23 ~= u21.player;
            end;

            local v24 = 0;
            v22 = {};

            for i, v in v22 do
                local _ = i - 1;

                if v ~= u21.player == true then
                    v24 = v24 + 1;
                    v22[v24] = v;
                end;
            end;
        end;

        if v22 then
            u13.launcherPlayersMap[u21.squadLauncher] = v22;
        end;

        if not u13.launcherCooldownList:has(u21.squadLauncher) then
            u13.launcherCooldownList:add(u21.squadLauncher);
            local u25 = u13.launcherPromptMap[u21.squadLauncher];

            if u25 then
                u25.ActionText = "Launcher on Cooldown!";
                u25.Enabled = true;
                task.delay(SquadLauncherUtil.LAUNCHER_COOLDOWN_TIME, function() -- Line: 177
                    -- upvalues: u25 (copy)
                    u25.ActionText = "Initialize Launch Sequence";
                end);
            end;
        end;

        if u21.player == Players.LocalPlayer then
            u13.preLaunchMaid:DoCleaning();
            u13.isLaunchingMap[u21.player] = false;
        end;
    end);
    default.Client:Get("SquadLauncherEntered"):Connect(function(u26) -- Line: 189
        -- upvalues: u13 (copy), SquadLauncherUtil (ref), Players (ref), Workspace (ref)
        local v27 = u13.launcherPlayersMap[u26.squadLauncher] or {};
        table.insert(v27, u26.player);
        u13.launcherPlayersMap[u26.squadLauncher] = v27;
        local v28 = u13.launcherPromptMap[u26.squadLauncher];

        if v28 then
            v28.ActionText = "Join Launch!" .. " " .. tostring(#v27) .. "/" .. tostring(SquadLauncherUtil.MAX_LAUNCH_SQUAD_SIZE);
        end;

        local v29 = u13.launcherPlayersMap[u26.squadLauncher];
        local v30 = v29 ~= nil and #v29 or v29;

        if (((v30 == 0 or (v30 ~= v30 or not v30)) and 0 or v30) >= SquadLauncherUtil.MAX_LAUNCH_SQUAD_SIZE or u26.player == Players.LocalPlayer) and v28 then
            v28.Enabled = false;
        end;

        if u26.isOperator and not u13.indicator then
            u13.launchInitiatedTimeMap[u26.squadLauncher] = Workspace:GetServerTimeNow();

            if u26.player == Players.LocalPlayer then
                task.delay(0.8, function() -- Line: 233
                    -- upvalues: u13 (ref), u26 (copy)
                    u13:enableLaunchControls(u26.player, u26.squadLauncher);
                end);
            end;
        end;

        if u26.player == Players.LocalPlayer then
            local v31 = u13.launchInitiatedTimeMap[u26.squadLauncher];

            if v31 == 0 or (v31 ~= v31 or not v31) then
                return nil;
            end;

            u13:mountLauncherUI(u26.squadLauncher, v31, v31 + SquadLauncherUtil.LAUNCH_SEQUENCE_TIME_LIMIT);
        end;

        u13:enterLauncherEffect(u26.player, u26.squadLauncher);
    end);
    default.Client:Get("SquadLauncherExited"):Connect(function(u32) -- Line: 249
        -- upvalues: u13 (copy), SquadLauncherUtil (ref), Players (ref)
        u13.isLaunchingMap[u32.player] = false;
        u13:exitLauncherEffect(u32.player, u32.squadLauncher);
        local v33 = u13.headHoleMaidMap[u32.player];

        if v33 ~= nil then
            v33:DoCleaning();
        end;

        local v34 = u13.launcherPromptMap[u32.squadLauncher];

        if v34 then
            v34.Enabled = true;
        end;

        local v35 = u13.launcherPlayersMap[u32.squadLauncher];

        if v35 ~= nil then
            local function _(p36) -- Line: 271
                -- upvalues: u32 (copy)
                return p36 ~= u32.player;
            end;

            local v37 = 0;
            v35 = {};

            for i, v in v35 do
                local _ = i - 1;

                if v ~= u32.player == true then
                    v37 = v37 + 1;
                    v35[v37] = v;
                end;
            end;
        end;

        if v35 then
            u13.launcherPlayersMap[u32.squadLauncher] = v35;

            if v34 then
                if #v35 == 0 then
                    v34.ActionText = "Initialize Launch Sequence";
                else
                    v34.ActionText = "Join Launch!" .. " " .. tostring(#v35) .. "/" .. tostring(SquadLauncherUtil.MAX_LAUNCH_SQUAD_SIZE);
                end;
            end;
        end;

        if u32.newOperator == Players.LocalPlayer then
            u13:enableLaunchControls(u32.newOperator, u32.squadLauncher);
        end;
    end);
end;

function u10.enableLaunchControls(u38, u39, u40) -- Line: 304
    -- upvalues: SquadLauncherUtil (copy), Workspace (copy)
    u38:activateIndicator();
    u38:setupAimCamera(u40:GetPivot().Position, u39);
    task.delay(SquadLauncherUtil.LAUNCH_SEQUENCE_TIME_LIMIT, function() -- Line: 310
        -- upvalues: u38 (copy), u40 (copy), u39 (copy), SquadLauncherUtil (ref), Workspace (ref)
        if not u38.indicator then
            return nil;
        end;

        local v41 = u38.launchInitiatedTimeMap[u40];

        if v41 == 0 or (v41 ~= v41 or not v41) then
            u38:exitLauncher(u39, u40);

            return nil;
        end;

        if v41 + SquadLauncherUtil.LAUNCH_SEQUENCE_TIME_LIMIT <= Workspace:GetServerTimeNow() then
            u38:launch(u39);
        end;
    end);
end;

function u10.enterLauncherEffect(u42, u43, u44) -- Line: 327
    -- upvalues: EntityUtil (copy), u3 (copy), Workspace (copy), Players (copy), StarterPlayer (copy), SquadLauncherUtil (copy), TweenService (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u4 (copy)
    local Character = u43.Character;
    local u45 = EntityUtil:getEntity(u43);

    if u45 ~= nil then
        u45:hideNametag();
    end;

    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not (Character and PrimaryPart) then
        return nil;
    end;

    Character.Archivable = true;
    local v46 = u42.fakeCharacterMaidMap[u43];

    if v46 == nil then
        v46 = u3.new();
    else
        v46:DoCleaning();
    end;

    local u47 = Character:Clone();
    u47:SetAttribute("Transparency", 0);
    u47.Parent = Workspace;

    if not u47.PrimaryPart then
        return nil;
    end;

    u42.fakeCharacterMap[u43] = u47;

    if u43 == Players.LocalPlayer and Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = u44:FindFirstChild("CameraSubject");
        Players.LocalPlayer.CameraMaxZoomDistance = 40;
        Players.LocalPlayer.CameraMinZoomDistance = 15;
    end;

    v46:GiveTask(function() -- Line: 367
        -- upvalues: u42 (copy), u43 (copy), Workspace (ref), Players (ref), Character (copy), StarterPlayer (ref), u45 (copy)
        local v48 = u42.fakeCharacterMap[u43];

        if v48 ~= nil then
            v48:Destroy();
        end;

        u42.fakeCharacterMap[u43] = nil;

        if Workspace.CurrentCamera and u43 == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
            Players.LocalPlayer.CameraMaxZoomDistance = StarterPlayer.CameraMaxZoomDistance;
            Players.LocalPlayer.CameraMinZoomDistance = StarterPlayer.CameraMinZoomDistance;
        end;

        Character:SetAttribute("Transparency", 0);
        local v49 = u45;

        if v49 ~= nil then
            v49:showNametag();
        end;
    end);
    u42.fakeCharacterMaidMap[u43] = v46;
    Character:SetAttribute("Transparency", 1);
    local v50 = u42.launcherOpenHeadHoleMap[u44];
    local u51 = ((v50 == 0 or (v50 ~= v50 or not v50)) and 0 or v50) % SquadLauncherUtil.MAX_LAUNCH_SQUAD_SIZE;
    u42.launcherOpenHeadHoleMap[u44] = u51 + 1;
    local v52 = u42.headHoleMaidMap[u43] or u3.new();
    v52:GiveTask(function() -- Line: 412
        -- upvalues: u42 (copy), u44 (copy), u51 (copy)
        u42.launcherOpenHeadHoleMap[u44] = u51;
    end);
    u42.headHoleMaidMap[u43] = v52;

    local function _(p53) -- Line: 421
        -- upvalues: u51 (copy)
        return p53.Name == "Head" .. tostring(u51);
    end;

    local v54 = nil;

    for i, descendant in u44:GetDescendants() do
        local _ = i - 1;

        if descendant.Name == "Head" .. tostring(u51) == true then
            v54 = descendant;
            break;
        end;
    end;

    local LookVector = v54:GetPivot().LookVector;
    local Position = v54:GetPivot().Position;
    local v55 = v54:GetPivot();
    local v56 = u42:getHighPoint(PrimaryPart, Position, 12);
    local v57 = TweenInfo.new(0.3);
    local v58 = TweenService:Create(u47.PrimaryPart, v57, {
        CFrame = CFrame.new(v56, LookVector)
    });
    local u59 = AnimationUtil:playAnimation(u47.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_NINJA_JUMP));
    v58:Play();
    local u60 = TweenService:Create(u47.PrimaryPart, TweenInfo.new(0.2), {
        CFrame = v55
    });
    v58.Completed:Connect(function() -- Line: 448
        -- upvalues: u60 (copy)
        u60:Play();
    end);
    u60.Completed:Connect(function() -- Line: 451
        -- upvalues: u59 (copy), u44 (copy), u47 (copy), u4 (ref), u42 (copy), u43 (copy), u3 (ref)
        local v61 = u59;

        if v61 ~= nil then
            v61:Stop();
        end;

        local v62 = u59;

        if v62 ~= nil then
            v62:Destroy();
        end;

        local Top = u44:FindFirstChild("Top");
        local v63;

        if Top == nil then
            v63 = Top;
        else
            v63 = Top.PrimaryPart;
        end;

        if v63 then
            local v64 = {};

            if Top ~= nil then
                Top = Top.PrimaryPart;
            end;

            v64.Part0 = Top;
            v64.Part1 = u47.PrimaryPart;
            v64.Parent = u47.PrimaryPart;
            u4("WeldConstraint", v64);
        end;

        local Head = u47:FindFirstChild("Head");
        local u65 = u47:FindFirstChild("3DClothing");

        if u65 ~= nil then
            u65 = u65:FindFirstChild("Head");
        end;

        local v66 = u47:GetDescendants();

        local function v70(p67) -- Line: 485
            -- upvalues: Head (copy), u65 (copy)
            if Head then
                if p67:IsDescendantOf(Head) or p67 == Head then
                    return nil;
                end;

                local function _(p68) -- Line: 492
                    return p68:IsA("Weld");
                end;

                local v69 = nil;

                for i, descendant in p67:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("Weld") == true then
                        v69 = descendant;
                        break;
                    end;
                end;

                if v69 ~= nil then
                    v69 = v69.Part1;
                end;

                if v69 == Head then
                    return nil;
                end;
            end;

            if u65 and (p67:IsDescendantOf(u65) or p67 == u65) then
                return nil;
            end;

            if p67:IsA("BasePart") then
                p67.Transparency = 1;

                return;
            end;

            if p67:IsA("Decal") then
                p67.Transparency = 1;
            end;
        end;

        for i, v in v66 do
            v70(v, i - 1, v66);
        end;

        local v71 = u42.fakeCharacterInvisibilityMaidMap[u43] or u3.new();
        v71:GiveTask(function() -- Line: 534
            -- upvalues: u47 (ref), Head (copy), u65 (copy)
            local v72 = u47:GetDescendants();

            local function v74(p73) -- Line: 536
                -- upvalues: Head (ref), u65 (ref)
                if Head and (p73:IsDescendantOf(Head) or p73 == Head) then
                    return nil;
                end;

                if u65 and (p73:IsDescendantOf(u65) or p73 == u65) then
                    return nil;
                end;

                if p73:IsA("BasePart") then
                    p73.Transparency = 0;

                    return;
                end;

                if p73:IsA("Decal") then
                    p73.Transparency = 0;
                end;
            end;

            for i, v in v72 do
                v74(v, i - 1, v72);
            end;
        end);
        u42.fakeCharacterInvisibilityMaidMap[u43] = v71;
    end);
end;

function u10.launchEffect(u75, u76, u77, p78, p79) -- Line: 562
    -- upvalues: Players (copy), Workspace (copy), TweenService (copy), SquadLauncherUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = u76.Character;
    local u80 = u75.fakeCharacterMaidMap[u76];
    local X = p78:GetPivot().Position.X;
    local v81 = p78:GetPivot().Position.Y + 6;
    local Z = p78:GetPivot().Position.Z;
    local v82 = Vector3.new(X, v81, Z);

    if not (Character and v82) then
        return nil;
    end;

    Character.Archivable = true;
    local u83 = u75.fakeCharacterMap[u76];
    local v84;

    if u83 == nil then
        v84 = u83;
    else
        v84 = u83.PrimaryPart;
    end;

    if not v84 then
        return nil;
    end;

    if u76 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = u83.Humanoid;

        if u80 ~= nil then
            u80:GiveTask(function() -- Line: 586
                -- upvalues: Workspace (ref), Character (copy)
                Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
            end);
        end;
    end;

    local Top = p78:FindFirstChild("Top");
    local v85;

    if Top == nil then
        v85 = Top;
    else
        v85 = Top.PrimaryPart;
    end;

    if not v85 then
        return nil;
    end;

    local v86 = TweenService:Create(Top.PrimaryPart, TweenInfo.new(0.5), {
        CFrame = CFrame.new(Top.PrimaryPart.CFrame.Position, (Vector3.new(p79.X, p79.Y + 50, p79.Z)))
    });
    v86:Play();
    local u87 = nil;
    local u88 = nil;
    local Animator = u83.Humanoid.Animator;
    local v89 = u75:getHighPoint(v82, p79, SquadLauncherUtil.LAUNCH_HEIGHT);
    local v90 = TweenInfo.new(0.5, Enum.EasingStyle.Sine);
    local u91 = TweenService:Create(u83.PrimaryPart, v90, {
        CFrame = CFrame.new(v89, p79)
    });
    v86.Completed:Connect(function() -- Line: 612
        -- upvalues: u83 (copy), u87 (ref), AnimationUtil (ref), Animator (copy), GameAnimationUtil (ref), AnimationType (ref), u75 (copy), u77 (copy), u76 (copy), u91 (copy)
        local v92 = u83;

        if v92 ~= nil then
            v92 = v92.PrimaryPart;
        end;

        if not v92 then
            return nil;
        end;

        task.wait(0.5);
        local v93 = u83.PrimaryPart:FindFirstChildWhichIsA("WeldConstraint");

        if v93 ~= nil then
            v93:Destroy();
        end;

        u87 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_NINJA_JUMP));
        u75:playEffects(u83.PrimaryPart.CFrame, u77);
        local v94 = u75.fakeCharacterInvisibilityMaidMap[u76];

        if v94 ~= nil then
            v94:DoCleaning();
        end;

        u91:Play();
    end);
    local u95 = nil;
    u91.Completed:Connect(function() -- Line: 639
        -- upvalues: u87 (ref), u88 (ref), AnimationUtil (ref), Animator (copy), GameAnimationUtil (ref), AnimationType (ref), u83 (copy), TweenService (ref), Character (copy), u95 (ref), u80 (copy)
        local v96 = u87;

        if v96 ~= nil then
            v96:Destroy();
        end;

        u88 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_DEFAULT_FREEFALL));
        local v97 = u83;

        if v97 ~= nil then
            v97 = v97.PrimaryPart;
        end;

        if not v97 then
            return nil;
        end;

        local PrimaryPart = u83.PrimaryPart;
        local v98 = TweenInfo.new(0.3);
        local v99 = {};
        local PrimaryPart2 = Character.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.CFrame;
        end;

        v99.CFrame = PrimaryPart2;
        u95 = TweenService:Create(PrimaryPart, v98, v99);
        u95:Play();
        u95.Completed:Connect(function() -- Line: 664
            -- upvalues: u80 (ref), u88 (ref)
            local v100 = u80;

            if v100 ~= nil then
                v100:DoCleaning();
            end;

            local v101 = u88;

            if v101 ~= nil then
                v101:Destroy();
            end;
        end);
    end);
end;

function u10.exitLauncherEffect(u102, u103, p104) -- Line: 676
    -- upvalues: Players (copy), Workspace (copy), TweenService (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v105 = u102.fakeCharacterMap[u103];
    local v106;

    if v105 == nil then
        v106 = v105;
    else
        v106 = v105.PrimaryPart;
    end;

    if not v106 then
        return nil;
    end;

    if u103 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = v105.Humanoid;
    end;

    local Character = u103.Character;
    local X = p104:GetPivot().Position.X;
    local v107 = p104:GetPivot().Position.Y + 6;
    local Z = p104:GetPivot().Position.Z;
    local v108 = Vector3.new(X, v107, Z);
    local v109;

    if Character == nil then
        v109 = Character;
    else
        v109 = Character.PrimaryPart;

        if v109 ~= nil then
            v109 = v109.Position;
        end;
    end;

    if not (Character and (v108 and v109)) then
        local v110 = u102.fakeCharacterMaidMap[u103];

        if v110 ~= nil then
            v110:DoCleaning();
        end;

        local v111 = u102.fakeCharacterInvisibilityMaidMap[u103];

        if v111 ~= nil then
            v111:DoCleaning();
        end;

        return nil;
    end;

    Character.Archivable = true;
    local v112 = u102:getHighPoint(v108, v109, 10);
    local v113 = u102.fakeCharacterInvisibilityMaidMap[u103];

    if v113 ~= nil then
        v113:DoCleaning();
    end;

    local v114 = TweenInfo.new(0.3);
    local v115 = TweenService:Create(v105.PrimaryPart, v114, {
        CFrame = CFrame.new(v112, p104.Position)
    });
    local u116 = AnimationUtil:playAnimation(v105.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_NINJA_JUMP));
    v115:Play();
    local PrimaryPart = v105.PrimaryPart;
    local v117 = TweenInfo.new(0.2);
    local v118 = {};
    local PrimaryPart2 = Character.PrimaryPart;

    if PrimaryPart2 ~= nil then
        PrimaryPart2 = PrimaryPart2.CFrame;
    end;

    v118.CFrame = PrimaryPart2;
    local u119 = TweenService:Create(PrimaryPart, v117, v118);
    v115.Completed:Connect(function() -- Line: 743
        -- upvalues: u119 (copy)
        u119:Play();
    end);
    u119.Completed:Connect(function() -- Line: 746
        -- upvalues: u102 (copy), u103 (copy), u116 (copy)
        local v120 = u102.fakeCharacterMaidMap[u103];

        if v120 ~= nil then
            v120:DoCleaning();
        end;

        local v121 = u116;

        if v121 ~= nil then
            v121:Destroy();
        end;
    end);
end;

function u10.getHighPoint(p122, p123, p124, p125) -- Line: 760
    local v126 = (p123.X + p124.X) / 2;
    local v127 = (p123.Z + p124.Z) / 2;
    local v128 = math.max(p123.Y, p124.Y) + p125;

    return Vector3.new(v126, v128, v127);
end;

function u10.launch(p129, p130) -- Line: 766
    -- upvalues: default (copy)
    if p129.isLaunchingMap[p130] then
        return false;
    end;

    if not p129.indicator then
        return false;
    end;

    local v131;

    if p129.targetMarked then
        v131 = p129.indicator.Position;
    else
        if not p129.lastValidLandingTarget then
            return false;
        end;

        v131 = p129.lastValidLandingTarget;
    end;

    p129.isLaunchingMap[p130] = true;
    p129.preLaunchMaid:DoCleaning();

    return default.Client:Get("RequestSquadLaunch"):CallServer({
        player = p130,
        target = v131
    });
end;

function u10.exitLauncher(u132, p133, p134) -- Line: 795
    -- upvalues: default (copy)
    task.delay(0.5, function() -- Line: 796
        -- upvalues: u132 (copy)
        u132.aimCameraMaid:DoCleaning();
        u132.preLaunchMaid:DoCleaning();
    end);

    if p134 then
        default.Client:Get("RequestExitSquadLauncher"):CallServer({
            squadLauncher = p134
        });
    end;
end;

function u10.activateIndicator(u135) -- Line: 806
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), Flamework (copy), Players (copy), MobileTouchType (copy), RunService (copy), DeviceUtil (copy), AbilityIndicatorUtil (copy), u7 (copy), SquadLauncherUtil (copy), u8 (copy)
    if u135.indicator then
        return nil;
    end;

    u135.indicator = ReplicatedStorage.Assets.Misc.WizardIndicator:Clone();
    u135.indicator.Parent = Workspace;
    local u136 = Vector3.new();
    u135.preLaunchMaid:GiveTask(function() -- Line: 813
        -- upvalues: u135 (copy)
        u135:disableIndicator();
    end);
    local v140 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Squad Launch",

        boundFunction = function(p137, p138, p139) -- Line: 820, Name: boundFunction
            -- upvalues: u135 (copy), Players (ref)
            if not u135.targetMarked then
                return nil;
            end;

            u135:launch(Players.LocalPlayer);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 828, Name: mobileBoundFunction
                -- upvalues: u135 (copy), Players (ref)
                if not u135.targetMarked then
                    return nil;
                end;

                u135:launch(Players.LocalPlayer);
            end
        }
    });
    u135.preLaunchMaid:GiveTask(v140);
    local u141 = nil;
    u141 = RunService.Heartbeat:Connect(function() -- Line: 838
        -- upvalues: u135 (copy), u141 (ref), Players (ref), DeviceUtil (ref), u136 (ref), AbilityIndicatorUtil (ref), u7 (ref), SquadLauncherUtil (ref), u8 (ref)
        if not u135.camera then
            return nil;
        end;

        if not u135.indicator then
            u141:Disconnect();

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
        local v142;

        if DeviceUtil.isMobileControls() then
            v142 = u135.camera.CFrame.LookVector.Unit;
        else
            v142 = UnitRay.Direction;
        end;

        u136 = AbilityIndicatorUtil:calculateBlockTargetPoint(u135.camera.CFrame.Position, v142, 300, Character);

        if not u136 then
            u135.targetMarked = false;

            return;
        end;

        local v143 = Vector3.new(u135.camera.CFrame.Position.X, u136.Y, u135.camera.CFrame.Position.Z);
        u135.indicator:PivotTo(CFrame.lookAt(u136, v143) * CFrame.Angles(0, 3.141592653589793, 0));
        local u144 = u7;

        if (u136 - Character).Magnitude > SquadLauncherUtil.LAUNCH_RANGE then
            u144 = u8;
            u135.targetMarked = false;
        else
            u135.targetMarked = true;
            u135.lastValidLandingTarget = u136;
        end;

        local function _(p145) -- Line: 873
            -- upvalues: u144 (ref)
            if p145:IsA("BasePart") then
                p145.Color = u144;
            end;
        end;

        for i, child in u135.indicator:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                child.Color = u144;
            end;
        end;
    end);
end;

function u10.setupAimCamera(p146, p147, p148) -- Line: 886
    -- upvalues: Workspace (copy), Players (copy), u4 (copy)
    if not Workspace.CurrentCamera then
        return nil;
    end;

    if p148 ~= Players.LocalPlayer then
        return nil;
    end;

    local Character = p148.Character;

    if not (Character and p148.Character) then
        return nil;
    end;

    local u149 = u4("Part", {
        Size = Vector3.new(1, 1, 1),
        CFrame = CFrame.new(p147 + Vector3.new(0, 50, 0), p148.Character:GetPivot().LookVector),
        Anchored = true,
        CanCollide = false,
        Transparency = 1,
        Parent = Workspace
    });
    Workspace.CurrentCamera.CameraSubject = u149;
    p146.aimCameraMaid:GiveTask(function() -- Line: 910
        -- upvalues: Workspace (ref), Character (copy), u149 (copy)
        if Workspace.CurrentCamera then
            Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
        end;

        u149:Destroy();
    end);
end;

function u10.setIndicatorTransparency(p150, u151) -- Line: 917
    if not p150.indicator then
        return nil;
    end;

    local function _(p152) -- Line: 922
        -- upvalues: u151 (copy)
        if p152:IsA("Part") or (p152:IsA("MeshPart") or p152:IsA("UnionOperation")) then
            p152.Transparency = u151;
        end;
    end;

    for i, child in p150.indicator:GetChildren() do
        local _ = i - 1;

        if child:IsA("Part") or (child:IsA("MeshPart") or child:IsA("UnionOperation")) then
            child.Transparency = u151;
        end;
    end;
end;

function u10.disableIndicator(p153, p154) -- Line: 931
    local indicator = p153.indicator;

    if indicator ~= nil then
        indicator:Destroy();
    end;

    p153.indicator = nil;
end;

function u10.mountLauncherUI(p155, p156, p157, p158) -- Line: 938
    -- upvalues: Flamework (copy), u5 (copy), SquadLauncherUI (copy)
    local v159 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(SquadLauncherUI, {
        StartTime = p157,
        EndTime = p158,
        SquadLauncher = p156
    }));
    p155.preLaunchMaid:GiveTask(v159);
end;

function u10.playEffects(p160, p161, p162) -- Line: 946
    -- upvalues: SquadLauncherUtil (copy), SoundManager (copy), u9 (copy), ReplicatedStorage (copy), Workspace (copy)
    SoundManager:playSound(u9[p162 % SquadLauncherUtil.MAX_LAUNCH_SQUAD_SIZE + 1], {
        rollOffMaxDistance = 100,
        volumeMultiplier = 5,
        position = p161.Position
    });
    local u163 = ReplicatedStorage.Assets.Effects.SquadLauncherEffect:Clone();
    u163.Parent = Workspace;
    u163.CFrame = p161;
    u163.RootAttachment.OutlineExplosion:Emit(1);
    u163.Smoke:Emit(6);
    task.delay(1.5, function() -- Line: 961
        -- upvalues: u163 (copy)
        u163:Destroy();
    end);
end;

KnitClient.CreateController(u10.new());

return nil;