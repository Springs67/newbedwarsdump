-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local QueueAppWrapper = RuntimeLib.import(script, script.Parent, "ui", "queue-app").QueueAppWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "QueueController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "QueueController";
    p4.joiningMatch = false;
end;

function u2.KnitStart(u5) -- Line: 35
    -- upvalues: ClientStore (copy), QueueState (copy), SoundManager (copy), GameSound (copy), CreateRoduxApp (copy), QueueAppWrapper (copy)
    ClientStore.changed:connect(function(p6, p7) -- Line: 36
        -- upvalues: QueueState (ref), u5 (copy), SoundManager (ref), GameSound (ref), CreateRoduxApp (ref), QueueAppWrapper (ref)
        if p6.Party.queueState ~= p7.Party.queueState then
            if p6.Party.queueState == QueueState.MATCH_FOUND then
                u5.joiningMatch = true;
                SoundManager:playSound(GameSound.QUEUE_MATCH_FOUND);

                return;
            end;

            if p6.Party.queueState == QueueState.IN_QUEUE then
                u5.joiningMatch = false;
                u5:cleanUpQueueBar();
                u5.queueBarTree = CreateRoduxApp("queue-status", QueueAppWrapper, {}, {}, {
                    IgnoreGuiInset = true
                });

                return;
            end;

            if p6.Party.queueState == QueueState.NONE and u5.joiningMatch ~= true then
                u5:cleanUpQueueBar();
            end;
        end;
    end);
end;

function u2.cleanUpQueueBar(p8) -- Line: 55
    -- upvalues: u1 (copy), SoundManager (copy), GameSound (copy)
    if p8.queueBarTree then
        u1.unmount(p8.queueBarTree);
        p8.queueBarTree = nil;
        SoundManager:playSound(GameSound.UI_CLOSE_2);
    end;
end;

function u2.joinQueue(p9, p10) -- Line: 62
    -- upvalues: QueueType (copy), KnitClient (copy), Flamework (copy), ClientStore (copy), Players (copy)
    if p10 == QueueType.CUSTOM_KIT_CREATION then
        KnitClient.Controllers.CustomKitCreationLobbyController:clickQueue();

        return nil;
    end;

    if p10 == QueueType.CUSTOM_KIT and not KnitClient.Controllers.CustomKitLobbyController:checkIfCanJoinQueue() then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "You do not have any custom kits set up yet. Click the Custom Kit Creator game card to create one."
        });

        return nil;
    end;

    if ClientStore:getState().Party.leader.userId == Players.LocalPlayer.UserId then
        Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p10);
    end;
end;

function u2.leaveQueue(p11) -- Line: 81
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):leaveQueue();
end;

return {
    QueueController = KnitClient.CreateController(u2.new())
};