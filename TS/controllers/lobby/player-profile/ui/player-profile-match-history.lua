-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MatchHistoryCore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "match-history", "ui", "match-history-core").MatchHistoryCore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerProfileEmpty = RuntimeLib.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty;

return {
    PlayerProfileMatchHistory = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: Theme (copy), u1 (copy), PlayerProfileEmpty (copy), MatchHistoryCore (copy)
        local _ = p4.useState;
        local v5 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, 0.98),
            BackgroundColor3 = Theme.backgroundPrimary,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.02)
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local createElement = u1.createElement;
        local v6 = {};
        local v7;

        if #p3.ProfileData.matchHistory == 0 then
            v7 = u1.createElement(PlayerProfileEmpty, {
                Text = "No match history available.",
                Size = UDim2.fromScale(1, 1)
            });
        else
            v7 = u1.createElement(MatchHistoryCore, {
                userId = p3.ProfileData.userId,
                matchHistory = p3.ProfileData.matchHistory
            });
        end;

        v6[1] = v7;

        return createElement("Frame", v5, v6);
    end)
};