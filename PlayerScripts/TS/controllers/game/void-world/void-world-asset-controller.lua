-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WorldId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "VoidWorldAssetController";
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
    p3.Name = "VoidWorldAssetController";
end;

function u1.KnitStart(u4) -- Line: 26
    -- upvalues: KnitController (copy), KnitClient (copy), WorldId (copy)
    KnitController.KnitStart(u4);
    local u5 = nil;
    u5 = KnitClient.Controllers.WorldController:watchLocalWorld(function(p6) -- Line: 29
        -- upvalues: WorldId (ref), u5 (ref), u4 (copy)
        if p6 ~= nil then
            p6 = p6.Name;
        end;

        if p6 == WorldId.VOID_WORLD then
            u5:Destroy();
            u4:preloadVoidAssets();
        end;
    end);
end;

function u1.preloadVoidAssets(p7) -- Line: 40
    -- upvalues: KnitClient (copy), GameSound (copy), AnimationType (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.VOID_CRAB_BASIC_ATTACK,
            GameSound.VOID_CRAB_BEAM_ATTACK,
            GameSound.VOID_CRAB_DAMAGED,
            GameSound.VOID_CRAB_DEATH,
            GameSound.VOID_CRAB_FOOTSTEPS,
            GameSound.VOID_CRAB_LUNGE_ATTACK
        },
        animations = {
            AnimationType.VOID_CRAB_BEAM_ATTACK,
            AnimationType.VOID_CRAB_LEFT_ATTACK,
            AnimationType.VOID_CRAB_RIGHT_ATTACK,
            AnimationType.VOID_CRAB_WALKING,
            AnimationType.VOID_CRAB_ATTACKED,
            AnimationType.VOID_CRAB_MIDDLE_ATTACK
        }
    });
end;

KnitClient.CreateController(u1.new());

return nil;