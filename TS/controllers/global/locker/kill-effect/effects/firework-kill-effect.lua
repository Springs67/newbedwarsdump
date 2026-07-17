-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "FireworkKillEffect";
    end,

    __index = KillEffect
});
u2.__index = u2;

function u2.new(...) -- Line: 17
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 21
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p4, ...);
end;

function u2.onKill(p5, p6, p7, u8) -- Line: 24
    -- upvalues: u1 (copy), KnitClient (copy), FireworkType (copy)
    local u9 = u1.new();
    task.spawn(function() -- Line: 26
        -- upvalues: KnitClient (ref), u8 (copy), FireworkType (ref), u9 (copy)
        local FireworkController = KnitClient.Controllers.FireworkController;
        local Position = u8.Position;
        local v10 = math.random() * 7 - 3.5;
        local v11 = math.random() * 7 - 3.5;
        local v12 = math.random() * 7 - 3.5;
        u9:GiveTask((FireworkController:playFireworkEffect(Position + Vector3.new(v10, v11, v12), FireworkType.NEW_YEARS, {
            sizeMultiplier = 0.7,
            popSoundPlaybackSpeedMultiplier = 1
        })));
    end);

    return u9;
end;

return u2;