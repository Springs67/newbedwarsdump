-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local SkullLeaderboardUIWrapper = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "event", "weekly-events", "skull-drops", "ui", "skull-leaderboard-core").SkullLeaderboardUIWrapper;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local RobloxLeaderboardEnum = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboardEnum;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local GetAttribute = v2.GetAttribute;
local LeaderboardName = v2.Attribute.new("LeaderboardName", t.optional(t.string));
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "LeaderboardComponent";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 24
    -- upvalues: GetAttribute (copy), LeaderboardName (copy), CreateRoduxApp (copy), SkullLeaderboardUIWrapper (copy), RobloxLeaderboardEnum (copy)
    GetAttribute(p6, LeaderboardName);
    p5.roactTree = CreateRoduxApp("SkullLeaderboardApp", SkullLeaderboardUIWrapper, {
        Leaderboards = { RobloxLeaderboardEnum.MARROWS_MADNESS },
        DefaultLeaderboard = RobloxLeaderboardEnum.MARROWS_MADNESS
    }, {}, {
        Parent = p6
    });
end;

function u3.Destroy(p7) -- Line: 33
    -- upvalues: u1 (copy)
    u1.unmount(p7.roactTree);
end;

u3.Tag = "crypt-Leaderboard";

return u3;