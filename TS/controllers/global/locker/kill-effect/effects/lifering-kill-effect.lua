-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local Linear = v1.Linear;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = Random.new();
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "LiferingKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 26
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.onKill(p10, p11, p12, u13) -- Line: 34
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), u3 (copy), ReplicatedStorage (copy), u5 (copy), default (copy), OutExpo (copy), WeldUtil (copy), Linear (copy), InExpo (copy)
    local v14 = u2.new();
    p12.Archivable = true;
    local u15 = p12:Clone();
    u15.HumanoidRootPart.Anchored = true;
    u15:PivotTo(u13);
    u15.Parent = Workspace;
    KillEffect.hideCharacter(p10, p12);
    v14:GiveTask(u15);
    local u16 = u3("Attachment", {
        WorldPosition = u13.Position + Vector3.new(0, 100, 0),
        Parent = Workspace.Terrain
    });
    v14:GiveTask(u16);
    local u17 = ReplicatedStorage.Assets.Misc.LifeRing:Clone();
    u17.Parent = Workspace;
    u17:PivotTo(u13 * CFrame.new(0, 100, 0));
    local PrimaryPart = u17.PrimaryPart;
    local v18 = {};
    local v19 = u5:NextNumber(-1, 1) * 1.5;
    local v20 = u5:NextNumber(-1, 1) * 1.5;
    v18.Position = Vector3.new(v19, 0, v20);
    v18.Parent = PrimaryPart;
    local v21 = u3("Attachment", v18);
    local v22 = {};
    local v23 = u5:NextNumber(-1, 1) * 1.5;
    local v24 = u5:NextNumber(-1, 1) * 1.5;
    v22.Position = Vector3.new(v23, 0, v24);
    v22.Parent = PrimaryPart;
    local v25 = u3("Attachment", v22);
    v14:GiveTask(u17);
    local u26 = u3("BodyForce", {
        Force = Vector3.new(0, PrimaryPart.AssemblyMass * 50, 0),
        Parent = PrimaryPart
    });
    local u27 = u3("SpringConstraint", {
        Visible = true,
        Stiffness = 500,
        Damping = 20,
        FreeLength = 10,
        Attachment0 = u16,
        Attachment1 = v21,
        Parent = PrimaryPart
    });
    local u28 = u3("SpringConstraint", {
        Visible = true,
        Stiffness = 500,
        Damping = 20,
        FreeLength = 10,
        Attachment0 = u16,
        Attachment1 = v25,
        Parent = PrimaryPart
    });
    v14:GiveTask(u27);
    v14:GiveTask(u28);
    task.spawn(function() -- Line: 91
        -- upvalues: default (ref), OutExpo (ref), u17 (copy), PrimaryPart (copy), u13 (copy), u15 (copy), WeldUtil (ref), u26 (copy), u16 (copy), Linear (ref), InExpo (ref), u27 (copy), u28 (copy)
        default(2, OutExpo, function(p29) -- Line: 92
            -- upvalues: u17 (ref)
            if u17.PrimaryPart then
                u17:PivotTo(p29);
            end;
        end, PrimaryPart.CFrame, u13):Wait();

        for _, descendant in u15:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Anchored = false;
            end;
        end;

        WeldUtil:weldParts(u15.PrimaryPart, PrimaryPart);
        task.wait(2);
        PrimaryPart.Anchored = false;
        u26.Force = Vector3.new(0, -1000 * PrimaryPart.AssemblyMass, 0);
        default(2, Linear, function(p30) -- Line: 106
            -- upvalues: u16 (ref)
            u16.WorldPosition = p30;
        end, u16.WorldPosition, u16.WorldPosition + Vector3.new(0, 300, 0));
        default(0.7, InExpo, function(p31) -- Line: 113
            -- upvalues: u15 (ref), PrimaryPart (ref), u27 (ref), u28 (ref)
            for _, descendant in u15:GetDescendants() do
                if descendant:IsA("BasePart") or descendant:IsA("Decal") then
                    descendant.Transparency = p31;
                end;
            end;

            PrimaryPart.Transparency = p31;

            if p31 > 0.5 then
                u27.Visible = false;
                u28.Visible = false;
            end;
        end, 0, 1);
    end);

    return v14;
end;

return u6;