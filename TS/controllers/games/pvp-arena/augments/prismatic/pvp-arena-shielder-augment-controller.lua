-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "PvPArenaShielderAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy)
    PvPArenaBaseAugmentController.constructor(p3, PvPArenaAugmentType.SHIELDER);
    p3.Name = "PvPArenaShielderAugmentController";
    p3.Client = {};
end;

function u1.onActivated(p4) -- Line: 27
    -- upvalues: Flamework (copy), AbilityId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(AbilityId.SHIELDER_ULT);
end;

KnitClient.CreateController(u1.new());

return nil;