-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BubblesKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, ...);
end;

function u4.onKill(p7, p8, p9, p10) -- Line: 29
    -- upvalues: u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy)
    local v11 = u2.new();
    local u12 = ReplicatedStorage.Assets.Effects.BubbleParticle:Clone();
    GameQueryUtil:setQueryIgnored(u12, true);
    u12.Transparency = 1;
    u12.CFrame = p10;
    u12.Parent = Workspace;
    v11:GiveTask(u12);
    local Bubbles = u12:WaitForChild("Attachment"):WaitForChild("Bubbles");
    Bubbles.Enabled = false;
    v11:GiveTask(Bubbles);
    v11:GiveTask(SoundManager:playSound(GameSound.BUBBLE_KILL_EFFECT, {
        position = p10.Position
    }));
    RuntimeLib.Promise.defer(function() -- Line: 45
        -- upvalues: Bubbles (copy)
        local v13 = false;
        local v14 = 0;

        while true do
            if v13 then
                v14 = v14 + 1;
            else
                v13 = true;
            end;

            if v14 >= 5 then
                return;
            end;

            Bubbles:Emit(10);
        end;
    end);
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 63
        -- upvalues: u12 (copy)
        u12:Destroy();
    end);

    return v11;
end;

return u4;