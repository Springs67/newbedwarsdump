-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local TimedProgressBar = v1.TimedProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SquadLauncherUI = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: u2 (copy), Empty (copy), Button (copy), Theme (copy), RuntimeLib (copy), KnitClient (copy), Players (copy), TimedProgressBar (copy), Countdown (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        return u2.createElement(Empty, {
            Size = u4.Size or UDim2.fromScale(1, 0.075)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            ExitButton = u2.createElement(Button, {
                Text = "<b>EXIT</b>",
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.125, 1),
                BackgroundColor3 = Theme.backgroundSuccess,
                OnClick = RuntimeLib.async(function() -- Line: 29
                    -- upvalues: KnitClient (ref), Players (ref), u4 (copy)
                    KnitClient.Controllers.SquadLauncherController:exitLauncher(Players.LocalPlayer, u4.SquadLauncher);
                end)
            }),
            u2.createElement(TimedProgressBar, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.6, 1),
                StartTime = u4.StartTime,
                EndTime = u4.EndTime,
                ProgressBarConfig = {
                    Flip = true,
                    GradientRotation = 180,
                    BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                }
            }),
            u2.createElement(Countdown, {
                EndTime = u4.EndTime,
                TextLabel = {
                    LayoutOrder = 3,
                    RichText = false,
                    Size = UDim2.fromScale(0.15, 1)
                },
                CountdownConfig = {
                    minutes = false,
                    hours = false,
                    days = false
                }
            }, { u2.createElement("UIStroke") })
        });
    end)
};