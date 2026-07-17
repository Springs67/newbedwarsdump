-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InCubic = v2.InCubic;
local Linear = v2.Linear;
local OutBack = v2.OutBack;
local OutExpo = v2.OutExpo;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic");
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "PortalKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 35
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 39
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(u11, p12, p13, u14) -- Line: 43
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), GameQueryUtil (copy), u4 (copy), u6 (copy), ReplicatedStorage (copy), RuntimeLib (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), InCubic (copy), SoundManager (copy), GameSound (copy), OutBack (copy), EffectUtil (copy), AnimationUtil (copy), Linear (copy), OutExpo (copy), RunService (copy)
    local u15 = u3.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u16.HumanoidRootPart.Anchored = true;
    u16:PivotTo(u14);
    u16.Parent = Workspace;
    KillEffect.hideCharacter(u11, p13);
    u15:GiveTask(u16);

    local function _(p17) -- Line: 56
        if p17:IsA("GuiObject") then
            p17.Transparency = 1;

            return;
        end;

        if p17:IsA("UIStroke") then
            p17.Transparency = 1;

            return;
        end;

        if p17:IsA("Decal") then
            p17.Transparency = 1;
        end;
    end;

    for i, descendant in u16:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    local function _(p18) -- Line: 70
        -- upvalues: u16 (copy)
        if p18:IsA("BasePart") and (p18.Transparency ~= 1 and p18.Position.Y <= u16.PrimaryPart.Position.Y) then
            p18.Transparency = 0.01;

            if p18.Material == Enum.Material.Glass then
                p18.Material = Enum.Material.SmoothPlastic;
            end;
        end;
    end;

    for i, descendant in u16:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") and (descendant.Transparency ~= 1 and descendant.Position.Y <= u16.PrimaryPart.Position.Y) then
            descendant.Transparency = 0.01;

            if descendant.Material == Enum.Material.Glass then
                descendant.Material = Enum.Material.SmoothPlastic;
            end;
        end;
    end;

    local v19 = RaycastParams.new();
    v19.FilterType = Enum.RaycastFilterType.Exclude;
    v19:AddToFilter({ u16 });
    local v20 = GameQueryUtil:raycast(u14.Position, Vector3.new(0, -20, 0));
    local v21;

    if v20 == nil then
        v21 = v20;
    else
        v21 = v20.Position;
    end;

    local u22;

    if v21 then
        u22 = CFrame.new(v20.Position) * CFrame.Angles(u14:ToOrientation(), select(2, u14:ToOrientation()), (select(3, u14:ToOrientation())));
    else
        u22 = u14 + Vector3.new(0, -6, 0);
    end;

    local u23 = u4("Part", {
        Size = Vector3.new(0.0001, 7, 7),
        Rotation = Vector3.new(0, -90, -90),
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Shape = Enum.PartType.Cylinder,
        Position = u22.Position,
        Parent = Workspace
    });
    GameQueryUtil:setQueryIgnored(u23, true);
    u15:GiveTask(u23);
    local v24 = {
        Name = "KillEffectGlass",
        Anchored = true,
        Size = Vector3.new(1.5, 7, 7),
        CanCollide = false,
        Color = Color3.fromRGB(255, 255, 255)
    };
    local v25 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966);
    v24.CFrame = (u22 - Vector3.new(0, 0.76, 0)) * v25;
    v24.Material = Enum.Material.Glass;
    v24.Shape = Enum.PartType.Cylinder;
    v24.Transparency = 0.999;
    v24.Parent = Workspace;
    local u26 = u4("Part", v24);
    GameQueryUtil:setQueryIgnored(u26, true);
    u15:GiveTask(u26);
    local u27 = u6.createFaces(u23, u16, { Enum.NormalId.Left });

    for _, v in u27 do
        local v28 = ReplicatedStorage.Assets.Effects.PortalKillEffect.ViewportSkybox:Clone();
        v28.Parent = v.slice.viewportFrame;
        u15:GiveTask(v28);
        u4("UICorner", {
            CornerRadius = UDim.new(1, 0),
            Parent = v.slice.viewportFrame
        });
        local clone = v.slice.clone;

        if clone ~= nil then
            clone:PivotTo(CFrame.new(Vector3.new(0, 0, 0)));
        end;
    end;

    local u29 = ReplicatedStorage.Assets.Effects.PortalKillEffect.PortalParticles:Clone();
    u15:GiveTask(u29);
    local u30 = nil;
    local u41 = RuntimeLib.Promise.new(function() -- Line: 155
        -- upvalues: u16 (copy), GameAnimationUtil (ref), AnimationType (ref), u14 (copy), default (ref), InCubic (ref), u22 (copy), u29 (copy), u23 (copy), u15 (copy), SoundManager (ref), GameSound (ref), OutBack (ref), u30 (ref), EffectUtil (ref), KillEffect (ref), u11 (copy), u26 (copy), u27 (copy), AnimationUtil (ref), Linear (ref)
        GameAnimationUtil:playAnimation(u16.Humanoid.Animator, AnimationType.SUCKED_INTO_HOLE);
        default(0.4, InCubic, function(p31) -- Line: 164
            -- upvalues: u16 (ref)
            u16:PivotTo(p31);
        end, u14, u14 + Vector3.new(0, 1, 0)):Wait();
        default(0.7, InCubic, function(p32) -- Line: 172
            -- upvalues: u16 (ref)
            u16:PivotTo(p32);
        end, u14 + Vector3.new(0, 1, 0), u22);
        u29:PivotTo(CFrame.new(u23:GetPivot().Position) * CFrame.Angles(0, 0, 1.5707963267948966));
        u29.Parent = u23;
        u15:GiveTask(SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_SPAWN));
        local u33 = SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_LOOP, {
            rollOffMaxDistance = 100,
            looped = true,
            position = u23:GetPivot().Position
        });
        u15:GiveTask(u33);
        default(0.7, OutBack, function(p34) -- Line: 192
            -- upvalues: u23 (ref), u30 (ref)
            local v35 = math.noise(os.clock() * 15) * 1.5;
            u23.Size = Vector3.new((u30.X + v35) * p34, (u30.Y + v35) * p34, u30.Z);
        end, 0, 1):Wait();

        if u29.OnOpen then
            EffectUtil:playEffects({ u29.OnOpen }, nil);
        end;

        if u29.OnOpened then
            EffectUtil:playEffects({ u29.OnOpened }, nil);
        end;

        u15:GiveTask(function() -- Line: 204
            -- upvalues: u33 (copy)
            local v36 = u33;

            if v36 ~= nil then
                v36:Stop();
            end;

            local v37 = u33;

            if v37 ~= nil then
                v37:Destroy();
            end;
        end);
        KillEffect.hideCharacter(u11, u16);
        u26:Destroy();
        u15:GiveTask(SoundManager:playSound(GameSound.GLITCH_KILL_EFFECT, {
            position = u14.Position
        }));

        for _, v in u27 do
            AnimationUtil:playAnimation(v.slice.clone.Humanoid.Animator, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_LOCOMOTION_ASTRONAUT_FALL), {
                looped = true
            });
        end;

        default(3, Linear, function(p38) -- Line: 226
            -- upvalues: u27 (ref), u22 (ref)
            for _, v in u27 do
                local clone = v.slice.clone;

                if clone ~= nil then
                    local v39 = CFrame.new(0, -60 * p38, 0);
                    local v40 = CFrame.Angles(6.283185307179586 * p38, 6.283185307179586 * p38, 6.283185307179586 * p38);
                    clone:PivotTo(u22 * v39 * v40);
                end;
            end;
        end);
    end);
    u15:GiveTask(function() -- Line: 240
        -- upvalues: u41 (copy)
        return u41:cancel();
    end);
    u30 = u23.Size;
    local u53 = RuntimeLib.Promise.new(function() -- Line: 244
        -- upvalues: default (ref), Linear (ref), u29 (copy), OutBack (ref), u23 (copy), u30 (ref), OutExpo (ref), u15 (copy)
        task.wait(2);
        local u42 = nil;
        u42 = default(1, Linear, function(u43) -- Line: 248
            -- upvalues: u29 (ref), u42 (ref)
            if not u29:FindFirstChild("OnOpened") then
                u42:Cancel();

                return nil;
            end;

            local v44 = u29.OnOpened:GetDescendants();

            local function v48(p45) -- Line: 251
                -- upvalues: u43 (copy)
                if not (p45:IsA("ParticleEmitter") or p45:IsA("Beam")) then
                    if p45:IsA("ImageLabel") and p45.ImageTransparency < u43 then
                        p45.ImageTransparency = u43;
                    end;

                    return;
                end;

                local u46 = 1;

                local function _(p47) -- Line: 255
                    -- upvalues: u46 (ref)
                    if p47.Value < u46 then
                        u46 = p47.Value;
                    end;
                end;

                for i, v in p45.Transparency.Keypoints do
                    local _ = i - 1;

                    if v.Value < u46 then
                        u46 = v.Value;
                    end;
                end;

                if u46 < u43 then
                    p45.Transparency = NumberSequence.new(u43);
                end;
            end;

            for i, v in v44 do
                v48(v, i - 1, v44);
            end;
        end);
        default(1.4, OutBack, function(p49) -- Line: 281
            -- upvalues: u23 (ref), u30 (ref)
            local v50 = math.noise(os.clock() * 15) * 1.5;
            u23.Size = Vector3.new((u30.X + v50) * p49, (u30.Y + v50) * p49, u30.Z);
        end, 1, 0.3):Wait();
        task.wait(0.2);
        default(0.2, OutExpo, function(p51) -- Line: 286
            -- upvalues: u23 (ref), u30 (ref)
            local v52 = math.random() * 3;
            u23.Size = Vector3.new((u30.X + v52) * p51, (u30.Y + v52) * p51, u30.Z);
        end, 0.3, 0);
        task.delay(1, function() -- Line: 290
            -- upvalues: u15 (ref)
            u15:DoCleaning();
        end);
    end);
    u15:GiveTask(function() -- Line: 294
        -- upvalues: u53 (copy)
        return u53:cancel();
    end);
    u15:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 298
        -- upvalues: u27 (copy), u6 (ref)
        for _, v in u27 do
            u6.update(v.surfaceGui, {
                viewportFrame = v.slice.viewportFrame,
                camera = v.slice.camera
            });
        end;
    end));
    u15:GiveTask(function() -- Line: 306
        -- upvalues: u27 (copy)
        for _, v in u27 do
            v.surfaceGui:Destroy();
        end;
    end);
    u15:GiveTask(u23);

    return u15;
end;

return u7;