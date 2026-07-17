-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GroupModifierBehavior = v1.GroupModifierBehavior;
local ModifierGroup = v1.ModifierGroup;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Lighting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v3 = RuntimeLib.import(script, script.Parent, "default-lighting-constants");
local DefaultAtmosphereProperties = v3.DefaultAtmosphereProperties;
local DefaultLightingProperties = v3.DefaultLightingProperties;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LightingController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy), ModifierGroup (copy), Lighting (copy), DefaultLightingProperties (copy), GroupModifierBehavior (copy), u2 (copy), PlaceUtil (copy), DefaultAtmosphereProperties (copy)
    KnitController.constructor(p6);
    p6.Name = "LightingController";
    p6.lightingModifier = ModifierGroup.new(Lighting, {
        baseProperties = DefaultLightingProperties,
        behavior = GroupModifierBehavior.Merge
    });
    p6.sunRayModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("SunRaysEffect") or u2("SunRaysEffect", {
        Parent = Lighting
    }), {
        baseProperties = {
            Intensity = 0.04,
            Spread = 1
        },
        behavior = GroupModifierBehavior.Merge
    });
    p6.skyModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("Sky") or u2("Sky", {
        Parent = Lighting
    }), {
        baseProperties = {
            CelestialBodiesShown = false,
            StarCount = 0,
            SkyboxBk = "rbxassetid://13839120191",
            SkyboxDn = "rbxassetid://13839122265",
            SkyboxFt = "rbxassetid://13839117957",
            SkyboxLf = "rbxassetid://13839116551",
            SkyboxRt = "rbxassetid://13839097493",
            SkyboxUp = "rbxassetid://13839112995"
        },
        behavior = GroupModifierBehavior.Merge
    });
    p6.colorCorrectionModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or u2("ColorCorrectionEffect", {
        Parent = Lighting
    }), {
        baseProperties = {
            Contrast = 0.05,
            Saturation = 0,
            TintColor = Color3.fromRGB(255, 255, 255)
        },
        behavior = GroupModifierBehavior.Merge
    });

    if not PlaceUtil.isLobbyServer() then
        p6.atmosphereModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("Atmosphere") or u2("Atmosphere", {
            Parent = Lighting
        }), {
            baseProperties = DefaultAtmosphereProperties,
            behavior = GroupModifierBehavior.Merge
        });
    end;
end;

function u4.KnitStart(p7) -- Line: 79
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.getAtmosphereModifier(p8) -- Line: 82
    -- upvalues: ModifierGroup (copy), Lighting (copy), u2 (copy), DefaultAtmosphereProperties (copy), GroupModifierBehavior (copy)
    if not p8.atmosphereModifier then
        p8.atmosphereModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("Atmosphere") or u2("Atmosphere", {
            Parent = Lighting
        }), {
            baseProperties = DefaultAtmosphereProperties,
            behavior = GroupModifierBehavior.Merge
        });
    end;

    return p8.atmosphereModifier;
end;

function u4.getAtmosphere(p9) -- Line: 93
    -- upvalues: Lighting (copy), u2 (copy)
    return Lighting:FindFirstChildOfClass("Atmosphere") or u2("Atmosphere", {
        Parent = Lighting
    });
end;

KnitClient.CreateController(u4.new());

return nil;