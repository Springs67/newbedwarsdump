-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "Anonymous";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 23
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, ...);
end;

function u5.onKill(p8, p9, p10, p11) -- Line: 30
    -- upvalues: u2 (copy), u3 (copy), Workspace (copy), GameQueryUtil (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy)
    local v12 = u2.new();
    local u13 = u3("Part", {
        Size = Vector3.new(1, 1, 1),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CFrame = p11,
        Parent = Workspace
    });
    v12:GiveTask(u13);
    GameQueryUtil:setQueryIgnored(u13, true);
    local u14 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ConfettiParticle"):Clone();
    u14.Enabled = false;
    u14.Parent = u13;
    v12:GiveTask(u14);
    v12:GiveTask(SoundManager:playSound(GameSound.CONFETTI, {
        position = p11.Position
    }));
    RuntimeLib.Promise.defer(function() -- Line: 49
        -- upvalues: u14 (copy)
        local v15 = false;
        local v16 = 0;

        while true do
            if v15 then
                v16 = v16 + 1;
            else
                v15 = true;
            end;

            if v16 >= 5 then
                return;
            end;

            u14:Emit(20);
        end;
    end);
    RuntimeLib.Promise.delay(4):andThen(function() -- Line: 67
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);

    return v12;
end;

return u5;