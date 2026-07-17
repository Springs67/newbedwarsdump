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
        return "Anonymous";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 26
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, ...);
end;

function u4.onKill(p7, p8, p9, p10) -- Line: 29
    -- upvalues: u2 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy)
    local u11 = u2.new();
    local u12 = ReplicatedStorage.Assets.Effects.HeartParticle:Clone();
    GameQueryUtil:setQueryIgnored(u12, true);
    u12.CFrame = p10;
    u12.Parent = Workspace;
    u11:GiveTask(u12);
    u11:GiveTask(SoundManager:playSound(GameSound.HEART, {
        position = p10.Position
    }));
    local u15 = RuntimeLib.Promise.defer(function() -- Line: 39
        -- upvalues: u12 (copy)
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

            u12.Attachment.Heart:Emit(10);
            u12.Attachment.Glow:Emit(10);
        end;
    end);
    u11:GiveTask(function() -- Line: 57
        -- upvalues: u15 (copy)
        return u15:cancel();
    end);
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 61
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);

    return u11;
end;

return u4;