-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local v1 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v1.InteractionCategory;
local InteractionPriority = v1.InteractionPriority;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SorcererCollectableEntityController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4);
    p4.Name = "SorcererCollectableEntityController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p5);
end;

function u2.validCollectableEntityTypes(p6) -- Line: 32
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.ALCHEMY_CRYSTAL };
end;

function u2.pickDisplayModel(p7, p8, p9) -- Line: 35
    -- upvalues: ReplicatedStorage (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy)
    return {
        repStorageModel = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("AlchemyCrystal"),
        collectionTag = p8,
        proximityPrompt = {
            holdDuration = 1,
            maxActivationDistance = 8,
            interactionLabel = "Collect",

            interactionObjectText = function(p10) -- Line: 40, Name: interactionObjectText
                return "Alchemy Crystal";
            end,

            clickablePrompt = DeviceUtil.isMobileControls(),
            priority = InteractionPriority.ABILITY,
            category = InteractionCategory.ABILITY
        }
    };
end;

function u2.onWillRemoveEntity(p11, p12, p13, p14, p15) -- Line: 52
    return nil;
end;

function u2.onCreatedEntity(p16, p17, p18, p19) -- Line: 55
    p19:PivotTo(CFrame.new(p19:GetPrimaryPartCFrame().Position + Vector3.new(0, 0, 0)));

    return nil;
end;

KnitClient.CreateController(u2.new());

return nil;