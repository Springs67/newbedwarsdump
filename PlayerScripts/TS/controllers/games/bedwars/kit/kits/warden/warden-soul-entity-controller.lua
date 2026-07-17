-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local v1 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v1.InteractionCategory;
local InteractionPriority = v1.InteractionPriority;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "JailorController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4);
    p4.Name = "JailorController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p5);
end;

function u2.validCollectableEntityTypes(p6) -- Line: 31
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.JAILOR_SOUL };
end;

function u2.pickDisplayModel(p7, p8, p9) -- Line: 34
    -- upvalues: ReplicatedStorage (copy), InteractionPriority (copy), InteractionCategory (copy)
    return {
        repStorageModel = p9 or ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("JailorSoul"):Clone(),
        collectionTag = p8,
        proximityPrompt = {
            interactionObjectText = "Soul",
            interactionLabel = "Imprison",
            maxActivationDistance = 14,
            priority = InteractionPriority.ABILITY,
            category = InteractionCategory.ABILITY
        }
    };
end;

function u2.onWillRemoveEntity(p10, p11, p12, p13, p14) -- Line: 48
end;

function u2.onCreatedEntity(p15, p16, p17, p18) -- Line: 50
end;

KnitClient.CreateController(u2.new());

return nil;