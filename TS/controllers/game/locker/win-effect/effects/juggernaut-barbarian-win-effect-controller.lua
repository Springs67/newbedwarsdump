-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "JuggernautBarbarianWinEffectController";
    end,

    __index = WinEffect
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: WinEffect (copy), WinEffectType (copy)
    WinEffect.constructor(p4, WinEffectType.JUGGERNAUT_BARBARIAN);
    p4.Name = "JuggernautBarbarianWinEffectController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: WinEffect (copy)
    WinEffect.KnitStart(p5);
end;

function u2.onWin(p6, p7) -- Line: 34
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EntityUtil (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v8 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    v8.Parent = Workspace;
    v8.CFrame = p7.Character.PrimaryPart.CFrame;
    local v9 = EntityUtil:getEntity(p7);

    if not v9 then
        return nil;
    end;

    EffectUtil:playEffects({ v8 }, v9:getInstance(), {
        sizeMultiplier = 3
    });
    local TNT_EXPLODE_1 = GameSound.TNT_EXPLODE_1;
    local v10 = {};
    local PrimaryPart = v9:getInstance().PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    v10.position = PrimaryPart;
    SoundManager:playSound(TNT_EXPLODE_1, v10);
end;

KnitClient.CreateController(u2.new());

return nil;