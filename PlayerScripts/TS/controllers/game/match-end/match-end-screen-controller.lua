-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "MatchEndScreenController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 18
    -- upvalues: KnitController (copy), MatchEndScreensMeta (copy)
    KnitController.constructor(p2);
    p2.matchEndScreenType = p3;
    p2.Name = "MatchEndScreenController";
    p2.Client = {};
    p2.displaying = false;
    p2.matchEndScreenMeta = MatchEndScreensMeta[p3];
end;

function v1.KnitStart(u4) -- Line: 26
    -- upvalues: default (copy)
    default.Client:OnEvent("MatchEndEvent", function(p5) -- Line: 27
        -- upvalues: u4 (copy)
        u4.matchEndEvent = p5;
        u4:initializeMatchEndScreen(u4.matchEndScreenType);
    end);
end;

function v1.initializeMatchEndScreen(u6, u7) -- Line: 32
    -- upvalues: KnitClient (copy), ClientSyncEvents (copy)
    task.spawn(function() -- Line: 33
        -- upvalues: KnitClient (ref), u7 (copy), u6 (copy), ClientSyncEvents (ref)
        if KnitClient.Controllers.MatchEndController:waitUntilDisplay(u7) then
            u6.displaying = true;
            u6:renderScreen();
        end;

        ClientSyncEvents.MatchEndScreenEnd:connect(function(p8) -- Line: 38
            -- upvalues: u7 (ref), u6 (ref)
            if p8.matchEndScreenType ~= u7 then
                return nil;
            end;

            if not u6.displaying then
                return nil;
            end;

            u6:unmountScreen();
            u6.displaying = false;
        end);
        ClientSyncEvents.MatchEndScreenStart:connect(function(p9) -- Line: 48
            -- upvalues: u7 (ref), u6 (ref)
            if p9.matchEndScreenType ~= u7 then
                return nil;
            end;

            if u6.displaying then
                return nil;
            end;

            u6:renderScreen();
            u6.displaying = true;
        end);
    end);
end;

return {
    MatchEndScreenController = v1
};