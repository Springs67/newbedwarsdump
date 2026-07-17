-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;

local function _(p5) -- Line: 17
    -- upvalues: Linear (copy)
    local v6 = Linear(p5, -150, 300, 4);

    return Vector3.new(v6, -100 / (((p5 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
end;

local u7 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "BirdKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 32
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 36
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(p11, p12, p13, u14) -- Line: 40
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), u2 (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy), Linear (copy)
    local u15 = u3.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16.HumanoidRootPart.Anchored = true;
    u16.Parent = Workspace;
    KillEffect.hideCharacter(p11, p13);
    u15:GiveTask(u16);
    local u17 = u2.GroupMotor.new({
        x = 0,
        y = 0,
        z = 0
    });
    u15:GiveTask(function() -- Line: 53
        -- upvalues: u17 (copy)
        u17:destroy();
    end);
    local u18 = ReplicatedStorage.Assets.Effects.BirdKillEffect:Clone();
    u18.PrimaryPart.Anchored = true;
    u18:PivotTo(u14);
    u18.Parent = Workspace;
    u15:GiveTask(u18);
    SoundManager:playSound(GameSound.WHITE_RAVEN_FLYING_LOOP, {
        volumeMultiplier = 2,
        rollOffMaxDistance = 150,
        position = u18:GetPrimaryPartCFrame().Position,
        parent = u18.PrimaryPart
    });
    local v19 = AnimationUtil:playAnimation(u18.AnimationController.Animator, GameAnimationUtil:getAssetId(AnimationType.RAVEN_LOOP), {
        looped = true
    });

    if v19 then
        u15:GiveTask(v19);
    end;

    local u20 = nil;
    local u21 = 0;
    u15:GiveTask(RunService.Heartbeat:Connect(function(p22) -- Line: 76
        -- upvalues: u21 (ref), Linear (ref), u14 (copy), u18 (copy), u14 (copy), u20 (ref), u16 (copy), SoundManager (ref), GameSound (ref), u17 (copy), u2 (ref)
        u21 = u21 + p22;
        local v23 = u21;
        local v24 = Linear(v23, -150, 300, 4);
        local v25 = Vector3.new(v24, -100 / (((v23 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
        local v26 = u21 + 0.05;
        local v27 = Linear(v26, -150, 300, 4);
        local v28 = v25 - Vector3.new(v27, -100 / (((v26 - 2) / 0.5) ^ 2 + 2) + 50 + 6, 0);
        local v29 = v28.Magnitude <= 0 and Vector3.new(1, 0, 0) or v28.Unit;
        local v30 = u14.Position + v25;
        local v31 = math.sin(u21 * 3) * 3;
        local v32 = v30 + Vector3.new(0, v31, 0);
        u18:PivotTo(CFrame.lookAt(v32, v32 + v29));

        if u14.Position.X + v25.X > u14.Position.X then
            if u20 == nil then
                u20 = u16:GetPrimaryPartCFrame().Y - u18:GetPrimaryPartCFrame().Y;
                SoundManager:playSound(GameSound.WHITE_RAVEN_SNATCH, {
                    rollOffMaxDistance = 100,
                    position = u18:GetPrimaryPartCFrame().Position,
                    parent = u18.PrimaryPart
                });
            end;

            local v33, v34, v35 = (u18:GetPrimaryPartCFrame() * CFrame.Angles(0, 3.141592653589793, 0)):ToOrientation();
            u17:setGoal({
                x = u2.Spring.new(v33, {
                    frequency = 2,
                    dampingRatio = 0.1
                }),
                y = u2.Spring.new(v34, {
                    frequency = 1,
                    dampingRatio = 0.1
                }),
                z = u2.Spring.new(v35, {
                    frequency = 1,
                    dampingRatio = 0.1
                })
            });
            local v36 = u17:getValue();
            local v37 = u18:GetPrimaryPartCFrame();
            local v38 = CFrame.new(0, u20, 0);
            u16:PivotTo(CFrame.new((v37 * v38).Position) * CFrame.fromOrientation(v36.x, v36.y, v36.z));
        end;
    end));
    task.delay(4.8, function() -- Line: 122
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);

    return u15;
end;

return u7;