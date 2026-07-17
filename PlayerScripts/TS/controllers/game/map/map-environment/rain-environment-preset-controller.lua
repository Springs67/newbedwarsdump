-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v2.Lighting;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SkyboxId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u3 = Color3.fromRGB(64, 64, 77);
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "RainEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy), u3 (copy), GameSound (copy), SkyboxId (copy)
    BaseEnvironmentPresetController.constructor(p6, EnvironmentPreset.Rain, {
        ColorCorrectionEffect = {
            TintColor = Color3.fromRGB(240, 237, 252)
        },
        Clouds = {
            Cover = 0.7,
            Density = 0.4,
            Color = u3
        }
    }, {
        {
            ambientSoundName = GameSound.PIRATE_EVENT_RAIN_LOOP
        }
    }, SkyboxId.Night, {
        sounds = {
            {
                soundId = GameSound.PIRATE_EVENT_LOBBY_MUSIC
            }
        }
    });
    p6.Name = "RainEnvironmentPresetController";
    p6.originalLightingBrightness = 2;
    p6.cachedClouds = nil;
end;

function u4.KnitStart(p7) -- Line: 58
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p7);
end;

function u4.onEnable(u8) -- Line: 61
    -- upvalues: KnitClient (copy), GameSound (copy), default2 (copy), Lighting (copy)
    local mapMeta = u8.mapMeta;

    if mapMeta ~= nil then
        mapMeta = mapMeta.environment;

        if mapMeta ~= nil then
            mapMeta = mapMeta.rainSettings;
        end;
    end;

    u8.rainSettings = mapMeta;
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.PIRATE_EVENT_THUNDER }
    });
    default2.Client:Get("EnvironmentWeatherPlayLightningEffect"):Connect(function(p9) -- Line: 75
        -- upvalues: u8 (copy)
        u8:playLightningEffect(p9.intensity);
    end);
    u8.originalLightingBrightness = Lighting.Brightness;
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.LIGHTNING_STRIKE_1,
            GameSound.LIGHTNING_STRIKE_2,
            GameSound.LIGHTNING_STATIC_1,
            GameSound.LIGHTNING_STATIC_2,
            GameSound.LIGHTNING_STATIC_3,
            GameSound.LIGHTNING_STATIC_4,
            GameSound.LIGHTNING_STATIC_5,
            GameSound.LIGHTNING_STATIC_6,
            GameSound.LIGHTNING_THUNDER_STORM_LOOP
        }
    });
end;

function u4.onIntensityChanged(p10, p11) -- Line: 84
    -- upvalues: KnitClient (copy), MathExtras (copy), default (copy), Linear (copy)
    if not p10.weatherIntensityInitialized then
        KnitClient.Controllers.RainWeatherParticleController:enable(p11);
        p10.maid:GiveTask(function() -- Line: 88
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.RainWeatherParticleController:disable();
        end);
    end;

    KnitClient.Controllers.RainWeatherParticleController:setIntensity(p11);
    local u12 = p10:getClouds();

    if u12 then
        local Cover = u12.Cover;
        local u13 = MathExtras:lerp(0.7, 0.85, p11);
        local Density = u12.Density;
        local u14 = MathExtras:lerp(0.4, 0.5, p11);
        default(6, Linear, function(p15) -- Line: 101
            -- upvalues: u12 (copy), MathExtras (ref), Cover (copy), u13 (copy), Density (copy), u14 (copy)
            if u12 then
                u12.Cover = MathExtras:lerp(Cover, u13, p15);
                u12.Density = MathExtras:lerp(Density, u14, p15);
            end;
        end, 0, 1):Play();
    end;
end;

function u4.playLightningEffect(p16, p17) -- Line: 109
    -- upvalues: SoundManager (copy), GameSound (copy), MathExtras (copy), default (copy), Linear (copy), Lighting (copy)
    SoundManager:playSound(GameSound.PIRATE_EVENT_THUNDER, {
        volumeMultiplier = MathExtras:lerp(0.4, 1, p17)
    });
    default(0.2, Linear, function(p18) -- Line: 115
        -- upvalues: Lighting (ref)
        Lighting.Brightness = p18;
    end, p16.originalLightingBrightness, 10):Play():Wait();
    default(0.2, Linear, function(p19) -- Line: 118
        -- upvalues: Lighting (ref)
        Lighting.Brightness = p19;
    end, 10, p16.originalLightingBrightness):Play():Wait();
    default(0.2, Linear, function(p20) -- Line: 121
        -- upvalues: Lighting (ref)
        Lighting.Brightness = p20;
    end, p16.originalLightingBrightness, 10):Play():Wait();
    default(1.5, Linear, function(p21) -- Line: 124
        -- upvalues: Lighting (ref)
        Lighting.Brightness = p21;
    end, 10, p16.originalLightingBrightness):Play():Wait();
end;

function u4.getClouds(p22) -- Line: 128
    -- upvalues: Workspace (copy)
    local cachedClouds = p22.cachedClouds;

    if cachedClouds then
        local cachedClouds2 = p22.cachedClouds;

        if cachedClouds2 ~= nil then
            cachedClouds2 = cachedClouds2.Parent;
        end;

        cachedClouds = cachedClouds2 == Workspace.Terrain;
    end;

    if cachedClouds then
        return p22.cachedClouds;
    end;

    return Workspace.Terrain:FindFirstChildOfClass("Clouds");
end;

function u4.onDynamicEventStarted(p23) -- Line: 142
end;

function u4.onDynamicEventEnded(p24) -- Line: 144
end;

KnitClient.CreateController(u4.new());

return nil;