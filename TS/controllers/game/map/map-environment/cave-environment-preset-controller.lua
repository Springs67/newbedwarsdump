-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v1.Lighting;
local SoundService = v1.SoundService;
local SkyboxId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "CaveEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy), GameSound (copy), SkyboxId (copy)
    BaseEnvironmentPresetController.constructor(p4, EnvironmentPreset.Cave, {
        ColorCorrectionEffect = {
            TintColor = Color3.fromRGB(247, 247, 255)
        },
        Lighting = {
            FogEnd = 2000,
            FogStart = 30,
            FogColor = Color3.fromRGB(255, 255, 255)
        }
    }, {
        {
            ambientSoundName = GameSound.CAVE_AMBIENCE
        }
    }, SkyboxId.Night);
    p4.Name = "CaveEnvironmentPresetController";
end;

function u2.KnitStart(p5) -- Line: 40
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p5);
end;

function u2.onEnable(p6) -- Line: 43
    -- upvalues: Lighting (copy), SoundService (copy)
    local Atmosphere = Lighting:WaitForChild("Atmosphere");

    if Atmosphere ~= nil then
        Atmosphere:Destroy();
    end;

    SoundService.AmbientReverb = Enum.ReverbType.Cave;
end;

function u2.onIntensityChanged(p7, p8) -- Line: 50
end;

function u2.onDynamicEventStarted(p9) -- Line: 52
end;

function u2.onDynamicEventEnded(p10) -- Line: 54
end;

KnitClient.CreateController(u2.new());

return nil;