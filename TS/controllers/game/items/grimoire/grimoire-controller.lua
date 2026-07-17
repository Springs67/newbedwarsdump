-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "GrimoireController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GrimoireController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    ClientSyncEvents.ItemConsumed:connect(function(p5) -- Line: 29
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref)
        if p5.itemType ~= ItemType.GRIMOIRE then
            return nil;
        end;

        local GRIMOIRE_CAST_COMPLETE = GameSound.GRIMOIRE_CAST_COMPLETE;
        local v6 = {};
        local PrimaryPart = p5.entity:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        v6.position = PrimaryPart;
        SoundManager:playSound(GRIMOIRE_CAST_COMPLETE, v6);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;