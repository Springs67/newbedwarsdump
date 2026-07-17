-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Controllers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient").Controllers;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "LightningMechanicController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: KnitController (copy), GameSound (copy)
    KnitController.constructor(p7);
    p7.Name = "LightningMechanicController";
    p7.staticSounds = {
        GameSound.LIGHTNING_STATIC_1,
        GameSound.LIGHTNING_STATIC_2,
        GameSound.LIGHTNING_STATIC_3,
        GameSound.LIGHTNING_STATIC_4,
        GameSound.LIGHTNING_STATIC_5,
        GameSound.LIGHTNING_STATIC_6
    };
end;

function u5.KnitStart(u8) -- Line: 44
    -- upvalues: KnitController (copy), KnitClient2 (copy), QueueType (copy), KnitClient (copy), GameSound (copy), default2 (copy), SoundManager (copy), u3 (copy), Lighting (copy), default (copy), Linear (copy), InQuad (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), Controllers (copy)
    KnitController.KnitStart(u8);
    task.spawn(function() -- Line: 46
        -- upvalues: KnitClient2 (ref), QueueType (ref), KnitClient (ref), GameSound (ref), u8 (copy)
        local v9, v10 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

        if v9 and (v10 == QueueType.BEDWARS_DISASTERS_20v20 or v10 == QueueType.BEDWARS_DISASTERS_TO4) then
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
            u8.initialAtmosphereColor = KnitClient2.Controllers.LightingController:getAtmosphere().Color;
        end;
    end);
    default2.Client:Get("LightningMechanic_StormStarted"):Connect(function() -- Line: 61
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), KnitClient2 (ref), u3 (ref), Lighting (ref), default (ref), Linear (ref)
        u8.stormSoundLoopRef = SoundManager:playSound(GameSound.LIGHTNING_THUNDER_STORM_LOOP, {
            looped = true,
            volumeMultiplier = 2.5
        });
        local Color = KnitClient2.Controllers.LightingController:getAtmosphere().Color;

        if not u8.currentAtmosphereModifier then
            u8.currentAtmosphereModifier = KnitClient2.Controllers.LightingController:getAtmosphereModifier():addModifier(30, {
                Density = 0,
                Haze = 0,
                Color = Color
            });
        end;

        if u8.colorCorrectionEffect then
            u8.colorCorrectionEffect:Destroy();
            u8.colorCorrectionEffect = nil;
        end;

        if not u8.colorCorrectionEffect then
            u8.colorCorrectionEffect = u3("ColorCorrectionEffect", {
                Name = "LightningMechanicColorCorrectionEffect",
                Saturation = 0,
                Enabled = true,
                TintColor = Color3.fromRGB(255, 255, 255),
                Parent = Lighting
            });
        end;

        if u8.currentAtmosphereTween then
            u8.currentAtmosphereTween:Cancel();
        end;

        u8.currentAtmosphereTween = default(3, Linear, function(p11) -- Line: 95
            -- upvalues: u8 (ref), Color (copy)
            local currentAtmosphereModifier = u8.currentAtmosphereModifier;
            local v12 = {};

            for i, v in u8.currentAtmosphereModifier:getProperties() do
                v12[i] = v;
            end;

            v12.Color = Color:Lerp(Color3.fromRGB(8, 0, 59), p11);
            v12.Density = 0.3 * p11;
            v12.Haze = 2.25 * p11;
            currentAtmosphereModifier:setProperties(v12);
            u8.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(145, 135, 191), p11);
        end, 0, 1);
    end);
    default2.Client:Get("LightningMechanic_StormEnded"):Connect(function() -- Line: 108
        -- upvalues: u8 (copy), SoundManager (ref), default (ref), InQuad (ref)
        if u8.stormSoundLoopRef then
            task.spawn(function() -- Line: 111
                -- upvalues: SoundManager (ref), u8 (ref)
                SoundManager:tweenSoundVolume(u8.stormSoundLoopRef, 0, 3);
                task.wait(3.1);

                if u8.stormSoundLoopRef then
                    u8.stormSoundLoopRef:Stop();
                    u8.stormSoundLoopRef:Destroy();
                end;
            end);
        end;

        if u8.currentAtmosphereModifier then
            if u8.currentAtmosphereTween then
                u8.currentAtmosphereTween:Cancel();
            end;

            u8.currentAtmosphereTween = default(3, InQuad, function(p13) -- Line: 124
                -- upvalues: u8 (ref)
                local currentAtmosphereModifier = u8.currentAtmosphereModifier;
                local v14 = {};

                for i, v in u8.currentAtmosphereModifier:getProperties() do
                    v14[i] = v;
                end;

                v14.Color = Color3.fromRGB(8, 0, 59):Lerp(u8.initialAtmosphereColor or Color3.fromRGB(255, 255, 255), p13);
                v14.Density = 0.3 - 0.3 * p13;
                v14.Haze = 2.25 - 2.25 * p13;
                currentAtmosphereModifier:setProperties(v14);
                u8.colorCorrectionEffect.TintColor = Color3.fromRGB(145, 135, 191):Lerp(Color3.fromRGB(255, 255, 255), p13);
            end, 0, 1);
        end;
    end);
    default2.Client:Get("LightningMechanic_ShowStaticOnPlayers"):Connect(function(p15) -- Line: 139
        -- upvalues: u8 (copy)
        local function _(p16) -- Line: 141
            -- upvalues: u8 (ref)
            u8:playStaticEffectForPlayer(p16);
        end;

        for i, v in p15.staticPlayers do
            local _ = i - 1;
            u8:playStaticEffectForPlayer(v);
        end;
    end);
    default2.Client:Get("LightningMechanic_ShowLightningStrikeIndicator"):Connect(function(u17) -- Line: 149
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), u8 (copy)
        local u18 = ReplicatedStorage.Assets.Effects.LightningMechanic_Indicator:Clone();
        u18.Parent = Workspace;
        u18.Position = u17.position;
        task.spawn(function() -- Line: 153
            -- upvalues: SoundManager (ref), u8 (ref), u17 (copy)
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
            task.wait(0.5);
            SoundManager:playSound(u8:getRandomStaticSound(), {
                position = u17.position
            });
        end);
        task.delay(3, function() -- Line: 182
            -- upvalues: u18 (copy)
            u18:Destroy();
        end);
    end);
    default2.Client:Get("LightningMechanic_LightningStrike"):Connect(function(p19) -- Line: 187
        -- upvalues: Players (ref), KnitClient2 (ref), Controllers (ref)
        local v20 = false;
        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer.Character;

            if LocalPlayer ~= nil then
                LocalPlayer = LocalPlayer.PrimaryPart;

                if LocalPlayer ~= nil then
                    LocalPlayer = LocalPlayer.Position;
                end;
            end;
        end;

        if LocalPlayer then
            v20 = (LocalPlayer - p19.position).Magnitude < 50;

            if v20 then
                KnitClient2.Controllers.ScreenShakeController:shake(LocalPlayer, Vector3.new(0, -1, 0), {
                    magnitude = 0.5,
                    cycles = 3,
                    duration = 0.3,
                    zMagnitude = 0.2
                });
            end;
        end;

        Controllers.WizardLightningStrikeController:playLightningEffects(p19.position, v20);
    end);
end;

function u5.playStaticEffectForPlayer(p21, p22) -- Line: 217
    -- upvalues: SoundManager (copy)
    local Character = p22.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v23 = p21:getOrCreateStaticShockParticlesParent(p22);

    if not v23 then
        return nil;
    end;

    local u24 = v23:GetChildren();
    task.spawn(function() -- Line: 233
        -- upvalues: u24 (copy)
        local function _(p25) -- Line: 234
            if not p25:IsA("ParticleEmitter") then
                return nil;
            end;

            p25.Enabled = true;
        end;

        for i, v in u24 do
            local _ = i - 1;

            if v:IsA("ParticleEmitter") then
                v.Enabled = true;
            end;
        end;

        task.wait(0.2);

        local function _(p26) -- Line: 244
            if not p26:IsA("ParticleEmitter") then
                return nil;
            end;

            p26.Enabled = false;
        end;

        for i, v in u24 do
            local _ = i - 1;

            if v:IsA("ParticleEmitter") then
                v.Enabled = false;
            end;
        end;
    end);
    SoundManager:playSound(p21:getRandomStaticSound(), {
        position = Character.Position
    });
end;

function u5.getOrCreateStaticShockParticlesParent(p27, p28) -- Line: 259
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy)
    local Character = p28.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local LightningMechanic_StaticParticles = Character:FindFirstChild("LightningMechanic_StaticParticles");

    if LightningMechanic_StaticParticles then
        return LightningMechanic_StaticParticles;
    end;

    local v29 = ReplicatedStorage.Assets.Effects.LightningMechanic_StaticParticles:Clone();
    v29.Parent = Character;
    v29.CFrame = Character.CFrame;
    WeldUtil:weldParts(v29, Character);
end;

function u5.getRandomStaticSound(p30) -- Line: 279
    return p30.staticSounds[math.random(0, #p30.staticSounds - 1) + 1];
end;

KnitClient.CreateController(u5.new());

return nil;