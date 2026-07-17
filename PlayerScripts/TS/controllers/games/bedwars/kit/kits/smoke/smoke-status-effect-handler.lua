-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SmokeStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 30
    -- upvalues: ClientStatusEffectHandler (copy)
    ClientStatusEffectHandler.constructor(p6, ...);
end;

function u4.onApply(u7, u8, p9) -- Line: 33
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), ClientSyncEvents (copy), BlockEngineClientEvents (copy)
    local v10;

    if u8 == Players.LocalPlayer.Character then
        v10 = Players.LocalPlayer.Character;
    else
        v10 = false;
    end;

    local USE_SMOKE_CHARGE = GameSound.USE_SMOKE_CHARGE;
    local v11 = {};
    local v12;

    if v10 then
        v12 = nil;
    else
        v12 = u8.PrimaryPart;

        if v12 ~= nil then
            v12 = v12.Position;
        end;
    end;

    v11.position = v12;
    SoundManager:playSound(USE_SMOKE_CHARGE, v11);
    local SMOKE_CHARGE_LOOP = GameSound.SMOKE_CHARGE_LOOP;
    local v13 = {};
    local v14;

    if v10 then
        v14 = nil;
    else
        v14 = u8.PrimaryPart;

        if v14 ~= nil then
            v14 = v14.Position;
        end;
    end;

    v13.position = v14;
    local v15;

    if v10 then
        v15 = nil;
    else
        v15 = u8.PrimaryPart;
    end;

    v13.parent = v15;
    v13.looped = true;
    local u16 = SoundManager:playSound(SMOKE_CHARGE_LOOP, v13);

    if u16 then
        u7.maid:GiveTask(function() -- Line: 70
            -- upvalues: u16 (copy)
            u16:Destroy();
        end);
    end;

    u7:playSmokePuff(u8);
    task.delay(0.08, function() -- Line: 75
        -- upvalues: u7 (copy), u8 (copy)
        u7:playSmokePuff(u8);
    end);
    local u17 = ReplicatedStorage.Assets.Effects.SmokeTrail:Clone();
    local PrimaryPart = u8.PrimaryPart;

    if not PrimaryPart then
        return nil;
    end;

    u17.Parent = PrimaryPart;
    u7.maid:GiveTask(function() -- Line: 84
        -- upvalues: u17 (copy)
        u17:Destroy();
    end);

    if v10 then
        u7.maid:GiveTask(ClientSyncEvents.PerformCombat:connect(function(p18) -- Line: 89
            p18:setCancelled(true);
        end));
        u7.maid:GiveTask(BlockEngineClientEvents.DamageBlock:connect(function(p19) -- Line: 92
            p19:setCancelled(true);
        end));
        u7.maid:GiveTask(BlockEngineClientEvents.PlaceBlock:connect(function(p20) -- Line: 95
            p20:setCancelled(true);
        end));
    end;
end;

function u4.onRemove(u21, u22, p23) -- Line: 100
    u21:playSmokePuff(u22);
    task.delay(0.08, function() -- Line: 102
        -- upvalues: u21 (copy), u22 (copy)
        u21:playSmokePuff(u22);
    end);
end;

function u4.playSmokePuff(p24, p25) -- Line: 106
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u2 (copy), GameQueryUtil (copy), EffectUtil (copy)
    local v26 = ReplicatedStorage.Assets.Effects.SmokePuff:Clone();
    local v27 = {};
    local PrimaryPart = p25.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    v27.CFrame = PrimaryPart;
    v27.Anchored = true;
    v27.CanQuery = false;
    v27.CanCollide = false;
    v27.Transparency = 1;
    v27.Parent = Workspace;
    local u28 = u2("Part", v27);
    GameQueryUtil:setQueryIgnored(u28, true);
    v26.Parent = u28;
    EffectUtil:playEffects({ v26 }, p25);
    task.delay(5, function() -- Line: 124
        -- upvalues: u28 (copy)
        u28:Destroy();
    end);
end;

return {
    SmokeStatusEffectHandler = u4
};