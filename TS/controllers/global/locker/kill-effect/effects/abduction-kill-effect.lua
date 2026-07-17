-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InExpo = v1.InExpo;
local InQuart = v1.InQuart;
local Linear = v1.Linear;
local OutExpo = v1.OutExpo;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = Random.new();
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "AbductionKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 37
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), RunService (copy), RuntimeLib (copy), default (copy), OutExpo (copy), InExpo (copy), Linear (copy), t (copy), u4 (copy), InQuart (copy)
    local v13 = u2.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    v13:GiveTask(u14);
    KillEffect.hideCharacter(p9, p11);
    v13:GiveTask((SoundManager:playSound(GameSound.UFO_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = p12.Position
    })));
    local u15 = ReplicatedStorage.Assets.Misc.UFO:Clone();

    local function _(p16) -- Line: 52
        if p16:IsA("BasePart") then
            p16.CanQuery = false;
        end;
    end;

    for i, descendant in u15:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanQuery = false;
        end;
    end;

    u15:PivotTo(u14:GetPivot() * CFrame.new(0, 50, 0));
    u15.Parent = Workspace;
    v13:GiveTask(u15);
    local Body = u15.Body;
    Body.Parent = Workspace;
    v13:GiveTask(Body);
    local u22 = RunService.Heartbeat:Connect(function(p17) -- Line: 69
        -- upvalues: Body (copy), u15 (copy)
        local v18 = Body:GetPivot();
        local v19 = v18 - v18.Position;
        local v20 = CFrame.new(u15.Main.Position);
        local new = CFrame.new;
        local v21 = time() * 2;
        Body:PivotTo(v20 * new(0, math.sin(v21) / 1.5, 0) * v19 * CFrame.Angles(0, 0.05235987755982989, 0));
    end);
    v13:GiveTask(u22);
    local u28 = RuntimeLib.Promise.new(function() -- Line: 81
        -- upvalues: u15 (copy), u14 (copy), default (ref), OutExpo (ref), Body (copy), InExpo (ref), Linear (ref), t (ref), u4 (ref), InQuart (ref), u22 (copy)
        task.wait(0.15);
        default(0.3, OutExpo, function(p23) -- Line: 84
            -- upvalues: u15 (ref)
            return u15:PivotTo(p23);
        end, u15:GetPivot(), u14:GetPivot() * CFrame.new(0, 10, 0)):Wait();
        local Beam = Body:FindFirstChild("Beam");

        if Beam then
            default(0.5, InExpo, function(p24) -- Line: 94
                -- upvalues: Beam (copy), Linear (ref)
                Beam.Transparency = Linear(p24, 1, -0.4, 1);
            end, 0, 1):Wait();
        end;

        for _, child in u14:GetChildren() do
            if child:IsA("Accessory") then
                local child = child:FindFirstChild("Handle");

                if t.instanceIsA("BasePart")(child) then
                    child.Anchored = true;
                    child:BreakJoints();
                    task.spawn(function() -- Line: 115
                        -- upvalues: u4 (ref), child (ref), u15 (ref), default (ref), InExpo (ref)
                        default(u4:NextNumber(0.2, 0.3), InExpo, function(p25) -- Line: 117
                            -- upvalues: child (ref)
                            child.CFrame = p25;
                        end, child.CFrame, u15:GetPivot() * CFrame.new(u4:NextNumber(-3, 3), u4:NextNumber(1, 2), u4:NextNumber(-3, 3))):Wait();
                        child:Destroy();
                    end);
                    task.wait(0.1);
                end;
            elseif child:IsA("BasePart") and child ~= u14.PrimaryPart then
                child.Anchored = true;
                child:BreakJoints();
                task.spawn(function() -- Line: 115
                    -- upvalues: u4 (ref), child (ref), u15 (ref), default (ref), InExpo (ref)
                    default(u4:NextNumber(0.2, 0.3), InExpo, function(p25) -- Line: 117
                        -- upvalues: child (ref)
                        child.CFrame = p25;
                    end, child.CFrame, u15:GetPivot() * CFrame.new(u4:NextNumber(-3, 3), u4:NextNumber(1, 2), u4:NextNumber(-3, 3))):Wait();
                    child:Destroy();
                end);
                task.wait(0.1);
            end;
        end;

        task.wait(1);

        if Beam then
            default(0.5, InExpo, function(p26) -- Line: 131
                -- upvalues: Beam (copy)
                Beam.Transparency = p26;

                return Beam.Transparency;
            end, Beam.Transparency, 1):Wait();
        end;

        default(0.2, InQuart, function(p27) -- Line: 136
            -- upvalues: u15 (ref)
            return u15:PivotTo(p27);
        end, u15:GetPivot(), u15:GetPivot() * CFrame.new(0, 10, 0)):Wait();
        u22:Disconnect();
        Body:Destroy();
        u15:Destroy();
        u14:Destroy();
    end);
    v13:GiveTask(function() -- Line: 148
        -- upvalues: u28 (copy)
        return u28:cancel();
    end);

    return v13;
end;

return u5;