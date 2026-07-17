-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InCubic = v2.InCubic;
local Linear = v2.Linear;
local OutElastic = v2.OutElastic;
local OutQuad = v2.OutQuad;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local SingleMotor = v3.SingleMotor;
local Spring = v3.Spring;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local u7 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic");
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
Random.new();
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "MirrorKillEffect";
    end,

    __index = KillEffect
});
u8.__index = u8;

function u8.new(...) -- Line: 39
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, p11) -- Line: 43
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p10, p11);
    KillEffect.setPlayDefaultKillEffect(p10, false);
end;

function u8.onKill(p12, p13, p14, u15) -- Line: 47
    -- upvalues: u4 (copy), SoundManager (copy), GameSound (copy), Workspace (copy), KillEffect (copy), SingleMotor (copy), ReplicatedStorage (copy), GameQueryUtil (copy), u7 (copy), u5 (copy), AnimationUtil (copy), RuntimeLib (copy), default (copy), OutElastic (copy), OutQuad (copy), Spring (copy), GameAnimationUtil (copy), AnimationType (copy), Linear (copy), RunService (copy), InCubic (copy), GameWorldUtil (copy)
    local u16 = u4.new();
    u16:GiveTask(SoundManager:playSound(GameSound.MIRROR_EFFECT, {
        rollOffMaxDistance = 100,
        position = u15.Position
    }));
    p14.Archivable = true;
    local u17 = p14:Clone();
    u17.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u17.HumanoidRootPart.Anchored = true;
    u17:PivotTo(u15);
    u17.Parent = Workspace;
    KillEffect.hideCharacter(p12, p14);
    u16:GiveTask(u17);
    local u18 = SingleMotor.new(0);
    local u19 = u15 * CFrame.new(0, -20, 10);
    local u20 = ReplicatedStorage.Assets.Effects.MagicMirror:Clone();

    for _, child in u20:GetChildren() do
        if child:IsA("BasePart") then
            child.Anchored = true;
            child.CanCollide = false;
        end;
    end;

    GameQueryUtil:setQueryIgnored(u20, true);
    u20.Parent = Workspace;
    u16:GiveTask(u20);
    local u21 = u7.createFaces(u20.PrimaryPart, u17, { Enum.NormalId.Front });
    local v22 = {};
    local v23 = u21[Enum.NormalId.Front];

    if v23 ~= nil then
        v23 = v23.slice.worldModel;
    end;

    v22.Parent = v23;
    v22.Anchored = true;
    v22.CanCollide = false;
    v22.Color = Color3.fromRGB(255, 255, 255);
    v22.Size = Vector3.new(256, 1, 256);
    v22.CFrame = u19 * CFrame.new(0, 16.5, 0);
    v22.Material = Enum.Material.SmoothPlastic;
    local u24 = u5("Part", v22);
    GameQueryUtil:setQueryIgnored(u24, true);
    u16:GiveTask(u24);
    local v25 = ReplicatedStorage.Assets.Effects.FloorShadow:Clone();
    v25.Anchored = true;
    v25.CanCollide = false;
    GameQueryUtil:setQueryIgnored(v25, true);
    v25.Size = Vector3.new(8, 1, 5);
    local v26 = u21[Enum.NormalId.Front];

    if v26 ~= nil then
        v26 = v26.slice.worldModel;
    end;

    v25.Parent = v26;
    v25.CFrame = u19 * CFrame.new(0, 16.55, 1.5);
    u16:GiveTask(v25);
    u21[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    u21[Enum.NormalId.Front].slice.viewportFrame.BackgroundTransparency = 0;
    u21[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255);

    for _, v in u21 do
        AnimationUtil:playAnimation(v.slice.clone.Humanoid.Animator, "rbxassetid://507766388");
    end;

    AnimationUtil:playAnimation(u17.Humanoid.Animator, "rbxassetid://507766388");
    local u52 = RuntimeLib.Promise.new(function() -- Line: 127
        -- upvalues: u15 (copy), default (ref), OutElastic (ref), u20 (copy), u19 (copy), OutQuad (ref), u18 (copy), Spring (ref), u17 (copy), u21 (copy), GameAnimationUtil (ref), AnimationType (ref), Linear (ref), u24 (copy), u16 (copy), RunService (ref), InCubic (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), GameWorldUtil (ref)
        local u27 = u15 * CFrame.new(0, 0, 10);
        default(0.1, OutElastic, function(p28) -- Line: 132
            -- upvalues: u20 (ref), u19 (ref), u27 (copy)
            u20:PivotTo(u19:Lerp(u27, p28));
        end, 0, 1):Wait();
        local u29 = nil;
        default(0.2, OutQuad, function(p30) -- Line: 138
            -- upvalues: u15 (ref), u27 (copy), u29 (ref), u18 (ref), Spring (ref), u17 (ref), u21 (ref)
            local v31 = u15:Lerp(u15 * CFrame.new(0, 0, 12), p30);
            local v32 = v31.Position - (u27 * CFrame.new(0, 0, -1)).Position;

            if u29 then
                u18:setGoal(Spring.new(math.rad((v31.Position - u29.Position).Magnitude * 50), {
                    dampingRatio = 0.75,
                    frequency = 15
                }));
            end;

            if u27.LookVector:Dot(v32) < 0 then
                u17:PivotTo(CFrame.new((1 / 0), (1 / 0), (1 / 0)));
            elseif u17.PrimaryPart then
                local v33 = v31 * CFrame.Angles(u18:getValue(), 0, 0);
                u29 = v33;
                u17:PivotTo(v33);
            end;

            for _, v in u21 do
                local v34 = v31 * CFrame.Angles(u18:getValue(), 0, 0);
                u29 = v34;
                local clone = v.slice.clone;

                if clone ~= nil then
                    clone:PivotTo(v34);
                end;
            end;
        end, 0, 1):Wait();

        for _, v in u21 do
            local v35 = u15 * CFrame.new(0, 0, 12);
            local clone = v.slice.clone;

            if clone ~= nil then
                clone:PivotTo(v35);
            end;
        end;

        task.wait(0.1);
        local u36 = GameAnimationUtil:playAnimation(u21[Enum.NormalId.Front].slice.clone.Humanoid.Animator, AnimationType.MIRROR_KILL_EFFECT, {
            looped = false
        });

        if u36 == nil then
            return nil;
        end;

        u36:AdjustSpeed(2);

        local function u37() -- Line: 196
            -- upvalues: u20 (ref)
            for _, child in u20.Part.Attachment:GetChildren() do
                if child:IsA("ParticleEmitter") then
                    child:Emit((child:GetAttribute("EmitCount")));
                end;
            end;
        end;

        task.delay(0.175, function() -- Line: 204
            -- upvalues: u37 (copy)
            return u37();
        end);
        task.delay(0.6083, function() -- Line: 207
            -- upvalues: u37 (copy)
            return u37();
        end);
        task.delay(0.975, function() -- Line: 210
            -- upvalues: u37 (copy)
            return u37();
        end);
        local u39 = default(u36.Length / 2 - 0.8, Linear, function(p38) -- Line: 213
            -- upvalues: u21 (ref), u24 (ref)
            u21[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(171, 33, 33), p38);
            u21[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 0, 0), p38);
            u24.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(153, 56, 79), p38);
        end, 0, 1);
        u16:GiveTask(function() -- Line: 220
            -- upvalues: u39 (copy)
            u39:Cancel();
        end);
        local u40 = 0;
        local v47 = RunService.Heartbeat:Connect(function(p41) -- Line: 224
            -- upvalues: u40 (ref), u36 (copy), InCubic (ref), u20 (ref), u15 (ref)
            u40 = u40 + p41;
            local v42 = u36.TimePosition / (u36.Length == 0 and 1 or u36.Length);
            local v43 = math.sin(u40 * 30) * InCubic(v42, 0.5, 5, 1);
            local v44 = math.rad(v43);
            local v45 = CFrame.new(math.noise(u40 * 20) * InCubic(v42, 0.1, 2, 1), 0, 10);
            local v46 = CFrame.Angles(0, 0, v44);
            u20:PivotTo(u15 * v45 * v46);
        end);

        if u36 ~= nil then
            u36 = u36.Length;
        end;

        task.wait(u36 / 2 - 0.2);
        v47:Disconnect();
        u20:Destroy();
        local u48 = ReplicatedStorage.Assets.Effects.MagicMirrorExplosion:Clone();
        u48.Anchored = true;
        u48.CanCollide = false;
        u48.CFrame = u15 * CFrame.new(0, 0, 10);
        GameQueryUtil:setQueryIgnored(u48, true);
        u48.Parent = Workspace;

        for _, descendant in u48:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                descendant:Emit((descendant:GetAttribute("EmitCount")));
            end;
        end;

        u16:GiveTask(u48);
        task.delay(3, function() -- Line: 257
            -- upvalues: u48 (copy)
            local v49 = u48;

            if v49 ~= nil then
                v49 = v49:Destroy();
            end;

            return v49;
        end);
        local v50 = ReplicatedStorage.Assets.Effects.FracturedMirror:Clone();
        GameQueryUtil:setQueryIgnored(v50, true);
        v50:PivotTo(u15 * CFrame.new(0, 0, 10));
        v50.Parent = Workspace;
        u16:GiveTask(v50);

        for _, descendant in v50:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Anchored = false;
                descendant.CanCollide = false;
                local v51 = GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 0.8726646259971648);
                descendant:ApplyImpulse(v51 * (descendant.AssemblyMass * 50));
                descendant:ApplyAngularImpulse(v51 * (descendant.AssemblyMass * 10));
            end;
        end;
    end);
    u16:GiveTask(function() -- Line: 286
        -- upvalues: u52 (copy)
        return u52:cancel();
    end);
    u16:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 289
        -- upvalues: u21 (copy), u7 (ref)
        for _, v in u21 do
            u7.update(v.surfaceGui, {
                viewportFrame = v.slice.viewportFrame,
                camera = v.slice.camera
            });
        end;
    end));
    u16:GiveTask(function() -- Line: 297
        -- upvalues: u21 (copy)
        for _, v in u21 do
            v.surfaceGui:Destroy();
        end;
    end);

    return u16;
end;

return u8;