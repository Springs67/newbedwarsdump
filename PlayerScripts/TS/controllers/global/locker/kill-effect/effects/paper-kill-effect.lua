-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InSine = v2.InSine;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "PaperKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, u12) -- Line: 41
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), default (copy), Linear (copy), MathExtras (copy), RuntimeLib (copy), MathUtil (copy), RunService (copy), SoundManager (copy), GameSound (copy), InSine (copy), CFrameUtil (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    local _DamageHighlight_ = u14:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    KillEffect.hideCharacter(p9, p11);
    local u15 = {};

    local function _(p16) -- Line: 59
        -- upvalues: u15 (copy)
        if not p16:IsA("BasePart") then
            return nil;
        end;

        p16.CanCollide = false;
        p16.CanQuery = false;
        p16.CanTouch = false;
        table.insert(u15, {
            part = p16,
            originalSize = p16.Size
        });
    end;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
            table.insert(u15, {
                part = descendant,
                originalSize = descendant.Size
            });
        end;
    end;

    local u21 = default(0.25, Linear, function(u17) -- Line: 75
        -- upvalues: MathExtras (ref), u15 (copy)
        local function _(p18) -- Line: 76
            -- upvalues: MathExtras (ref), u17 (copy)
            local v19 = MathExtras:lerp(p18.originalSize.Z, 0.1, u17);
            p18.part.Size = Vector3.new(p18.part.Size.X, p18.part.Size.Y, v19);
        end;

        for i, v in u15 do
            local _ = i - 1;
            local v20 = MathExtras:lerp(v.originalSize.Z, 0.1, u17);
            v.part.Size = Vector3.new(v.part.Size.X, v.part.Size.Y, v20);
        end;
    end, 0, 1);
    u21:Play();
    u13:GiveTask(function() -- Line: 85
        -- upvalues: u21 (copy)
        u21:Cancel();
    end);
    local u39 = RuntimeLib.Promise.new(function() -- Line: 88
        -- upvalues: MathUtil (ref), RunService (ref), u14 (copy), u13 (copy), SoundManager (ref), GameSound (ref), u12 (copy), default (ref), InSine (ref), CFrameUtil (ref)
        task.wait(0.75);
        local v22 = MathUtil.randomFloatMaxInclusive(1, 3.5, true);
        local v23 = MathUtil.randomFloatMaxInclusive(1, 3.5, true);
        local v24 = MathUtil.randomFloatMaxInclusive(1, 3.5, true);
        local u25 = Vector3.new(v22, v23, v24);
        local u27 = RunService.Heartbeat:Connect(function(p26) -- Line: 96
            -- upvalues: u14 (ref), u25 (copy)
            local PrimaryPart = u14.PrimaryPart;

            if PrimaryPart then
                PrimaryPart.CFrame = PrimaryPart.CFrame * CFrame.Angles(u25.X * p26, u25.Y * p26, u25.Z * p26);
            end;
        end);
        u13:GiveTask(function() -- Line: 104
            -- upvalues: u27 (copy)
            u27:Disconnect();
        end);
        local u28 = SoundManager:playModifiableSound(GameSound.WIND_LOOP, {
            volumeMultiplier = 1,
            looped = true,
            parent = u14,
            position = u14:GetPivot().Position
        });
        local u29 = 1;
        local u30 = nil;
        u30 = RunService.Heartbeat:Connect(function(p31) -- Line: 116
            -- upvalues: u29 (ref), u28 (copy), u30 (ref)
            u29 = u29 - p31 / 5;
            u28.Volume = u29;

            if u29 <= 0 then
                u30:Disconnect();
                u28:Stop();
                u28:Destroy();
            end;
        end);
        u13:GiveTask(u28);
        u13:GiveTask(u30);
        local Position = u12.Position;
        local v32 = MathUtil.randomFloatMaxInclusive(80, 100, true);
        local v33 = MathUtil.randomFloatMaxInclusive(80, 100, true);
        local v34 = MathUtil.randomFloatMaxInclusive(200, 210, false);
        local u35 = u12.Position + Vector3.new(v32, v34, v33);
        local u38 = default(17, InSine, function(p36) -- Line: 136
            -- upvalues: Position (copy), u35 (copy), u14 (ref), CFrameUtil (ref)
            local v37 = Position:Lerp(u35, p36);

            if u14.PrimaryPart then
                CFrameUtil.setPosition(u14.PrimaryPart, v37);
            end;
        end, 0, 1);
        u13:GiveTask(function() -- Line: 142
            -- upvalues: u38 (copy)
            u38:Cancel();
        end);
        u38:Play():Wait();
    end);
    u13:GiveTask(function() -- Line: 147
        -- upvalues: u39 (copy)
        return u39:cancel();
    end);

    return u13;
end;

return u5;