-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SnowballRanOverKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 30
    -- upvalues: u1 (copy), Workspace (copy), ReplicatedStorage (copy), KillEffect (copy), u2 (copy), GameSound (copy), default (copy), InQuad (copy)
    local v12 = u1.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.Parent = Workspace;
    local u14 = ReplicatedStorage.Assets.Effects.Snowball:Clone();
    u13.PrimaryPart.Anchored = true;

    local function _(p15) -- Line: 38
        if p15:IsA("Part") or p15:IsA("MeshPart") then
            p15.CanCollide = false;
        end;
    end;

    for i, child in u13:GetChildren() do
        local _ = i - 1;

        if child:IsA("Part") or child:IsA("MeshPart") then
            child.CanCollide = false;
        end;
    end;

    u13.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    v12:GiveTask(u13);
    KillEffect.hideCharacter(p8, p10);
    local PrimaryPart = u13.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if not PrimaryPart then
        return v12;
    end;

    local u16 = PrimaryPart * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966) - Vector3.new(0, 2, 0);
    local LookVector = (PrimaryPart * CFrame.Angles(0, -1.5707963267948966, 0)).LookVector;
    u14:PivotTo(CFrame.new(PrimaryPart.Position + LookVector * 45 + Vector3.new(0, 1, 0)));
    u14.Parent = Workspace;
    v12:GiveTask(u14);
    v12:GiveTask((u2("Sound", {
        RollOffMinDistance = 80,
        RollOffMaxDistance = 120,
        Volume = 0.6,
        Playing = true,
        SoundId = GameSound.ROLLING_BOULDER_LOOP,
        Parent = u14
    })));
    local u17 = Workspace:GetServerTimeNow();
    local Size = u14.Size;
    local u18 = u17;
    default(3, InQuad, function(p19) -- Line: 82
        -- upvalues: Workspace (ref), u18 (ref), u17 (copy), u14 (copy), PrimaryPart (copy), Size (copy)
        local _ = Workspace:GetServerTimeNow() - u18;
        u18 = Workspace:GetServerTimeNow();
        local v20 = Workspace:GetServerTimeNow() - u17;
        u14:PivotTo(CFrame.new(p19) * CFrame.fromAxisAngle(PrimaryPart.LookVector, -v20 * 3.141592653589793 * 2));
        u14.Size = Size + Vector3.new(v20 * 3, v20 * 3, v20 * 3);
    end, u14.Position, u14.Position - LookVector * 120);
    v12:GiveTask(task.delay(1.65, function() -- Line: 97
        -- upvalues: u13 (copy), default (ref), InQuad (ref), u16 (copy)
        u13.PrimaryPart.Anchored = false;
        default(0.15, InQuad, function(p21) -- Line: 99
            -- upvalues: u13 (ref)
            u13:PivotTo(p21);
        end, u13.PrimaryPart.CFrame, u16);
    end));
    v12:GiveTask(task.delay(1.8, function() -- Line: 103
        -- upvalues: u13 (copy), u14 (copy), u2 (ref)
        u13.Parent = u14;
        u2("WeldConstraint", {
            Parent = u14,
            Part0 = u14,
            Part1 = u13.PrimaryPart
        });
    end));
    v12:GiveTask(task.delay(3, function() -- Line: 111
        -- upvalues: u14 (copy), u13 (copy)
        u14:Destroy();
        u13:Destroy();
    end));

    return v12;
end;

return u4;