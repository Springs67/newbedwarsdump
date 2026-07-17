-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local BaseWeatherParticleController = RuntimeLib.import(script, script.Parent, "base-weather-particle-controller").BaseWeatherParticleController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "RainWeatherParticleController";
    end,

    __index = BaseWeatherParticleController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: BaseWeatherParticleController (copy), ReplicatedStorage (copy)
    BaseWeatherParticleController.constructor(p3, {
        rateMin = 60,
        rateMax = 180,
        followOffset = Vector3.new(0, 100, 0),
        particleDistance = 150,
        weatherAsset = ReplicatedStorage.Assets.Effects.RainParticlePart,
        speedMinRange = NumberRange.new(160, 170),
        speedMaxRange = NumberRange.new(200, 210)
    });
    p3.Name = "RainWeatherParticleController";
end;

function u1.KnitStart(p4) -- Line: 32
    -- upvalues: BaseWeatherParticleController (copy)
    BaseWeatherParticleController.KnitStart(p4);
end;

function u1.onEnable(p5) -- Line: 35
end;

KnitClient.CreateController(u1.new());

return nil;