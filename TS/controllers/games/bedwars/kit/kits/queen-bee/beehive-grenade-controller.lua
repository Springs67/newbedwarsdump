-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v1.Debris;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "BeehiveGrenadeController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 28
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BeehiveGrenadeController";
end;

function u2.KnitStart(u5) -- Line: 36
    -- upvalues: KnitController (copy), default2 (copy), BalanceFile (copy), ReplicatedStorage (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy)
    KnitController.KnitStart(u5);
    default2.Client:Get("BeehiveGrenadeExplode"):Connect(function(p6) -- Line: 38
        -- upvalues: u5 (copy), BalanceFile (ref), ReplicatedStorage (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref), Linear (ref)
        u5:playBeehiveBlast(p6.position);
        local v7 = false;
        local v8 = 0;

        while true do
            if v7 then
                v8 = v8 + 1;
            else
                v7 = true;
            end;

            if v8 >= BalanceFile.FLORA_SEEKING_BEE_COUNT then
                return;
            end;

            local u9;

            if v8 < #p6.miniExplosions then
                u9 = p6.miniExplosions[v8 + 1];
            else
                u9 = nil;
            end;

            local u10 = ReplicatedStorage.Assets.Effects.Bee:Clone();
            u10.Parent = Workspace;

            local function _(p11) -- Line: 56
                if p11:IsA("BasePart") then
                    p11.CanCollide = false;
                    p11.CanQuery = false;
                    p11.Anchored = true;
                end;
            end;

            for i, descendant in u10:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false;
                    descendant.CanQuery = false;
                    descendant.Anchored = true;
                end;
            end;

            local PrimaryPart = u10.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("RocketParticle");
            end;

            if PrimaryPart then
                PrimaryPart.Enabled = true;
            end;

            local v12 = u10:FindFirstChildOfClass("AnimationController");

            if v12 ~= nil then
                local v13 = v12:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEE_FLAP));
                v13.Looped = true;
                v13:Play();
            end;

            u10:PivotTo(CFrame.new(p6.position));
            local u14 = CFrame.new(p6.position);
            local v15 = math.random() * 3.141592653589793 * 2;
            local v16 = math.sin(v15) * 5;
            local v17 = 6 + math.random() * 2;
            local v18 = math.cos(v15) * 5;
            local u19 = u14 + Vector3.new(v16, v17, v18);
            local v20;

            if u9 == nil then
                v20 = u9;
            else
                v20 = u9.explosionTime;
            end;

            local v21;

            if v20 == 0 or (v20 ~= v20 or not v20) then
                v21 = v8 * 0.1 + 0.75;
            else
                v21 = u9.explosionTime - Workspace:GetServerTimeNow();
            end;

            local u22 = nil;
            u22 = default(v21, Linear, function(p23) -- Line: 93
                -- upvalues: u9 (copy), u22 (ref), u14 (copy), u19 (copy), u10 (copy)
                local v24 = u9;

                if v24 ~= nil then
                    v24 = v24.target;
                end;

                if v24 then
                    v24 = not u9.target.PrimaryPart;
                end;

                if v24 then
                    u22:Cancel();

                    return nil;
                end;

                local v25 = (0.5 * p23 + (math.pow(p23 - 0.5, 3) + 0.125)) / 0.75;
                local v26 = u9;

                if v26 ~= nil then
                    v26 = v26.target;
                end;

                local v27;

                if v26 then
                    v27 = v25 / 0.6;
                else
                    v27 = v25;
                end;

                local v28 = u14:Lerp(u19, (math.clamp(v27, 0, 1)));
                local v29 = u9;

                if v29 ~= nil then
                    v29 = v29.target.PrimaryPart;
                end;

                local v30;

                if v29 then
                    v30 = u9.target.PrimaryPart.CFrame;
                else
                    v30 = v28;
                end;

                local Position = u10:GetPrimaryPartCFrame().Position;
                local Position2 = v28:Lerp(v30, (math.clamp(v25 * 1.5 - 0.4, 0, 1))).Position;
                local v31 = Position2 - Position;
                u10:PivotTo(CFrame.new(Position2, Position2 + (v31.Magnitude == 0 and Vector3.new(1, 0, 0) or v31)));
            end);
            task.spawn(function() -- Line: 130
                -- upvalues: u22 (ref), u10 (copy), u9 (copy), u5 (ref), default (ref), Linear (ref)
                u22:Wait();
                local Position = u10:GetPrimaryPartCFrame().Position;
                local v32 = u9;

                if v32 ~= nil then
                    v32 = v32.target;
                end;

                if v32 then
                    v32 = u9.target.PrimaryPart;
                end;

                if v32 then
                    u10:Destroy();
                    u5:playBeeExplosion(Position);

                    return;
                end;

                default(0.5, Linear, function(u33) -- Line: 146
                    -- upvalues: u10 (ref)
                    local function _(p34) -- Line: 148
                        -- upvalues: u33 (copy)
                        if p34:IsA("BasePart") then
                            p34.Transparency = math.max(p34.Transparency, u33);
                        end;
                    end;

                    for i, descendant in u10:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("BasePart") then
                            descendant.Transparency = math.max(descendant.Transparency, u33);
                        end;
                    end;
                end);
                task.delay(0.55, function() -- Line: 157
                    -- upvalues: u10 (ref)
                    return u10:Destroy();
                end);
            end);
        end;
    end);
end;

function u2.playBeeExplosion(p35, p36) -- Line: 166
    -- upvalues: ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), EffectUtil (copy)
    local u37 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
        rollOffMaxDistance = 200,
        volumeMultiplier = 0.4,
        position = p36,
        playbackSpeedMultiplier = math.random() * 0.1 + 0.95
    });
    u37.Parent = Workspace;
    EffectUtil:playEffects({ u37 }, nil, {
        sizeMultiplier = 0.35
    });
    u37.CFrame = CFrame.new(p36);
    task.delay(2, function() -- Line: 179
        -- upvalues: u37 (copy)
        u37:Destroy();
    end);
end;

function u2.playBeehiveBlast(p38, p39) -- Line: 183
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), Debris (copy)
    local v40 = ReplicatedStorage.Assets.Effects.BeehiveGrenadeExplode:Clone();
    v40.Position = p39;
    v40.Parent = Workspace;
    v40.CanQuery = false;
    SoundManager:playSound(GameSound.BEEHIVE_GRENADE_EXPLODE, {
        rollOffMaxDistance = 180,
        rollOffMinDistance = 20,
        position = p39
    });

    local function _(p41) -- Line: 194
        if p41:IsA("ParticleEmitter") then
            p41:Emit(30);
        end;
    end;

    for i, descendant in v40:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    Debris:AddItem(v40, 3);
end;

KnitClient.CreateController(u2.new());

return nil;