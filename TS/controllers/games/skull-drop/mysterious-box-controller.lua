-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ItemPopUp = RuntimeLib.import(script, script.Parent, "ui", "item-pop-up").ItemPopUp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "MysteriousBoxController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "MysteriousBoxController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), SoundManager (copy), GameSound (copy), Players (copy), default (copy), u1 (copy), ItemPopUp (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.StartConsuming:connect(function(p6) -- Line: 33
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref)
        if p6:isCancelled() then
            return nil;
        end;

        if p6.itemType == ItemType.MYSTERIOUS_BOX then
            SoundManager:playSound(GameSound.GIFT_BOX_UNWRAP, {
                volumeMultiplier = 0.4
            });
        end;
    end);
    ClientSyncEvents.ItemConsumed:connect(function(p7) -- Line: 43
        -- upvalues: Players (ref), ItemType (ref), SoundManager (ref), GameSound (ref)
        local v8 = Players:GetPlayerFromCharacter(p7.entity:getInstance());

        if p7.itemType == ItemType.MYSTERIOUS_BOX and v8 == Players.LocalPlayer then
            SoundManager:playSound(GameSound.GIFT_BOX_OPEN, {
                volumeMultiplier = 0.4
            });
        end;
    end);
    default.Client:Get("MysteriousBoxOpen"):Connect(function(p9) -- Line: 51
        -- upvalues: u5 (copy), u1 (ref), ItemPopUp (ref), Players (ref)
        if u5.popUpTree then
            u1.unmount(u5.popUpTree);
        end;

        u5.popUpTree = u1.mount(u1.createElement(ItemPopUp, {
            item = p9.item,
            tier = p9.tier
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    end);
end;

function u2.unmountItemPopup(p10) -- Line: 61
    -- upvalues: u1 (copy)
    if p10.popUpTree then
        u1.unmount(p10.popUpTree);
        p10.popUpTree = nil;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;