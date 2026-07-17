-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "LunarVenomStatusEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "LunarVenomStatusEffectController";
    p6.entityInstanceMaid = {};
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ReplicatedStorage (copy), Workspace (copy), StatusEffectType (copy), CollectionService (copy)
    KnitController.KnitStart(u7);
    ClientSyncEvents.ProjectileHit:connect(function(p8) -- Line: 34
        -- upvalues: ReplicatedStorage (ref), Workspace (ref)
        if p8:isCancelled() then
            return nil;
        end;

        if p8.projectileType == "villain_magical_girl_scepter_projectile" or p8.projectileType == "villain_magical_girl_scepter_multi_projectile" then
            local u9 = ReplicatedStorage.Assets.Effects.LunarVenomHit:Clone();
            u9.CFrame = p8.hitData.hitCFrame;
            u9.Parent = Workspace;

            for _, descendant in u9:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(10);
                end;
            end;

            task.delay(5, function() -- Line: 47
                -- upvalues: u9 (copy)
                u9:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p10) -- Line: 52
        -- upvalues: StatusEffectType (ref), u7 (copy)
        if p10.statusEffect == StatusEffectType.LUNAR_VENOM then
            local Position = p10.entityInstance:GetPrimaryPartCFrame().Position;
            u7.entityInstanceMaid[p10.entityInstance] = u7:setEffects(Position, p10.entityInstance);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p11) -- Line: 61
        -- upvalues: StatusEffectType (ref), u7 (copy)
        if p11.statusEffect == StatusEffectType.LUNAR_VENOM then
            u7:removeEffects(p11.entityInstance);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p12) -- Line: 67
        -- upvalues: u7 (copy)
        u7:removeEffects(p12);
    end);
end;

function u4.removeEffects(p13, p14) -- Line: 72
    local v15 = p13.entityInstanceMaid[p14];

    if v15 then
        v15:DoCleaning();
        p13.entityInstanceMaid[p14] = nil;
    end;
end;

function u4.setEffects(p16, p17, p18) -- Line: 83
    -- upvalues: u1 (copy), ReplicatedStorage (copy), u2 (copy), CollectionService (copy)
    local v19 = u1.new();
    local v20 = ReplicatedStorage.Assets.Effects.LunarVenom:Clone();
    v20.Parent = p18;
    v20.Position = p17;
    u2("WeldConstraint", {
        Part0 = v20,
        Part1 = p18.PrimaryPart,
        Parent = p18
    });
    CollectionService:AddTag(v20, "FirstPersonHidden");
    v19:GiveTask(v20);

    return v19;
end;

KnitClient.CreateController(u4.new());

return nil;