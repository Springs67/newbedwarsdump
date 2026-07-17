-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "EggLauncherController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "EggLauncherController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("EggExplode"):Connect(function(u6) -- Line: 32
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        local u7 = ReplicatedStorage.Assets.Effects.EggExplosion:Clone();
        u7.Parent = Workspace;
        u7.Position = u6.position;
        SoundManager:playSound(GameSound.GLUE_ENCHANT_01, {
            rollOffMaxDistance = 220,
            volumeMultiplier = 2,
            position = u6.position
        });
        SoundManager:playSound(GameSound.EGG_EXPLOSION, {
            rollOffMaxDistance = 220,
            position = u6.position
        });

        local function _(p8) -- Line: 46
            if p8:IsA("ParticleEmitter") then
                p8:Emit(30);
            end;
        end;

        for i, descendant in u7:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(30);
            end;
        end;

        local v9 = false;
        local v10 = 0;

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= math.random() * 2 + 3 then
                task.delay(1, function() -- Line: 81
                    -- upvalues: u7 (copy)
                    u7:Destroy();
                end);

                return;
            end;

            task.spawn(function() -- Line: 67
                -- upvalues: ReplicatedStorage (ref), Workspace (ref), u6 (copy)
                local v11 = ReplicatedStorage.Assets.Effects.EasterEggDebris:Clone();
                v11.Parent = Workspace;
                v11.Position = u6.position;
                local v12 = math.random() * 3.141592653589793 * 2;
                local v13 = math.cos(v12) * 20;
                local v14 = math.sin(v12) * 20;
                v11:ApplyImpulse(Vector3.new(v13, 50, v14) * v11.Mass);
                task.wait(1);
                v11:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.ProjectileRender:connect(function(p15) -- Line: 85
        if p15.projectile.Name == "easter_egg" then
            p15.cframe = p15.cframe * CFrame.Angles(0, 0, p15.totalTime * 3.141592653589793);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;