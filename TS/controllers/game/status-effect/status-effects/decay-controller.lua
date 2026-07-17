-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "DecayController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "DecayController";
    p5.maid = u1.new();
    p5.expireTime = 0;
    p5.isPlaying = false;
end;

function u3.KnitStart(u6) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), EffectUtil (copy), Players (copy), KnitClient (copy), VignetteType (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("PlayerDecayed"):Connect(function(p7) -- Line: 38
        -- upvalues: u6 (copy), ReplicatedStorage (ref), EffectUtil (ref), Players (ref), KnitClient (ref), VignetteType (ref), SoundManager (ref), GameSound (ref)
        if not p7.player then
            return nil;
        end;

        u6.expireTime = tick() + p7.duration;
        EffectUtil:playEffects({ (ReplicatedStorage.Assets.Effects.DecayVignette:Clone()) }, p7.player.Character, {
            destroyAfterSec = 3
        });
        local v8 = p7.player == Players.LocalPlayer;

        if v8 then
            v8 = tick();

            if v8 ~= 0 and (v8 == v8 and v8) then
                v8 = u6.isPlaying == false;
            end;
        end;

        if v8 ~= 0 and (v8 == v8 and v8) then
            KnitClient.Controllers.VignetteController:createVignette(VignetteType.DECAY);
            u6.maid:GiveTask(function() -- Line: 59
                -- upvalues: KnitClient (ref), VignetteType (ref)
                KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.DECAY);
            end);
            u6.isPlaying = true;
            SoundManager:playSound(GameSound.VOID_HEALTH_DECAY);
            task.delay(3, function() -- Line: 64
                -- upvalues: u6 (ref)
                u6:cleanUpEffect();
            end);
        end;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 69
        -- upvalues: u6 (copy)
        if tick() > u6.expireTime then
            u6.isPlaying = false;
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p9) -- Line: 74
        -- upvalues: Players (ref), u6 (copy)
        if Players:GetPlayerFromCharacter(p9.entityInstance) == Players.LocalPlayer then
            u6:cleanUpEffect();
        end;
    end);
end;

function u3.cleanUpEffect(p10) -- Line: 81
    p10.maid:DoCleaning();
end;

KnitClient.CreateController(u3.new());

return nil;