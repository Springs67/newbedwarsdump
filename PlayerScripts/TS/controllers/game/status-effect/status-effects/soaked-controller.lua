-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SoakedController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "SoakedController";
    p5.maid = u1.new();
    p5.isPlaying = false;
    p5.entityInstanceMaid = {};
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), EntityUtil (copy), Players (copy), KnitClient (copy), VignetteType (copy), default (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.StatusEffectAdded:connect(function(p7) -- Line: 39
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), u6 (copy), Players (ref), KnitClient (ref), VignetteType (ref)
        if p7.statusEffect ~= StatusEffectType.SOAKED then
            return nil;
        end;

        local v8 = EntityUtil:getPlayerFromEntityInstance(p7.entityInstance);
        u6.entityInstanceMaid[p7.entityInstance] = u6:setEffectsOnCharacter(p7.entityInstance);

        if v8 == Players.LocalPlayer and u6.isPlaying == false then
            KnitClient.Controllers.VignetteController:createVignette(VignetteType.SOAKED);
            u6.maid:GiveTask(function() -- Line: 51
                -- upvalues: KnitClient (ref), VignetteType (ref)
                KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.SOAKED);
            end);
            u6.isPlaying = true;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p9) -- Line: 57
        -- upvalues: EntityUtil (ref), u6 (copy), Players (ref), StatusEffectType (ref)
        local v10 = EntityUtil:getPlayerFromEntityInstance(p9.entityInstance);
        local v11 = u6.entityInstanceMaid[p9.entityInstance];

        if v11 then
            v11:DoCleaning();
            u6.entityInstanceMaid[p9.entityInstance] = nil;
        end;

        if v10 == Players.LocalPlayer and p9.statusEffect == StatusEffectType.SOAKED then
            u6:cleanUpEffect();
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p12) -- Line: 72
        -- upvalues: Players (ref), u6 (copy)
        if Players:GetPlayerFromCharacter(p12.entityInstance) == Players.LocalPlayer then
            u6:cleanUpEffect();
        end;
    end);
end;

function u3.cleanUpEffect(p13) -- Line: 79
    p13.isPlaying = false;
    p13.maid:DoCleaning();
end;

function u3.setEffectsOnCharacter(p14, u15) -- Line: 83
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), CollectionService (copy)
    local u16 = u1.new();
    local u17 = ReplicatedStorage.Assets.Effects.SoakedEffect:Clone();
    u17.Parent = Workspace;

    local function _(p18) -- Line: 88
        -- upvalues: u17 (copy), u15 (copy), Players (ref), CollectionService (ref), u16 (copy)
        local v19 = u17.Droplets:Clone();
        v19.Parent = p18;

        if u15 == Players.LocalPlayer.Character then
            CollectionService:AddTag(v19, "FirstPersonHidden");
        end;

        u16:GiveTask(v19);
    end;

    for i, v in {
        u15.UpperTorso,
        u15.Head,
        u15.LeftUpperArm,
        u15.RightUpperArm
    } do
        local _ = i - 1;
        local v20 = u17.Droplets:Clone();
        v20.Parent = v;

        if u15 == Players.LocalPlayer.Character then
            CollectionService:AddTag(v20, "FirstPersonHidden");
        end;

        u16:GiveTask(v20);
    end;

    local u21 = {};

    local function _(p22) -- Line: 102
        -- upvalues: u21 (copy)
        if p22:IsA("MeshPart") then
            u21[p22] = p22.Material;
            p22.Material = Enum.Material.Glass;
        end;
    end;

    for i, descendant in u15:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") then
            u21[descendant] = descendant.Material;
            descendant.Material = Enum.Material.Glass;
        end;
    end;

    u16:GiveTask(function() -- Line: 113
        -- upvalues: u21 (copy)
        local function _(p23, p24) -- Line: 114
            p24.Material = p23;
        end;

        for i, v in u21 do
            i.Material = v;
        end;
    end);

    return u16;
end;

KnitClient.CreateController(u3.new());

return nil;