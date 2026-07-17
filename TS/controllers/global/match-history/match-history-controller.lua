-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchHistoryModerationApp = RuntimeLib.import(script, script.Parent, "ui", "match-history-moderation-app").MatchHistoryModerationApp;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "MatchHistoryController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "MatchHistoryController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), OfflinePlayerUtil (copy), Flamework (copy), MatchHistoryModerationApp (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("SendMatchHistoryToPlayer"):Connect(function(p5) -- Line: 30
        -- upvalues: OfflinePlayerUtil (ref), Flamework (ref), MatchHistoryModerationApp (ref)
        local matchHistory = p5.matchHistory;
        OfflinePlayerUtil.getOfflinePlayersByUserIds({ p5.matchHistoryOwner }):andThen(function(p6) -- Line: 34
            -- upvalues: Flamework (ref), MatchHistoryModerationApp (ref), matchHistory (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "MatchHistoryApp",
                app = MatchHistoryModerationApp
            }, {
                player = p6[1],
                matchHistory = matchHistory
            });
        end);
    end);
end;

function u1.requestMatchHistory(p7, p8) -- Line: 46
    -- upvalues: default (copy)
    return default.Client:Get("RequestMatchHistory"):CallServerAsync(p8);
end;

KnitClient.CreateController(u1.new());

return nil;