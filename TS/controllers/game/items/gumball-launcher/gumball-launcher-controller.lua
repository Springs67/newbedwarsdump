-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local UserInputService = v2.UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "GumballLauncherController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: GameSound (copy), u1 (copy)
    p5.jumpStuckSounds = { GameSound.GUMBALL_LAUNCHER_JUMP_STUCK_1, GameSound.GUMBALL_LAUNCHER_JUMP_STUCK_2, GameSound.GUMBALL_LAUNCHER_JUMP_STUCK_3 };
    p5.rng = Random.new();
    p5.denyJumpMaid = u1.new();
end;

function u3.onStart(u6) -- Line: 33
    -- upvalues: KnitClient (copy), ItemType (copy), GameSound (copy), AnimationType (copy), ClientSyncEvents (copy), UserInputService (copy), SoundManager (copy)
    local PreloadController = KnitClient.Controllers.PreloadController;
    local GUMBALL_LAUNCHER = ItemType.GUMBALL_LAUNCHER;
    local v7 = {};
    local v8 = {};
    local v9 = #v8;
    local jumpStuckSounds = u6.jumpStuckSounds;
    local v10 = #jumpStuckSounds;
    table.move(jumpStuckSounds, 1, v10, v9 + 1, v8);
    local v11 = v9 + v10;
    v8[v11 + 1] = GameSound.GUMBALL_LAUNCHER_SPLATTER_1;
    v8[v11 + 2] = GameSound.GUMBALL_LAUNCHER_SPLATTER_2;
    v8[v11 + 3] = GameSound.GUMBALL_LAUNCHER_SPLATTER_3;
    v8[v11 + 4] = GameSound.GUMBALL_LAUNCHER_SHOT_1;
    v8[v11 + 5] = GameSound.GUMBALL_LAUNCHER_SHOT_2;
    v8[v11 + 6] = GameSound.GUMBALL_LAUNCHER_SHOT_3;
    v8[v11 + 7] = GameSound.GUM_FOOTSTEP_1;
    v8[v11 + 8] = GameSound.GUM_FOOTSTEP_2;
    v8[v11 + 9] = GameSound.GUM_FOOTSTEP_3;
    v8[v11 + 10] = GameSound.GUM_FOOTSTEP_4;
    v7.sounds = v8;
    v7.animations = { AnimationType.ROCKET_LAUNCHER_IDLE };
    PreloadController:preloadForItemType(GUMBALL_LAUNCHER, v7);
    ClientSyncEvents.StatusEffectAdded:connect(function(p12) -- Line: 57
        -- upvalues: u6 (copy), UserInputService (ref), SoundManager (ref)
        if u6:isInvalidStatusEffectEvent(p12.entityInstance, p12.statusEffect) then
            return nil;
        end;

        u6.denyJumpMaid:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 61
            -- upvalues: u6 (ref), SoundManager (ref)
            local v13 = u6.rng:NextNumber() * #u6.jumpStuckSounds;
            local v14 = math.floor(v13);
            SoundManager:playSound(u6.jumpStuckSounds[v14 + 1]);
        end));
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p15) -- Line: 67
        -- upvalues: u6 (copy)
        if u6:isInvalidStatusEffectEvent(p15.entityInstance, p15.statusEffect) then
            return nil;
        end;

        u6.denyJumpMaid:DoCleaning();
    end);
end;

function u3.isInvalidStatusEffectEvent(p16, p17, p18) -- Line: 74
    -- upvalues: Players (copy), StatusEffectType (copy)
    return p17 ~= Players.LocalPlayer.Character and true or p18 ~= StatusEffectType.STICKY_BOOTS;
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/game/items/gumball-launcher/gumball-launcher-controller@GumballLauncherController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    default = u3
};