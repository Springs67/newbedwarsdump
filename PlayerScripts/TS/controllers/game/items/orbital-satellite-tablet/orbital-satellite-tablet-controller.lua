-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "OrbitalSatelliteTabletController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.Name = "OrbitalSatelliteTabletController";
    p4.tabletMaid = u1.new();
    p4.inTablet = false;
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy)
    HandKnitController.KnitStart(p5);
    ClientSyncEvents.ItemConsumed:connect(function(p6) -- Line: 30
        -- upvalues: ItemType (ref)
        if p6.itemType ~= ItemType.ORBITAL_SATELLITE_TABLET then
            return nil;
        end;
    end);
end;

function u2.isRelevantItem(p7, p8) -- Line: 37
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.ORBITAL_SATELLITE_TABLET;
end;

function u2.onEnable(p9, p10, p11) -- Line: 40
end;

function u2.onDisable(p12) -- Line: 42
    p12.tabletMaid:DoCleaning();
end;

KnitClient.CreateController(u2.new());

return nil;