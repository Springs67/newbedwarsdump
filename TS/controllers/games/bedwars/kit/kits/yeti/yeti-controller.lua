-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "YetiController";
    end,

    __index = BaseKitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy)
    BaseKitController.constructor(p3, BedwarsKit.YETI, {
        sounds = { GameSound.BREAK_FROZEN_BLOCK, GameSound.YETI_ROAR },
        animations = { AnimationType.YETI_ROAR }
    });
    p3.Name = "YetiController";
end;

function u1.onKitLocalActivated(p4, p5) -- Line: 31
end;

function u1.onKitLocalDeactivated(p6) -- Line: 33
end;

function u1.onKitReplicationActivated(p7, p8) -- Line: 35
end;

function u1.onKitReplicationDeactivated(p9) -- Line: 37
end;

function u1.onInnateAbilityEnabled(p10, p11, p12) -- Line: 39
end;

function u1.onAbilityUsed(p13, p14, p15) -- Line: 41
    -- upvalues: AbilityId (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p15.ability ~= AbilityId.YETI_GLACIAL_ROAR then
        return nil;
    end;

    GameAnimationUtil:playAnimation(p14, AnimationType.YETI_ROAR);
end;

KnitClient.CreateController(u1.new());

return nil;