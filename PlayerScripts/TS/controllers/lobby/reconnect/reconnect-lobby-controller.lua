-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ReconnectingMenu = RuntimeLib.import(script, script.Parent, "reconnect-lobby-menu").ReconnectingMenu;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ReconnectLobbyController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "ReconnectLobbyController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("NotifyReconnectToMatch", function(p6) -- Line: 29
        -- upvalues: u5 (copy), KnitClient (ref)
        u5:openReconnectNotificationMenu(p6.queueType, p6.endTime);
        KnitClient.Controllers.QueueController:leaveQueue();
    end);
end;

function u2.openReconnectNotificationMenu(p7, p8, p9) -- Line: 34
    -- upvalues: u1 (copy), ReconnectingMenu (copy), Players (copy)
    p7.menuTree = u1.mount(u1.createElement(ReconnectingMenu, {
        QueueType = p8,
        ResponseEndTime = p9
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "ReconnectMenu");
end;

function u2.cancelReconnectToMatch(p10) -- Line: 40
    -- upvalues: default (copy), u1 (copy)
    local v11 = default.Client:Get("CancelReconnectToMatch"):CallServer();

    if v11 and p10.menuTree then
        u1.unmount(p10.menuTree);
        p10.menuTree = nil;
    end;

    return v11;
end;

function u2.confirmReconnectToMatch(u12) -- Line: 48
    -- upvalues: RuntimeLib (copy), default (copy), u1 (copy)
    task.spawn(RuntimeLib.async(function() -- Line: 49
        -- upvalues: RuntimeLib (ref), default (ref), u12 (copy), u1 (ref)
        if RuntimeLib.await(default.Client:Get("ConfirmReconnectToMatch"):CallServerAsync()) and u12.menuTree then
            u1.unmount(u12.menuTree);
            u12.menuTree = nil;
        end;
    end));
end;

KnitClient.CreateController(u2.new());

return nil;