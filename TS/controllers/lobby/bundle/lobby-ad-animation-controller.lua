-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ContentProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContentProvider;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "LobbyAdAnimation";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "LobbyAdAnimation";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), AnimationType (copy), GameSound (copy), GameAnimationUtil (copy), SoundManager (copy), ContentProvider (copy)
    KnitController.KnitStart(p5);
    WatchCollectionTag("music-ad", function(p6) -- Line: 32
        -- upvalues: AnimationType (ref), GameSound (ref), GameAnimationUtil (ref), SoundManager (ref), ContentProvider (ref)
        local SPIRIT_ASSASSIN_LOOP = GameSound.SPIRIT_ASSASSIN_LOOP;
        local v7 = GameAnimationUtil:getAnimation(AnimationType.SPIRIT_ASSASSIN_AD);
        local v8 = SoundManager:createSound(SPIRIT_ASSASSIN_LOOP);

        if not v8 then
            return nil;
        end;

        v8.RollOffMinDistance = 50;
        v8.RollOffMaxDistance = 70;
        v8.RollOffMode = Enum.RollOffMode.Linear;
        v8.Volume = 0.5;
        ContentProvider:PreloadAsync({ v7, v8 });

        if not p6.PrimaryPart then
            p6:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local Humanoid = p6:WaitForChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator");
        end;

        v8.Parent = p6.PrimaryPart;
        v8.Looped = true;
        local v9 = Humanoid:LoadAnimation(v7);
        v9.Looped = true;
        v9:Play();
        v8:Play();
    end);
end;

KnitClient.CreateController(u2.new());

return nil;