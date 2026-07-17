-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Lighting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SurvivalWorldLightingController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: GameKnitController (copy), GameType (copy), u2 (copy)
    GameKnitController.constructor(p5, { GameType.SURVIVAL });
    p5.Name = "SurvivalWorldLightingController";
    p5.lightingMaid = u2.new();
end;

function u3.onGameInit(p6) -- Line: 29
end;

function u3.applyVoidLighting(p7) -- Line: 31
    -- upvalues: KnitClient2 (copy), Lighting (copy)
    local v8 = {};
    local v9 = KnitClient2.Controllers.LightingController.lightingModifier:addModifier(20, {
        Brightness = 3,
        ClockTime = 14.5,
        ExposureCompensation = 0,
        Ambient = Color3.fromRGB(70, 70, 70)
    });
    table.insert(v8, v9);
    local atmosphereModifier = KnitClient2.Controllers.LightingController.atmosphereModifier;

    if atmosphereModifier ~= nil then
        atmosphereModifier = atmosphereModifier:addModifier(20, {
            Density = 0.3,
            Offset = 0.25,
            Glare = 0,
            Haze = 0,
            Color = Color3.fromRGB(199, 199, 199),
            Decay = Color3.fromRGB(106, 112, 125)
        });
    end;

    if atmosphereModifier then
        table.insert(v8, atmosphereModifier);
    end;

    local v10 = KnitClient2.Controllers.LightingController.sunRayModifier:addModifier(20, {
        Intensity = 0.005
    });
    table.insert(v8, v10);
    Lighting:WaitForChild("Sky"):Destroy();

    return v8;
end;

KnitClient.CreateController(u3.new());

return nil;