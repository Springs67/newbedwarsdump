-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InteractionCategory = RuntimeLib.import(script, script.Parent.Parent, "interaction", "interaction-registry-controller").InteractionCategory;
local v3 = {};
local v4 = setmetatable({}, {
    __index = v3
});
v4.Ability = 1;
v3[1] = "Ability";
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "MobileInteractController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "MobileInteractController";
end;

function u5.KnitStart(p8) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
end;

function u5.abilityInteract(p9) -- Line: 40
    -- upvalues: KnitClient2 (copy), u2 (copy), InteractionCategory (copy), Players (copy)
    local u10 = nil;
    local u11 = 100;
    local v12 = KnitClient2.Controllers.InteractionRegistryController:getProximityPrompts();
    local v13 = u2.entries(v12);

    local function v20(p14) -- Line: 45
        -- upvalues: KnitClient2 (ref), InteractionCategory (ref), Players (ref), u11 (ref), u10 (ref)
        local v15 = p14[2];
        local v16 = KnitClient2.Controllers.InteractionRegistryController:getInteractionDefinition(p14[1]);

        if v16 ~= nil then
            v16 = v16.category;
        end;

        if v16 ~= InteractionCategory.ABILITY then
            return nil;
        end;

        local function v19(p17) -- Line: 56
            -- upvalues: Players (ref), u11 (ref), u10 (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            local Parent = p17.Parent;

            if not Parent then
                return nil;
            end;

            local v18 = nil;

            if Parent:IsA("BasePart") then
                v18 = Parent.Position;
            elseif Parent:IsA("Model") then
                v18 = Parent.PrimaryPart;

                if v18 ~= nil then
                    v18 = v18.Position;
                end;
            end;

            if not (Character and v18) then
                return nil;
            end;

            local Magnitude = (Character - v18).Magnitude;

            if p17.MaxActivationDistance < Magnitude then
                return nil;
            end;

            if Magnitude < u11 then
                u11 = Magnitude;
                u10 = p17;
            end;
        end;

        for i, v in v15 do
            v19(v, i - 1, v15);
        end;
    end;

    for i, v in v13 do
        v20(v, i - 1, v13);
    end;

    if u10 ~= nil then
        u10:InputHoldBegin();
    end;
end;

KnitClient.CreateController(u5.new());

return {
    PromptPriorioty = v4
};