-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local SkyboxId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "ForestEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy), GameSound (copy), SkyboxId (copy)
    BaseEnvironmentPresetController.constructor(p3, EnvironmentPreset.Forest, {
        ColorCorrectionEffect = {
            TintColor = Color3.fromRGB(243, 255, 247)
        }
    }, {
        {
            ambientSoundName = GameSound.WIND_AMBIENCE
        }
    }, SkyboxId.Blue, {
        sounds = {
            {
                volumeMultiplier = 0.4,
                soundId = GameSound.LOBBY_MUSIC_FOREST
            }
        }
    });
    p3.Name = "ForestEnvironmentPresetController";
end;

function u1.KnitStart(p4) -- Line: 39
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p4);
end;

function u1.onEnable(p5) -- Line: 42
    -- upvalues: SoundManager (copy), GameSound (copy), Workspace (copy)
    SoundManager:playSound(GameSound.FOREST_AMBIENCE, {
        looped = true,
        volumeMultiplier = 1.5,
        parent = Workspace
    });
end;

function u1.onIntensityChanged(p6, p7) -- Line: 50
    -- upvalues: KnitClient (copy)
    if not p6.weatherIntensityInitialized then
        KnitClient.Controllers.WindWeatherParticleController:enable(p7);
        p6.maid:GiveTask(function() -- Line: 54
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.WindWeatherParticleController:disable();
        end);
    end;

    KnitClient.Controllers.WindWeatherParticleController:setIntensity(p7);
end;

function u1.onDynamicEventStarted(p8) -- Line: 60
end;

function u1.onDynamicEventEnded(p9) -- Line: 62
end;

KnitClient.CreateController(u1.new());

return nil;