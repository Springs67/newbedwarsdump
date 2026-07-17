-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local InExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BeachballKillEffect";
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
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), u1 (copy), ReplicatedStorage (copy), RunService (copy), ModelUtil (copy), InExpo (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(u11);
    u13.Parent = Workspace;
    KillEffect.hideCharacter(p8, p10);
    u12:GiveTask(u13);
    local u14 = u1.SingleMotor.new(u11.Position.Y);
    u14:onStep(function(p15) -- Line: 40
        -- upvalues: u13 (copy), u11 (copy)
        u13:PivotTo(u11 * CFrame.new(0, -p15, 0));
    end);
    u12:GiveTask(function() -- Line: 46
        -- upvalues: u14 (copy)
        u14:destroy();
    end);
    local u16 = ReplicatedStorage.Assets.Misc.Beachball:Clone();
    u16.Parent = Workspace;
    u12:GiveTask(u16);
    local Angles = CFrame.Angles;
    local v17 = math.random(-360, 360);
    local v18 = math.rad(v17);
    local v19 = math.random(-360, 360);
    local v20 = math.rad(v19);
    local v21 = math.random(-360, 360);
    local u22 = Angles(v18, v20, (math.rad(v21)));
    local u23 = nil;
    local u24 = 0.632;
    u12:GiveTask(RunService.Heartbeat:Connect(function(p25) -- Line: 59
        -- upvalues: u24 (ref), u23 (ref), u14 (copy), u1 (ref), u16 (copy), u11 (copy), u22 (copy)
        u24 = u24 + p25;
        local v26 = 0.3 ^ math.floor(u24 / 1.2649110640673518) * (40 - (u24 % 1.2649110640673518 - 0.6324555320336759) ^ 2 * 100);
        local v27 = 0.3 ^ ((u24 - 1) / 1.2649110640673518) * 40;
        local v28 = u23;

        if v28 ~= 0 and (v28 == v28 and v28) then
            v28 = v27 < 0.5;
        end;

        if v28 == 0 or (v28 ~= v28 or not v28) then
            u14:setGoal(u1.Spring.new((1 - 0.5 ^ math.floor(u24 / 1.2649110640673518)) * 6, {
                dampingRatio = 0.35,
                frequency = 4
            }));
        end;

        if v27 < 3 and (u23 == 0 or (u23 ~= u23 or not u23)) and v26 < 0.5 then
            u23 = v26;
        end;

        if u23 ~= nil then
            v26 = u23;
        end;

        u16:PivotTo(u11 * CFrame.new(0, v26, 0) * u22);
    end));
    task.delay(4, function() -- Line: 81
        -- upvalues: ModelUtil (ref), u16 (copy), InExpo (ref), u12 (copy)
        ModelUtil.tweenModelSize(u16, 2, InExpo, 0):andThen(function() -- Line: 82
            -- upvalues: u12 (ref)
            u12:DoCleaning();
        end);
    end);

    return u12;
end;

return u4;