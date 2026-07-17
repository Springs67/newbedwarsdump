-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BlackholeKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(u7, p8, p9, u10) -- Line: 30
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), scaleModel (copy), ModelUtil (copy), OutExpo (copy), RunService (copy)
    local u11 = u1.new();
    task.delay(8, function() -- Line: 32
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.HumanoidRootPart.Anchored = true;
    u12.Parent = Workspace;
    KillEffect.hideCharacter(u7, p9);
    u11:GiveTask(u12);
    local u13 = ReplicatedStorage.Assets.Effects.BlackHole:Clone();
    u13:PivotTo(u10);
    u13.Parent = Workspace;

    for _, descendant in u13:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Anchored = true;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    u13["ring.001"].Color = Color3.fromRGB(170, 0, 170);
    u13["ring.002"].Color = Color3.fromRGB(177, 167, 255);
    u13["ring.003"].Color = Color3.fromRGB(255, 89, 89);
    u11:GiveTask(u13);
    scaleModel(u13, 0.5);
    scaleModel(u13, 0.01);
    ModelUtil.tweenModelSize(u13, 0.5, OutExpo, 100);
    local u14 = {};

    for _, child in u12:GetChildren() do
        if child:IsA("BasePart") then
            for _, child2 in child:GetChildren() do
                if child2:IsA("Motor6D") then
                    child2:Destroy();
                end;
            end;

            child.Anchored = true;
            child.CanCollide = false;
            child.CanQuery = false;
            child.CanTouch = false;
            local v15 = {
                goalY = 8,
                part = child,
                offset = math.random() * 1000,
                startY = math.random(),
                seed = math.random() * 1000
            };
            table.insert(u14, v15);
        end;
    end;

    local u16 = 0;
    u11:GiveTask(RunService.Heartbeat:Connect(function(p17) -- Line: 81
        -- upvalues: u16 (ref), u13 (copy), u10 (copy), u14 (copy), OutExpo (ref)
        u16 = u16 + p17;
        u13:PivotTo(u10 * CFrame.Angles(0, math.rad(u16 * 360), 0));

        for _, v in u14 do
            local v18;

            if u16 < 0.5 then
                v18 = OutExpo(u16, 0, 7, 0.5);
            else
                v18 = u16 <= 5.9 and 7 or OutExpo(math.min(u16 - 5.9, 1), 7, -7, 0.1);
            end;

            local v19 = math.sin(u16 * 2 + v.offset) * v18;
            local v20 = math.cos(u16 * 2 + v.offset) * v18;
            local v21 = Vector3.new(v19, 0, v20);
            local v22 = math.noise(u16 * 0.5, 0, v.seed) * 9;
            local v23 = math.noise(u16 * 0.5, 0, -v.seed) * 15;
            local v24 = math.noise(u16 * 0.5, 0, v.seed + v.seed) * 9;
            local v25 = Vector3.new(v22, v23, v24);
            v.part.CFrame = u10 + (v21 + v25);
        end;
    end));
    task.delay(6, function() -- Line: 102
        -- upvalues: u7 (copy), u12 (copy), u14 (copy), ModelUtil (ref), u13 (copy), OutExpo (ref)
        u7:hideCharacter(u12);
        table.clear(u14);
        ModelUtil.tweenModelSize(u13, 0.3, OutExpo, 0);
    end);

    return u11;
end;

return u3;