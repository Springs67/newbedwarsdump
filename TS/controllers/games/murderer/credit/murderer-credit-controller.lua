-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MurdererCreditApp = RuntimeLib.import(script, script.Parent, "ui", "murderer-credit-app").MurdererCreditApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "MurdererCreditController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.MURDERER_GAME });
    p4.Name = "MurdererCreditController";
    p4.teleportStarted = false;
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(p6) -- Line: 35
    -- upvalues: default (copy), KnitClient (copy), Flamework (copy), MurdererCreditApp (copy), UILayers (copy)
    default.Client:Get("MatchEndEvent"):Connect(function() -- Line: 36
        -- upvalues: KnitClient (ref), Flamework (ref), MurdererCreditApp (ref), UILayers (ref)
        KnitClient.Controllers.MatchEndController:waitUntilDisplay(2);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "MurdererCredit",
            app = MurdererCreditApp,
            layer = UILayers.OVERLAY
        }, {
            AppId = "MurdererCredit"
        });
    end);
end;

function u2.teleportToMurderMystery2(p7) -- Line: 47
    -- upvalues: SoundManager (copy), GameSound (copy), default (copy)
    if p7.teleportStarted then
        return nil;
    end;

    p7.teleportStarted = true;
    SoundManager:playSound(GameSound.QUEUE_MATCH_FOUND);
    default.Client:Get("RequestTeleportToPlace"):SendToServer({
        placeId = 142823291
    });
end;

KnitClient.CreateController(u2.new());

return nil;