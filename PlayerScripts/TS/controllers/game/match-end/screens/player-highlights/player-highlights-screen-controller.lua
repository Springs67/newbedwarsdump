-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreenController = RuntimeLib.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController;
local PlayerHighlightsWrapper = RuntimeLib.import(script, script.Parent, "ui", "player-highlights").PlayerHighlightsWrapper;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "PlayerHighlightsScreenController";
    end,

    __index = MatchEndScreenController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: MatchEndScreenController (copy)
    MatchEndScreenController.constructor(p4, 2);
    p4.Name = "PlayerHighlightsScreenController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: MatchEndScreenController (copy), default (copy)
    MatchEndScreenController.KnitStart(u5);
    default.Client:OnEvent("PostGameStatCardsGenerated", function(p6) -- Line: 29
        -- upvalues: u5 (copy)
        u5.statCardsEvent = p6;
    end);
end;

function u2.renderScreen(p7) -- Line: 33
    -- upvalues: CreateRoduxApp (copy), PlayerHighlightsWrapper (copy)
    if not p7.statCardsEvent then
        return nil;
    end;

    p7.tree = CreateRoduxApp("MatchEndControls", PlayerHighlightsWrapper, {
        cards = p7.statCardsEvent.cards
    });
end;

function u2.unmountScreen(p8) -- Line: 41
    -- upvalues: u1 (copy)
    if not p8.tree then
        return nil;
    end;

    u1.unmount(p8.tree);
end;

KnitClient.CreateController(u2.new());

return nil;