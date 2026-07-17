-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
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
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "DragonIncinerateBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.DRAGON_INCINERATE);
    p6.Name = "DragonIncinerateBreakEffectController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, u9, u10, u11, p12) -- Line: 40
    task.spawn(function() -- Line: 41
        -- upvalues: u8 (copy), u10 (copy), u9 (copy), u11 (copy)
        u8:createEffect(u10, u9, u11);
    end);
end;

function u4.createEffect(u13, u14, p15, p16) -- Line: 45
    -- upvalues: u1 (copy), KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), u2 (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), EffectUtil (copy), default (copy), Linear (copy), RunService (copy), RandomUtil (copy)
    local u17 = u1.new();
    u13.maid:GiveTask(u17);
    local u18 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p16);

    if not u18 then
        return nil;
    end;

    u18.Name = "BedBreakEffectBedClone";
    u18:PivotTo(u14);
    u18.Parent = Workspace;
    u17:GiveTask(u18);

    local function _(p19) -- Line: 59
        if p19:IsA("BasePart") or p19:IsA("MeshPart") then
            p19.CanCollide = false;
            p19.CanQuery = false;
            p19.CanTouch = false;
        end;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    local u20 = ReplicatedStorage.Assets.Misc.FlyingDragon:Clone();
    u20.PrimaryPart.Anchored = true;
    u20:PivotTo(u14);
    u20:ScaleTo(0.5);
    u20.Parent = Workspace;
    u17:GiveTask(u20);

    local function _(p21) -- Line: 76
        -- upvalues: u2 (ref), u20 (copy), u17 (copy)
        local v22 = u2("Sound", {
            Volume = 1,
            RollOffMaxDistance = 300,
            SoundId = p21,
            Parent = u20.PrimaryPart
        });
        u17:GiveTask(v22);

        return v22;
    end;

    local u23 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_ROAR,
        Parent = u20.PrimaryPart
    });
    u17:GiveTask(u23);
    local u24 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_WING_FLAP_1,
        Parent = u20.PrimaryPart
    });
    u17:GiveTask(u24);
    local u25 = u2("Sound", {
        Volume = 1,
        RollOffMaxDistance = 300,
        SoundId = GameSound.DRAGON_WING_FLAP_2,
        Parent = u20.PrimaryPart
    });
    u17:GiveTask(u25);
    local Animator = u20.AnimationController.Animator;
    local v26 = u2("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.DRAGON_FLYING)
    });
    u17:GiveTask(v26);
    local v27 = u2("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.DRAGON_BREATH)
    });
    u17:GiveTask(v27);
    local v28 = Animator:LoadAnimation(v26);
    u17:GiveTask(v28);
    local u29 = Animator:LoadAnimation(v27);
    u17:GiveTask(u29);
    v28:Play();
    local u30 = ReplicatedStorage.Assets.Effects.DragonEffect:Clone();
    local CFrame2 = u20.PrimaryPart.CFrame;
    local v31 = CFrame.new(0, 5, -15);
    local v32 = CFrame.Angles(0, 1.5707963267948966, 0);
    u30.CFrame = CFrame2 * v31 * v32;
    u30.CanCollide = false;
    u30.Anchored = true;
    u30.Parent = Workspace;
    u17:GiveTask(u30);
    EffectUtil:toggleEffects(u30, false);
    local u33 = {};

    for _, child in ReplicatedStorage.Assets.Effects.Burn:GetChildren() do
        if child:IsA("ParticleEmitter") then
            local v34 = child:Clone();
            v34.Parent = u18:FindFirstChild("Root"):FindFirstChild("Bed");
            u17:GiveTask(v34);
            table.insert(u33, v34);
        end;
    end;

    task.delay(0.5, function() -- Line: 123
        -- upvalues: u29 (copy), u23 (copy), EffectUtil (ref), u30 (copy), u18 (copy), default (ref), Linear (ref), u33 (copy)
        u29:Play();
        u23:Play();
        EffectUtil:toggleEffects(u30, true);
        EffectUtil:toggleEffects(u30, true, 0.5);

        local function _(u35) -- Line: 129
            -- upvalues: default (ref), Linear (ref)
            if u35:IsA("BasePart") then
                default(3, Linear, function(p36) -- Line: 131
                    -- upvalues: u35 (copy)
                    u35.LocalTransparencyModifier = p36;
                end):Play();
            end;
        end;

        for i, descendant in u18:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                default(3, Linear, function(p37) -- Line: 131
                    -- upvalues: descendant (copy)
                    descendant.LocalTransparencyModifier = p37;
                end):Play();
            end;
        end;

        for _, v in u33 do
            v.Enabled = true;
        end;
    end);
    task.delay(3.5, function() -- Line: 144
        -- upvalues: EffectUtil (ref), u30 (copy), u29 (copy), u33 (copy)
        EffectUtil:toggleEffects(u30, false, 0.5);
        u29:Stop(1);

        for _, v in u33 do
            v.Enabled = false;
        end;
    end);
    local u38 = os.clock();
    local u39 = 0;
    u17:GiveTask(RunService.Heartbeat:Connect(function(p40) -- Line: 153
        -- upvalues: u39 (ref), u13 (copy), u14 (copy), u20 (copy)
        u39 = u39 + p40;
        local v41 = u13:getDragonOffsetAt(u39);
        local v42 = v41 - u13:getDragonOffsetAt(u39 + 0.05);
        local v43 = v42.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v42.Unit);
        local v44 = u14.Position + v41;
        u20:PivotTo(CFrame.lookAt(v44, v44 + v43));
        local u45 = u13:getDragonTransparencyAt(u39);

        local function _(p46) -- Line: 163
            -- upvalues: u45 (copy)
            if p46:IsA("BasePart") and p46.Name ~= "RootPart" or p46:IsA("Decal") then
                p46.Transparency = u45;
            end;
        end;

        for i, descendant in u20:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.Name ~= "RootPart" or descendant:IsA("Decal") then
                descendant.Transparency = u45;
            end;
        end;
    end));
    u17:GiveTask(RunService.Heartbeat:Connect(function(p47) -- Line: 172
        -- upvalues: u20 (copy), u30 (copy), u14 (copy), u38 (copy)
        local TransformedWorldCFrame = u20.RootPart.master_bone.torso["torso.001"].neck["neck.001"]["neck.002"].head.TransformedWorldCFrame;
        local v48 = CFrame.new(0, 20, 1);
        local v49 = CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966);
        u30.CFrame = TransformedWorldCFrame * v48 * v49;
        local Position = u14.Position;

        if Position then
            for _, descendant in u30:GetDescendants() do
                if descendant:IsA("Beam") then
                    local Attachment0 = descendant.Attachment0;
                    local Attachment1 = descendant.Attachment1;

                    if Attachment1 and Attachment0 then
                        local v50 = os.clock() - u38;
                        local v51 = math.clamp(v50, 0, 1);
                        local v52 = (CFrame.new(Position) * (Attachment1.CFrame - Attachment1.CFrame.Position)).Position + Attachment1.CFrame.LookVector * 7;
                        Attachment1.WorldPosition = Attachment0.WorldPosition:Lerp(v52, (math.clamp(v51, 0.3, 1)));
                    end;
                end;
            end;
        end;
    end));
    u17:GiveTask(v28:GetMarkerReachedSignal("sound"):Connect(function() -- Line: 197
        -- upvalues: RandomUtil (ref), u24 (copy), u25 (copy)
        RandomUtil.fromList(u24, u25):Play();
    end));
    task.delay(5.5, function() -- Line: 200
        -- upvalues: u17 (copy)
        u17:Destroy();
    end);
end;

function u4.getDragonOffsetAt(p53, p54) -- Line: 204
    -- upvalues: Linear (copy)
    local v55 = Linear(p54, -100, 200, 5);
    local v56 = -20 / (((p54 - 2) / 0.5) ^ 2 + 2) + 50 + math.sin(p54 * 3) * 3;

    return Vector3.new(v55, v56, 0);
end;

function u4.getDragonTransparencyAt(p57, p58) -- Line: 209
    -- upvalues: Linear (copy)
    if p58 <= 1 then
        return Linear(p58, 1, -1, 0.5);
    end;

    return p58 <= 4.5 and 0 or Linear(p58 - 4.5, 0, 1, 0.5);
end;

KnitClient.CreateController(u4.new());

return nil;