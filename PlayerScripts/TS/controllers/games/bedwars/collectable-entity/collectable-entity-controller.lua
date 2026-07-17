-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v4.InteractionCategory;
local InteractionPriority = v4.InteractionPriority;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "CollectableEntityController";
    end,

    __index = KnitController
});
v5.__index = v5;

function v5.constructor(p6, ...) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "CollectableEntityController";
    p6.entityMap = {};
    p6.entityMaidMap = {};
end;

function v5.KnitStart(u7) -- Line: 38
    -- upvalues: KnitController (copy), default (copy), u2 (copy), CollectionService (copy)
    KnitController.KnitStart(u7);
    default.Client:WaitFor("CollectableEntitySpawn"):andThen(function(p8) -- Line: 41
        -- upvalues: u7 (copy), u2 (ref)
        p8:Connect(function(p9) -- Line: 42
            -- upvalues: u7 (ref), u2 (ref)
            local v10 = u7:validCollectableEntityTypes();

            if table.find(v10, p9.entityType) == nil then
                return nil;
            end;

            u7.entityMap[p9.id] = p9.entityType;
            u7.entityMaidMap[p9.id] = u2.new();
            local v11 = u7:pickDisplayModel(p9.entityType, p9.model);
            local v12 = {};

            for i, v in p9 do
                v12[i] = v;
            end;

            v12.tag = v11.collectionTag;
            v12.repStorageModel = v11.repStorageModel;
            v12.proximityPrompt = v11.proximityPrompt;
            v12.attributes = p9.attributes;
            u7:createLocalModel(v12);
        end);
    end);
    default.Client:OnEvent("CollectableEntityRemoved", function(u13) -- Line: 70
        -- upvalues: u7 (copy), CollectionService (ref)
        local v14 = u7:validCollectableEntityTypes();

        if table.find(v14, u13.entityType) == nil then
            return nil;
        end;

        local function _(p15) -- Line: 77
            -- upvalues: u13 (copy)
            return p15:GetAttribute("Id") == u13.id;
        end;

        local v16 = nil;

        for i, v in CollectionService:GetTagged(u13.entityType) do
            local _ = i - 1;

            if v:GetAttribute("Id") == u13.id == true then
                v16 = v;
                break;
            end;
        end;

        if v16 then
            u7:onWillRemoveEntity(u13.id, u13.entityType, u13.collector, v16);
        end;

        u7.entityMap[u13.id] = nil;
        local v17 = u7.entityMaidMap[u13.id];

        if v17 ~= nil then
            v17:DoCleaning();
        end;

        u7.entityMaidMap[u13.id] = nil;

        if v16 ~= nil then
            v16:Destroy();
        end;
    end);
end;

function v5.createLocalModel(u18, p19) -- Line: 112
    -- upvalues: Workspace (copy), GameQueryUtil (copy), KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), CollectionService (copy)
    local u20 = p19.repStorageModel:Clone();

    if p19.attributes ~= nil then
        local function _(p21, p22) -- Line: 117
            -- upvalues: u20 (copy)
            if typeof(p21) == "string" or (typeof(p21) == "number" or typeof(p21) == "boolean") then
                u20:SetAttribute(p22, p21);
            end;
        end;

        for i, v in p19.attributes do
            if typeof(v) == "string" or (typeof(v) == "number" or typeof(v) == "boolean") then
                u20:SetAttribute(i, v);
            end;
        end;
    end;

    u20.Parent = Workspace;
    u20:SetAttribute("Id", p19.id);
    u20:SetAttribute("SpawnTime", Workspace:GetServerTimeNow());
    u20:PivotTo(CFrame.new(p19.position));

    for _, descendant in p19.repStorageModel:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    u20.PrimaryPart.Anchored = true;
    u20.PrimaryPart.CanCollide = false;
    local v23 = p19.tag .. "_ProximityPrompt";

    if p19.proximityPrompt and not KnitClient.Controllers.InteractionRegistryController:getInteractionDefinition(v23) then
        local InteractionRegistryController = KnitClient.Controllers.InteractionRegistryController;
        local v24 = {};
        local interactionLabel = p19.proximityPrompt.interactionLabel;
        v24.interactionLabel = interactionLabel == nil and "Pick Up" or interactionLabel;
        v24.interactionObjectText = p19.proximityPrompt.interactionObjectText;
        v24.interactionTag = v23;
        local instantActivation = p19.proximityPrompt.instantActivation;
        v24.instantActivation = instantActivation == nil and true or instantActivation;
        local maxActivationDistance = p19.proximityPrompt.maxActivationDistance;
        v24.maxActivationDistance = maxActivationDistance == nil and 5 or maxActivationDistance;
        local clickablePrompt = p19.proximityPrompt.clickablePrompt;

        if clickablePrompt == nil then
            clickablePrompt = DeviceUtil.isMobileControls();
        end;

        v24.clickablePrompt = clickablePrompt;
        local priority = p19.proximityPrompt.priority;

        if priority == nil then
            priority = InteractionPriority.OTHER;
        end;

        v24.priority = priority;
        v24.category = p19.proximityPrompt.category or InteractionCategory.OTHER;
        v24.removePromptOnInteract = p19.proximityPrompt.removePromptOnInteract;

        function v24.onInteracted(p25, p26, p27) -- Line: 188
            -- upvalues: u18 (copy), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
            if not u18:canPickupEntity(p25, p26) then
                return nil;
            end;

            GameAnimationUtil:playAnimation(p25, AnimationType.PUNCH);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
            SoundManager:playSound(GameSound.PICKUP_ITEM_DROP);

            if p27 then
                u18:collectEntity(p25, p26, p26.Name);
            end;
        end;

        InteractionRegistryController:RegisterInteraction(v24);
    end;

    u18:onCreatedEntity(p19.id, p19.entityType, u20);
    CollectionService:AddTag(u20, p19.tag);
    CollectionService:AddTag(u20, v23);

    return u20;
end;

function v5.collectEntity(p28, p29, p30, p31) -- Line: 209
    -- upvalues: Players (copy), ClientSyncEvents (copy), default (copy)
    if p29 == Players.LocalPlayer then
        local v32 = p30:GetAttribute("Id");
        local v33 = p28.entityMap[v32];

        if not v33 then
            return nil;
        end;

        if ClientSyncEvents.CollectEntity:fire(v33, p30):isCancelled() then
            return nil;
        end;

        default.Client:Get("CollectCollectableEntity"):SendToServer({
            id = v32,
            collectableName = p31
        });
    end;
end;

function v5.getEntityMaid(p34, p35) -- Line: 225
    return p34.entityMaidMap[p35];
end;

function v5.getEntity(p36, p37) -- Line: 230
    return p36.entityMap[p37];
end;

function v5.canPickupEntity(p38, p39, p40) -- Line: 235
    return true;
end;

return {
    CollectableEntityController = v5
};