-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local u3 = ConstantManager.registerConstants(script, {
    Duration = 0.25,
    Magnitude = 0.4,
    TotalCycles = 5
});
local v4 = {};
local u5 = nil;

local function shakeScreenDirection(u6, u7) -- Line: 19
    -- upvalues: u1 (copy), u3 (copy), default (copy), Linear (copy), u5 (ref), RunService (copy), Workspace (copy)
    local u8 = u1.new();
    local u9 = 0;
    local v10;

    if u7 == nil then
        v10 = u7;
    else
        v10 = u7.duration;
    end;

    if v10 == nil then
        v10 = u3.Duration;
    end;

    local u13 = default(v10, Linear, function(p11) -- Line: 30
        -- upvalues: u7 (copy), u9 (ref), u5 (ref)
        local v12 = u7;

        if v12 ~= nil then
            v12 = v12.cycles;
        end;

        u9 = u5(p11, v12);
    end, 0, 1);
    u8:GiveTask(function() -- Line: 38
        -- upvalues: u13 (copy)
        return u13:Cancel();
    end);
    local u14 = "screen-shake" .. tostring(math.random());
    RunService:BindToRenderStep(u14, Enum.RenderPriority.Camera.Value + 3, function() -- Line: 42
        -- upvalues: Workspace (ref), u6 (copy), u7 (copy), u9 (ref), u3 (ref)
        if not Workspace.CurrentCamera then
            return nil;
        end;

        local CFrame2 = Workspace.CurrentCamera.CFrame;
        local Unit = Vector3.new(u6.X, u6.Y, 0).Unit;
        local v15 = u7;

        if v15 ~= nil then
            v15 = v15.zMagnitude;
        end;

        local v16 = Vector3.new(0, 0, v15 == nil and 0 or v15);
        local v17 = u7;

        if v17 ~= nil then
            v17 = v17.magnitude;
        end;

        if v17 == nil then
            v17 = u3.Magnitude;
        end;

        local v18 = CFrame.new(CFrame2 * ((Unit + v16) * (u9 * v17)));
        Workspace.CurrentCamera.CFrame = v18 * (Workspace.CurrentCamera.CFrame - Workspace.CurrentCamera.CFrame.Position);
    end);
    u8:GiveTask(function() -- Line: 72
        -- upvalues: RunService (ref), u14 (copy)
        return RunService:UnbindFromRenderStep(u14);
    end);
    task.spawn(function() -- Line: 75
        -- upvalues: u13 (copy), u8 (copy)
        u13:Wait();
        u8:DoCleaning();
    end);

    return u8;
end;

v4.shakeScreenDirection = shakeScreenDirection;

u5 = function(p19, p20) -- Line: 82, Name: getShakeMagnitude
    -- upvalues: u3 (copy)
    if p20 == nil then
        p20 = u3.TotalCycles;
    end;

    local v21 = p19 * 3.141592653589793 * p20;

    return math.sin(v21) / math.pow(v21, 0.5);
end;

v4.getShakeMagnitude = u5;

function v4.shake(p22, p23, p24) -- Line: 90
    -- upvalues: Workspace (copy), shakeScreenDirection (copy)
    if not Workspace.CurrentCamera then
        return nil;
    end;

    local v25 = Workspace.CurrentCamera:WorldToScreenPoint(p22);
    local v26 = Workspace.CurrentCamera:WorldToScreenPoint(p22 + p23.Unit);

    return shakeScreenDirection(Vector2.new(v26.X - v25.X, -(v26.Y - v25.Y)), p24);
end;

return {
    ScreenShakeUtil = v4
};