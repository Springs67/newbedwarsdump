-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SummonVoidMobsController";
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
    p4.Name = "SummonVoidMobsController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(p5);
    default.Client:GetNamespace("WarlockBoss"):Get("WarlockSummonVoidMobs"):Connect(function(p6) -- Line: 32
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local summons = p6.summons;
        SoundManager:playSound(GameSound.HALLOWEEN_BOSS_CAST, {
            rollOffMaxDistance = 200,
            rollOffMinDistance = 10,
            position = p6.fromPosition,
            playbackSpeedMultiplier = math.random() * 0.1 + 0.95
        });

        local function v14(u7) -- Line: 41
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
            local u8 = ReplicatedStorage.Assets.Effects.Warlock.VoidSummonPortal:Clone();

            local function _(p9) -- Line: 45
                if p9:IsA("BasePart") then
                    p9.CanCollide = false;
                    p9.CanQuery = false;
                end;
            end;

            for i, descendant in u8:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false;
                    descendant.CanQuery = false;
                end;
            end;

            u8:PivotTo(CFrame.new(u7.position + Vector3.new(0, 5, 0)) * CFrame.Angles(0, 0, 1.5707963267948966));
            u8.Parent = Workspace;
            SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_SPAWN, {
                rollOffMaxDistance = 150,
                position = u8:GetPivot().Position
            });
            local u10 = SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_LOOP, {
                rollOffMaxDistance = 100,
                looped = true,
                position = u8:GetPivot().Position
            });
            local v11 = u7.summonAtTime - Workspace:GetServerTimeNow();
            task.delay(v11, function() -- Line: 72
                -- upvalues: ReplicatedStorage (ref), u7 (copy), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), u8 (copy)
                local v12 = ReplicatedStorage.Assets.Effects.WormholeTeleport:Clone();
                v12.CFrame = CFrame.new(u7.position + Vector3.new(0, 5, 0));
                v12.Parent = Workspace;
                EffectUtil:playEffects({ v12 }, nil, {
                    destroyAfterSec = 1
                });
                SoundManager:playSound(GameSound.VOID_PORTAL_TELEPORT, {
                    rollOffMaxDistance = 100,
                    position = u8:GetPivot().Position
                });
                SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_CLOSE, {
                    rollOffMaxDistance = 100,
                    position = u8:GetPivot().Position
                });
            end);
            task.delay(v11 + 0.25, function() -- Line: 91
                -- upvalues: u8 (copy), u10 (copy)
                u8:Destroy();
                local v13 = u10;

                if v13 ~= nil then
                    v13:Destroy();
                end;
            end);
        end;

        for i, v in summons do
            v14(v, i - 1, summons);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;