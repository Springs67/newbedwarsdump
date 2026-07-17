-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "HoleInWallController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "HoleInWallController";
    p6.holeInWallMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.KnitStart(u7);
    default2.Client:Get("SpawnGhostWall"):Connect(function(p8, p9, p10, p11, p12) -- Line: 38
        -- upvalues: u7 (copy)
        u7:spawnWall(p8, p9, p10, p11, p12);
    end);
    default2.Client:Get("EntityDeathEvent"):Connect(function(p13) -- Line: 41
        -- upvalues: u7 (copy)
        if p13.entityInstance.Name ~= "HalloweenBoss" then
            return nil;
        end;

        u7.holeInWallMaid:DoCleaning();
    end);
end;

function u4.spawnWall(p14, p15, p16, p17, p18, p19) -- Line: 48
    -- upvalues: u2 (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), GameQueryUtil (copy), default (copy), Linear (copy), Players (copy), default2 (copy)
    local u20 = u2.new();
    local u21 = ReplicatedStorage.Assets.Misc.HwBossWall:Clone();
    SoundManager:playSound(GameSound.HALLOWEEN_BOSS_FOG_LOOP, {
        rollOffMaxDistance = 400,
        volumeMultiplier = 0.8,
        parent = u21
    });
    local v22 = math.abs(p17.X);
    local v23 = math.abs(p17.Y);
    local v24 = math.abs(p17.Z);
    local v25 = Vector3.new(v22, v23, v24);
    local v26 = p15 - p16;
    local v27 = math.abs(v26.X);
    local v28 = math.abs(v26.Z);
    local v29 = Vector3.new(v27, 0, v28);
    u21.Size = v25 * 3.2 + v29 + Vector3.new(0, 18, 0);
    local u30 = p15:Lerp(p16, 0.5) + Vector3.new(0, u21.Size.Y / 2, 0);
    u21.Position = u30;

    for _, descendant in u21:GetDescendants() do
        if descendant:IsA("ParticleEmitter") then
            descendant.Rate = descendant.Rate * v29.Magnitude / 400;
        end;
    end;

    u21.Parent = Workspace;
    GameQueryUtil:setQueryIgnored(u21, true);
    local u31 = u30 + p17 * p18;
    local u33 = default(p18 / p19, Linear, function(p32) -- Line: 81
        -- upvalues: u21 (copy), u30 (copy), u31 (copy)
        u21.Position = u30:Lerp(u31, p32);
    end);
    p14.holeInWallMaid:GiveTask(function() -- Line: 84
        -- upvalues: u33 (copy)
        return u33:Cancel();
    end);
    local u34 = false;
    u20:GiveTask(u21.Touched:Connect(function(p35) -- Line: 88
        -- upvalues: Players (ref), u34 (ref), u20 (copy), default2 (ref)
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if not p35:IsDescendantOf(Character) then
            return nil;
        end;

        if u34 then
            return nil;
        end;

        u34 = true;
        u20:DoCleaning();
        default2.Client:Get("HitGhostWall"):SendToServer();
    end));
    task.spawn(function() -- Line: 103
        -- upvalues: u33 (copy), u21 (copy), u20 (copy)
        u33:Wait();
        u21:Destroy();
        u20:DoCleaning();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;