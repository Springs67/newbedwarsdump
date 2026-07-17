-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "Anonymous";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, p10) -- Line: 30
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v11 = u2.new();
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.Parent = Workspace;
    v11:GiveTask(u12);
    KillEffect.hideCharacter(p7, p9);
    v11:GiveTask(SoundManager:playSound(GameSound.ASCEND, {
        position = u12:GetPivot().Position
    }));
    local u13 = AnimationUtil:playAnimation(u12:FindFirstChild("Humanoid"):FindFirstChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.ASCEND), {
        looped = false
    });
    v11:GiveTask(function() -- Line: 44
        -- upvalues: u13 (copy)
        local v14 = u13;

        if v14 ~= nil then
            v14 = v14:Destroy();
        end;

        return v14;
    end);

    if u13 ~= nil then
        u13.Stopped:Connect(function() -- Line: 53
            -- upvalues: u12 (copy)
            u12:Destroy();
        end);
    end;

    return v11;
end;

return u3;