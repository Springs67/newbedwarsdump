-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "GoldenAppleController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "GoldenAppleController";
    p5.entityInstanceMaid = {};
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), CollectionService (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.StatusEffectAdded:connect(function(p7) -- Line: 36
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p7.statusEffect == StatusEffectType.GOLDEN_APPLE then
            u6.entityInstanceMaid[p7.entityInstance] = u6:setEffectsOnCharacter(p7.entityInstance);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p8) -- Line: 44
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p8.statusEffect == StatusEffectType.GOLDEN_APPLE then
            u6:removeEffects(p8.entityInstance);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p9) -- Line: 50
        -- upvalues: u6 (copy)
        u6:removeEffects(p9);
    end);
end;

function u3.removeEffects(p10, p11) -- Line: 55
    local v12 = p10.entityInstanceMaid[p11];

    if v12 then
        v12:DoCleaning();
        p10.entityInstanceMaid[p11] = nil;
    end;
end;

function u3.setEffectsOnCharacter(p13, u14) -- Line: 66
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), u1 (copy), ReplicatedStorage (copy), Workspace (copy), CollectionService (copy)
    if u14.PrimaryPart then
        local FIREWORK_EXPLODE_3 = GameSound.FIREWORK_EXPLODE_3;
        local v15 = {};
        local v16;

        if Players.LocalPlayer.Character == u14 then
            v16 = nil;
        else
            v16 = u14.PrimaryPart.Position;
        end;

        v15.position = v16;
        SoundManager:playSound(FIREWORK_EXPLODE_3, v15);
    end;

    local u17 = u1.new();
    local v18 = ReplicatedStorage.Assets.Effects.SparklingAppleJuiceEffect:Clone();
    v18.Parent = Workspace;
    u17:GiveTask(v18);
    local Trail = v18.Trail;
    Trail.Parent = u14;
    Trail.Attachment0 = u14.LowerTorso.WaistCenterAttachment;
    Trail.Attachment1 = u14.UpperTorso.NeckAttachment;
    CollectionService:AddTag(Trail, "FirstPersonHidden");
    u17:GiveTask(Trail);
    local Sparkles = v18.Sparkles;
    Sparkles.Parent = u14.UpperTorso;
    CollectionService:AddTag(Sparkles, "FirstPersonHidden");
    u17:GiveTask(Sparkles);
    local v19 = ReplicatedStorage.Assets.Effects.GoldenAppleRays:Clone();
    v19.Parent = Workspace;
    u17:GiveTask(v19);
    local v20 = v19:GetChildren();

    local function v22(p21) -- Line: 90
        -- upvalues: u14 (copy), Players (ref), u17 (copy)
        if p21:IsA("ParticleEmitter") then
            p21.Parent = u14.Head.FaceCenterAttachment;
            p21.Enabled = true;
            p21.Transparency = NumberSequence.new(0.5, 1);

            if Players.LocalPlayer.Character == u14 then
                p21.Transparency = NumberSequence.new(1);
            end;

            u17:GiveTask(p21);
        end;
    end;

    for i, v in v20 do
        v22(v, i - 1, v20);
    end;

    return u17;
end;

KnitClient.CreateController(u3.new());

return nil;