-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GroupModifierBehavior = v1.GroupModifierBehavior;
local MathExtras = v1.MathExtras;
local ModifierGroup = v1.ModifierGroup;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Lighting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BaseEnvironmentSettings = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "base-environment-settings").BaseEnvironmentSettings;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BaseEnvironmentPresetController";
    end,

    __index = KnitController
});
v4.__index = v4;

function v4.constructor(p5, p6, p7, p8, p9, p10) -- Line: 27
    -- upvalues: KnitController (copy), u2 (copy), ModifierGroup (copy), Lighting (copy), u3 (copy), GroupModifierBehavior (copy)
    KnitController.constructor(p5);
    p5.preset = p6;
    p5.environmentTable = p7;
    p5.ambientSoundSettings = p8;
    p5.skyboxId = p9;
    p5.backgroundMusicOverride = p10;
    p5.Name = "BaseEnvironmentPresetController";
    p5.currentIntensity = 0;
    p5.environmentMaid = u2.new();
    p5.colorCorrectionModifier = ModifierGroup.new(Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or u3("ColorCorrectionEffect", {
        Parent = Lighting
    }), {
        baseProperties = {
            Contrast = 0.05,
            Saturation = 0,
            TintColor = Color3.fromRGB(255, 255, 255)
        },
        behavior = GroupModifierBehavior.Merge
    });
    p5.ambientSoundInstances = {};
    p5.ambientSoundVolumeTweens = {};
    p5.weatherIntensityInitialized = false;
    p5.maid = u2.new();
    p5.dynamicWeatherEventMaid = u2.new();
    p5.enabled = false;
    p5.weatherEventIsActive = false;
end;

function v4.KnitStart(u11) -- Line: 55
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.KnitStart(u11);
    default2.Client:Get("SetupWeather"):Connect(function(p12) -- Line: 57
        -- upvalues: u11 (copy)
        if p12.preset == u11.preset then
            u11:enable();
        end;
    end);
    default2.Client:Get("DynamicWeatherEventStarted"):Connect(function(p13) -- Line: 64
        -- upvalues: u11 (copy)
        if p13.preset == u11.preset then
            u11.weatherEventIsActive = true;
            u11:onDynamicEventStarted();
        end;
    end);
    default2.Client:Get("DynamicWeatherEventEnded"):Connect(function(p14) -- Line: 70
        -- upvalues: u11 (copy)
        if p14.preset == u11.preset then
            u11.weatherEventIsActive = false;
            u11.dynamicWeatherEventMaid:DoCleaning();
            u11:onDynamicEventEnded();
        end;
    end);
end;

function v4.enable(u15) -- Line: 78
    -- upvalues: KnitClient (copy), SoundManager (copy), default2 (copy)
    u15.enabled = true;
    u15.maid:GiveTask(function() -- Line: 80
        -- upvalues: u15 (copy)
        u15.enabled = false;
    end);

    if u15.environmentTable then
        KnitClient.Controllers.EnvironmentController:setupEnvironment(u15.environmentTable);
    end;

    if u15.ambientSoundSettings ~= nil and #u15.ambientSoundSettings > 0 then
        KnitClient.Controllers.AmbientSoundController:stopAmbience();

        for _, v in u15.ambientSoundSettings do
            local v16 = SoundManager:playModifiableSound(v.ambientSoundName, {
                looped = true
            });

            if v16 then
                local baseVolumeOverride = v.baseVolumeOverride;

                if baseVolumeOverride == nil then
                    baseVolumeOverride = v16.Volume;
                end;

                u15.ambientSoundInstances[v.ambientSoundName] = {
                    sound = v16,
                    originalVolume = baseVolumeOverride,
                    setting = v
                };
            end;
        end;

        u15.maid:GiveTask(function() -- Line: 111
            -- upvalues: u15 (copy)
            for _, v in u15.ambientSoundInstances do
                v.sound:Stop();
            end;

            table.clear(u15.ambientSoundInstances);
        end);
    end;

    if u15.skyboxId ~= nil then
        KnitClient.Controllers.SkyboxController:setSkybox(u15.skyboxId);
    end;

    local u18 = default2.Client:Get("EnvironmentIntensityVarianceUpdate"):Connect(function(p17) -- Line: 123
        -- upvalues: u15 (copy)
        u15:setIntensity(p17.newIntensity);
    end);
    u15.maid:GiveTask(function() -- Line: 126
        -- upvalues: u18 (copy)
        u18:Disconnect();
    end);
    default2.Client:Get("RequestEnvironmentWeatherIntensityFromServer"):CallServerAsync():andThen(function(p19) -- Line: 131
        -- upvalues: u15 (copy)
        if p19 ~= nil then
            u15:setIntensity(p19);
        end;
    end);

    if u15.backgroundMusicOverride ~= nil and #u15.backgroundMusicOverride.sounds > 0 then
        task.delay(1, function() -- Line: 139
            -- upvalues: KnitClient (ref), u15 (copy)
            local BackgroundMusicController = KnitClient.Controllers.BackgroundMusicController;
            local soundId = u15.backgroundMusicOverride.sounds[1].soundId;
            local v20 = {};
            local volumeMultiplier = u15.backgroundMusicOverride.sounds[1].volumeMultiplier;
            v20.volumeMultiplier = volumeMultiplier == nil and 1 or volumeMultiplier;
            BackgroundMusicController:startMusic(soundId, nil, v20);
        end);
    end;

    u15:onEnable();
end;

function v4.setIntensity(p21, p22) -- Line: 156
    -- upvalues: MathExtras (copy), BaseEnvironmentSettings (copy), default (copy), Linear (copy)
    if not p21.enabled then
        return nil;
    end;

    p21.currentIntensity = p22;

    for i, v in p21.ambientSoundInstances do
        if not v.setting.intensityInfluencedDisabled then
            local Volume = v.sound.Volume;
            local volumeMultiplierMinOverride = v.setting.volumeMultiplierMinOverride;

            if volumeMultiplierMinOverride == nil then
                volumeMultiplierMinOverride = BaseEnvironmentSettings.AMBIENT_SOUND_VOLUME_MULTIPLIER_MIN;
            end;

            local volumeMultiplierMaxOverride = v.setting.volumeMultiplierMaxOverride;

            if volumeMultiplierMaxOverride == nil then
                volumeMultiplierMaxOverride = BaseEnvironmentSettings.AMBIENT_SOUND_VOLUME_MULTIPLIER_MAX;
            end;

            local v23 = MathExtras:lerp(volumeMultiplierMinOverride, volumeMultiplierMaxOverride, p22);
            local v24 = v.originalVolume * v23;
            local v25 = p21.ambientSoundVolumeTweens[i];

            if v25 ~= nil then
                v25:Cancel();
            end;

            local v27 = default(3, Linear, function(p26) -- Line: 182
                -- upvalues: v (copy)
                v.sound.Volume = p26;
            end, Volume, v24);
            p21.ambientSoundVolumeTweens[i] = v27;
            v27:Play();
        end;
    end;

    p21:onIntensityChanged(p22);
    p21.weatherIntensityInitialized = true;
end;

return {
    BaseEnvironmentPresetController = v4
};