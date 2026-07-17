-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local LegacyKitKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "IceQueenProgressController";
    end,

    __index = LegacyKitKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 17
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 21
    -- upvalues: LegacyKitKnitController (copy), BedwarsKit (copy), u1 (copy)
    LegacyKitKnitController.constructor(p4, { BedwarsKit.ICE_QUEEN });
    p4.Name = "IceQueenProgressController";
    p4.maid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: LegacyKitKnitController (copy)
    LegacyKitKnitController.KnitStart(p5);
end;

function u2.onKitEnabled(p6) -- Line: 29
end;

function u2.onKitDisabled(p7) -- Line: 31
end;

KnitClient.CreateController(u2.new());

return nil;