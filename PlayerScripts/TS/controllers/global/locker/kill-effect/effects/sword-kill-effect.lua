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
local _ = {
    blade = Color3.fromRGB(0, 170, 255),
    hilt = Color3.fromRGB(54, 123, 190),
    neon = Color3.fromRGB(104, 128, 250)
};
local u5 = {
    blade = Color3.fromRGB(255, 135, 0),
    hilt = Color3.fromRGB(231, 125, 23),
    neon = Color3.fromRGB(250, 132, 112)
};
local u6 = {
    blade = Color3.fromRGB(255, 176, 0),
    hilt = Color3.fromRGB(182, 146, 53),
    neon = Color3.fromRGB(248, 217, 109)
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 51, Name: __tostring
        return "SwordKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 57
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 61
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(p11, p12, p13, p14) -- Line: 65
    -- upvalues: u2 (copy), TweenService (copy), ReplicatedStorage (copy), Workspace (copy), KillEffect (copy), u3 (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), u5 (copy), u6 (copy), RunService (copy), RuntimeLib (copy)
    local u15 = u2.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16:PivotTo(p14);
    local u17 = {};

    for _, descendant in u16:GetDescendants() do
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

            table.insert(u17, descendant);
        elseif descendant:IsA("Texture") then
            descendant:Destroy();
        elseif descendant:IsA("Shirt") then
            descendant:Destroy();
        end;
    end;

    local u18 = ReplicatedStorage.Assets.Effects.SwordKillEffect.SwordModel:Clone();
    u18.Parent = Workspace;
    local Position = u16:GetPivot().Position;
    u18:PivotTo(CFrame.new(Position + Vector3.new(0, 9, 0)));
    u15:GiveTask(u18);
    u16.Parent = Workspace;
    u15:GiveTask(u16);
    KillEffect.hideCharacter(p11, p13);
    u15:GiveTask((u3("PointLight", {
        Brightness = 0.3,
        Range = 5,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(254, 168, 78),
        Parent = u16
    })));
    local u19 = SoundManager:playSound(GameSound.HANNAH_UNSHEATH_SWORD, {
        position = u16:GetPivot().Position
    });
    local u20 = AnimationUtil:playAnimation(u16:FindFirstChild("Humanoid"):FindFirstChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.ASCEND), {
        looped = false
    });
    task.delay(0.5, function() -- Line: 117
        -- upvalues: u20 (copy)
        local v21 = u20;

        if v21 ~= nil then
            v21:AdjustSpeed(0);
        end;
    end);
    u15:GiveTask(function() -- Line: 123
        -- upvalues: u19 (copy)
        if u19 then
            u19:Destroy();
        end;
    end);
    u15:GiveTask(function() -- Line: 128
        -- upvalues: u20 (copy)
        if u20 then
            u20:Destroy();
        end;
    end);
    task.delay(0.25, function() -- Line: 133
        -- upvalues: u18 (copy), TweenService (ref), u5 (ref), u6 (ref)
        local PrimaryPart = u18:WaitForChild("PrimaryPart");
        u18.PrimaryPart = PrimaryPart;
        local Blade = PrimaryPart:WaitForChild("Blade");
        local Hilt = PrimaryPart:WaitForChild("Hilt");
        local Neon = PrimaryPart:WaitForChild("Neon");

        local function _(p22, p23, p24) -- Line: 139
            -- upvalues: TweenService (ref)
            local v25 = TweenService:Create(p22, TweenInfo.new(p24), {
                Color = p23
            });
            v25:Play();

            return v25;
        end;

        local blade = u5.blade;
        local v26 = TweenService:Create(Blade, TweenInfo.new(0.4), {
            Color = blade
        });
        v26:Play();
        v26.Completed:Connect(function() -- Line: 146
            -- upvalues: Blade (copy), u6 (ref), TweenService (ref)
            local blade2 = u6.blade;
            TweenService:Create(Blade, TweenInfo.new(0.6), {
                Color = blade2
            }):Play();
        end);
        local hilt = u5.hilt;
        local v27 = TweenService:Create(Hilt, TweenInfo.new(0.4), {
            Color = hilt
        });
        v27:Play();
        v27.Completed:Connect(function() -- Line: 149
            -- upvalues: Hilt (copy), u6 (ref), TweenService (ref)
            local hilt2 = u6.hilt;
            TweenService:Create(Hilt, TweenInfo.new(0.6), {
                Color = hilt2
            }):Play();
        end);
        local neon = u5.neon;
        local v28 = TweenService:Create(Neon, TweenInfo.new(0.4), {
            Color = neon
        });
        v28:Play();
        v28.Completed:Connect(function() -- Line: 152
            -- upvalues: Neon (copy), u6 (ref), TweenService (ref)
            local neon2 = u6.neon;
            TweenService:Create(Neon, TweenInfo.new(0.6), {
                Color = neon2
            }):Play();
        end);
    end);
    local u29 = SoundManager:playSound(GameSound.SWORD_SPARKLE, {
        position = u16:GetPivot().Position
    });
    u15:GiveTask(function() -- Line: 159
        -- upvalues: u29 (copy)
        if u29 then
            u29:Destroy();
        end;
    end);
    local u30 = 0;
    local Position2 = u18:GetPivot().Position;
    local u31 = CFrame.new(Position2 - Vector3.new(0, 9, 0));
    u15:GiveTask(RunService.Heartbeat:Connect(function(p32) -- Line: 169
        -- upvalues: u30 (ref), u18 (copy), u31 (copy), u15 (copy)
        u30 = u30 + p32;
        local v33 = u18:GetPivot() * CFrame.Angles(0, 0.5235987755982988 * math.sqrt(u30 / 2), 0);

        if u30 > 0.75 then
            v33 = v33:Lerp(u31, (math.sqrt((u30 - 0.75) / 1.25)));
        end;

        u18:PivotTo(v33);

        if u30 > 2 then
            task.delay(1, function() -- Line: 181
                -- upvalues: u15 (ref)
                u15:DoCleaning();
            end);
        end;
    end));
    local u35 = RuntimeLib.Promise.delay(0.75):andThen(function() -- Line: 187
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u16 (copy), u15 (copy), SoundManager (ref), GameSound (ref)
        local v34 = ReplicatedStorage.Assets.Effects.SwordKillEffect.ExplosionParticles:Clone();
        v34.Parent = Workspace;
        v34:PivotTo(u16:GetPivot());
        u15:GiveTask(v34);

        for _, descendant in v34:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                descendant:Emit();
                u15:GiveTask(descendant);
            end;
        end;

        u15:GiveTask(SoundManager:playSound(GameSound.FRYING_PAN_HIT, {
            position = u16:GetPivot().Position
        }));
    end);
    u15:GiveTask(function() -- Line: 203
        -- upvalues: u35 (copy)
        return u35:cancel();
    end);
    local u37 = RuntimeLib.Promise.delay(0.69):andThen(function() -- Line: 207
        -- upvalues: TweenService (ref), u17 (copy)
        local function _(p36) -- Line: 208
            -- upvalues: TweenService (ref)
            TweenService:Create(p36, TweenInfo.new(0.33), {
                Transparency = 1
            }):Play();
        end;

        for i, v in u17 do
            local _ = i - 1;
            TweenService:Create(v, TweenInfo.new(0.33), {
                Transparency = 1
            }):Play();
        end;
    end);
    u15:GiveTask(function() -- Line: 218
        -- upvalues: u37 (copy)
        return u37:cancel();
    end);

    return u15;
end;

return u7;