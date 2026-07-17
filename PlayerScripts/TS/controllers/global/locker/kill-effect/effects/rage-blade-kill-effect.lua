-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "RageBladeKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    p7.startDistanceAbove = 50;
    p7.swordFallTime = 0.5;
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, p11, p12) -- Line: 37
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), KillEffect (copy), u3 (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), TweenService (copy)
    p11.Archivable = true;
    local u13 = u2.new();
    local v14 = u9:createStatue(p11, p12);
    local u15 = v14[1];
    local u16 = v14[2];
    local u17 = u9:getBodyParts(u15);
    local u18 = ReplicatedStorage.Assets.Effects.RageBladeKillEffect.RageBlade:Clone();
    u18.Parent = Workspace;
    local Position = u15:GetPivot().Position;
    local v19 = Vector3.new(0, u9.startDistanceAbove, 0);
    u18:PivotTo(CFrame.new(Position + v19));
    u13:GiveTask(u18);
    u15.Parent = Workspace;
    u13:GiveTask(u15);
    KillEffect.hideCharacter(u9, p11);
    u3("PointLight", {
        Brightness = 0.3,
        Range = 5,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(254, 168, 78),
        Parent = u15
    });
    local u20 = SoundManager:playSound(GameSound.RAGEBLADE_KILL_EFFECT, {
        position = u15:GetPivot().Position
    });
    local u21 = AnimationUtil:playAnimation(u15:FindFirstChild("Humanoid"):FindFirstChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.ASCEND), {
        looped = false
    });
    task.delay(0.5, function() -- Line: 69
        -- upvalues: u21 (copy)
        local v22 = u21;

        if v22 ~= nil then
            v22:AdjustSpeed(0);
        end;
    end);
    u13:GiveTask(function() -- Line: 75
        -- upvalues: u20 (copy)
        if u20 then
            u20:Destroy();
        end;
    end);
    u13:GiveTask(function() -- Line: 80
        -- upvalues: u21 (copy)
        if u21 then
            u21:Destroy();
        end;
    end);
    local u23 = 0;
    local u24 = false;
    local u25 = false;
    local Position2 = u18:GetPivot().Position;
    local v26 = Vector3.new(0, u9.startDistanceAbove, 0);
    local u27 = CFrame.new(Position2 - v26);
    u13:GiveTask(RunService.Heartbeat:Connect(function(p28) -- Line: 93
        -- upvalues: u23 (ref), u9 (copy), u18 (copy), u27 (copy), u25 (ref), u17 (copy), u24 (ref), ReplicatedStorage (ref), Workspace (ref), u15 (copy), u13 (copy)
        u23 = u23 + p28;

        if u23 > u9.swordFallTime then
            local v29 = u18:GetPivot();
            local v30 = (u23 - u9.swordFallTime) / (2 - u9.swordFallTime);
            local v31 = (v29 * CFrame.Angles(0, 0.5235987755982988 * math.sqrt(v30), 0)):Lerp(u27, (math.sqrt(v30)));
            u18:PivotTo(v31);

            if u25 or (v29.Position - v31.Position).Magnitude < 3 then
                u25 = true;

                for _, v in u17 do
                    local v32 = v.part:GetPivot().Position + v.velocity * (p28 * 4.5);
                    v.part:PivotTo(CFrame.new(v32));
                end;

                if not u24 then
                    u24 = true;
                    local v33 = ReplicatedStorage.Assets.Effects.RageBladeKillEffect.ExplosionParticles:Clone();
                    v33.Parent = Workspace;
                    v33:PivotTo(u15:GetPivot());
                    u13:GiveTask(v33);
                end;
            end;
        end;

        if u23 > 3 then
            u13:DoCleaning();
        end;
    end));
    task.delay(2, function() -- Line: 130
        -- upvalues: TweenService (ref), u16 (copy)
        local function _(p34) -- Line: 131
            -- upvalues: TweenService (ref)
            TweenService:Create(p34, TweenInfo.new(0.33), {
                Transparency = 1
            }):Play();
        end;

        for i, v in u16 do
            local _ = i - 1;
            TweenService:Create(v, TweenInfo.new(0.33), {
                Transparency = 1
            }):Play();
        end;
    end);

    return u13;
end;

function u5.createStatue(p35, p36, p37) -- Line: 142
    -- upvalues: TweenService (copy)
    local v38 = p36:Clone();
    v38:PivotTo(p37);
    local v39 = {};

    for _, descendant in v38:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Material = Enum.Material.SmoothPlastic;
            TweenService:Create(descendant, TweenInfo.new(0.4), {
                Color = Color3.fromRGB(248, 217, 109)
            }):Play();

            if descendant:IsA("MeshPart") then
                descendant.TextureID = "";
            end;

            if descendant.Name == "Head" then
                descendant.Material = Enum.Material.Neon;
            end;

            table.insert(v39, descendant);
        elseif descendant:IsA("Texture") then
            descendant:Destroy();
        elseif descendant:IsA("Shirt") then
            descendant:Destroy();
        end;
    end;

    return { v38, v39 };
end;

function u5.getBodyParts(p40, p41) -- Line: 168
    local v42 = math.random(-6.283185307179586, 6.283185307179586);
    local v43 = math.random() * 5 + 5;
    local v44 = {};

    for _, child in p41:GetChildren() do
        if child:IsA("BasePart") then
            for _, child2 in child:GetChildren() do
                if child2:IsA("Motor6D") then
                    child2:Destroy();
                end;
            end;

            child.Anchored = true;
            local v45 = {
                part = child
            };
            local Unit = (Vector3.new(3, 10, 0)).Unit;
            local v46 = 5 + math.random() * 5;
            local v47 = v43 * math.cos(v42);
            local v48 = 5 + 5 * math.random();
            local v49 = v43 * math.sin(v42);
            local v50 = Vector3.new(v47, v48, v49);
            v45.velocity = Unit * v46 + v50 * child.Mass;
            table.insert(v44, v45);
        end;
    end;

    return v44;
end;

return u5;