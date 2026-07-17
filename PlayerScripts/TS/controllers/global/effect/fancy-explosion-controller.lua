-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MathExtras = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local Linear = v1.Linear;
local OutExpo = v1.OutExpo;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "FancyExplosionController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "FancyExplosionController";
    p5.random = Random.new();
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

u3.createExplosion = RuntimeLib.async(function(p7, u8) -- Line: 37
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), default (copy), OutExpo (copy), MathExtras (copy), Linear (copy), InExpo (copy)
    local inDuration = u8.inDuration;
    local outDuration = u8.outDuration;
    local randomSizeOffset = u8.randomSizeOffset;
    local v9 = randomSizeOffset == nil and 10 or randomSizeOffset;
    local randomPositionOffset = u8.randomPositionOffset;
    local v10 = randomPositionOffset == nil and 2 or randomPositionOffset;
    local rotationSpeed = u8.rotationSpeed;
    local u11 = rotationSpeed == nil and 15 or rotationSpeed;
    local u12 = u8.radius + p7.random:NextNumber(-v9, v9);
    local u13 = (u8.model or ReplicatedStorage.Assets.Misc.SpiritExplosion):Clone();
    local v14 = CFrame.new(u8.position);
    local v15 = CFrame.new(p7.random:NextNumber(-v10, v10), p7.random:NextNumber(-v10, v10), p7.random:NextNumber(-v10, v10));
    local Angles = CFrame.Angles;
    local v16 = math.random(-360, 360);
    local v17 = Angles(0, math.rad(v16), 0);
    u13:PivotTo(v14 * v15 * v17);
    u13.Parent = Workspace;

    if u8.simpleScaleParent then
        u13:ScaleTo(u8.simpleScaleParent.startScale);
    end;

    local v19 = RunService.Heartbeat:Connect(function(p18) -- Line: 74
        -- upvalues: u13 (copy), u11 (copy)
        u13:PivotTo(u13:GetPrimaryPartCFrame() * CFrame.Angles(0, p18 * u11, 0));
    end);
    local Magnitude = u13:GetExtentsSize().Magnitude;
    local u20 = {};

    for _, child in u13:GetChildren() do
        if child:IsA("BasePart") then
            u20[child] = {
                size = child.Size,
                position = child.Position,
                transparency = child.Transparency
            };
        end;
    end;

    local v24 = default(inDuration == nil and 0.2 or inDuration, OutExpo, function(p21) -- Line: 92
        -- upvalues: u8 (copy), MathExtras (ref), u13 (copy), u20 (copy), Linear (ref), u12 (copy), Magnitude (copy)
        if u8.simpleScaleParent then
            u13:ScaleTo((MathExtras:lerp(u8.simpleScaleParent.startScale, u8.simpleScaleParent.endScale, p21)));

            return;
        end;

        for _, child in u13:GetChildren() do
            if child:IsA("BasePart") then
                local v22 = u20[child];

                if v22 ~= nil then
                    local v23 = Linear(p21, 1, u12 / Magnitude, 1);
                    child.Position = u8.position:Lerp(v22.position, v23);
                    child.Size = v22.size * v23;
                end;
            end;
        end;
    end, 0, 1);
    local v27 = default(outDuration == nil and 0.5 or outDuration, InExpo, function(p25) -- Line: 110
        -- upvalues: u13 (copy), u20 (copy), Linear (ref)
        for _, child in u13:GetChildren() do
            if child:IsA("BasePart") then
                local v26 = u20[child];

                if v26 ~= nil then
                    child.Transparency = Linear(p25, v26.transparency, 1, 1);
                end;
            end;
        end;
    end, 0, 1);
    v24:Wait();
    v27:Wait();
    v19:Disconnect();
    u13:Destroy();
end);
KnitClient.CreateController(u3.new());

return nil;