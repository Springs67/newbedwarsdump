-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TwirlbladeController";
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
    p4.Name = "TwirlbladeController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), AnimationType (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("TwirlbladeSpin", function(p6) -- Line: 32
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), KnitClient2 (ref), AnimationType (ref)
        if p6.executingPlayer ~= Players.LocalPlayer then
            SoundManager:playSound(GameSound.TWIRLBLADE_SPIN, {
                position = p6.position
            });

            return;
        end;

        SoundManager:playSound(GameSound.TWIRLBLADE_SPIN, {});
        KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.FP_TWIRLBLADE_ATTACK_SPIN);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;