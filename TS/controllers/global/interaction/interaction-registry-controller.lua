-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v3 = {};
local v4 = setmetatable({}, {
    __index = v3
});
v4.OTHER = 1;
v3[1] = "OTHER";
v4.ABILITY = 2;
v3[2] = "ABILITY";
local v5 = {};
local v6 = setmetatable({}, {
    __index = v5
});
v6.OTHER = "other";
v5.other = "OTHER";
v6.ABILITY = "ability";
v5.ability = "ABILITY";
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "InteractionRegistryController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 45
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 49
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p9, ...);
    p9.Name = "InteractionRegistryController";
    p9.onPromptCreated = Signal.new();
    p9.registeredInteractions = {};
    p9.proximityPrompts = {};
end;

function u7.KnitStart(p10) -- Line: 56
end;

function u7.RegisterInteraction(u11, u12) -- Line: 58
    -- upvalues: u2 (copy), CollectionService (copy)
    if u11:getInteractionDefinition(u12.interactionTag) then
        error("Tag " .. u12.interactionTag .. " is already registered");
    end;

    local u13 = u2.new();
    u11.registeredInteractions[u12.interactionTag] = {
        definition = u12,
        maid = u13
    };

    for _, v in CollectionService:GetTagged(u12.interactionTag) do
        if v:IsA("BasePart") and (not u12.shouldMakeInteraction or u12.shouldMakeInteraction(v)) then
            u13:GiveTask(u11:givePartProximityPrompt(v, u12));
        end;
    end;

    u13:GiveTask(CollectionService:GetInstanceAddedSignal(u12.interactionTag):Connect(function(p14) -- Line: 85
        -- upvalues: u12 (copy), u13 (copy), u11 (copy)
        if not (p14:IsA("BasePart") or p14:IsA("Model")) then
            error("Only BaseParts & Models can have an interaction, got " .. p14:GetFullName());
        end;

        if u12.shouldMakeInteraction and not u12.shouldMakeInteraction(p14) then
            return nil;
        end;

        u13:GiveTask(u11:givePartProximityPrompt(p14, u12));
    end));
    u13:GiveTask(CollectionService:GetInstanceRemovedSignal(u12.interactionTag):Connect(function(p15) -- Line: 99
        -- upvalues: u11 (copy), u12 (copy)
        if not (p15:IsA("BasePart") or p15:IsA("Model")) then
            return nil;
        end;

        u11:removePrompt(p15, u12.interactionTag);
    end));

    if u12.onVisibilityStateChanged then
        local u18 = u12.onVisibilityStateChanged:Connect(function(p16) -- Line: 112
            -- upvalues: u11 (copy), u12 (copy)
            local v17 = u11.proximityPrompts[u12.interactionTag];

            if v17 then
                for _, v in v17 do
                    v.Enabled = p16;
                end;
            end;
        end);
        u13:GiveTask(function() -- Line: 125
            -- upvalues: u18 (copy)
            return u18:Disconnect();
        end);
    end;

    u13:GiveTask(function() -- Line: 130
        -- upvalues: u11 (copy), u12 (copy)
        u11:unregisterInteraction(u12.interactionTag);
    end);

    return u13;
end;

function u7.unregisterInteraction(p19, p20) -- Line: 135
    local v21 = p19.registeredInteractions[p20];

    if not v21 then
        return false;
    end;

    v21.maid:DoCleaning();
    p19.proximityPrompts[p20] = nil;
    p19.registeredInteractions[p20] = nil;

    return true;
end;

function u7.getProximityPrompts(p22) -- Line: 151
    return p22.proximityPrompts;
end;

function u7.getInteractionDefinition(p23, p24) -- Line: 154
    local v25 = p23.registeredInteractions[p24];

    if v25 ~= nil then
        v25 = v25.definition;
    end;

    return v25;
end;

function u7.givePartProximityPrompt(u26, u27, u28) -- Line: 163
    -- upvalues: KnitClient2 (copy), Theme (copy)
    local interactionLabel = u28.interactionLabel;

    if type(interactionLabel) == "function" then
        interactionLabel = interactionLabel(u27);
    end;

    local interactionObjectText = u28.interactionObjectText;

    if type(interactionObjectText) == "function" then
        interactionObjectText = interactionObjectText(u27);
    end;

    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v29 = {
        AutoLocalize = true,
        RequiresLineOfSight = false,
        Name = u28.interactionTag,
        ObjectText = interactionObjectText,
        ActionText = interactionLabel,
        ClickablePrompt = u28.clickablePrompt,
        KeyboardKeyCode = u28.KeyCode
    };
    local v30;

    if u28.instantActivation then
        v30 = 0;
    else
        v30 = u28.holdDuration;

        if v30 == nil then
            v30 = Theme.promptHoldDuration;
        end;
    end;

    v29.HoldDuration = v30;
    v29.Parent = u27;
    v29.MaxActivationDistance = u28.maxActivationDistance;
    local u31 = ProximityPromptController:createProximityPrompt(v29);
    u31.Triggered:Connect(function(p32) -- Line: 193
        -- upvalues: u26 (copy), u27 (copy), u28 (copy), u31 (copy)
        u28.onInteracted(p32, u27, u31, function() -- Line: 194
            -- upvalues: u26 (ref), u27 (ref), u28 (ref)
            u26:removePrompt(u27, u28.interactionTag);
        end);

        if u28.removePromptOnInteract then
            u26:removePrompt(u27, u28.interactionTag);
        end;
    end);

    if u28.promptButtonHoldBegan ~= nil then
        u31.PromptButtonHoldBegan:Connect(function(p33) -- Line: 203
            -- upvalues: u28 (copy), u27 (copy), u31 (copy)
            local promptButtonHoldBegan = u28.promptButtonHoldBegan;

            if promptButtonHoldBegan ~= nil then
                promptButtonHoldBegan(p33, u27, u31);
            end;
        end);
    end;

    if u28.promptButtonHoldEnded ~= nil then
        u31.PromptButtonHoldBegan:Connect(function(p34) -- Line: 211
            -- upvalues: u28 (copy), u27 (copy), u31 (copy)
            local promptButtonHoldEnded = u28.promptButtonHoldEnded;

            if promptButtonHoldEnded ~= nil then
                promptButtonHoldEnded(p34, u27, u31);
            end;
        end);
    end;

    local v35 = u26.proximityPrompts[u28.interactionTag] or {};
    local proximityPrompts = u26.proximityPrompts;
    local interactionTag = u28.interactionTag;
    local v36 = {};
    local v37 = #v36;
    local v38 = #v35;
    table.move(v35, 1, v38, v37 + 1, v36);
    v36[v37 + v38 + 1] = u31;
    proximityPrompts[interactionTag] = v36;
    u26.onPromptCreated:Fire(u31, u28.interactionTag);

    return u31;
end;

function u7.removePrompt(p39, p40, p41) -- Line: 241
    -- upvalues: CollectionService (copy)
    local v42 = p39.proximityPrompts[p41];

    if not v42 then
        return false;
    end;

    local v43 = false;
    local v44 = 0;
    local v45 = nil;

    while true do
        if v43 then
            v44 = v44 + 1;
        else
            v43 = true;
        end;

        if v44 >= #v42 then
            break;
        end;

        if v42[v44 + 1].Parent == p40 then
            v45 = v42[v44 + 1];
            break;
        end;
    end;

    if not v45 then
        return false;
    end;

    table.remove(v42, v44 + 1);
    v45:Destroy();
    CollectionService:RemoveTag(p40, p41);

    return true;
end;

return {
    InteractionPriority = v4,
    InteractionCategory = v6,
    InteractionRegistryController = KnitClient.CreateController(u7.new())
};