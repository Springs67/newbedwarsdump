-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local LobbyPerformanceFinalizedPopup = RuntimeLib.import(script, script.Parent, "ui", "lobby-performance-finalized-popup").LobbyPerformanceFinalizedPopup;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "LobbyPerformancePopupController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.constructor(p5);
    p5.Name = "LobbyPerformancePopupController";
    p5.getMatchPerformancePopup = default2.Client:Get("SendMatchPerformancePopup");
    p5.processedMatches = {};
end;

function u3.KnitStart(u6) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), u1 (copy)
    KnitController.KnitStart(u6);
    u6.getMatchPerformancePopup:Connect(function(p7) -- Line: 35
        -- upvalues: default (ref), u1 (ref), u6 (copy)
        default.Info("Queued popups {data}", u1(p7));
        u6:queuePopups(p7);
    end);
end;

function u3.queuePopups(u8, p9) -- Line: 40
    -- upvalues: Flamework (copy), BedwarsImageId (copy)
    local function _(p10) -- Line: 42
        -- upvalues: u8 (copy)
        local processedMatches = u8.processedMatches;
        table.insert(processedMatches, p10);

        return #processedMatches;
    end;

    for i, v in p9 do
        local _ = i - 1;
        local processedMatches = u8.processedMatches;
        table.insert(processedMatches, v);
        local _ = #processedMatches;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
        message = "Click to view <b>" .. tostring(#p9) .. "</b> processed matches.",
        image = BedwarsImageId.BED_RED_RENDER,

        onClick = function() -- Line: 54, Name: onClick
            -- upvalues: u8 (copy)
            u8:showPopup();
        end
    });
end;

function u3.showPopup(p11) -- Line: 59
    -- upvalues: u2 (copy), LobbyPerformanceFinalizedPopup (copy), Players (copy)
    if p11.menuTree then
        u2.unmount(p11.menuTree);
    end;

    p11.menuTree = u2.mount(u2.createElement(LobbyPerformanceFinalizedPopup, {
        data = p11.processedMatches
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "MatchPerformancePopup");
    p11.processedMatches = {};
end;

function u3.hidePopup(p12) -- Line: 68
    -- upvalues: u2 (copy)
    if p12.menuTree then
        u2.unmount(p12.menuTree);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;