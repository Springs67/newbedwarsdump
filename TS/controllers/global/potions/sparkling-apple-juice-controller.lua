-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SparklingAppleJuiceController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "SparklingAppleJuiceController";
    p5.entityInstanceMaid = {};
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), StatusEffectType (copy), CollectionService (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ItemConsumed:connect(function(p7) -- Line: 34
        -- upvalues: ItemType (ref), u6 (copy)
        if p7.itemType == ItemType.SPARKLING_APPLE_JUICE then
            local v8 = p7.entity:getInstance();
            u6.entityInstanceMaid[v8] = u6:setEffectsOnCharacter(v8);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p9) -- Line: 42
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p9.statusEffect == StatusEffectType.SPEED then
            u6:removeEffects(p9.entityInstance);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p10) -- Line: 48
        -- upvalues: u6 (copy)
        u6:removeEffects(p10);
    end);
end;

function u3.removeEffects(p11, p12) -- Line: 53
    local v13 = p11.entityInstanceMaid[p12];

    if v13 then
        v13:DoCleaning();
        p11.entityInstanceMaid[p12] = nil;
    end;
end;

function u3.setEffectsOnCharacter(p14, p15) -- Line: 64
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), CollectionService (copy)
    local v16 = u1.new();
    local v17 = ReplicatedStorage.Assets.Effects.SparklingAppleJuiceEffect:Clone();
    v17.Parent = Workspace;
    local Trail = v17.Trail;
    Trail.Parent = p15;
    Trail.Attachment0 = p15.LowerTorso.WaistCenterAttachment;
    Trail.Attachment1 = p15.UpperTorso.NeckAttachment;
    CollectionService:AddTag(Trail, "FirstPersonHidden");
    v16:GiveTask(Trail);
    local Bubbles = v17.Bubbles;
    Bubbles.Parent = p15.UpperTorso;
    CollectionService:AddTag(Bubbles, "FirstPersonHidden");
    v16:GiveTask(Bubbles);
    local Sparkles = v17.Sparkles;
    Sparkles.Parent = p15.UpperTorso;
    CollectionService:AddTag(Sparkles, "FirstPersonHidden");
    v16:GiveTask(Sparkles);

    return v16;
end;

KnitClient.CreateController(u3.new());

return nil;