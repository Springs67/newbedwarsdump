-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;

local function _(p4) -- Line: 17
    -- upvalues: Linear (copy)
    local v5 = Linear(p4, -100, 200, 5);
    local v6 = -20 / (((p4 - 2) / 0.5) ^ 2 + 2) + 50 + math.sin(p4 * 3) * 3;

    return Vector3.new(v5, v6, 0);
end;

local function _(p7) -- Line: 22
    -- upvalues: Linear (copy)
    if p7 <= 1 then
        return Linear(p7, 1, -1, 0.5);
    end;

    return p7 <= 4.5 and 0 or Linear(p7 - 4.5, 0, 1, 0.5);
end;

local u8 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "DragonIncinerateKillEffect";
    end,

    __index = KillEffect
});
u8.__index = u8;

function u8.new(...) -- Line: 44
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, ...) -- Line: 48
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p10, ...);
end;

function u8.onKill(p11, p12, p13, u14) -- Line: 51
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u2 (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), default (copy), Linear (copy), RunService (copy), RandomUtil (copy)
    local u15 = u1.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16.HumanoidRootPart.Anchored = true;
    u16:PivotTo(u14);
    u16.Parent = Workspace;
    KillEffect.hideCharacter(p11, p13);
    u15:GiveTask(u16);
    local _DamageHighlight_ = u16:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local function _(p17) -- Line: 69
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

    if not p13.PrimaryPart then
        return u15;
    end;

    local u18 = ReplicatedStorage.Assets.Misc.FlyingDragon:Clone();
    u18.PrimaryPart.Anchored = true;
    u18:PivotTo(u14);
    u18:ScaleTo(0.5);
    u18.Parent = Workspace;
    u15:GiveTask(u18);

    local function _(p19) -- Line: 91
        -- upvalues: u2 (ref), u18 (copy), u15 (copy)
        local v20 = u2("Sound", {
            Volume = 1,
            RollOffMaxDistance = 300,
            SoundId = p19,
            Parent = u18.PrimaryPart
        });
        u15:GiveTask(v20);

        return v20;
    end;

    local u21 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_ROAR,
        Parent = u18.PrimaryPart
    });
    u15:GiveTask(u21);
    local u22 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_WING_FLAP_1,
        Parent = u18.PrimaryPart
    });
    u15:GiveTask(u22);
    local u23 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_WING_FLAP_2,
        Parent = u18.PrimaryPart
    });
    u15:GiveTask(u23);
    local Animator = u18.AnimationController.Animator;
    local v24 = u2("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.DRAGON_FLYING)
    });
    u15:GiveTask(v24);
    local v25 = u2("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.DRAGON_BREATH)
    });
    u15:GiveTask(v25);
    local v26 = Animator:LoadAnimation(v24);
    u15:GiveTask(v26);
    local u27 = Animator:LoadAnimation(v25);
    u15:GiveTask(u27);
    v26:Play();
    local u28 = ReplicatedStorage.Assets.Effects.DragonEffect:Clone();
    local CFrame2 = u18.PrimaryPart.CFrame;
    local v29 = CFrame.new(0, 5, -15);
    local v30 = CFrame.Angles(0, 1.5707963267948966, 0);
    u28.CFrame = CFrame2 * v29 * v30;
    u28.CanCollide = false;
    u28.Anchored = true;
    u28.Parent = Workspace;
    u15:GiveTask(u28);
    EffectUtil:toggleEffects(u28, false);
    local u31 = {};

    for _, child in ReplicatedStorage.Assets.Effects.Burn:GetChildren() do
        if child:IsA("ParticleEmitter") then
            local v32 = child:Clone();
            v32.Parent = u16.UpperTorso;
            u15:GiveTask(v32);
            table.insert(u31, v32);
        end;
    end;

    task.delay(0.5, function() -- Line: 138
        -- upvalues: u27 (copy), u21 (copy), EffectUtil (ref), u28 (copy), u16 (copy), default (ref), Linear (ref), u31 (copy)
        u27:Play();
        u21:Play();
        EffectUtil:toggleEffects(u28, true);
        EffectUtil:toggleEffects(u28, true, 0.5);
        local v33 = u16:GetDescendants();

        local function v36(u34) -- Line: 144
            -- upvalues: default (ref), Linear (ref)
            if u34:IsA("BasePart") and u34.Name ~= "HumanoidRootPart" then
                default(3, Linear, function(p35) -- Line: 146
                    -- upvalues: u34 (copy)
                    u34.LocalTransparencyModifier = p35;
                end):Play();
            end;
        end;

        for i, v in v33 do
            v36(v, i - 1, v33);
        end;

        for _, v in u31 do
            v.Enabled = true;
        end;
    end);
    task.delay(3.5, function() -- Line: 159
        -- upvalues: EffectUtil (ref), u28 (copy), u27 (copy), u31 (copy)
        EffectUtil:toggleEffects(u28, false, 0.5);
        u27:Stop(1);

        for _, v in u31 do
            v.Enabled = false;
        end;
    end);
    local u37 = os.clock();
    local u38 = 0;
    u15:GiveTask(RunService.Heartbeat:Connect(function(p39) -- Line: 168
        -- upvalues: u38 (ref), Linear (ref), u14 (copy), u18 (copy)
        u38 = u38 + p39;
        local v40 = u38;
        local v41 = Linear(v40, -100, 200, 5);
        local v42 = -20 / (((v40 - 2) / 0.5) ^ 2 + 2) + 50 + math.sin(v40 * 3) * 3;
        local v43 = Vector3.new(v41, v42, 0);
        local v44 = u38 + 0.05;
        local v45 = Linear(v44, -100, 200, 5);
        local v46 = -20 / (((v44 - 2) / 0.5) ^ 2 + 2) + 50 + math.sin(v44 * 3) * 3;
        local v47 = v43 - Vector3.new(v45, v46, 0);
        local v48 = v47.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v47.Unit);
        local v49 = u14.Position + v43;
        u18:PivotTo(CFrame.lookAt(v49, v49 + v48));
        local v50 = u38;
        local u51;

        if v50 <= 1 then
            u51 = Linear(v50, 1, -1, 0.5);
        else
            u51 = v50 <= 4.5 and 0 or Linear(v50 - 4.5, 0, 1, 0.5);
        end;

        local function _(p52) -- Line: 178
            -- upvalues: u51 (copy)
            if p52:IsA("BasePart") and p52.Name ~= "RootPart" or p52:IsA("Decal") then
                p52.Transparency = u51;
            end;
        end;

        for i, descendant in u18:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.Name ~= "RootPart" or descendant:IsA("Decal") then
                descendant.Transparency = u51;
            end;
        end;
    end));
    u15:GiveTask(RunService.Heartbeat:Connect(function(p53) -- Line: 187
        -- upvalues: u18 (copy), u28 (copy), u14 (copy), u37 (copy)
        local TransformedWorldCFrame = u18.RootPart.master_bone.torso["torso.001"].neck["neck.001"]["neck.002"].head.TransformedWorldCFrame;
        local v54 = CFrame.new(0, 20, 1);
        local v55 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966);
        u28.CFrame = TransformedWorldCFrame * v54 * v55;
        local Position = u14.Position;

        if Position then
            for _, descendant in u28:GetDescendants() do
                if descendant:IsA("Beam") then
                    local Attachment0 = descendant.Attachment0;
                    local Attachment1 = descendant.Attachment1;

                    if Attachment1 and Attachment0 then
                        local v56 = os.clock() - u37;
                        local v57 = math.clamp(v56, 0, 1);
                        local v58 = (CFrame.new(Position) * (Attachment1.CFrame - Attachment1.CFrame.Position)).Position + Attachment1.CFrame.LookVector * 7;
                        Attachment1.WorldPosition = Attachment0.WorldPosition:Lerp(v58, (math.clamp(v57, 0.3, 1)));
                    end;
                end;
            end;
        end;
    end));
    u15:GiveTask(v26:GetMarkerReachedSignal("sound"):Connect(function() -- Line: 212
        -- upvalues: RandomUtil (ref), u22 (copy), u23 (copy)
        RandomUtil.fromList(u22, u23):Play();
    end));
    task.delay(5.5, function() -- Line: 215
        -- upvalues: u15 (copy)
        u15:Destroy();
    end);

    return u15;
end;

return u8;