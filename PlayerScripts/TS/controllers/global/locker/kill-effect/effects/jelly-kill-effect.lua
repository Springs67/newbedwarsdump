-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "JellyKillEffect";
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

function u4.onKill(p8, p9, p10, u11) -- Line: 30
    -- upvalues: default (copy), u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u1 (copy), RunService (copy)
    default.Debug("Jelly kill effect");
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u12:GiveTask(u13);
    u13.Parent = Workspace;
    local HipHeight = u13.Humanoid.HipHeight;
    local u14 = u13:GetPrimaryPartCFrame();
    KillEffect.hideCharacter(p8, p10);
    local u15 = ReplicatedStorage.Assets.Effects.JellyMonster:Clone();
    u15:PivotTo(u14);
    u12:GiveTask(u15);
    u15.Parent = Workspace;
    local u16 = u1.GroupMotor.new({
        x = u14.X,
        y = u14.Y - 200,
        z = u14.Z
    });
    local u17 = u1.GroupMotor.new({
        x = u14.X,
        y = u14.Y - 200 + 5,
        z = u14.Z
    });
    local u18 = u1.GroupMotor.new({
        x = u15.jelly.Size.X,
        y = u15.jelly.Size.Y,
        z = u15.jelly.Size.Z
    });
    u12:GiveTask(function() -- Line: 60
        -- upvalues: u16 (copy), u17 (copy), u18 (copy)
        u16:destroy();
        u17:destroy();
        u18:destroy();
    end);
    local u20 = u16:onStep(function(p19) -- Line: 65
        -- upvalues: u15 (copy)
        u15.RootPart["master_bone.001"].WorldCFrame = CFrame.new(p19.x, p19.y, p19.z);
    end);
    local u22 = u17:onStep(function(p21) -- Line: 68
        -- upvalues: u15 (copy)
        u15.RootPart["master_bone.001"]["jelly.V"].WorldCFrame = CFrame.new(p21.x, p21.y, p21.z);
    end);
    local u24 = u18:onStep(function(p23) -- Line: 71
        -- upvalues: u15 (copy)
        u15.jelly.Size = Vector3.new(p23.x, p23.y, p23.z);
    end);
    u12:GiveTask(function() -- Line: 74
        -- upvalues: u20 (copy), u22 (copy), u24 (copy)
        u20:disconnect();
        u22:disconnect();
        u24:disconnect();
    end);
    u12:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 79
        -- upvalues: u13 (copy), u15 (copy), HipHeight (copy), u11 (copy)
        u13:PivotTo(u15.RootPart["master_bone.001"].TransformedWorldCFrame * CFrame.new(0, HipHeight, 0) * (u11 - u11.Position));
    end));
    local u25 = {
        frequency = 6,
        dampingRatio = 0.6
    };
    local u26 = {
        frequency = 4,
        dampingRatio = 0.3
    };
    local u27 = {
        frequency = 2,
        dampingRatio = 0.6
    };
    u16:setGoal({
        x = u1.Spring.new(u14.X, u25),
        y = u1.Spring.new(u14.Y - HipHeight - 1, u25),
        z = u1.Spring.new(u14.Z, u25)
    });
    u17:setGoal({
        x = u1.Spring.new(u14.X, u26),
        y = u1.Spring.new(u14.Y + 5 - HipHeight - 1, u26),
        z = u1.Spring.new(u14.Z, u26)
    });
    local u28 = nil;
    u28 = u17:onComplete(function() -- Line: 110
        -- upvalues: u28 (ref), u16 (copy), u1 (ref), u14 (copy), u25 (copy), u17 (copy), u26 (copy), u18 (copy), u27 (copy), u12 (copy)
        u28:disconnect();
        u16:setGoal({
            x = u1.Spring.new(u14.X, u25),
            y = u1.Spring.new(u14.Y + 18, u25),
            z = u1.Spring.new(u14.Z, u25)
        });
        u17:setGoal({
            x = u1.Spring.new(u14.X, u26),
            y = u1.Spring.new(u14.Y + 18 + 5, u26),
            z = u1.Spring.new(u14.Z, u26)
        });
        u18:setGoal({
            x = u1.Spring.new(0.1, u27),
            y = u1.Spring.new(0.1, u27),
            z = u1.Spring.new(0.1, u27)
        });
        local u29 = nil;
        u29 = u17:onComplete(function() -- Line: 128
            -- upvalues: u29 (ref), u12 (ref)
            u29:disconnect();
            u12:DoCleaning();
        end);
    end);

    return u12;
end;

return u4;