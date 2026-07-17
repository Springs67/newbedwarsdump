-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local SkyboxId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "skybox", "skybox-util").SkyboxId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "DesertEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy), GameSound (copy), SkyboxId (copy), u1 (copy)
    BaseEnvironmentPresetController.constructor(p4, EnvironmentPreset.Desert, {
        ColorCorrectionEffect = {
            TintColor = Color3.fromRGB(255, 242, 230)
        }
    }, {
        {
            baseVolumeOverride = 7,
            ambientSoundName = GameSound.WIND_AMBIENCE
        }
    }, SkyboxId.Sunset, {
        sounds = {
            {
                soundId = GameSound.DESERT_ISLAND_MUSIC
            },
            {
                volumeMultiplier = 0.65,
                soundId = GameSound.DESERT_TRAILER_MUSIC
            },
            {
                soundId = GameSound.DESERT_BOSS_MUSIC
            }
        }
    });
    p4.Name = "DesertEnvironmentPresetController";
    p4.desertSandstormMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 48
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p5);
end;

function u2.onEnable(p6) -- Line: 51
    local mapMeta = p6.mapMeta;

    if mapMeta ~= nil then
        mapMeta = mapMeta.environment;

        if mapMeta ~= nil then
            mapMeta = mapMeta.desertSettings;
        end;
    end;

    p6.sandstormSettings = mapMeta;
end;

function u2.onIntensityChanged(p7, p8) -- Line: 62
    -- upvalues: KnitClient (copy)
    if not p7.weatherIntensityInitialized then
        KnitClient.Controllers.SandstormWeatherParticleController:enable(p8);
        p7.maid:GiveTask(function() -- Line: 66
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.SandstormWeatherParticleController:disable();
        end);
    end;

    KnitClient.Controllers.SandstormWeatherParticleController:setIntensity(p8);
end;

function u2.onDynamicEventStarted(u9) -- Line: 72
    -- upvalues: WatchCharacter (copy), Players (copy)
    u9.desertSandstormMaid:DoCleaning();
    u9.desertSandstormMaid:GiveTask(u9:setDesertSandstormEnvironment(true));
    u9:applySpeedReduction();
    u9.dynamicWeatherEventMaid:GiveTask(WatchCharacter(function(p10, p11) -- Line: 76
        -- upvalues: Players (ref), u9 (copy)
        if p10 == Players.LocalPlayer then
            task.delay(1, function() -- Line: 78
                -- upvalues: u9 (ref)
                if u9.weatherEventIsActive then
                    u9:applySpeedReduction();
                end;
            end);
        end;
    end));
end;

function u2.onDynamicEventEnded(p12) -- Line: 87
    p12.desertSandstormMaid:DoCleaning();
    p12.desertSandstormMaid:GiveTask(p12:setDesertSandstormEnvironment(false));
end;

function u2.applySpeedReduction(p13) -- Line: 92
    -- upvalues: KnitClient (copy)
    local v14 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0.8
    });
    p13.desertSandstormMaid:GiveTask(v14);
end;

function u2.setDesertSandstormEnvironment(u15, u16) -- Line: 98
    -- upvalues: u1 (copy), KnitClient (copy), default (copy), Linear (copy)
    local v17 = u1.new();
    local u18 = KnitClient.Controllers.LightingController:getAtmosphere();

    if not u18 then
        return v17;
    end;

    if u16 then
        u15.lastAtmosphereDensity = u18.Density;
    end;

    local u20 = default(3, Linear, function(p19) -- Line: 107
        -- upvalues: u16 (copy), u15 (copy), u18 (copy)
        if not u16 then
            p19 = 1 - p19;
        end;

        local lastAtmosphereDensity = u15.lastAtmosphereDensity;
        u18.Density = math.lerp(lastAtmosphereDensity == nil and 0 or lastAtmosphereDensity, 0.6, p19);
    end);
    v17:GiveTask(function() -- Line: 116
        -- upvalues: u20 (copy)
        if u20.Running then
            u20:Cancel();
        end;
    end);

    return v17;
end;

KnitClient.CreateController(u2.new());

return nil;