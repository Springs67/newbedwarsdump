-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local GlobalStats = RuntimeLib.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "global-stats").GlobalStats;
local QueueStatsSection = RuntimeLib.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "queue-stats-section").QueueStatsSection;
local RankStats = RuntimeLib.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "rank-stats").RankStats;
local CurrentlyEquipped = RuntimeLib.import(script, script.Parent, "currently-equipped").CurrentlyEquipped;
local FavoriteKits = RuntimeLib.import(script, script.Parent, "favorite-kits").FavoriteKits;

return {
    PlayerProfileStats = v3.new(u2)(function(p4, p5) -- Line: 16
        -- upvalues: RankUtil (copy), Theme (copy), u2 (copy), DeviceUtil (copy), RankStats (copy), Players (copy), GlobalStats (copy), QueueStatsSection (copy), AutoCanvasScrollingFrame (copy), FavoriteKits (copy), CurrentlyEquipped (copy)
        local _ = p5.useState;
        local v6 = p4.ProfileData.rankStats.matchesPlayed >= RankUtil.NUM_PROVISIONAL_MATCHES;
        local v7 = next(p4.ProfileData.favoriteKitData) == nil and 0 or 0.27;
        local v8 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        local v9 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v10 = #v9;
        local v11 = {
            ScrollingFrameProps = {
                LayoutOrder = 0,
                Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 1 or 0.6, 1),
                Position = UDim2.fromScale(0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y
            }
        };
        local v12 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 20)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }) };
        local v13 = #v12;

        if v6 then
            v6 = u2.createElement(RankStats, {
                store = p4.store,
                RankStats = p4.ProfileData.rankStats,
                OtherPlayerViewing = p4.ProfileData.userId ~= Players.LocalPlayer.UserId
            });
        end;

        if v6 then
            v12[v13 + 1] = v6;
        end;

        local v14 = #v12;
        v12[v14 + 1] = u2.createElement(GlobalStats, {
            store = p4.store,
            GlobalStats = p4.ProfileData.globalStats,
            Queues = p4.ProfileData.queues,
            Honor = p4.ProfileData.honor
        });
        v12[v14 + 2] = u2.createElement(QueueStatsSection, {
            store = p4.store,
            Queues = p4.ProfileData.queues
        });
        v9.Stats = u2.createElement(AutoCanvasScrollingFrame, v11, v12);
        local v15 = not DeviceUtil.isSmallScreen();

        if v15 then
            local v16 = {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.4, 1)
            };
            local v17 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 10)
                }) };
            local v18 = #v17;
            local v19 = next(p4.ProfileData.favoriteKitData) ~= nil and u2.createElement(FavoriteKits, {
                ProfileData = p4.ProfileData,
                Size = UDim2.fromScale(1, v7)
            });

            if v19 then
                v17[v18 + 1] = v19;
            end;

            v17[#v17 + 1] = u2.createElement(CurrentlyEquipped, {
                ProfileData = p4.ProfileData,
                Size = UDim2.fromScale(1, next(p4.ProfileData.favoriteKitData) == nil and 1 or 1 - v7 - 0.01)
            });
            v15 = u2.createFragment({
                PlayerProfileRight = u2.createElement("Frame", v16, v17)
            });
        end;

        if v15 then
            v9[v10 + 1] = v15;
        end;

        return u2.createElement("Frame", v8, v9);
    end)
};