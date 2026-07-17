-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local NumberCounter = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GlobalTeamEventGoalsOverview = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: Theme (copy), u2 (copy), Countdown (copy), Empty (copy), NumberCounter (copy)
        local _ = p5.useState;
        local v6 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.35),
            Position = UDim2.fromScale(0.025, 0.05),
            AnchorPoint = Vector2.new(0, 0),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.075, 0),
                PaddingBottom = UDim.new(0.075, 0)
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.025, 0)
            }) };
        local v8 = #v7;
        local v9 = {
            Size = UDim2.fromScale(1, 0.2)
        };
        local CurrentTimedGoalData = p4.CurrentTimedGoalData;

        if CurrentTimedGoalData ~= nil then
            CurrentTimedGoalData = CurrentTimedGoalData.timedGoal.name;
        end;

        v9.Text = CurrentTimedGoalData;
        v9.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v9.TextColor3 = Color3.fromRGB(255, 255, 255);
        v9.TextXAlignment = Enum.TextXAlignment.Left;
        v9.TextYAlignment = Enum.TextYAlignment.Center;
        v9.TextScaled = true;
        v9.BackgroundTransparency = 1;
        v9.LayoutOrder = 1;
        v7.TimeGoalTrackName = u2.createElement("TextLabel", v9);
        local v10 = {
            Size = UDim2.fromScale(1, 0.1)
        };
        local CurrentTimedGoalData2 = p4.CurrentTimedGoalData;

        if CurrentTimedGoalData2 ~= nil then
            CurrentTimedGoalData2 = CurrentTimedGoalData2.timedGoal.startTime;
        end;

        local v11 = os.date("%b %d", CurrentTimedGoalData2);
        local CurrentTimedGoalData3 = p4.CurrentTimedGoalData;

        if CurrentTimedGoalData3 ~= nil then
            CurrentTimedGoalData3 = CurrentTimedGoalData3.timedGoal.endTime;
        end;

        v10.Text = v11 .. " - " .. os.date("%b %d", CurrentTimedGoalData3);
        v10.TextColor3 = Color3.fromRGB(255, 255, 255);
        v10.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
        v10.TextXAlignment = Enum.TextXAlignment.Left;
        v10.TextYAlignment = Enum.TextYAlignment.Center;
        v10.TextScaled = true;
        v10.TextTransparency = 0.3;
        v10.BackgroundTransparency = 1;
        v10.LayoutOrder = 2;
        v7.TimedGoalDates = u2.createElement("TextLabel", v10);
        local CurrentTimedGoalData4 = p4.CurrentTimedGoalData;

        if CurrentTimedGoalData4 then
            local v12 = {};
            local CurrentTimedGoalData5 = p4.CurrentTimedGoalData;

            if CurrentTimedGoalData5 ~= nil then
                CurrentTimedGoalData5 = CurrentTimedGoalData5.timedGoal.endTime;
            end;

            v12.EndTime = CurrentTimedGoalData5;
            local CurrentTimedGoalData6 = p4.CurrentTimedGoalData;

            if CurrentTimedGoalData6 ~= nil then
                CurrentTimedGoalData6 = CurrentTimedGoalData6.timedGoal.startTime;
            end;

            local v13 = CurrentTimedGoalData6 <= os.time();

            if v13 then
                local CurrentTimedGoalData7 = p4.CurrentTimedGoalData;

                if CurrentTimedGoalData7 ~= nil then
                    CurrentTimedGoalData7 = CurrentTimedGoalData7.timedGoal.endTime;
                end;

                v13 = os.time() < CurrentTimedGoalData7;
            end;

            v12.PreText = v13 and "Ends: " or "Starts: ";
            v12.TextLabel = {
                RichText = false,
                LayoutOrder = 3,
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                Size = UDim2.fromScale(1, 0.1),
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            };
            CurrentTimedGoalData4 = u2.createElement(Countdown, v12);
        end;

        if CurrentTimedGoalData4 then
            v7[v8 + 1] = CurrentTimedGoalData4;
        end;

        local v14 = #v7;
        v7[v14 + 1] = u2.createElement(Empty, {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0)
        });
        local v15 = {
            Size = UDim2.fromScale(1, 0.2)
        };
        local CurrentTimedGoalData5 = p4.CurrentTimedGoalData;

        if CurrentTimedGoalData5 ~= nil then
            CurrentTimedGoalData5 = CurrentTimedGoalData5.timedGoal.description;
        end;

        v15.Text = CurrentTimedGoalData5;
        v15.TextColor3 = Color3.fromRGB(255, 255, 255);
        v15.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v15.TextXAlignment = Enum.TextXAlignment.Left;
        v15.TextYAlignment = Enum.TextYAlignment.Center;
        v15.TextScaled = true;
        v15.BackgroundTransparency = 1;
        v15.LayoutOrder = 5;
        v7.TimedGoalDescription = u2.createElement("TextLabel", v15);
        local v16 = p4.CurrentTimedGoalData and u2.createFragment({
            Count = u2.createElement(NumberCounter, {
                Value = p4.CurrentTimedGoalData.score,
                TextLabelProps = {
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 6,
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    Size = UDim2.fromScale(1, 0.25),
                    TextColor3 = Color3.fromRGB(255, 235, 77),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            })
        });

        if v16 then
            v7[v14 + 2] = v16;
        end;

        return u2.createFragment({
            TimedGoalsOverviewCard = u2.createElement("Frame", v6, v7)
        });
    end)
};