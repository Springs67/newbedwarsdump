-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "SpearImpactController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "SpearImpactController";
    p4.random = Random.new();
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), u1 (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("SpearImpactEffect", function(p6) -- Line: 30
        -- upvalues: u1 (ref), SoundManager (ref), GameSound (ref), KnitClient (ref)
        u1.new();
        SoundManager:playSound(GameSound.SPEAR_HIT, {
            rollOffMaxDistance = 100,
            position = p6.position
        });
        KnitClient.Controllers.LightningController:createExplosion({
            explosionType = "spearExplosion",
            position = p6.position
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;