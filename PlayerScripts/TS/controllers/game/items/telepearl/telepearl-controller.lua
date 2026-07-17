-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "TelepearlController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.maid = u1.new();
    p4.Name = "TelepearlController";
end;

function u2.isRelevantItem(p5, p6) -- Line: 29
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.TELEPEARL;
end;

function u2.onEnable(p7, p8, p9) -- Line: 32
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy)
    local v10 = Players.LocalPlayer:GetAttribute("UseKitAbility");

    if v10 ~= 0 and (v10 == v10 and (v10 ~= "" and v10)) then
        return nil;
    end;

    p7:setupDestroyableYield(function() -- Line: 37
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.TELEPEARL, nil):expect();
    end);
end;

function u2.onDisable(p11) -- Line: 41
    p11.maid:DoCleaning();
end;

function u2.KnitStart(p12) -- Line: 44
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p12);
end;

KnitClient.CreateController(u2.new());

return nil;