-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local VictorySection = RuntimeLib.import(script, script.Parent, "victory-section").VictorySection;
local u3 = nil;

local function WinningTeamWrapper(p4) -- Line: 38
    -- upvalues: u1 (copy), u3 (ref)
    return u1.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 1000
    }, { u1.createElement(u3, {
            store = p4.store,
            WinningTeamId = p4.WinningTeamId,
            NewLeaderboardPos = p4.NewLeaderboardPos,
            PreviousLeaderboardPos = p4.PreviousLeaderboardPos,
            CustomTitleMessage = p4.CustomTitleMessage
        }) });
end;

u3 = v2.new(u1)(function(p5, p6) -- Line: 7
    -- upvalues: Theme (copy), u1 (copy), VictorySection (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.new(0.5, 0, 0, Theme.topBarGuiInset),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v8 = {};
    local v9 = {
        FrameProps = {
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.18),
            AnchorPoint = Vector2.new(0.5, 0)
        },
        store = p5.store,
        WinningTeamId = p5.WinningTeamId,
        CustomTitleMessage = p5.CustomTitleMessage
    };
    local DisplayPlayers = p5.DisplayPlayers;
    v9.DisplayPlayers = DisplayPlayers == nil and true or DisplayPlayers;
    v8[#v8 + 1] = u1.createElement(VictorySection, v9);

    return u1.createElement("Frame", v7, v8);
end);

return {
    WinningTeamWrapper = WinningTeamWrapper,
    WinningTeam = u3
};