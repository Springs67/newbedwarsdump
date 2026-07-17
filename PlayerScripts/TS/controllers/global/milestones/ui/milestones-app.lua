-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MilestonesProgress = RuntimeLib.import(script, script.Parent, "milestones-progress").MilestonesProgress;
local MilestonesRewardsContainer = RuntimeLib.import(script, script.Parent, "milestones-rewards-container").MilestonesRewardsContainer;
local v8 = v3.new(u2)(function(u5, p6) -- Line: 16
    -- upvalues: Flamework (copy), u2 (copy), DeviceUtil (copy), DarkBackground (copy), SlideIn (copy), Theme (copy), ScaleComponent (copy), WidgetComponent (copy), MilestonesRewardsContainer (copy), MilestonesProgress (copy)
    local _ = p6.useState;

    local function u7() -- Line: 18
        -- upvalues: Flamework (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
    end;

    return u2.createElement("ScreenGui", {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    }, { u2.createElement(DarkBackground, {
            AppId = u5.AppId
        }), u2.createElement(SlideIn, {}, { u2.createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = Theme.widgetSize
            }, { u2.createElement(ScaleComponent, {
                    MaximumSize = Theme.widgetScaleComponentMaxSize,
                    ScreenPadding = Theme.widgetScaleComponentScreenPadding
                }), u2.createElement(WidgetComponent, {
                    Title = "Milestones",
                    AppId = u5.AppId,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),

                    OnClose = function() -- Line: 46, Name: OnClose
                        -- upvalues: u7 (copy)
                        return u7();
                    end
                }, { u2.createElement("ScrollingFrame", {
                        ScrollBarThickness = 6,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Selectable = false,
                        Size = UDim2.fromScale(1, 1),
                        AutomaticSize = Enum.AutomaticSize.Y,
                        AutomaticCanvasSize = Enum.AutomaticSize.XY,
                        ScrollingDirection = Enum.ScrollingDirection.X
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 10)
                        }), u2.createElement(MilestonesRewardsContainer, {
                            LayoutOrder = 1,
                            store = u5.store,
                            Size = UDim2.fromScale(1, 0.7)
                        }), u2.createElement(MilestonesProgress, {
                            LayoutOrder = 2,
                            store = u5.store,
                            Size = UDim2.fromScale(1, 0.1)
                        }) }) }) }) }) });
end);

return {
    MilestonesApp = v4.connect(function(p9, p10) -- Line: 84
        local v11 = {};

        for i, v in p10 do
            v11[i] = v;
        end;

        v11.store = p9;

        return v11;
    end)(v8)
};