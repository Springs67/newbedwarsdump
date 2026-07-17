-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local PlacementScores = RuntimeLib.import(script, script.Parent, "placement-scores").PlacementScores;
local v7 = v3.new(u2)(function(p5, p6) -- Line: 10
    -- upvalues: u2 (copy), Empty (copy), DeviceUtil (copy), PlacementScores (copy)
    local _ = p6.useState;

    return u2.createFragment({
        PlacementScoreHud = u2.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, {
            PlacementScoreHud = u2.createElement(Empty, {
                Size = UDim2.fromScale(0.19, DeviceUtil.isSmallScreen() and 0.17 or 0.14),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.02)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.05, 0)
                }), u2.createElement(PlacementScores, {
                    AppId = "PlacementScores",
                    Size = UDim2.fromScale(1, 0),
                    showMaxScore = p5.showMaxScore
                }) })
        })
    });
end);

return {
    PlacementHud = v4.connect(function(p8, p9) -- Line: 38
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        return v10;
    end)(v7)
};