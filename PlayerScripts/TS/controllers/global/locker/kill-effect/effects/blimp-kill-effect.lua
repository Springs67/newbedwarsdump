-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InSine = v1.InSine;
local OutSine = v1.OutSine;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "BlimpKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 31
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), RuntimeLib (copy), default (copy), OutSine (copy), WeldUtil (copy), InSine (copy)
    local v12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13.Parent = Workspace;
    v12:GiveTask(u13);
    KillEffect.hideCharacter(p8, p10);
    local u14 = u13:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0);
    local u15 = ReplicatedStorage.Assets.Misc.ReindeerBlimp:Clone();
    u15:PivotTo(u14);
    u15.Parent = Workspace;
    v12:GiveTask(u15);
    local u24 = RuntimeLib.Promise.new(function() -- Line: 46
        -- upvalues: u15 (copy), u13 (copy), default (ref), OutSine (ref), u14 (copy), WeldUtil (ref), InSine (ref)
        default(1, OutSine, function(p16) -- Line: 47
            -- upvalues: u15 (ref)
            u15:PivotTo(p16);
        end, u14, u13:GetPrimaryPartCFrame() * CFrame.new(0.076, 3.698, 0.488)):Wait();
        u13.HumanoidRootPart.Anchored = false;
        WeldUtil:weldPartsWithJoint(u13.HumanoidRootPart, u15.PrimaryPart, "Weld");
        task.wait(0.5);
        default(1, OutSine, function(p17) -- Line: 56
            -- upvalues: u15 (ref)
            u15:PivotTo(p17);
        end, u15:GetPrimaryPartCFrame(), u13:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0)):Wait();

        local function v19(p18) -- Line: 63
            -- upvalues: u15 (ref)
            u15:PivotTo(p18);
        end;

        local v20 = u15:GetPrimaryPartCFrame();
        local v21 = u15:GetPrimaryPartCFrame();
        local v22 = CFrame.new(0, 0, -50);
        local v23 = CFrame.Angles(-0.06981317007977318, 0, 0);
        default(1, InSine, v19, v20, v21 * v22 * v23):Wait();
        u15:Destroy();
        u13:Destroy();
    end);
    v12:GiveTask(function() -- Line: 74
        -- upvalues: u24 (copy)
        return u24:cancel();
    end);

    return v12;
end;

return u4;