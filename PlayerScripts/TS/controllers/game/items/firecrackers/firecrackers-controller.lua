-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "FirecrackersController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "FirecrackersController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), ClientSyncEvents (copy), ExplosionType (copy), SoundManager (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(p6);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.FIRECRACKERS, {
        sounds = {
            GameSound.FIRECRACKER_BANG_SHORT_1,
            GameSound.FIRECRACKER_BANG_SHORT_2,
            GameSound.FIRECRACKER_BANG_SHORT_3,
            GameSound.FIRECRACKER_BANG_SHORT_4,
            GameSound.FIRECRACKER_BANG_SHORT_5,
            GameSound.FIRECRACKER_BANG_SHORT_6,
            GameSound.FIRECRACKER_BANG_SHORT_7,
            GameSound.FIRECRACKER_BANG_SHORT_8,
            GameSound.FIRECRACKER_BANG_SHORT_9,
            GameSound.FIRECRACKER_BANG_SHORT_10
        }
    });
    ClientSyncEvents.ExplosionEffect:connect(function(p7) -- Line: 39
        -- upvalues: ExplosionType (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if p7.explosionType == ExplosionType.FIRECRACKER then
            SoundManager:playSound(RandomUtil.fromList(GameSound.FIRECRACKER_BANG_SHORT_1, GameSound.FIRECRACKER_BANG_SHORT_2, GameSound.FIRECRACKER_BANG_SHORT_3, GameSound.FIRECRACKER_BANG_SHORT_4, GameSound.FIRECRACKER_BANG_SHORT_5, GameSound.FIRECRACKER_BANG_SHORT_6, GameSound.FIRECRACKER_BANG_SHORT_7, GameSound.FIRECRACKER_BANG_SHORT_8, GameSound.FIRECRACKER_BANG_SHORT_9, GameSound.FIRECRACKER_BANG_SHORT_10), {
                rollOffMaxDistance = 250,
                position = p7.position
            });
            local v8 = ReplicatedStorage.Assets.Effects.FirecrackerExplosion:Clone();
            v8.Parent = Workspace;
            v8.CFrame = CFrame.new(p7.position);
            EffectUtil:playEffects({ v8 }, nil, {
                sizeMultiplier = 0.7,
                destroyAfterSec = 3
            });
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;