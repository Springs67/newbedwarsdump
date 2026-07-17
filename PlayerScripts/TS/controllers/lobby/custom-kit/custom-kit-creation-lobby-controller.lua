-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CustomKitCreationQueueHud = RuntimeLib.import(script, script.Parent, "custom-kit-creation-queue-hud").CustomKitCreationQueueHud;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "CustomKitCreationLobbyController";
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
    p4.Name = "CustomKitCreationLobbyController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("CustomKitCreationShowQueuePopupOnClient"):Connect(function(p6) -- Line: 29
        -- upvalues: u5 (copy)
        u5:showQueuePopup(p6.message);
    end);
end;

function u2.showQueuePopup(p7, p8) -- Line: 33
    -- upvalues: u1 (copy), CustomKitCreationQueueHud (copy), Players (copy)
    if p7.customKitHudTree then
        u1.unmount(p7.customKitHudTree);
    end;

    p7.customKitHudTree = u1.mount(u1.createElement(CustomKitCreationQueueHud, {
        message = p8
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u2.clickQueue(p9) -- Line: 41
    -- upvalues: default (copy)
    default.Client:Get("CustomKitCreationQueue"):SendToServer({});
end;

KnitClient.CreateController(u2.new());

return nil;