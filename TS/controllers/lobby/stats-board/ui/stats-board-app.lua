-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AutoCanvasScrollingFrame = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local StatsBoardHeader = RuntimeLib.import(script, script.Parent, "board-header").StatsBoardHeader;
local GlobalStats = RuntimeLib.import(script, script.Parent, "global-stats").GlobalStats;
local LevelStats = RuntimeLib.import(script, script.Parent, "level-stats").LevelStats;
local QueueStatsSection = RuntimeLib.import(script, script.Parent, "queue-stats-section").QueueStatsSection;
local RankStats = RuntimeLib.import(script, script.Parent, "rank-stats").RankStats;
local u6 = v2.new(u1)(function(p3, p4) -- Line: 12
    -- upvalues: u1 (copy), Theme (copy), StatsBoardHeader (copy), AutoCanvasScrollingFrame (copy), LevelStats (copy), RankStats (copy), GlobalStats (copy), QueueStatsSection (copy)
    local _ = p4.useState;
    local v5 = UDim2.fromScale(1, 0.125);

    return u1.createElement("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    }, { u1.createElement(StatsBoardHeader, {
            Size = v5
        }), u1.createElement(AutoCanvasScrollingFrame, {
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 1 - v5.Y.Scale),
                Position = UDim2.fromScale(0, v5.Y.Scale)
            }
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 20)
            }),
            u1.createElement("UIPadding", {
                PaddingTop = UDim.new(0.01, 0),
                PaddingBottom = UDim.new(0.03, 0),
                PaddingLeft = UDim.new(0.075, 0),
                PaddingRight = UDim.new(0.075, 0)
            }),
            u1.createElement(LevelStats, {
                AppId = "LevelStats"
            }),
            u1.createElement(RankStats, {
                store = p3.store
            }),
            u1.createElement(GlobalStats, {
                store = p3.store
            }),
            u1.createElement(QueueStatsSection, {
                store = p3.store
            })
        }) });
end);

return {
    StatsBoardUIWrapper = function(p7) -- Line: 58, Name: StatsBoardUIWrapper
        -- upvalues: u1 (copy), u6 (copy)
        local v8 = {
            LightInfluence = 0.25,
            Face = Enum.NormalId.Front,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        };
        local v9 = {};
        local v10 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -30, 1, -30)
        };
        local v11 = {};
        local v12 = {};

        for i, v in p7 do
            v12[i] = v;
        end;

        v11[#v11 + 1] = u1.createElement(u6, v12);
        v9[#v9 + 1] = u1.createElement("Frame", v10, v11);

        return u1.createElement("SurfaceGui", v8, v9);
    end,

    StatsBoard = u6
};