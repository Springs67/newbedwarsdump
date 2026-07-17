-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "AlchemyCircleKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(u8, p9, p10, p11) -- Line: 37
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(p11);
    u13.Parent = Workspace;
    KillEffect.hideCharacter(u8, p10);
    u12:GiveTask(u13);
    local _DamageHighlight_ = u13:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local function _(p14) -- Line: 55
        if p14:IsA("GuiObject") then
            p14.Transparency = 1;

            return;
        end;

        if p14:IsA("UIStroke") then
            p14.Transparency = 1;

            return;
        end;

        if p14:IsA("Decal") then
            p14.Transparency = 1;
        end;
    end;

    for i, descendant in u13:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    local u15 = ReplicatedStorage.Assets.Effects.AlchemyCircle:Clone();
    u15:PivotTo(p11 + Vector3.new(0, -2.9, 0));
    u15.Parent = Workspace;
    u12:GiveTask(u15);
    u15.Ground.Summon.SummonCircle:Clear();
    u15.Ground.Summon.SummonCircle:Emit(1);
    u12:GiveTask(u15);
    AnimationUtil:playAnimation(u13:FindFirstChild("Humanoid"):FindFirstChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.ALCHEMY_CIRCLE_KILL_EFFECT), {
        looped = false
    });
    local v16 = SoundManager:playSound(GameSound.MAGIC_CIRCLE_SPAWN, {
        playbackSpeedMultiplier = 0.5,
        rollOffMaxDistance = 180,
        volumeMultiplier = 1,
        position = p11.Position
    });
    SoundManager:tweenSoundVolume(v16, 0, 6);
    u12:GiveTask(v16);
    task.delay(0.8, function() -- Line: 89
        -- upvalues: u8 (copy), u15 (copy), u13 (copy), u12 (copy)
        u8:fadeInImageLabel(u15.Outer.UI.Circle0, 1);
        u8:fadeInImageLabel(u15.Outer.UI.Circle1, 1);
        u8:fadeInImageLabel(u15.Middle.UI.Star, 1);
        u15.Ground.Particle.Main.Enabled = true;
        u15.Ground.Particle.PulseUp:Emit(1);
        task.delay(0.5, function() -- Line: 95
            -- upvalues: u15 (ref), u8 (ref), u13 (ref)
            u15.Ground1.Sparks.Enabled = false;
            u15.Ground1.GoldSparks.Enabled = true;
            u8:turnModelGold(u13);
        end);
        task.delay(1.5, function() -- Line: 100
            -- upvalues: u8 (ref), u15 (ref)
            u8:fadeOutImageLabel(u15.Outer.UI.Circle0, 1);
            u8:fadeOutImageLabel(u15.Outer.UI.Circle1, 1);
            u8:fadeOutImageLabel(u15.Middle.UI.Star, 1);
            u15.Ground.Particle.Main.Enabled = false;
        end);
        task.delay(4, function() -- Line: 106
            -- upvalues: u8 (ref), u13 (ref)
            u8:detachParts({ u13:FindFirstChild("Head") });
        end);
        task.delay(4.25, function() -- Line: 109
            -- upvalues: u8 (ref), u13 (ref)
            u8:detachParts({ u13:FindFirstChild("RightUpperArm"), u13:FindFirstChild("LeftUpperArm") });
        end);
        task.delay(4.5, function() -- Line: 112
            -- upvalues: u8 (ref), u13 (ref)
            u8:detachParts({ u13:FindFirstChild("UpperTorso") });
        end);
        task.delay(4.75, function() -- Line: 115
            -- upvalues: u8 (ref), u13 (ref)
            u8:detachParts({ u13:FindFirstChild("LeftLowerLeg"), u13:FindFirstChild("RightLowerLeg"), u13:FindFirstChild("LowerTorso") });
        end);
        task.delay(5, function() -- Line: 118
            -- upvalues: u12 (ref)
            u12:DoCleaning();
        end);
    end);

    return u12;
end;

function u4.fadeInImageLabel(p17, p18, p19) -- Line: 124
    -- upvalues: TweenService (copy)
    TweenService:Create(p18, TweenInfo.new(p19, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ImageTransparency = 0
    }):Play();
end;

function u4.fadeOutImageLabel(p20, p21, p22) -- Line: 129
    -- upvalues: TweenService (copy)
    TweenService:Create(p21, TweenInfo.new(p22, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ImageTransparency = 1
    }):Play();
end;

function u4.turnModelGold(p23, p24) -- Line: 134
    -- upvalues: KnitClient (copy), ArmorSlot (copy)
    local function _(p25) -- Line: 136
        if p25:IsA("BasePart") then
            p25.Material = Enum.Material.Metal;
        end;
    end;

    for i, descendant in p24:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Material = Enum.Material.Metal;
        end;
    end;

    KnitClient.Controllers.EntityHighlightController:highlight(p24, {
        transparency = 0,
        fadeInTime = 1,
        lastsForever = true,
        color = Color3.fromHex("#dbb658"),

        shouldApplyToPart = function(p26) -- Line: 149, Name: shouldApplyToPart
            -- upvalues: ArmorSlot (ref)
            local v27 = p26:FindFirstAncestorWhichIsA("Accessory");

            if not v27 or v27:GetAttribute("ArmorSlot") ~= ArmorSlot.HELMET then
                return true;
            end;

            local function _(p28) -- Line: 154
                if p28:IsA("Texture") then
                    p28.Transparency = 1;
                end;
            end;

            for i, descendant in v27:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Texture") then
                    descendant.Transparency = 1;
                end;
            end;

            return false;
        end
    });
end;

function u4.detachParts(u29, p30) -- Line: 169
    -- upvalues: GameQueryUtil (copy)
    for _, v in p30 do
        local v31;

        if v == nil then
            v31 = v;
        else
            v31 = v:IsA("BasePart");
        end;

        if v31 then
            for _, child in v:GetChildren() do
                if child:IsA("Motor6D") then
                    child:Destroy();
                end;
            end;

            local v32 = u29:getRandomPositionAround(v.Position, 6);
            local v33 = v.Position - v32;
            v:ApplyImpulse((Vector3.new(v33.X, 0, v33.Z).Unit * 10 + Vector3.new(0, 15, 0)) * v.AssemblyMass);
            v:ApplyAngularImpulse(Vector3.new(5, 10, 5) * v.AssemblyMass);
            v.Touched:Connect(function(p34) -- Line: 197
                -- upvalues: v (copy), GameQueryUtil (ref), u29 (copy)
                if v.Parent and p34:IsDescendantOf(v.Parent) then
                    return nil;
                end;

                if GameQueryUtil:isQueryIgnored(p34) then
                    return nil;
                end;

                task.wait(0.15);
                u29:despawnPart(v);
            end);
        end;
    end;
end;

function u4.getRandomPositionAround(p35, p36, p37) -- Line: 209
    local v38 = math.random() * 2 * 3.141592653589793;
    local v39 = math.random() * p37;
    local v40 = math.cos(v38) * v39;
    local v41 = math.sin(v38) * v39;

    return p36 + Vector3.new(v40, 0, v41);
end;

function u4.despawnPart(u42, p43) -- Line: 218
    -- upvalues: RandomUtil (copy), GameSound (copy), SoundManager (copy)
    if not p43.Parent then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(GameSound.ROCK_CRUMBLE_1, GameSound.ROCK_CRUMBLE_2, GameSound.ROCK_CRUMBLE_3), {
        volumeMultiplier = 0.2,
        position = p43.Position
    });
    local u44 = p43:GetConnectedParts(false);
    p43:Destroy();
    task.delay(0.12, function() -- Line: 229
        -- upvalues: u42 (copy), u44 (copy)
        local function _(p45) -- Line: 230
            -- upvalues: u42 (ref)
            u42:despawnPart(p45);
        end;

        for i, v in u44 do
            local _ = i - 1;
            u42:despawnPart(v);
        end;
    end);
end;

return u4;