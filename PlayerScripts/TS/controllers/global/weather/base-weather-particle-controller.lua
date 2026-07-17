-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MathExtras = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ParticleUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "particles", "particle-util").ParticleUtil;
local u3 = NumberRange.new(8, 48);
local u4 = NumberRange.new(18, 55);
local v5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "BaseWeatherParticleController";
    end,

    __index = KnitController
});
v5.__index = v5;

function v5.constructor(p6, p7) -- Line: 35
    -- upvalues: KnitController (copy), u1 (copy), u3 (copy), u4 (copy)
    KnitController.constructor(p6);
    p6.config = p7;
    p6.Name = "BaseWeatherParticleController";
    p6.maid = u1.new();
    p6.enabled = false;
    p6.particleEmitters = {};

    if p6.config.rateMin == nil then
        p6.config.rateMin = 20;
    end;

    if p6.config.rateMax == nil then
        p6.config.rateMax = 400;
    end;

    if p6.config.speedMinRange == nil then
        p6.config.speedMinRange = u3;
    end;

    if p6.config.speedMaxRange == nil then
        p6.config.speedMaxRange = u4;
    end;

    if p6.config.followOffset == nil then
        p6.config.followOffset = Vector3.new(0, 100, 0);
    end;

    if p6.config.particleDistance == nil then
        p6.config.particleDistance = 150;
    end;
end;

function v5.KnitStart(p8) -- Line: 62
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
end;

function v5.enable(p9, p10) -- Line: 65
    if p9.enabled then
        return nil;
    end;

    p9.enabled = true;
    p9:instantiateParticleParent();
    p9:setIntensity(p10);
    p9:onEnable();
end;

function v5.disable(p11) -- Line: 76
    p11.enabled = false;
    p11.maid:DoCleaning();
end;

function v5.instantiateParticleParent(u12) -- Line: 80
    -- upvalues: Workspace (copy), RunService (copy)
    if u12.config.weatherAsset == nil then
        return nil;
    end;

    u12.particleParent = u12.config.weatherAsset:Clone();

    local function _(p13) -- Line: 86
        return p13:IsA("ParticleEmitter");
    end;

    local v14 = 0;
    local v15 = {};

    for i, descendant in u12.particleParent:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") == true then
            v14 = v14 + 1;
            v15[v14] = descendant;
        end;
    end;

    u12.particleEmitters = v15;
    u12.maid:GiveTask(function() -- Line: 100
        -- upvalues: u12 (copy)
        local particleParent = u12.particleParent;

        if particleParent ~= nil then
            particleParent:Destroy();
        end;

        u12.particleParent = nil;

        local function _(p16) -- Line: 107
            if p16 ~= nil then
                p16:Destroy();
            end;
        end;

        for i, v in u12.particleEmitters do
            local _ = i - 1;

            if v ~= nil then
                v:Destroy();
            end;
        end;

        u12.particleEmitters = {};
    end);
    u12.particleParent.Parent = Workspace;
    local u17 = nil;
    u17 = RunService.Heartbeat:Connect(function() -- Line: 121
        -- upvalues: Workspace (ref), u12 (copy), u17 (ref)
        local v18 = not (Workspace.CurrentCamera and u12.particleParent);

        if not v18 then
            local particleParent = u12.particleParent;

            if particleParent ~= nil then
                particleParent = particleParent.Parent;
            end;

            v18 = not particleParent;
        end;

        if v18 then
            u17:Disconnect();

            return nil;
        end;

        u12.particleParent:PivotTo(CFrame.new(Workspace.CurrentCamera.CFrame.Position + u12.config.followOffset));
    end);
    u12.maid:GiveTask(function() -- Line: 139
        -- upvalues: u17 (ref)
        u17:Disconnect();
    end);
end;

function v5.setIntensity(u19, p20) -- Line: 143
    -- upvalues: MathExtras (copy), ParticleUtil (copy)
    if not u19.particleEmitters or #u19.particleEmitters == 0 then
        return nil;
    end;

    local v21 = math.clamp(p20, 0, 1);
    local u22 = MathExtras:lerp(u19.config.rateMin, u19.config.rateMax, v21);
    local u23 = MathExtras:lerp(u19.config.speedMinRange.Min, u19.config.speedMinRange.Max, v21);
    local u24 = MathExtras:lerp(u19.config.speedMaxRange.Min, u19.config.speedMaxRange.Max, v21);

    local function _(p25) -- Line: 154
        -- upvalues: ParticleUtil (ref), u23 (copy), u24 (copy), u19 (copy), u22 (copy)
        ParticleUtil.setSpeedAndDistance(p25, u23, u24, u19.config.particleDistance);
        p25.Rate = u22;
    end;

    for i, v in u19.particleEmitters do
        local _ = i - 1;
        ParticleUtil.setSpeedAndDistance(v, u23, u24, u19.config.particleDistance);
        v.Rate = u22;
    end;
end;

return {
    BaseWeatherParticleController = v5
};