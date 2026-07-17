-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local NIGHT_ENVIRONMENT = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "night-environment").NIGHT_ENVIRONMENT;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "NightEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy)
    BaseEnvironmentPresetController.constructor(p7, EnvironmentPreset.Night);
    p7.Name = "NightEnvironmentPresetController";
end;

function u5.KnitStart(p8) -- Line: 40
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p8);
end;

function u5.onEnable(u9) -- Line: 43
    -- upvalues: NIGHT_ENVIRONMENT (copy), ClientSyncEvents (copy), MatchState (copy), default2 (copy), PlaceUtil (copy)
    task.spawn(function() -- Line: 44
        -- upvalues: u9 (copy), NIGHT_ENVIRONMENT (ref), ClientSyncEvents (ref), MatchState (ref)
        u9:createAtmosphere(NIGHT_ENVIRONMENT);
        u9:setupSky(NIGHT_ENVIRONMENT);
        ClientSyncEvents.MatchStateChange:connect(function(p10) -- Line: 48
            -- upvalues: MatchState (ref), u9 (ref), NIGHT_ENVIRONMENT (ref)
            if p10.matchState == MatchState.RUNNING then
                task.delay(20, function() -- Line: 50
                    -- upvalues: u9 (ref), NIGHT_ENVIRONMENT (ref)
                    u9:tweenTime(20, 20);
                    u9:tweenMoonSize(NIGHT_ENVIRONMENT, 15, 20);
                end);
                task.delay(40, function() -- Line: 54
                    -- upvalues: u9 (ref), NIGHT_ENVIRONMENT (ref)
                    u9:tweenTime(21, 20);
                    u9:tweenMoonSize(NIGHT_ENVIRONMENT, 17, 20);
                end);
                task.delay(60, function() -- Line: 58
                    -- upvalues: u9 (ref), NIGHT_ENVIRONMENT (ref)
                    u9:tweenTime(22, 20);
                    u9:tweenMoonSize(NIGHT_ENVIRONMENT, 19, 20);
                end);
                task.delay(80, function() -- Line: 62
                    -- upvalues: u9 (ref), NIGHT_ENVIRONMENT (ref)
                    u9:tweenTime(23, 20);
                    u9:tweenMoonSize(NIGHT_ENVIRONMENT, 21, 20);
                end);
            end;
        end);
    end);
    default2.Client:Get("SpawnFireFly"):Connect(function(p11) -- Line: 69
        -- upvalues: u9 (copy)
        u9:spawnFirefly(p11.positions);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p12) -- Line: 72
    end);
    PlaceUtil.isGameServer();
end;

function u5.setupSky(p13, p14) -- Line: 76
    -- upvalues: Lighting (copy), u3 (copy), KnitClient2 (copy), Workspace (copy)
    if p14.BlurEffect then
        local environmentMaid = p13.environmentMaid;
        local v15 = {};

        for i, v in p14.BlurEffect do
            v15[i] = v;
        end;

        v15.Parent = Lighting;
        environmentMaid:GiveTask(u3("BlurEffect", v15));
    end;

    if p14.BloomEffect then
        local environmentMaid = p13.environmentMaid;
        local v16 = {};

        for i, v in p14.BloomEffect do
            v16[i] = v;
        end;

        v16.Parent = Lighting;
        environmentMaid:GiveTask(u3("BloomEffect", v16));
    end;

    if p14.DepthOfFieldEffect then
        local environmentMaid = p13.environmentMaid;
        local v17 = {};

        for i, v in p14.DepthOfFieldEffect do
            v17[i] = v;
        end;

        v17.Parent = Lighting;
        environmentMaid:GiveTask(u3("DepthOfFieldEffect", v17));
    end;

    if p14.SunRaysEffect then
        local environmentMaid = p13.environmentMaid;
        local sunRayModifier = KnitClient2.Controllers.LightingController.sunRayModifier;
        local v18 = {};

        for i, v in p14.SunRaysEffect do
            v18[i] = v;
        end;

        environmentMaid:GiveTask(sunRayModifier:addModifier(10, v18));
    end;

    if p14.Sky then
        local skyModifier = KnitClient2.Controllers.LightingController.skyModifier;
        local v19 = {};

        for i, v in p14.Sky do
            v19[i] = v;
        end;

        p13.skyModifier = skyModifier:addModifier(10, v19);
        p13.environmentMaid:GiveTask(p13.skyModifier);
    end;

    if p14.Clouds then
        local environmentMaid = p13.environmentMaid;
        local v20 = {};

        for i, v in p14.Clouds do
            v20[i] = v;
        end;

        v20.Parent = Workspace.Terrain;
        environmentMaid:GiveTask(u3("Clouds", v20));
    end;
end;

function u5.createAtmosphere(p21, p22) -- Line: 132
    -- upvalues: u3 (copy), Lighting (copy)
    local v23 = u3("ColorCorrectionEffect", {
        Parent = Lighting
    });
    local v24 = Lighting:FindFirstChildWhichIsA("Atmosphere") or u3("Atmosphere", {
        Parent = Lighting
    });
    p21:tweenLighting(p22);

    if p22.ColorCorrectionEffect then
        local Brightness = p22.ColorCorrectionEffect.Brightness;

        if Brightness ~= 0 and (Brightness == Brightness and Brightness) then
            v23.Brightness = p22.ColorCorrectionEffect.Brightness;
        end;

        local Contrast = p22.ColorCorrectionEffect.Contrast;

        if Contrast ~= 0 and (Contrast == Contrast and Contrast) then
            v23.Brightness = p22.ColorCorrectionEffect.Contrast;
        end;

        if p22.ColorCorrectionEffect.TintColor then
            v23.TintColor = p22.ColorCorrectionEffect.TintColor;
        end;
    end;

    if p22.Atmosphere then
        if p22.Atmosphere.Color then
            v24.Color = p22.Atmosphere.Color;
        end;

        if p22.Atmosphere.Decay then
            v24.Decay = p22.Atmosphere.Decay;
        end;

        local Glare = p22.Atmosphere.Glare;

        if Glare ~= 0 and (Glare == Glare and Glare) then
            v24.Glare = p22.Atmosphere.Glare;
        end;

        local Haze = p22.Atmosphere.Haze;

        if Haze ~= 0 and (Haze == Haze and Haze) then
            v24.Glare = p22.Atmosphere.Haze;
        end;
    end;
end;

function u5.tweenLighting(p25, p26) -- Line: 170
    -- upvalues: Lighting (copy), KnitClient2 (copy), u2 (copy)
    if p26.Lighting then
        local v27 = {
            Ambient = Lighting.Ambient,
            Brightness = Lighting.Brightness,
            ColorShift_Bottom = Lighting.ColorShift_Bottom,
            ColorShift_Top = Lighting.ColorShift_Top,
            EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
            EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
            OutdoorAmbient = Lighting.OutdoorAmbient,
            ShadowSoftness = Lighting.ShadowSoftness,
            ExposureCompensation = Lighting.ExposureCompensation,
            ClockTime = Lighting.ClockTime
        };

        if not p25.lightingModifier then
            local lightingModifier = KnitClient2.Controllers.LightingController.lightingModifier;
            local v28 = {};

            for i, v in v27 do
                v28[i] = v;
            end;

            p25.lightingModifier = lightingModifier:addModifier(10, v28);
        end;

        local v29 = {};
        local Lighting2 = p26.Lighting;

        if Lighting2 ~= nil then
            Lighting2 = Lighting2.Ambient;
        end;

        v29.Ambient = Lighting2;
        local Lighting3 = p26.Lighting;

        if Lighting3 ~= nil then
            Lighting3 = Lighting3.Brightness;
        end;

        v29.Brightness = Lighting3;
        local Lighting4 = p26.Lighting;

        if Lighting4 ~= nil then
            Lighting4 = Lighting4.ColorShift_Bottom;
        end;

        v29.ColorShift_Bottom = Lighting4;
        local Lighting5 = p26.Lighting;

        if Lighting5 ~= nil then
            Lighting5 = Lighting5.ColorShift_Top;
        end;

        v29.ColorShift_Top = Lighting5;
        local Lighting6 = p26.Lighting;

        if Lighting6 ~= nil then
            Lighting6 = Lighting6.EnvironmentDiffuseScale;
        end;

        v29.EnvironmentDiffuseScale = Lighting6;
        local Lighting7 = p26.Lighting;

        if Lighting7 ~= nil then
            Lighting7 = Lighting7.EnvironmentSpecularScale;
        end;

        v29.EnvironmentSpecularScale = Lighting7;
        local Lighting8 = p26.Lighting;

        if Lighting8 ~= nil then
            Lighting8 = Lighting8.OutdoorAmbient;
        end;

        v29.OutdoorAmbient = Lighting8;
        local Lighting9 = p26.Lighting;

        if Lighting9 ~= nil then
            Lighting9 = Lighting9.ShadowSoftness;
        end;

        v29.ShadowSoftness = Lighting9;
        local Lighting10 = p26.Lighting;

        if Lighting10 ~= nil then
            Lighting10 = Lighting10.ExposureCompensation;
        end;

        v29.ExposureCompensation = Lighting10;
        local Lighting11 = p26.Lighting;

        if Lighting11 ~= nil then
            Lighting11 = Lighting11.ClockTime;
        end;

        v29.ClockTime = Lighting11;

        if p26.Lighting and p25.lightingModifier then
            local v30 = u2.deepCopy(v29);

            for _, v in u2.entries(v30) do
                local v31 = v[1];
                local v32 = v[2];

                if type(v32) == "number" then
                    v30[v31] = v32 - v27[v31] + v27[v31];
                end;

                local _ = typeof(v32) == "Color3";
            end;

            if p25.lightingModifier then
                p25.lightingModifier:setProperties(v30);
            end;
        end;
    end;
end;

function u5.tweenTime(u33, u34, p35) -- Line: 273
    -- upvalues: Lighting (copy), default (copy), Linear (copy), u2 (copy)
    local ClockTime = Lighting.ClockTime;
    local u36 = {
        Ambient = Lighting.Ambient,
        Brightness = Lighting.Brightness,
        ColorShift_Bottom = Lighting.ColorShift_Bottom,
        ColorShift_Top = Lighting.ColorShift_Top,
        EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        ShadowSoftness = Lighting.ShadowSoftness,
        ExposureCompensation = Lighting.ExposureCompensation,
        ClockTime = u34
    };
    default(p35, Linear, function(p37) -- Line: 296
        -- upvalues: u2 (ref), u36 (copy), u34 (copy), ClockTime (copy), u33 (copy)
        local v38 = u2.deepCopy(u36);
        v38.ClockTime = (u34 - ClockTime) * p37 + ClockTime;

        if u33.lightingModifier then
            u33.lightingModifier:setProperties(v38);
        end;
    end);
end;

function u5.tweenMoonSize(u39, u40, u41, p42) -- Line: 304
    -- upvalues: default (copy), Linear (copy), u2 (copy)
    local skyModifier = u39.skyModifier;

    if skyModifier ~= nil then
        skyModifier = skyModifier:getProperties();
    end;

    if skyModifier == nil then
        skyModifier = nil;
    end;

    local MoonAngularSize = skyModifier.MoonAngularSize;

    if MoonAngularSize == 0 or (MoonAngularSize ~= MoonAngularSize or not MoonAngularSize) then
        return nil;
    end;

    default(p42, Linear, function(p43) -- Line: 318
        -- upvalues: u40 (copy), u2 (ref), u41 (copy), MoonAngularSize (copy), u39 (copy)
        if u40.Sky then
            local v44 = u2.deepCopy(u40.Sky);
            v44.MoonAngularSize = (u41 - MoonAngularSize) * p43 + MoonAngularSize;

            if u39.skyModifier then
                u39.skyModifier:setProperties(v44);
            end;
        end;
    end, 0, 1);
end;

u5.spawnFirefly = RuntimeLib.async(function(p45, p46) -- Line: 328
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local FireFly = ReplicatedStorage.Assets.Effects.FireFly;

    for _, v in p46 do
        local v47 = FireFly:Clone();
        v47.Parent = Workspace;
        v47.Position = v;
    end;
end);

function u5.onIntensityChanged(p48, p49) -- Line: 336
end;

function u5.onDynamicEventStarted(p50) -- Line: 338
end;

function u5.onDynamicEventEnded(p51) -- Line: 340
end;

KnitClient.CreateController(u5.new());

return nil;