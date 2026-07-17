-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Popup = RuntimeLib.import(script, script.Parent, "ui", "popup").Popup;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "PopupController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "PopupController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), KnitClient2 (copy), Popup (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("ShowPopup"):Connect(function(p6) -- Line: 30
        -- upvalues: KnitClient2 (ref), Popup (ref)
        local UiQueueManagerController = KnitClient2.Controllers.UiQueueManagerController;
        local v7 = {
            app = {
                appId = "Popup",
                app = Popup
            }
        };
        local v8 = {};

        for i, v in p6 do
            v8[i] = v;
        end;

        v7.props = v8;
        v7.priority = p6.priority;
        UiQueueManagerController:queueApp(v7);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;