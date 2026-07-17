-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ProjectileImpactZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SplashPotionController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SplashPotionController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), ProjectileImpactZap (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    ProjectileImpactZap.On(function(p6, p7, p8, p9, p10, p11, p12, p13) -- Line: 32
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        local Name = p8.Name;

        if Name == "sleep_splash_potion" then
            local v14 = ReplicatedStorage.Assets.Effects.Potion.SleepSplashPotion:Clone();
            v14.CFrame = CFrame.new(p6);
            v14.Parent = Workspace;
            EffectUtil:playEffects({ v14 }, nil, {
                destroyAfterSec = 3
            });
            SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
                position = p6
            });

            return;
        end;

        if Name ~= "poison_splash_potion" then
            if Name == "heal_splash_potion" then
                local v15 = ReplicatedStorage.Assets.Effects.Potion.HealSplashPotion:Clone();
                v15.CFrame = CFrame.new(p6);
                v15.Parent = Workspace;
                EffectUtil:playEffects({ v15 }, nil, {
                    destroyAfterSec = 3
                });
                SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
                    position = p6
                });
            end;

            return;
        end;

        local v16 = ReplicatedStorage.Assets.Effects.Potion.PoisonSplashPotion:Clone();
        v16.CFrame = CFrame.new(p6);
        v16.Parent = Workspace;
        EffectUtil:playEffects({ v16 }, nil, {
            destroyAfterSec = 3
        });
        SoundManager:playSound(GameSound.SMOKE_GRENADE_POP, {
            position = p6
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;