-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "StatsController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "StatsController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: default (copy), ClientStore (copy)
    default.Client:WaitFor("FetchStats"):andThen(function(p5) -- Line: 28
        -- upvalues: ClientStore (ref)
        local v6 = p5:CallServer();
        ClientStore:dispatch({
            type = "SetStats",
            globalStats = v6.globalStats,
            queues = v6.queues,
            rankStats = v6.rankStats
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;