-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "WaterGunController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "WaterGunController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), KnitClient2 (copy), ItemType (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    KnitClient2.Controllers.PreloadController:preloadForItemType(ItemType.WATER_GUN, {
        sounds = {
            GameSound.WATER_HIT_1,
            GameSound.WATER_HIT_2,
            GameSound.WATER_HIT_3,
            GameSound.WATER_HIT_4,
            GameSound.WATER_SHOT_1,
            GameSound.WATER_SHOT_2,
            GameSound.WATER_SHOT_3,
            GameSound.WATER_SHOT_4
        }
    });
end;

KnitClient.CreateController(u2.new());

return nil;