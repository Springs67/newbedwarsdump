-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ProjectileImpactZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap;
local GhostOrbBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "ghost-orb-balance").GhostOrbBalance;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "GhostOrbController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "GhostOrbController";
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: KnitController (copy), default (copy), ProjectileImpactZap (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy), GhostOrbBalance (copy), RuntimeLib (copy), PlayerEntity (copy)
    KnitController.KnitStart(u7);
    default.Client:OnEvent("GhostOrbStartGravity", function(p8) -- Line: 38
        -- upvalues: u7 (copy)
        u7:startGravity(p8.player, p8.primaryPart);
    end);
    ProjectileImpactZap.On(function(p9, p10, p11, p12, p13, p14, p15, p16) -- Line: 41
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), EntityUtil (ref), GhostOrbBalance (ref), RuntimeLib (ref), PlayerEntity (ref), u7 (copy)
        if p11.Name ~= "ghost_orb" then
            return nil;
        end;

        local v17 = ReplicatedStorage.Assets.Effects.GhostOrbEffect:Clone();
        v17.CFrame = CFrame.new(p9);
        v17.Parent = Workspace;
        EffectUtil:playEffects({ v17 }, nil, {
            destroyAfterSec = 2.5
        });
        SoundManager:playSound(GameSound.GLITCHED_LUCKY_BLOCK_TELEPORT, {
            position = p9
        });

        for _, v in EntityUtil:getEntitiesNearPosition(p9, GhostOrbBalance.GHOST_ORB_SPLASH_RADIUS) do
            local v18 = EntityUtil:getEntity(v);

            if not RuntimeLib.instanceof(v18, PlayerEntity) then
                return nil;
            end;

            local v19 = v18:getPlayer();
            local Character = v19.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                return nil;
            end;

            local u20 = EntityUtil:getEntity(v19);

            if not u20 then
                return nil;
            end;

            u7:changeTransparency(u20, GhostOrbBalance.GHOST_ORB_TARGET_TRANSPARENCY);
            task.delay(GhostOrbBalance.GHOST_ORB_DURATION, function() -- Line: 77
                -- upvalues: u7 (ref), u20 (copy)
                u7:changeTransparency(u20, 0);
            end);
        end;
    end);
end;

function u4.startGravity(p21, p22, u23) -- Line: 114
    -- upvalues: u1 (copy), u2 (copy), GhostOrbBalance (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local u24 = u1.new();
    local u25 = true;
    local Character = p22.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Humanoid");
    end;

    local u26 = u2("BodyForce", {
        Parent = u23,
        Force = Vector3.new(0, GhostOrbBalance.GRAVITY_MULTIPLIER * Workspace.Gravity * u23.AssemblyMass, 0)
    });
    u23.AssemblyLinearVelocity = Vector3.new(0, GhostOrbBalance.GRAVITY_UPWARD_VELOCITY, 0);
    local u27 = SoundManager:playModifiableSound(GameSound.GHOST_ORB_ACTIVE_LOOPED, {});
    task.delay(GhostOrbBalance.GHOST_ORB_TIME_TO_BOBBING, function() -- Line: 128
        -- upvalues: u25 (ref), GhostOrbBalance (ref), u23 (copy)
        while u25 do
            local GRAVITY_BOBBLE_AMPLITUDE = GhostOrbBalance.GRAVITY_BOBBLE_AMPLITUDE;
            local v28 = GhostOrbBalance.GRAVITY_BOBBLE_FREQUENCY * tick();
            local v29 = GRAVITY_BOBBLE_AMPLITUDE * math.sin(v28);
            local v30 = math.clamp(v29, -GhostOrbBalance.GRAVITY_BOBBLE_AMPLITUDE, GhostOrbBalance.GRAVITY_BOBBLE_AMPLITUDE);
            u23.AssemblyLinearVelocity = Vector3.new(0, v30, 0);
            task.wait(0.1);
        end;
    end);
    u24:GiveTask(function() -- Line: 136
        -- upvalues: u25 (ref), u26 (copy), u27 (copy), u23 (copy)
        u25 = false;
        u26:Destroy();

        if u27 then
            u27:Pause();
        end;

        u23.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
    end);
    task.delay(GhostOrbBalance.GHOST_ORB_DURATION, function() -- Line: 144
        -- upvalues: u24 (copy)
        u24:DoCleaning();
    end);
end;

function u4.changeTransparency(p31, u32, u33) -- Line: 148
    -- upvalues: GhostOrbBalance (copy)
    local v34 = u32:getInstance():GetAttribute("Transparency");
    local u35 = v34 == nil and 0 or v34;
    local u36 = tick();

    local function u39() -- Line: 155
        -- upvalues: u36 (copy), GhostOrbBalance (ref), u35 (ref), u33 (copy), u32 (copy), u39 (ref)
        local v37 = (tick() - u36) / GhostOrbBalance.GHOST_ORB_TRANSPARENCY_TIME;
        local v38 = math.clamp(v37, 0, 1);
        u32:getInstance():SetAttribute("Transparency", u35 + (u33 - u35) * v38);

        if v38 < 1 then
            task.wait(0.03);
            u39();
        end;
    end;

    u39();
end;

KnitClient.CreateController(u4.new());

return nil;