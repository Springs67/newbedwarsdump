-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "HeavyHitterToolEnchantController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "HeavyHitterToolEnchantController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), BlockEngine (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("HeavyHitterHit"):Connect(function(p6) -- Line: 31
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), BlockEngine (ref)
        SoundManager:playSound(RandomUtil.fromList(GameSound.HEAVY_HITTER_HIT_1, GameSound.HEAVY_HITTER_HIT_2, GameSound.HEAVY_HITTER_HIT_3), {
            volumeMultiplier = 0.8,
            position = BlockEngine:getWorldPosition(p6.blockPosition)
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;