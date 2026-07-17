-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local LeaderboardUIWrapper = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "leaderboard", "ui", "leaderboard-core").LeaderboardUIWrapper;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local DEFAULT_LEADERBOARD_TO_DISPLAY = v2.DEFAULT_LEADERBOARD_TO_DISPLAY;
local getLeaderboardsToDisplay = v2.getLeaderboardsToDisplay;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local GetAttribute = v3.GetAttribute;
local LeaderboardName = v3.Attribute.new("LeaderboardName", t.optional(t.string));
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "LeaderboardComponent";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 26
    -- upvalues: GetAttribute (copy), LeaderboardName (copy), CreateRoduxApp (copy), LeaderboardUIWrapper (copy), getLeaderboardsToDisplay (copy), DEFAULT_LEADERBOARD_TO_DISPLAY (copy)
    GetAttribute(p7, LeaderboardName);
    p6.roactTree = CreateRoduxApp("LeaderboardApp", LeaderboardUIWrapper, {
        Leaderboards = getLeaderboardsToDisplay(),
        DefaultLeaderboard = DEFAULT_LEADERBOARD_TO_DISPLAY
    }, {}, {
        Parent = p7
    });
end;

function u4.Destroy(p8) -- Line: 35
    -- upvalues: u1 (copy)
    u1.unmount(p8.roactTree);
end;

u4.Tag = "Leaderboard";

return u4;