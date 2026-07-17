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
    -- upvalues: Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RuntimeLib (copy), u2 (copy)
    p9.Archivable = true;
    local u11 = p9:Clone();

    for _, descendant in u11:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Material = Enum.Material.Glass;
            descendant.Color = Color3.fromRGB(255, 215, 0);

            if descendant:IsA("MeshPart") then
                descendant.TextureID = "";
            end;
        elseif descendant:IsA("Texture") then
            descendant:Destroy();
        elseif descendant:IsA("Shirt") then
            descendant:Destroy();
        end;
    end;

    u11.Parent = Workspace;
    KillEffect.hideCharacter(p7, p9);
    SoundManager:playSound(GameSound.STATUE, {
        position = u11:GetPrimaryPartCFrame().Position
    });
    AnimationUtil:playAnimation(u11:FindFirstChild("Humanoid"):FindFirstChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.STATUE), {
        looped = false
    });
    RuntimeLib.Promise.delay(2.8):andThen(function() -- Line: 56
        -- upvalues: u11 (copy)
        u11:Destroy();
    end);

    return u2.new();
end;

return u3;