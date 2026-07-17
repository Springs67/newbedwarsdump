-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TournamentAppMatchHistory = RuntimeLib.import(script, script.Parent, "tournament-app-match-history").TournamentAppMatchHistory;
local TournamentAppRewardTracker = RuntimeLib.import(script, script.Parent, "tournament-app-reward-tracker").TournamentAppRewardTracker;

return {
    TournamentAppBracketPage = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), Empty (copy), TournamentAppMatchHistory (copy), TournamentAppRewardTracker (copy)
        local _ = p4.useState;

        return u1.createFragment({
            ["App Content - Bracket"] = u1.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.9)
            }, { u1.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u1.createElement(TournamentAppMatchHistory, {
                    inATeam = p3.inATeam
                }), u1.createElement(TournamentAppRewardTracker) })
        });
    end)
};