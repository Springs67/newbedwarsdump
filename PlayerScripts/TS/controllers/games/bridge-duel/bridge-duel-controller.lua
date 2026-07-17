-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "BridgeDuelController";
    end,

    __index = GameKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p3, { GameType.BRIDGE_DUEL });
    p3.Name = "BridgeDuelController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: GameKnitController (copy), default (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), FireworkType (copy)
    GameKnitController.KnitStart(p4);
    default.Client:Get("BigHammerHitPlayer"):Connect(function(p5) -- Line: 30
        local player = p5.player;

        if player ~= nil then
            player = player.Character;

            if player ~= nil then
                player = player.PrimaryPart;
            end;
        end;

        if not player then
            return nil;
        end;

        player:ApplyImpulse(p5.impulse);
    end);
    default.Client:Get("BridgeDuelTouchdownEffects"):Connect(function(p6) -- Line: 45
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), FireworkType (ref)
        SoundManager:playSound(GameSound.BRIDGE_DUEL_CHEER);
        local v7 = false;
        local v8 = 0;

        while true do
            if v7 then
                v8 = v8 + 1;
            else
                v7 = true;
            end;

            if v8 >= 5 then
                return;
            end;

            local v9 = (math.random() - 0.5) * 100;
            local v10 = math.random() * 75 + 50;
            local v11 = (math.random() - 0.5) * 100;
            local v12 = Vector3.new(p6.position.X + v9, p6.position.Y + v10, p6.position.Z + v11);
            local v13 = math.random(1, 4);
            KnitClient.Controllers.FireworkController:playFireworkEffect(v12, FireworkType.NORMAL, {
                volumeMultiplier = 0.6,
                popSoundPlaybackSpeedMultiplier = 1,
                sizeMultiplier = v13,
                color = p6.color
            });
            task.wait(1);
        end;
    end);
end;

function u1.onGameInit(p14) -- Line: 78
end;

KnitClient.CreateController(u1.new());

return nil;