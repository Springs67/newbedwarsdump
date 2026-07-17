-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local CollectableEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local CollectableEntityController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "AlchemistController";
    end,

    __index = CollectableEntityController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.constructor(p4);
    p4.Name = "AlchemistController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: CollectableEntityController (copy)
    CollectableEntityController.KnitStart(p5);
end;

function u2.validCollectableEntityTypes(p6) -- Line: 35
    -- upvalues: CollectableEntityType (copy)
    return { CollectableEntityType.ALCHEMIST_INGREDIENTS };
end;

function u2.pickDisplayModel(p7, p8, p9) -- Line: 38
    -- upvalues: ReplicatedStorage (copy)
    local v10 = p7:getRandomIngredient();

    return {
        repStorageModel = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v10),
        collectionTag = p8
    };
end;

function u2.onWillRemoveEntity(p11, p12, p13, p14, p15) -- Line: 45
    return nil;
end;

function u2.onCreatedEntity(u16, p17, p18, u19) -- Line: 48
    -- upvalues: Players (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy)
    u19:PivotTo(CFrame.new(u19:GetPrimaryPartCFrame().Position + Vector3.new(0, -1, 0)));
    local v20 = u16:getEntityMaid(p17);

    if not v20 then
        return nil;
    end;

    local u21 = 0;

    local function v24(p22) -- Line: 57
        -- upvalues: Players (ref), Workspace (ref), u21 (ref), u16 (copy), u19 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
        local LocalPlayer = Players.LocalPlayer;
        local Character = LocalPlayer.Character;

        if not (Character and p22:IsDescendantOf(Character)) then
            return nil;
        end;

        local v23 = Workspace:GetServerTimeNow();

        if v23 - u21 < 0.35 then
            return nil;
        end;

        u21 = v23;

        if not u16:canPickupEntity(LocalPlayer, u19) then
            return nil;
        end;

        GameAnimationUtil:playAnimation(LocalPlayer, AnimationType.PUNCH);
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
        SoundManager:playSound(GameSound.PICKUP_ITEM_DROP);
        u16:collectEntity(LocalPlayer, u19, u19.Name);
    end;

    for _, descendant in u19:GetDescendants() do
        if descendant:IsA("BasePart") then
            v20:GiveTask(descendant.Touched:Connect(v24));
        end;
    end;
end;

function u2.getRandomIngredient(p25) -- Line: 82
    local v26 = math.random(0, 2);

    return v26 == 0 and "Flower" or (v26 == 1 and "Mushrooms" or (v26 == 2 and "Thorns" or "None"));
end;

KnitClient.CreateController(u2.new());

return nil;