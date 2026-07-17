-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "JumpPadController";
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
    p4.Name = "JumpPadController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient2 (copy), ItemType (copy), GameSound (copy), ClientSyncEvents (copy), SoundManager (copy)
    KnitController.KnitStart(p5);
    KnitClient2.Controllers.PreloadController:preloadForItemType(ItemType.JUMP_PAD, {
        sounds = { GameSound.LAUNCH_PAD_ACTIVATE }
    });
    ClientSyncEvents.LaunchPadUsed:connect(function(p6) -- Line: 34
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref)
        if p6.launchpad.Name == ItemType.JUMP_PAD then
            SoundManager:playSound(GameSound.LAUNCH_PAD_ACTIVATE, {
                position = p6.launchpad.Position
            });
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;