-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "BaseRegenController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BaseRegenController";
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), CollectionService (copy), u1 (copy), RunService (copy)
    KnitController.KnitStart(p6);
    ClientSyncEvents.StatusEffectAdded:connect(function(u7) -- Line: 34
        -- upvalues: StatusEffectType (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), CollectionService (ref), u1 (ref), RunService (ref)
        if u7.statusEffect ~= StatusEffectType.BASE_REGEN then
            return nil;
        end;

        local u8 = ReplicatedStorage.Assets.Effects.Enchant.RapidRegen:Clone();
        u8.Anchored = true;
        u8.CanCollide = false;
        u8.CanQuery = false;
        GameQueryUtil:setQueryIgnored(u8, true);
        u8.Parent = Workspace;
        CollectionService:AddTag(u8, u7.entityInstance.Name .. ":base-regen");
        local u9 = u1.new();
        u8.AncestryChanged:Connect(function(p10, p11) -- Line: 46
            -- upvalues: u9 (copy)
            if p11 == nil then
                u9:DoCleaning();
            end;
        end);
        (function(u12) -- Line: 51
            -- upvalues: u8 (copy), CollectionService (ref)
            local function _(p13) -- Line: 53
                -- upvalues: u12 (copy), CollectionService (ref)
                if p13:IsA("ParticleEmitter") then
                    p13.Enabled = u12;
                    p13:SetAttribute("FirstPersonVisible", false);
                    CollectionService:AddTag(p13, "FirstPersonHidden");
                end;
            end;

            for i, child in u8:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Enabled = u12;
                    child:SetAttribute("FirstPersonVisible", false);
                    CollectionService:AddTag(child, "FirstPersonHidden");
                end;
            end;
        end)(true);
        u9:GiveTask(RunService.Heartbeat:Connect(function(p14) -- Line: 68
            -- upvalues: u7 (copy), u8 (copy)
            if u7.entityInstance.PrimaryPart == nil then
                return nil;
            end;

            u8.CFrame = u7.entityInstance.PrimaryPart.CFrame;
        end));
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p15) -- Line: 75
        -- upvalues: StatusEffectType (ref), CollectionService (ref)
        if p15.statusEffect ~= StatusEffectType.BASE_REGEN then
            return nil;
        end;

        local function _(p16) -- Line: 80
            p16:Destroy();
        end;

        for i, v in CollectionService:GetTagged(p15.entityInstance.Name .. ":base-regen") do
            local _ = i - 1;
            v:Destroy();
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;