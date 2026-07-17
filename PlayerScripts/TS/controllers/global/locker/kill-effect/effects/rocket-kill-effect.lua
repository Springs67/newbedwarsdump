-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "RocketKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(u7, p8, p9, p10) -- Line: 31
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), scaleModel (copy), default (copy), InQuad (copy)
    local u11 = u1.new();
    task.delay(8, function() -- Line: 33
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);
    local u12 = p10 * CFrame.new(0, 5, 0);
    local u13 = u12 * CFrame.Angles(0, -1.5707963267948966, 0);
    p9.Archivable = true;
    local u14 = p9:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(u12);
    u14.Parent = Workspace;
    KillEffect.hideCharacter(u7, p9);
    u11:GiveTask(u14);
    local u15 = ReplicatedStorage.Assets.Effects.RocketKillEffect:Clone();
    u15:PivotTo(u13);
    u15.Parent = Workspace;
    u11:GiveTask(u15);
    local u16 = SoundManager:playSound(GameSound.ROCKET_KILL_EFFECT, {
        rollOffMaxDistance = 100,
        position = u15:GetPrimaryPartCFrame().Position,
        parent = u15.PrimaryPart
    });
    local Attachment = u15.Main.Attachment;
    Attachment.Parent = nil;
    scaleModel(u15, 0.01);
    Attachment.Parent = u15.Main;
    u11:GiveTask(u7:scaleModel(u15, 100, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)).Completed:Connect(function() -- Line: 62
        -- upvalues: Attachment (copy), u16 (copy), default (ref), InQuad (ref), u15 (copy), u13 (copy), u14 (copy), u12 (copy), u7 (copy), u11 (copy)
        task.wait(0.3);
        Attachment.ParticleEmitter.Enabled = true;
        task.wait(0.5);

        if u16 then
            u16:setProperty("RollOffMaxDistance", 300);
        end;

        default(2, InQuad, function(p17) -- Line: 69
            -- upvalues: u15 (ref), u13 (ref), u14 (ref), u12 (ref)
            if u15.PrimaryPart then
                u15:PivotTo(u13 * CFrame.new(0, p17, 0));
            end;

            if u14.PrimaryPart then
                u14:PivotTo(u12 * CFrame.new(0, p17, 0));
            end;
        end, 0, 600):Wait();
        Attachment.ParticleEmitter.Enabled = false;
        u7:hideCharacter(u14);
        u11:GiveTask(u7:scaleModel(u15, 0.4, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)));
    end));

    return u11;
end;

return u3;