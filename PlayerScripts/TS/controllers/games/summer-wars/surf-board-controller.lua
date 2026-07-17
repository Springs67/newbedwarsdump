-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SurfBoardController";
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
    GameKnitController.constructor(p3, { GameType.SUMMER_WARS });
    p3.Name = "SurfBoardController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p4);
end;

function u1.onGameInit(p5) -- Line: 31
    -- upvalues: default (copy), KnitClient (copy), Players (copy), SoundManager (copy), GameSound (copy)
    default.Client:Get("SurfBoardBlock"):Connect(function(p6) -- Line: 32
        -- upvalues: KnitClient (ref), Players (ref), SoundManager (ref), GameSound (ref)
        local Character = p6.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if Character then
            KnitClient.Controllers.DamageIndicatorController:spawnDamageIndicator(Character, 1, {
                text = "Blocked!",
                color = Color3.fromRGB(0, 224, 255)
            });

            if p6.player == Players.LocalPlayer then
                SoundManager:playSound(GameSound.VOID_AXE_HIT);

                return;
            end;

            SoundManager:playSound(GameSound.VOID_AXE_HIT, {
                position = Character
            });
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;