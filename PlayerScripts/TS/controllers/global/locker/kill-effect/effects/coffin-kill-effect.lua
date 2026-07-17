-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v1.InOutExpo;
local OutExpo = v1.OutExpo;
local OutQuart = v1.OutQuart;
local SoftSpring = v1.SoftSpring;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "CoffinKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 35
    -- upvalues: u2 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), KillEffect (copy), ReplicatedStorage (copy), RuntimeLib (copy), default (copy), OutExpo (copy), SoftSpring (copy), OutQuart (copy), ModelUtil (copy), InOutExpo (copy)
    local v12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13.Parent = Workspace;
    v12:GiveTask(u13);
    local u14 = u13:GetPivot();
    v12:GiveTask(SoundManager:playSound(GameSound.COFFIN_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = p11.Position
    }));
    KillEffect.hideCharacter(p8, p10);
    local u15 = ReplicatedStorage.Assets.Misc.Coffin:Clone();
    u15:PivotTo(u14 * CFrame.new(0, -10, 8));
    u15.Parent = Workspace;
    v12:GiveTask(u15);
    local u31 = RuntimeLib.Promise.new(function() -- Line: 54
        -- upvalues: u15 (copy), default (ref), OutExpo (ref), u14 (copy), SoftSpring (ref), u13 (copy), OutQuart (ref), ModelUtil (ref), InOutExpo (ref)
        default(0.4, OutExpo, function(p16) -- Line: 56
            -- upvalues: u15 (ref)
            return u15:PivotTo(p16);
        end, u15:GetPivot(), u14 * CFrame.new(0, -3 + u15.PrimaryPart.Size.Y / 2, 8)):Wait();
        task.wait(0.2);
        local Door = u15:FindFirstChild("Door");
        local v17;

        if Door == nil then
            v17 = Door;
        else
            v17 = Door.CFrame;
        end;

        if Door then
            default(0.4, SoftSpring, function(p18) -- Line: 71
                -- upvalues: Door (copy)
                Door.CFrame = p18;
            end, v17, v17 * CFrame.new(0, 0, -3) * CFrame.Angles(0, -0.3490658503988659, 0)):Wait();
        end;

        local function v20(p19) -- Line: 80
            -- upvalues: u13 (ref)
            return u13:PivotTo(p19);
        end;

        local v21 = u15:GetPivot();
        local v22 = CFrame.new(0, 3, 0);
        local v23 = CFrame.Angles(1.5707963267948966, 0, 0);
        default(0.3, OutExpo, v20, u14, v21 * v22 * v23):Wait();
        task.wait(0.1);

        local function v25(p24) -- Line: 89
            -- upvalues: u13 (ref)
            return u13:PivotTo(p24);
        end;

        local v26 = u13:GetPivot();
        local v27 = u15:GetPivot();
        local v28 = CFrame.new(0, -1, 0);
        local v29 = CFrame.Angles(1.5707963267948966, 0, 0);
        default(0.3, OutQuart, v25, v26, v27 * v28 * v29):Wait();
        task.wait(0.25);

        if Door then
            default(0.3, SoftSpring, function(p30) -- Line: 100
                -- upvalues: Door (copy)
                Door.CFrame = p30;
            end, u15.Door.CFrame, v17):Wait();
        end;

        task.wait(0.4);
        u13:Destroy();
        ModelUtil.tweenModelSize(u15, 0.1, InOutExpo, 0):await();
        u15:Destroy();
    end);
    v12:GiveTask(function() -- Line: 112
        -- upvalues: u31 (copy)
        return u31:cancel();
    end);

    return v12;
end;

return u4;