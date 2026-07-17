-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "DogPersonController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "DogPersonController";
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient2 (copy), GameSound (copy), AnimationType (copy)
    KnitController.KnitStart(p6);
    KnitClient2.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.BHAA_GRUNT_1,
            GameSound.BHAA_GRUNT_2,
            GameSound.BHAA_SPAWN,
            GameSound.BHAA_SPIKE,
            GameSound.BHAA_SPIKE_WARMUP
        },
        animations = {
            AnimationType.BHAA_ATTACK,
            AnimationType.BHAA_DEATH,
            AnimationType.BHAA_IDLE,
            AnimationType.BHAA_MOVEMENT,
            AnimationType.BHAA_SUMMON,
            AnimationType.BHAA_ROCKSPIKE,
            AnimationType.BHAA_ROCKWAVE,
            AnimationType.BHAA_SPAWN
        }
    });
end;

function u3.createClientModel(p7, p8) -- Line: 53
    -- upvalues: ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if not p8.PrimaryPart then
        return nil;
    end;

    local v9 = ReplicatedStorage.Assets.Misc.Anubis:Clone();
    v9:PivotTo(p8.PrimaryPart.CFrame - Vector3.new(0, 6, 0));
    v9.Parent = p8;
    p7.model = v9;
    p7.track = AnimationUtil:playAnimation(v9, GameAnimationUtil:getAssetId(AnimationType.ANUBIS_IDLE));
end;

function u3.attackEffect(u10, p11) -- Line: 66
    -- upvalues: SoundManager (copy), RandomUtil (copy), GameSound (copy), default (copy), Linear (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local model = u10.model;

    if model ~= nil then
        model = model.PrimaryPart;

        if model ~= nil then
            model = model.Position;
        end;
    end;

    if not (u10.model and model) then
        return nil;
    end;

    local v12 = Vector3.new(0, model.Y, 0);
    SoundManager:playSound(RandomUtil.fromList(GameSound.GUARDIAN_OF_DREAM_ATTACK_1, GameSound.GUARDIAN_OF_DREAM_ATTACK_2), {
        rollOffMaxDistance = 220,
        position = model
    });
    default(0.3, Linear, function(p13) -- Line: 88
        -- upvalues: u10 (copy)
        if u10.model then
            u10.model:PivotTo(p13);
        end;
    end, u10.model.PrimaryPart.CFrame, CFrame.new(model, p11 * Vector3.new(1, 0, 1) + v12));
    u10.track = AnimationUtil:playAnimation(u10.model, GameAnimationUtil:getAssetId(AnimationType.ANUBIS_ATTACK));
    task.delay(0.7, function() -- Line: 94
        -- upvalues: u10 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if u10.model then
            u10.track = AnimationUtil:playAnimation(u10.model, GameAnimationUtil:getAssetId(AnimationType.ANUBIS_IDLE));
        end;
    end);
end;

function u3.createEntityHealthbar(p14, p15, p16) -- Line: 100
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local v18 = {
        app = StatefulEntityHpBarBillboard
    };
    local Position = p15:GetPivot().Position;
    v18.appId = "StatefulEntityHpBarBillboard_" .. tostring(Position);
    v17:openApp(v18, {
        hpBarOffset = Vector3.new(0, 5.5, 0),
        gameEntity = p15,
        serverInstance = p15,
        barColor = p16
    }, nil, p15);

    if not p15:GetAttribute("ItemType") then
        return nil;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;