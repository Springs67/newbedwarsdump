-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local v1 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v1.InteractionCategory;
local InteractionPriority = v1.InteractionPriority;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ForestEnvironmentMushroomType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").ForestEnvironmentMushroomType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "ForestEnvironmentCollectibleEntityController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4);
    p4.Name = "ForestEnvironmentCollectibleEntityController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p5);
end;

function u2.validCollectableEntityTypes(p6) -- Line: 33
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.FOREST_ENVIRONMENT_PLANT };
end;

function u2.pickDisplayModel(p7, p8, p9) -- Line: 36
    -- upvalues: ReplicatedStorage (copy), InteractionPriority (copy), InteractionCategory (copy)
    return {
        repStorageModel = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("SingleMushroom"),
        collectionTag = p8,
        proximityPrompt = {
            interactionLabel = "Eat",

            interactionObjectText = function(p10) -- Line: 42, Name: interactionObjectText
                return p10.Name;
            end,

            priority = InteractionPriority.ABILITY,
            category = InteractionCategory.ABILITY
        }
    };
end;

function u2.onWillRemoveEntity(p11, p12, p13, p14, p15) -- Line: 51
    return nil;
end;

function u2.onCreatedEntity(p16, p17, p18, p19) -- Line: 54
    -- upvalues: ForestEnvironmentMushroomType (copy)
    p19:PivotTo(CFrame.new(p19:GetPrimaryPartCFrame().Position + Vector3.new(0, -1.5, 0)));
    local v20 = p19:GetAttribute("MushroomType");

    if v20 ~= nil then
        local Pivot = p19:FindFirstChild("Pivot");

        if Pivot ~= nil then
            Pivot = Pivot:FindFirstChild("MushroomTop");
        end;

        if Pivot then
            if v20 == ForestEnvironmentMushroomType.Heal then
                Pivot.Color = Color3.new(1, 0.31, 0.31);
            elseif v20 == ForestEnvironmentMushroomType.Shield then
                Pivot.Color = Color3.new(0.27, 0.71, 1);
            elseif v20 == ForestEnvironmentMushroomType.Speed then
                Pivot.Color = Color3.new(0.95, 1, 0.27);
            elseif v20 == ForestEnvironmentMushroomType.Dizzy then
                Pivot.Color = Color3.new(0.7, 0.16, 0.71);
            end;
        end;
    end;

    return nil;
end;

function u2.canPickupEntity(p21, p22, p23) -- Line: 88
    -- upvalues: ForestEnvironmentMushroomType (copy), EntityUtil (copy)
    local v24 = p23:GetAttribute("MushroomType");

    if v24 == nil then
        return true;
    end;

    if v24 == ForestEnvironmentMushroomType.Heal then
        local v25 = EntityUtil:getEntity(p22);

        if v25 and (v25:isDead() or v25:getHealth() >= v25:getMaxHealth()) then
            return false;
        end;
    end;

    return true;
end;

KnitClient.CreateController(u2.new());

return nil;