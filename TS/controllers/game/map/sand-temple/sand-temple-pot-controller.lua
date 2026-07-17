-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "SandTemplePotController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SandTemplePotController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("PotBreak"):Connect(function(p5) -- Line: 28
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref)
        SoundManager:playSound(GameSound.POT_BREAK, {
            rollOffMinDistance = 30,
            rollOffMaxDistance = 120,
            position = p5.potPosition,
            playbackSpeedMultiplier = 0.95 + math.random() * 0.1
        });
        local v6 = false;
        local v7 = 0;

        while true do
            if v6 then
                v7 = v7 + 1;
            else
                v6 = true;
            end;

            if v7 >= 4 then
                return;
            end;

            KnitClient.Controllers.BlockDebrisController:createDebris(p5.potPosition, p5.potColor, Vector3.new(0, 0, 0));
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;