-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "LeaderboardController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3, ...);
    p3.Name = "LeaderboardController";
end;

u1.KnitStart = RuntimeLib.async(function(p4) -- Line: 26
    p4:setupLeaderboardBoards();
end);
u1.setupLeaderboardBoards = RuntimeLib.async(function(u5) -- Line: 29
    -- upvalues: default (copy), RuntimeLib (copy)
    local v6 = default.Client:GetNamespace("Leaderboard");
    RuntimeLib.await(v6:WaitFor("OnLeaderboardsUpdate")):Connect(function(p7) -- Line: 32
        -- upvalues: u5 (copy)
        return u5:updateLeaderboards(p7);
    end);
    local v8 = RuntimeLib.await(v6:WaitFor("RequestLeaderboardData"));
    u5:updateLeaderboards((RuntimeLib.await(v8:CallServerAsync())));
end);

function u1.updateLeaderboards(p9, p10) -- Line: 40
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "UpdateAllLeaderboards",
        leaderboards = p10
    });
end;

return {
    LeaderboardController = KnitClient.CreateController(u1.new())
};