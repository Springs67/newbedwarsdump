-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "FireworkController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 31
    -- upvalues: KnitController (copy), u3 (copy), Workspace (copy)
    KnitController.constructor(p7);
    p7.Name = "FireworkController";
    p7.fireworksFolder = u3("Folder", {
        Name = "Fireworks",
        Parent = Workspace
    });
end;

function u5.KnitStart(p8) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
end;

function u5.playFireworkEffect(p9, u10, p11, u12) -- Line: 42
    -- upvalues: u2 (copy), ReplicatedStorage (copy), FireworkType (copy), RandomUtil (copy), GameQueryUtil (copy), EffectUtil (copy), GameSound (copy), SoundManager (copy)
    local u13 = u2.new();
    local Fireworks = ReplicatedStorage.Assets.Effects.Fireworks;
    local v14 = nil;

    if p11 == FireworkType.NORMAL then
        v14 = RandomUtil.fromList(Fireworks.Firework_1, Fireworks.Firework_2, Fireworks.Firework_3);
    elseif p11 == FireworkType.SPARKS then
        v14 = RandomUtil.fromList(Fireworks.Firework_4);
    elseif p11 == FireworkType.HEART then
        v14 = RandomUtil.fromList(Fireworks.FireworkHearts_1);
    elseif p11 == FireworkType.DV then
        v14 = RandomUtil.fromList(Fireworks.Firework_Dv_1);
    elseif p11 == FireworkType.NEW_YEARS then
        v14 = Fireworks.FireworkNewYears;
    elseif p11 == FireworkType.GOOSE then
        v14 = Fireworks.Goose;
    elseif p11 == FireworkType.FIREWORK_CRATE then
        v14 = Fireworks.FireworkCrate;
    elseif p11 == FireworkType.METEOR then
        v14 = Fireworks.Meteor;
    elseif p11 == FireworkType.RAINBOW_METEOR then
        v14 = Fireworks.RainbowMeteor;
    elseif p11 == FireworkType.CONFETTI then
        v14 = Fireworks.Confetti;
    else
        error("Unknown firework type:", p11);
    end;

    local u15 = v14:Clone();
    local v16;

    if u12 == nil then
        v16 = u12;
    else
        v16 = u12.color;
    end;

    if v16 then
        local v17 = u15:GetDescendants();

        local function v19(p18) -- Line: 76
            -- upvalues: u12 (copy)
            if p18:IsA("ParticleEmitter") and u12.color ~= nil then
                p18.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u12.color), ColorSequenceKeypoint.new(1, u12.color) });
            end;
        end;

        for i, v in v17 do
            v19(v, i - 1, v17);
        end;
    end;

    u13:GiveTask(u15);
    u15.CanCollide = false;
    u15.CanQuery = false;
    u15.Anchored = true;
    u15.Transparency = 1;
    GameQueryUtil:setQueryIgnored(u15, true);
    u15.Parent = p9.fireworksFolder;
    u15.CFrame = CFrame.new(u10);
    local v20 = u15:GetChildren();
    local v21 = {};
    local v22;

    if u12 == nil then
        v22 = u12;
    else
        v22 = u12.sizeMultiplier;
    end;

    v21.sizeMultiplier = v22;
    EffectUtil:playEffects(v20, nil, v21);
    local v23 = RandomUtil.fromList(GameSound.FIREWORK_EXPLODE_1, GameSound.FIREWORK_EXPLODE_2, GameSound.FIREWORK_EXPLODE_3);
    local v24;

    if u12 == nil then
        v24 = u12;
    else
        v24 = u12.noSound;
    end;

    if not v24 then
        local v25 = {
            rollOffMaxDistance = 1000,
            rollOffMinDistance = 200,
            position = u10
        };
        local v26;

        if u12 == nil then
            v26 = u12;
        else
            v26 = u12.volumeMultiplier;
        end;

        v25.volumeMultiplier = v26;
        local v27;

        if u12 == nil then
            v27 = u12;
        else
            v27 = u12.popSoundPlaybackSpeedMultiplier;
        end;

        v25.playbackSpeedMultiplier = v27;
        u13:GiveTask(SoundManager:playSound(v23, v25));
    end;

    local u28 = RandomUtil.fromList(GameSound.FIREWORK_CRACKLE_1, GameSound.FIREWORK_CRACKLE_2, GameSound.FIREWORK_CRACKLE_3);
    task.delay(0.4, function() -- Line: 134
        -- upvalues: u12 (copy), u13 (copy), SoundManager (ref), u10 (copy), u28 (copy)
        local v29 = u12;

        if v29 ~= nil then
            v29 = v29.noSound;
        end;

        if not v29 then
            local v30 = {
                rollOffMaxDistance = 1000,
                position = u10
            };
            local v31 = u12;

            if v31 ~= nil then
                v31 = v31.volumeMultiplier;
            end;

            v30.volumeMultiplier = v31;
            u13:GiveTask(SoundManager:playSound(u28, v30));
        end;
    end);
    task.delay(8, function() -- Line: 155
        -- upvalues: u15 (copy)
        u15:Destroy();
    end);

    return u13;
end;

KnitClient.CreateController(u5.new());

return nil;