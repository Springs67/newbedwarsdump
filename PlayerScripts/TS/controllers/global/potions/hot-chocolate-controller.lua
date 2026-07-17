-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "HotChocolateController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "HotChocolateController";
    p5.entityInstanceMaid = {};
end;

function u3.KnitStart(u6) -- Line: 31
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), StatusEffectType (copy), CollectionService (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ItemConsumed:connect(function(p7) -- Line: 33
        -- upvalues: ItemType (ref), u6 (copy)
        if p7.itemType == ItemType.HOT_CHOCOLATE then
            local v8 = p7.entity:getInstance();
            u6:removeEffects(v8);
            u6.entityInstanceMaid[v8] = u6:setEffectsOnCharacter(v8);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p9) -- Line: 42
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p9.statusEffect == StatusEffectType.TOASTY then
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
    -- upvalues: u1 (copy), ReplicatedStorage (copy), CollectionService (copy)
    local v16 = u1.new();
    local v17 = ReplicatedStorage.Assets.Effects.HotChocolate:Clone();
    local Smoke = v17.Smoke;
    Smoke.Parent = p15.UpperTorso.BodyFrontAttachment;
    CollectionService:AddTag(Smoke, "FirstPersonHidden");
    v16:GiveTask(Smoke);
    local PointLight = v17.PointLight;
    PointLight.Parent = p15.Head;
    v16:GiveTask(PointLight);

    return v16;
end;

KnitClient.CreateController(u3.new());

return nil;