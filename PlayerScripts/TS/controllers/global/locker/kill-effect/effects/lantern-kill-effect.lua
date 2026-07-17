-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v1.InOutExpo;
local Linear = v1.Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = Random.new();
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "LanternKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 30
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, u12) -- Line: 34
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u4 (copy), scaleModel (copy), RunService (copy), Linear (copy), ModelUtil (copy), InOutExpo (copy)
    local u13 = false;
    local u14 = u2.new();
    p11.Archivable = true;
    local v15 = p11:Clone();
    v15.HumanoidRootPart.Anchored = true;
    u14:GiveTask(v15);
    v15.Parent = Workspace;
    KillEffect.hideCharacter(p9, p11);
    local u16 = table.create(10);
    task.spawn(function() -- Line: 44
        -- upvalues: u13 (ref), ReplicatedStorage (ref), u12 (copy), u4 (ref), scaleModel (ref), Workspace (ref), u16 (copy)
        local v17 = false;
        local v18 = 0;

        while true do
            if v17 then
                v18 = v18 + 1;
            else
                v17 = true;
            end;

            if v18 >= 10 or u13 == true then
                return;
            end;

            local v19 = ReplicatedStorage.Assets.Misc.Lantern:Clone();
            v19:PivotTo(u12 * CFrame.new(u4:NextNumber(-20, 20), -4, u4:NextNumber(20, -20)));
            scaleModel(v19, 0.5 - u4:NextNumber(0, 0.15));
            local v20, v21, v22 = v19.Lamp.Color:ToHSV();
            local Lamp = v19.Lamp;
            local fromHSV = Color3.fromHSV;
            local v23 = v20 + u4:NextNumber(-0.01, 0.01);
            local v24 = math.clamp(v23, 0, 1);
            local v25 = v21 + u4:NextNumber(-0.2, 0.2);
            local v26 = math.clamp(v25, 0, 1);
            local v27 = v22 + u4:NextNumber(-0.2, 0.2);
            Lamp.Color = fromHSV(v24, v26, (math.clamp(v27, 0, 1)));
            v19.Parent = Workspace;
            local v28 = {
                dead = false,
                elapsedTime = 0,
                goalYPos = 8,
                part = v19,
                origin = v19:GetPrimaryPartCFrame().Position,
                seed = u4:NextNumber(0, 500),
                radius = 2 + u4:NextNumber(0, 7),
                start = u4:NextNumber(0, 0.3) + -4,
                speed = 1 + u4:NextNumber(0, 1),
                offset = u4:NextNumber(0, 500)
            };
            table.insert(u16, v28);
            task.wait(0.4);
        end;
    end);
    u14:GiveTask(RunService.Heartbeat:Connect(function(p29) -- Line: 86
        -- upvalues: u16 (copy), u12 (copy), Linear (ref), ModelUtil (ref), InOutExpo (ref)
        for _, v in u16 do
            v.elapsedTime = v.elapsedTime + p29;
            local Position = u12.Position;
            local v30 = math.sin(v.elapsedTime * v.speed + v.offset) * v.radius;
            local v31 = math.cos(v.elapsedTime * v.speed + v.offset) * v.radius;
            local v32 = Position + Vector3.new(v30, 0, v31);
            local v33 = math.noise(v.elapsedTime * 0.5, 0, v.seed) * 3;
            local v34 = math.noise(v.elapsedTime * 0.5, 0, -v.seed) * 3;
            local v35 = math.noise(v.elapsedTime * 0.5, 0, v.seed + v.seed) * 3;
            local v36 = Vector3.new(v33, v34, v35);
            local v37 = math.noise(v.elapsedTime * 2, 0, v.seed) * 0.3;
            local v38 = math.noise(v.elapsedTime, 0, -v.seed) * 2;
            local v39 = math.noise(v.elapsedTime * 2, 0, v.seed + v.seed) * 0.3;
            local part = v.part;
            local v40 = Linear(v.elapsedTime, v.start, v.goalYPos, 3);
            local v41 = Vector3.new(0, v40, 0);
            part:PivotTo(CFrame.new(v32 + v41 + v36) * CFrame.Angles(v37, v38, v39));

            if v.elapsedTime > 4 and v.dead == false then
                v.dead = true;
                ModelUtil.tweenModelSize(v.part, 0.4, InOutExpo, 0);
            end;
        end;
    end));
    u14:GiveTask(function() -- Line: 108
        -- upvalues: u16 (copy)
        for _, v in u16 do
            v.part:Destroy();
        end;
    end);
    u14:GiveTask(function() -- Line: 113
        -- upvalues: u13 (ref)
        u13 = true;
    end);
    task.delay(8, function() -- Line: 116
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);

    return u14;
end;

return u5;