-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchPlayerCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "footstep-sounds");
local BlockFootstepSound = v3.BlockFootstepSound;
local FootstepSounds = v3.FootstepSounds;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EnvironmentPreset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset;
local WinterEnvironment = RuntimeLib.import(script, script.Parent.Parent, "lighting-environments", "winter-environment").WinterEnvironment;
local BaseEnvironmentPresetController = RuntimeLib.import(script, script.Parent, "base-environment-preset-controller").BaseEnvironmentPresetController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "WinterEnvironmentPresetController";
    end,

    __index = BaseEnvironmentPresetController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: BaseEnvironmentPresetController (copy), EnvironmentPreset (copy), WinterEnvironment (copy), GameSound (copy), u1 (copy)
    BaseEnvironmentPresetController.constructor(p6, EnvironmentPreset.Winter, WinterEnvironment, {
        {
            ambientSoundName = GameSound.AMBIENCE_SNOW
        }
    }, nil, {
        sounds = {
            {
                volumeMultiplier = 0.4,
                soundId = GameSound.WINTER_EVENT_MINIGAME_MUSIC
            }
        }
    });
    p6.Name = "WinterEnvironmentPresetController";
    p6.winterBlizzardMaid = u1.new();
end;

function u4.KnitStart(p7) -- Line: 46
    -- upvalues: BaseEnvironmentPresetController (copy)
    BaseEnvironmentPresetController.KnitStart(p7);
end;

function u4.onEnable(p8) -- Line: 49
    local mapMeta = p8.mapMeta;

    if mapMeta ~= nil then
        mapMeta = mapMeta.environment;

        if mapMeta ~= nil then
            mapMeta = mapMeta.winterSettings;
        end;
    end;

    p8.winterSettings = mapMeta;
end;

function u4.onIntensityChanged(p9, p10) -- Line: 60
    -- upvalues: KnitClient (copy)
    if not p9.weatherIntensityInitialized then
        KnitClient.Controllers.SnowWeatherParticleController:enable(p10);
        p9.maid:GiveTask(function() -- Line: 64
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.SnowWeatherParticleController:disable();
        end);
    end;

    KnitClient.Controllers.SnowWeatherParticleController:setIntensity(p10);
end;

function u4.onDynamicEventStarted(p11) -- Line: 70
    p11.winterBlizzardMaid:DoCleaning();
    p11.winterBlizzardMaid:GiveTask(p11:setWinterBlizzardEnvironment(true));
    p11:setupFrostedFeet();
end;

function u4.onDynamicEventEnded(p12) -- Line: 76
    p12.winterBlizzardMaid:DoCleaning();
    p12.winterBlizzardMaid:GiveTask(p12:setWinterBlizzardEnvironment(false));
end;

function u4.setWinterBlizzardEnvironment(u13, u14) -- Line: 81
    -- upvalues: u1 (copy), KnitClient (copy), default (copy), Linear (copy)
    local v15 = u1.new();
    local u16 = KnitClient.Controllers.LightingController:getAtmosphere();

    if not u16 then
        return v15;
    end;

    if u14 then
        u13.lastAtmosphereDensity = u16.Density;
    end;

    local u18 = default(3, Linear, function(p17) -- Line: 90
        -- upvalues: u14 (copy), u13 (copy), u16 (copy)
        if not u14 then
            p17 = 1 - p17;
        end;

        local lastAtmosphereDensity = u13.lastAtmosphereDensity;
        u16.Density = math.lerp(lastAtmosphereDensity == nil and 0 or lastAtmosphereDensity, 0.4, p17);
    end);
    v15:GiveTask(function() -- Line: 99
        -- upvalues: u18 (copy)
        if u18.Running then
            u18:Cancel();
        end;
    end);

    return v15;
end;

function u4.setupFrostedFeet(u19) -- Line: 106
    -- upvalues: BlockFootstepSound (copy), FootstepSounds (copy), KnitClient (copy), Players (copy), WatchPlayerCharacter (copy), ReplicatedStorage (copy), AccessoryUtil (copy), WeldUtil (copy)
    local v20 = FootstepSounds[BlockFootstepSound.ICE];

    if v20 then
        u19.winterBlizzardMaid:GiveTask(KnitClient.Controllers.FootstepsController.footstepModifier:addModifier({
            localVolumeMultiplier = 2,
            localFootstepFrequency = 0.13513513513513511,
            soundConfig = v20
        }));
    end;

    local function _(p21) -- Line: 117
        -- upvalues: u19 (copy), WatchPlayerCharacter (ref), ReplicatedStorage (ref), AccessoryUtil (ref), WeldUtil (ref)
        u19.winterBlizzardMaid:GiveTask(WatchPlayerCharacter(p21, function(u22, u23) -- Line: 118
            -- upvalues: ReplicatedStorage (ref), AccessoryUtil (ref), u19 (ref), WeldUtil (ref)
            task.defer(function() -- Line: 119
                -- upvalues: ReplicatedStorage (ref), AccessoryUtil (ref), u22 (copy), u23 (copy), u19 (ref), WeldUtil (ref)
                local frost_boots = ReplicatedStorage.Assets.Armor:FindFirstChild("frost_boots");

                if frost_boots ~= nil then
                    local v24 = frost_boots:GetChildren();

                    local function v27(p25) -- Line: 123
                        -- upvalues: AccessoryUtil (ref), u22 (ref), u23 (ref), u19 (ref)
                        if p25:IsA("Accessory") then
                            local u26 = p25:Clone();
                            AccessoryUtil:setAccessoryTransparency(u26, 1);
                            AccessoryUtil:addAccessory(u22, u26);
                            u23:GiveTask(AccessoryUtil:tweenAccessoryTransparency(u26, 0.5, 3));
                            u19.winterBlizzardMaid:GiveTask(function() -- Line: 129
                                -- upvalues: u23 (ref), AccessoryUtil (ref), u26 (copy)
                                u23:GiveTask(AccessoryUtil:tweenAccessoryTransparency(u26, 1, 3));
                                task.delay(1, function() -- Line: 131
                                    -- upvalues: u26 (ref)
                                    u26:Destroy();
                                end);
                            end);
                            u23:GiveTask(u26);
                        end;
                    end;

                    for i, v in v24 do
                        v27(v, i - 1, v24);
                    end;
                end;

                WeldUtil:weldCharacterAccessories(u22);
            end);
        end));
    end;

    for i, v in Players:GetPlayers() do
        local _ = i - 1;
        u19.winterBlizzardMaid:GiveTask(WatchPlayerCharacter(v, function(u28, u29) -- Line: 118
            -- upvalues: ReplicatedStorage (ref), AccessoryUtil (ref), u19 (copy), WeldUtil (ref)
            task.defer(function() -- Line: 119
                -- upvalues: ReplicatedStorage (ref), AccessoryUtil (ref), u28 (copy), u29 (copy), u19 (ref), WeldUtil (ref)
                local frost_boots = ReplicatedStorage.Assets.Armor:FindFirstChild("frost_boots");

                if frost_boots ~= nil then
                    local v30 = frost_boots:GetChildren();

                    local function v33(p31) -- Line: 123
                        -- upvalues: AccessoryUtil (ref), u28 (ref), u29 (ref), u19 (ref)
                        if p31:IsA("Accessory") then
                            local u32 = p31:Clone();
                            AccessoryUtil:setAccessoryTransparency(u32, 1);
                            AccessoryUtil:addAccessory(u28, u32);
                            u29:GiveTask(AccessoryUtil:tweenAccessoryTransparency(u32, 0.5, 3));
                            u19.winterBlizzardMaid:GiveTask(function() -- Line: 129
                                -- upvalues: u29 (ref), AccessoryUtil (ref), u32 (copy)
                                u29:GiveTask(AccessoryUtil:tweenAccessoryTransparency(u32, 1, 3));
                                task.delay(1, function() -- Line: 131
                                    -- upvalues: u32 (ref)
                                    u32:Destroy();
                                end);
                            end);
                            u29:GiveTask(u32);
                        end;
                    end;

                    for i2, v4 in v30 do
                        v33(v4, i2 - 1, v30);
                    end;
                end;

                WeldUtil:weldCharacterAccessories(u28);
            end);
        end));
    end;
end;

KnitClient.CreateController(u4.new());

return nil;