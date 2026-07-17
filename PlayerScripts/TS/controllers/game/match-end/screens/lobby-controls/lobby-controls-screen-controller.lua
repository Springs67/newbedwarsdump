-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local LobbyControlsWrapper = RuntimeLib.import(script, script.Parent, "ui", "lobby-controls").LobbyControlsWrapper;
local MatchEndBackgroundWrapper = RuntimeLib.import(script, script.Parent, "ui", "match-end-background").MatchEndBackgroundWrapper;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "LobbyControlsScreenController";
    end,

    __index = MatchEndScreenController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p5, 0);
    p5.Name = "LobbyControlsScreenController";
    p5.disableViewSummary = false;
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: MatchEndScreenController (copy), KnitClient2 (copy), getQueueMeta (copy), default (copy)
    MatchEndScreenController.KnitStart(u6);
    local v7, v8 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

    if v7 then
        local disabledMatchEndScreens = getQueueMeta(v8).disabledMatchEndScreens;

        if disabledMatchEndScreens ~= nil then
            disabledMatchEndScreens = table.find(disabledMatchEndScreens, 6) ~= nil;
        end;

        if disabledMatchEndScreens then
            u6.disableViewSummary = true;
        end;
    end;

    default.Client:OnEvent("MatchEndEvent", function(p9) -- Line: 45
        -- upvalues: u6 (copy)
        if p9.cancelled then
            u6.disableViewSummary = true;
        end;
    end);
end;

function u3.renderScreen(p10) -- Line: 51
    -- upvalues: CreateRoduxApp (copy), LobbyControlsWrapper (copy), MatchEndBackgroundWrapper (copy)
    p10.tree = CreateRoduxApp("MatchEndControls", LobbyControlsWrapper, {
        DisableViewSummary = p10.disableViewSummary
    });
    p10.backgroundTree = CreateRoduxApp("MatchEndBackground", MatchEndBackgroundWrapper, {});
end;

function u3.unmountScreen(p11) -- Line: 57
    -- upvalues: u2 (copy)
    if p11.tree then
        u2.unmount(p11.tree);
    end;

    if p11.backgroundTree then
        u2.unmount(p11.backgroundTree);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;