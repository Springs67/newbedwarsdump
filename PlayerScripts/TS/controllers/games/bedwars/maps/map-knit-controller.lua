-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local v2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "MapKnitController";
    end,

    __index = KnitController
});
v2.__index = v2;

function v2.constructor(p3, p4) -- Line: 18
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.maps = p4;
    p3.Name = "MapKnitControler";
end;

function v2.KnitStart(u5) -- Line: 23
    -- upvalues: KnitController (copy), KnitClient (copy), u1 (copy), ClientSyncEvents (copy), MatchState (copy)
    KnitController.KnitStart(u5);
    task.spawn(function() -- Line: 25
        -- upvalues: KnitClient (ref), u5 (copy), u1 (ref), ClientSyncEvents (ref), MatchState (ref)
        local u6 = KnitClient.Controllers.MapController:waitForMapName();

        local function _(p7) -- Line: 28
            -- upvalues: u1 (ref), u6 (copy)
            return u1.includes(string.lower(u6), string.lower(p7));
        end;

        local v8 = nil;

        for i, v in u5.maps do
            local _ = i - 1;

            if u1.includes(string.lower(u6), string.lower(v)) == true then
                v8 = v;
                break;
            end;
        end;

        if v8 == "" or not v8 then
            return nil;
        end;

        u5:onMapInit();
        ClientSyncEvents.MatchStateChange:connect(function(p9) -- Line: 45
            -- upvalues: MatchState (ref), u5 (ref)
            if p9.matchState == MatchState.RUNNING then
                u5:onMatchStart();
            end;
        end);
    end);
end;

return {
    MapKnitController = v2
};