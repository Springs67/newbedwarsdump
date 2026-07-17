-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local WinstreakBoard = RuntimeLib.import(script, script.Parent, "ui", "winstreak-board").WinstreakBoard;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "WinstreakQueueLobbyUiController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "WinstreakQueueLobbyUiController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), KnitClient (copy), QueueType (copy), WinstreakBoard (copy)
    KnitController.KnitStart(p4);
    KnitClient.Controllers.QueueUiBoardController:mountUI(QueueType.WINSTREAK_1v1, WinstreakBoard, function(p5) -- Line: 27
        -- upvalues: QueueType (ref)
        local v6 = {};
        local v7 = p5.Leaderboard.queues[QueueType.WINSTREAK_1v1];

        if v7 ~= nil then
            v7 = v7.currentWinStreak;
        end;

        v6.streak = v7 == nil and 0 or v7;

        return v6;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;