-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = { GameSound.ROCK_CRUMBLE_1, GameSound.ROCK_CRUMBLE_2, GameSound.ROCK_CRUMBLE_3 };
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "BlockDecayController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BlockDecayController";
end;

function u3.KnitStart(p6) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), RandomUtil (copy), u2 (copy), SoundManager (copy)
    KnitController.KnitStart(p6);
    default.Client:Get("RandomNearbyBlockDecaySound"):Connect(function(p7) -- Line: 31
        -- upvalues: RandomUtil (ref), u2 (ref), SoundManager (ref)
        SoundManager:playSound(RandomUtil.fromList(unpack(u2)), {
            volumeMultiplier = 0.5,
            position = p7.position
        });
    end);
end;

KnitClient.CreateController(u3.new());

return nil;