-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "GroundedStatusEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "GroundedStatusEffectController";
end;

function u4.KnitStart(p7) -- Line: 38
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), EntityUtil (copy), Players (copy), StatusEffectUtil (copy), StatusEffectType (copy), EntityDamageEventZap (copy), RandomUtil (copy), GameSound (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), u2 (copy)
    KnitController.KnitStart(p7);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p8) -- Line: 40
        -- upvalues: ItemType (ref), EntityUtil (ref), Players (ref), StatusEffectUtil (ref), StatusEffectType (ref)
        if p8.handItem.itemType == ItemType.TELEPEARL then
            local v9 = EntityUtil:getEntity(Players.LocalPlayer);

            if v9 ~= nil then
                v9 = v9:getInstance();
            end;

            if v9 and StatusEffectUtil:isActive(v9, StatusEffectType.GROUNDED) then
                p8:setCancelled(true);
            end;
        end;
    end);
    EntityDamageEventZap.On(function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23) -- Line: 52
        -- upvalues: StatusEffectUtil (ref), StatusEffectType (ref), RandomUtil (ref), GameSound (ref), SoundManager (ref)
        if p14 and StatusEffectUtil:isActive(p14, StatusEffectType.GROUNDED_ENCHANT) then
            local v24 = RandomUtil.fromList(GameSound.GLUE_ENCHANT_01, GameSound.GLUE_ENCHANT_02);
            local v25 = {};
            local PrimaryPart = p10.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            v25.position = PrimaryPart;
            SoundManager:playSound(v24, v25);
        end;
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p26) -- Line: 68
        -- upvalues: ReplicatedStorage (ref), Workspace (ref)
        if p26:isCancelled() then
            return nil;
        end;

        if p26.projectileType == "glue_trap" or p26.projectileType == "glue_trap_charging" then
            local u27 = ReplicatedStorage.Assets.Effects.GlueHit:Clone();
            u27.CFrame = p26.hitData.hitCFrame;
            u27.Parent = Workspace;

            for _, descendant in u27:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(30);
                end;
            end;

            task.delay(1, function() -- Line: 81
                -- upvalues: u27 (copy)
                u27:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p28) -- Line: 86
        -- upvalues: StatusEffectType (ref), ReplicatedStorage (ref), Workspace (ref), u2 (ref)
        if p28.statusEffect == StatusEffectType.GROUNDED then
            local u29 = ReplicatedStorage.Assets.Effects.GlueHit:Clone();
            local Position = p28.entityInstance:GetPrimaryPartCFrame().Position;
            u29.Position = Position;
            u29.Parent = Workspace;

            for _, descendant in u29:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(30);
                end;
            end;

            task.delay(1, function() -- Line: 97
                -- upvalues: u29 (copy)
                u29:Destroy();
            end);
            local v30 = ReplicatedStorage.Assets.Effects.GlueStatus:Clone();
            v30.Parent = p28.entityInstance;
            v30.Position = Position;
            u2("WeldConstraint", {
                Part0 = v30,
                Part1 = p28.entityInstance.PrimaryPart,
                Parent = p28.entityInstance
            });
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p31) -- Line: 110
        -- upvalues: StatusEffectType (ref)
        if p31.statusEffect == StatusEffectType.GROUNDED then
            for _, child in p31.entityInstance:GetChildren() do
                if child.Name == "GlueStatus" then
                    child:Destroy();
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;