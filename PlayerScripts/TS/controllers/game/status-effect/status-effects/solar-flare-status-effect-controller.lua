-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MagicalGirlScepterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "magical-girl-scepter", "magical-girl-scepter-util").MagicalGirlScepterUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SolarFlareStatusEffectController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SolarFlareStatusEffectController";
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ReplicatedStorage (copy), Workspace (copy), StatusEffectType (copy), default (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ProjectileHit:connect(function(p7) -- Line: 36
        -- upvalues: ReplicatedStorage (ref), Workspace (ref)
        if p7:isCancelled() then
            return nil;
        end;

        if p7.projectileType == "hero_magical_girl_scepter_projectile" or p7.projectileType == "hero_magical_girl_scepter_multi_projectile" then
            local u8 = ReplicatedStorage.Assets.Effects.SolarFlare:Clone();
            u8.CFrame = p7.hitData.hitCFrame;
            u8.Parent = Workspace;

            for _, descendant in u8:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(15);
                end;
            end;

            task.delay(4, function() -- Line: 49
                -- upvalues: u8 (copy)
                u8:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p9) -- Line: 54
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p9.statusEffect == StatusEffectType.SOLAR_FLARE then
            u6:setEffects(p9.entityInstance:GetPrimaryPartCFrame().Position, p9.entityInstance);
        end;
    end);
    ClientSyncEvents.StatusEffectChanged:connect(function(p10) -- Line: 60
        -- upvalues: StatusEffectType (ref), u6 (copy)
        if p10.statusEffect == StatusEffectType.SOLAR_FLARE then
            u6:setEffects(p10.entityInstance:GetPrimaryPartCFrame().Position, p10.entityInstance);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p11) -- Line: 66
        -- upvalues: StatusEffectType (ref)
        if p11.statusEffect == StatusEffectType.SOLAR_FLARE then
            for _, child in p11.entityInstance:GetChildren() do
                if child.Name == "SolarFlareExplosion" then
                    child:Destroy();
                end;
            end;
        end;
    end);
    default.Client:OnEvent("SolarFlareExplosion", function(p12) -- Line: 75
        -- upvalues: ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), Workspace (ref), EffectUtil (ref)
        local u13 = ReplicatedStorage.Assets.Effects.SolarFlareLargeExplosion:Clone();
        SoundManager:playSound(GameSound.SOLAR_FLARE_EXPLOSION, {
            rollOffMaxDistance = 200,
            volumeMultiplier = 4,
            position = p12.position
        });
        u13.Parent = Workspace;
        u13.Color = Color3.new(0.93, 0.53, 0.89);
        EffectUtil:playEffects({ u13 }, nil, {
            sizeMultiplier = 3
        });
        u13:PivotTo(CFrame.new(p12.position));
        task.delay(2, function() -- Line: 88
            -- upvalues: u13 (copy)
            u13:Destroy();
        end);
    end);
end;

function u3.setEffects(p14, p15, p16) -- Line: 93
    -- upvalues: ReplicatedStorage (copy), u1 (copy), MagicalGirlScepterUtil (copy)
    local u17 = ReplicatedStorage.Assets.Effects.SolarFlareExplosion:Clone();
    u17.Parent = p16;
    u17.Position = p15;
    u1("WeldConstraint", {
        Part0 = u17,
        Part1 = p16.PrimaryPart,
        Parent = p16
    });
    task.delay(MagicalGirlScepterUtil.SOLAR_FLARE_AFTERSHOCK_DELAY, function() -- Line: 102
        -- upvalues: u17 (copy)
        for _, descendant in u17:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(1);
            end;
        end;

        task.delay(1, function() -- Line: 108
            -- upvalues: u17 (ref)
            u17:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;