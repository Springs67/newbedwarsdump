-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "BeeParticle";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(u5, u6) -- Line: 24
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), default (copy), Linear (copy)
    u5.maid = u1.new();
    u5.beeInstance = ReplicatedStorage.Assets.Effects.Bee:Clone();
    u5.beeInstance.Parent = Workspace;

    local function _(p7) -- Line: 29
        if p7:IsA("BasePart") then
            p7.CanCollide = false;
            p7.CanQuery = false;
            p7.Anchored = true;
        end;
    end;

    for i, descendant in u5.beeInstance:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.Anchored = true;
        end;
    end;

    local PrimaryPart = u5.beeInstance.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart:FindFirstChild("Trail");
    end;

    if PrimaryPart then
        PrimaryPart.Enabled = true;
    end;

    local v8 = u5.beeInstance:FindFirstChildOfClass("AnimationController");

    if v8 ~= nil then
        local v9 = v8:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEE_FLAP));
        v9.Looped = true;
        v9:Play();
    end;

    u5.maid:GiveTask(u6.AncestryChanged:Connect(function() -- Line: 55
        -- upvalues: u5 (copy)
        u5.maid:DoCleaning();
    end));
    local u10 = math.random() * 3;
    local u11 = 3.5 + math.random() * 1.5;
    local u12 = math.random() * 10;
    local u13 = false;
    local u20 = RunService.Heartbeat:Connect(function(p14) -- Line: 63
        -- upvalues: u12 (ref), u6 (copy), u5 (copy), u11 (copy), u10 (copy)
        u12 = u12 + p14;
        local PrimaryPart2 = u6.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.CFrame;
        end;

        if not PrimaryPart2 then
            u5.maid:DoCleaning();

            return nil;
        end;

        local v15 = math.sin(u12 * 1.5) * u11;
        local v16 = u10 + math.sin(u12 * 2.5) * 3;
        local v17 = math.cos(u12 * 1.5) * u11;
        local v18 = PrimaryPart2 * Vector3.new(v15, v16, v17);
        local v19 = CFrame.new(v18, v18 + PrimaryPart2.LookVector);

        if (u5.beeInstance.PrimaryPart.Position - v19.Position).Magnitude > 20 then
            u5.beeInstance:PivotTo(v19);

            return nil;
        end;

        u5.beeInstance:PivotTo(u5.beeInstance.PrimaryPart.CFrame:Lerp(v19, 4.5 * p14));
    end);
    u5.maid:GiveTask(function() -- Line: 101
        -- upvalues: u13 (ref), u5 (copy), default (ref), Linear (ref), u20 (copy)
        u13 = true;

        local function _(u21) -- Line: 104
            -- upvalues: default (ref), Linear (ref)
            if u21:IsA("BasePart") then
                local Transparency = u21.Transparency;
                default(0.9, Linear, function(p22) -- Line: 107
                    -- upvalues: u21 (copy), Transparency (copy)
                    u21.Transparency = (1 - p22) * Transparency + p22 * 1;
                end);
            end;
        end;

        for i, descendant in u5.beeInstance:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                local Transparency = descendant.Transparency;
                default(0.9, Linear, function(p23) -- Line: 107
                    -- upvalues: descendant (copy), Transparency (copy)
                    descendant.Transparency = (1 - p23) * Transparency + p23 * 1;
                end);
            end;
        end;

        task.delay(1, function() -- Line: 115
            -- upvalues: u20 (ref), u5 (ref)
            u20:Disconnect();
            u5.beeInstance:Destroy();
        end);
    end);
end;

function u3.Destroy(p24) -- Line: 121
    p24.maid:DoCleaning();
end;

return {
    BeeParticle = u3
};