-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local DistractionWrapper = RuntimeLib.import(script, script.Parent, "distraction").DistractionWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DistractionController";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
end;

function u2.onStart(p5) -- Line: 25
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy), u1 (copy), DistractionWrapper (copy), Players (copy)
    default.Client:Get("Distraction"):Connect(function(p6) -- Line: 26
        -- upvalues: SoundManager (ref), GameSound (ref), u1 (ref), DistractionWrapper (ref), Players (ref)
        SoundManager:playSound(GameSound.TV_STATIC);
        SoundManager:playSound(GameSound.TURRET_ON);
        local u7 = u1.mount(u1.createElement(DistractionWrapper), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
        task.delay(p6.length, function() -- Line: 30
            -- upvalues: SoundManager (ref), GameSound (ref), u1 (ref), u7 (copy)
            SoundManager:playSound(GameSound.TV_STATIC);
            SoundManager:playSound(GameSound.TURRET_OFF);
            u1.unmount(u7);
        end);
    end);
end;

Reflect.defineMetadata(u2, "identifier", "client/controllers/games/bedwars/lucky-blocks/distraction/distraction-controller@DistractionController");
Reflect.defineMetadata(u2, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u2, "$:flamework@Controller", Controller, { {} });

return {
    default = u2
};