-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "TurtleBackpackController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TurtleBackpackController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), Players (copy), ItemType (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    ClientSyncEvents.BackpackEquipEvent:connect(function(p5) -- Line: 30
        -- upvalues: Players (ref), ItemType (ref), SoundManager (ref), GameSound (ref)
        if p5.player == Players.LocalPlayer and p5.item == ItemType.TURTLE_BACKPACK then
            SoundManager:playSound(GameSound.EQUIP_TURTLE_SHELL);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;