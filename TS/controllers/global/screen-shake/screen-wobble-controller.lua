-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayerCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ScreenWobbleController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "ScreenWobbleController";
    p5.maid = u1.new();
    p5.wobbleRunning = false;
    p5.wobbleAlive = false;
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.enableScreenWobble(u7) -- Line: 35
    -- upvalues: Players (copy), WatchPlayerCharacter (copy), KnitClient (copy)
    u7.maid:GiveTask(Players.LocalPlayer.CharacterRemoving:Connect(function() -- Line: 36
        -- upvalues: u7 (copy)
        u7.wobbleAlive = false;
    end));
    u7.maid:GiveTask(WatchPlayerCharacter(Players.LocalPlayer, function(p8, u9) -- Line: 39
        -- upvalues: u7 (copy), KnitClient (ref)
        local Humanoid = p8:WaitForChild("Humanoid");
        u7.maid:GiveTask(Humanoid.Died:Connect(function() -- Line: 41
            -- upvalues: u7 (ref), u9 (copy)
            u7.wobbleAlive = false;
            u9:DoCleaning();
        end));

        if not p8.PrimaryPart then
            p8:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local PrimaryPart = p8.PrimaryPart;
        local u10 = Humanoid.MoveDirection.Magnitude ~= 0;

        local function _() -- Line: 50
            -- upvalues: Humanoid (copy), PrimaryPart (copy), u10 (ref), KnitClient (ref), u7 (ref)
            local v11;

            if Humanoid.MoveDirection.Magnitude == 0 then
                v11 = false;
            else
                v11 = not PrimaryPart.Anchored;
            end;

            if v11 ~= u10 then
                u10 = v11;

                if u10 and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u7:startWobble(Humanoid);

                    return;
                end;

                u7.wobbleAlive = false;
            end;
        end;

        local v12 = {};
        local v14 = Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 63
            -- upvalues: Humanoid (copy), PrimaryPart (copy), u10 (ref), KnitClient (ref), u7 (ref)
            local v13;

            if Humanoid.MoveDirection.Magnitude == 0 then
                v13 = false;
            else
                v13 = not PrimaryPart.Anchored;
            end;

            if v13 ~= u10 then
                u10 = v13;

                if u10 and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u7:startWobble(Humanoid);

                    return;
                end;

                u7.wobbleAlive = false;
            end;
        end);
        table.insert(v12, v14);
        local v16 = PrimaryPart:GetPropertyChangedSignal("Anchored"):Connect(function() -- Line: 67
            -- upvalues: Humanoid (copy), PrimaryPart (copy), u10 (ref), KnitClient (ref), u7 (ref)
            local v15;

            if Humanoid.MoveDirection.Magnitude == 0 then
                v15 = false;
            else
                v15 = not PrimaryPart.Anchored;
            end;

            if v15 ~= u10 then
                u10 = v15;

                if u10 and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u7:startWobble(Humanoid);

                    return;
                end;

                u7.wobbleAlive = false;
            end;
        end);
        table.insert(v12, v16);
        local v19 = KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p17) -- Line: 71
            -- upvalues: Humanoid (copy), PrimaryPart (copy), u10 (ref), KnitClient (ref), u7 (ref)
            local v18;

            if Humanoid.MoveDirection.Magnitude == 0 then
                v18 = false;
            else
                v18 = not PrimaryPart.Anchored;
            end;

            if v18 ~= u10 then
                u10 = v18;

                if u10 and KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                    u7:startWobble(Humanoid);

                    return;
                end;

                u7.wobbleAlive = false;
            end;
        end);
        table.insert(v12, v19);

        for _, v in v12 do
            u9:GiveTask(v);
            u7.maid:GiveTask(v);
        end;

        if u10 then
            u7:startWobble(Humanoid);
        end;
    end));
end;

function u3.startWobble(u20, u21) -- Line: 84
    -- upvalues: u1 (copy), RunService (copy), Workspace (copy)
    if u20.wobbleRunning then
        u20.wobbleAlive = true;

        return nil;
    end;

    u20.wobbleRunning = true;
    u20.wobbleAlive = true;
    local u22 = 0;
    local u23 = u1.new();
    u23:GiveTask(function() -- Line: 93
        -- upvalues: u20 (copy)
        u20.wobbleRunning = false;
    end);
    local u24 = 0;
    RunService:BindToRenderStep("wobble-pre-camera", Enum.RenderPriority.Character.Value + 2, function(p25) -- Line: 101
        -- upvalues: Workspace (ref), u24 (ref), u21 (copy), u20 (copy), u22 (ref), u23 (copy)
        local CurrentCamera = Workspace.CurrentCamera;

        if not CurrentCamera then
            return nil;
        end;

        u24 = u24 + p25;
        local v26 = (CurrentCamera.CFrame - CurrentCamera.CFrame.Position):Inverse() * u21.MoveDirection;
        local v27 = math.atan2(v26.X, v26.Z);
        local v28 = math.cos(v27);
        local v29 = math.abs(v28);
        local v30 = {
            Enum.HumanoidStateType.Jumping,
            Enum.HumanoidStateType.FallingDown,
            Enum.HumanoidStateType.Freefall,
            Enum.HumanoidStateType.Flying
        };
        local v31 = u21:GetState();

        if table.find(v30, v31) ~= nil then
            v29 = v29 * 0.2;
        end;

        if not u20.wobbleAlive then
            v29 = v29 * 2;
        end;

        local v32 = math.cos(v27) > 0 and -1 or 1;
        local v33 = p25 * (u21.WalkSpeed / 24) * 1.6216216216216215 * 3.141592653589793 * 2 * v29 * (not u20.wobbleAlive and (u22 % 3.141592653589793 < 1.5707963267948966 and -1 or 1) or v32);

        if not u20.wobbleAlive and u22 % 3.141592653589793 > (u22 + v33) % 3.141592653589793 then
            u23:DoCleaning();

            return nil;
        end;

        u22 = (u22 + v33) % 6.283185307179586;
        local v34 = CurrentCamera.CFrame - CurrentCamera.CFrame.Position;
        local v35 = math.min(u24 / 1, 1) * 0.35;
        local v36 = math.cos(u22 - 1.5707963267948966) * v35;
        local v37 = math.sin(u22 * 2) * v35 * 0.65;
        local v38 = Vector3.new(v36, v37, 0);
        CurrentCamera.CFrame = v34 + CurrentCamera.CFrame * v38;
    end);
    u23:GiveTask(function() -- Line: 147
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("wobble-pre-camera");
    end);
    local u39 = nil;
    RunService:BindToRenderStep("wobble-post-camera", Enum.RenderPriority.Camera.Value + 1, function(p40) -- Line: 152
        -- upvalues: Workspace (ref), u39 (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        u39 = CurrentCamera;
    end);
    u23:GiveTask(function() -- Line: 160
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("wobble-post-camera");
    end);
    u23:GiveTask(RunService.Stepped:Connect(function() -- Line: 163
        -- upvalues: Workspace (ref), u39 (ref)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera and u39 then
            CurrentCamera.CFrame = u39;
        end;
    end));

    return nil;
end;

function u3.disableScreenWobble(p41) -- Line: 172
    p41.maid:DoCleaning();
end;

KnitClient.CreateController(u3.new());

return nil;