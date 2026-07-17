-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "VampirismHungerStatusEffectController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "VampirismHungerStatusEffectController";
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), StatusEffectUtil (copy), StatusEffectType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Players (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(p4);
    default.Client:OnEvent("CursedCoffinHitPlayer", function(p5) -- Line: 32
        -- upvalues: StatusEffectUtil (ref), StatusEffectType (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), Players (ref)
        if StatusEffectUtil:isActive(p5.healer, StatusEffectType.VAMPIRISM) then
            local LifeStealController = KnitClient.Controllers.LifeStealController;
            local healer = p5.healer;
            local enemy = p5.enemy;
            local v6 = {};
            local config = p5.config;

            if config ~= nil then
                config = config.beamColors;
            end;

            v6.extraBeams = config;
            local config2 = p5.config;

            if config2 ~= nil then
                config2 = config2.mainBeamColor;
            end;

            v6.mainBeamColor = config2;
            LifeStealController:playRegenEffect(healer, enemy, v6);
            local CURSED_COFFIN_LIFESTEAL_HIT = GameSound.CURSED_COFFIN_LIFESTEAL_HIT;
            local v7 = {};
            local v8;

            if p5.healer == Players.LocalPlayer.Character then
                v8 = nil;
            else
                v8 = p5.healer.PrimaryPart;

                if v8 ~= nil then
                    v8 = v8.Position;
                end;
            end;

            v7.position = v8;
            local config3 = p5.config;

            if config3 ~= nil then
                config3 = config3.volumeMultiplier;
            end;

            v7.volumeMultiplier = config3;
            SoundManager:playSound(CURSED_COFFIN_LIFESTEAL_HIT, v7);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p9) -- Line: 75
        -- upvalues: StatusEffectType (ref)
        if p9.statusEffect == StatusEffectType.VAMPIRISM then
            for _, child in p9.entityInstance:GetChildren() do
                if child.Name == "VampireCape" then
                    child:Destroy();
                end;
            end;
        end;
    end);
    default.Client:OnEvent("CursedCoffinPlayHungrySound", function(p10) -- Line: 84
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
        if p10.entityInstance == Players.LocalPlayer.Character then
            SoundManager:playSound(GameSound.CURSED_COFFIN_HUNGRY, {});
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;