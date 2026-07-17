-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TrainingRoomQueueHud = RuntimeLib.import(script, script.Parent, "ui", "training-room-queue-hud").TrainingRoomQueueHud;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TrainingRoomLobbyController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "TrainingRoomLobbyController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), default (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag("TrainingAreaPortal", function(p6) -- Line: 32
        -- upvalues: u5 (copy)
        u5:hookTeleporter(p6);
    end);
    default.Client:Get("TrainingRoomShowQueuePopupOnClient"):Connect(function(p7) -- Line: 35
        -- upvalues: u5 (copy)
        u5:showQueuePopup(p7.message);
    end);
end;

function u2.hookTeleporter(u8, p9) -- Line: 39
    -- upvalues: Players (copy)
    if p9 then
        p9.Touched:Connect(function(p10) -- Line: 41
            -- upvalues: Players (ref), u8 (copy)
            if Players.LocalPlayer.Character and p10.Parent == Players.LocalPlayer.Character then
                u8:clickQueue();
            end;
        end);
    end;
end;

function u2.showKitSelection(p11) -- Line: 50
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.TRAINING_ROOM_KIT_SELECTION_APP, {
        IsInLobby = true
    });
end;

function u2.showQueuePopup(p12, p13) -- Line: 55
    -- upvalues: u1 (copy), TrainingRoomQueueHud (copy), Players (copy)
    if p12.trainingRoomHudTree then
        u1.unmount(p12.trainingRoomHudTree);
    end;

    p12.trainingRoomHudTree = u1.mount(u1.createElement(TrainingRoomQueueHud, {
        message = p13
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u2.clickQueue(p14) -- Line: 63
    -- upvalues: default (copy)
    default.Client:Get("TrainingRoomQueue"):SendToServer({});
end;

KnitClient.CreateController(u2.new());

return nil;