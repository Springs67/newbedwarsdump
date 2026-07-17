-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GlobalTeamEventTimedGoalsRiddleCard = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: DeviceUtil (copy), KnitClient (copy), Theme (copy), u2 (copy), StringUtil (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(DeviceUtil.isHoarceKat() and "I have keys but no locks, I have space but no room.\n You can enter, but not go outside—what am I" or "");
        local u8 = nil;
        local u9 = nil;
        useEffect(function() -- Line: 15
            -- upvalues: u8 (ref), u9 (ref), DeviceUtil (ref), KnitClient (ref), u7 (copy)
            local v10 = u8();

            if not v10 then
                v10 = u9();

                if v10 ~= nil then
                    v10 = v10.riddleReward;

                    if v10 ~= nil then
                        v10 = v10.riddle;
                    end;
                end;
            end;

            if v10 ~= nil and not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.RiddleController:getRiddle(v10):andThen(function(p11) -- Line: 31
                    -- upvalues: u7 (ref)
                    u7(table.concat(p11, "\n"));
                end);
            end;
        end, { u4.CurrentTimedGoalData });
        local u12 = nil;

        u8 = function() -- Line: 38
            -- upvalues: u12 (ref)
            local v13 = u12();

            if v13 ~= nil then
                v13 = v13.riddleReward;

                if v13 ~= nil then
                    v13 = v13.riddle;
                end;
            end;

            return v13;
        end;

        u12 = function() -- Line: 48
            -- upvalues: u4 (copy)
            local CurrentTimedGoalData = u4.CurrentTimedGoalData;

            if CurrentTimedGoalData ~= nil then
                CurrentTimedGoalData = CurrentTimedGoalData.score;
            end;

            local u14 = CurrentTimedGoalData == nil and 0 or CurrentTimedGoalData;
            local CurrentTimedGoalData2 = u4.CurrentTimedGoalData;

            if CurrentTimedGoalData2 ~= nil then
                local function _(p15) -- Line: 61
                    -- upvalues: u14 (copy)
                    local v16;

                    if p15.riddleReward == nil then
                        v16 = false;
                    else
                        v16 = u14 < p15.globalTeamScoreRequired;
                    end;

                    return v16;
                end;

                local v17 = 0;
                local v18 = {};

                for i, v in CurrentTimedGoalData2.timedGoal.rewards do
                    local _ = i - 1;
                    local v19;

                    if v.riddleReward == nil then
                        v19 = false;
                    else
                        v19 = u14 < v.globalTeamScoreRequired;
                    end;

                    if v19 == true then
                        v17 = v17 + 1;
                        v18[v17] = v;
                    end;
                end;

                table.sort(v18, function(p20, p21) -- Line: 74
                    return p20.globalTeamScoreRequired < p21.globalTeamScoreRequired;
                end);
                CurrentTimedGoalData2 = v18[1];
            end;

            return CurrentTimedGoalData2;
        end;

        u9 = function() -- Line: 82
            -- upvalues: u4 (copy)
            local CurrentTimedGoalData = u4.CurrentTimedGoalData;

            if CurrentTimedGoalData ~= nil then
                local function _(p22) -- Line: 86
                    return p22.riddleReward ~= nil;
                end;

                local v23 = 0;
                local v24 = {};

                for i, v in CurrentTimedGoalData.timedGoal.rewards do
                    local _ = i - 1;

                    if v.riddleReward ~= nil == true then
                        v23 = v23 + 1;
                        v24[v23] = v;
                    end;
                end;

                table.sort(v24, function(p25, p26) -- Line: 99
                    return p25.globalTeamScoreRequired > p26.globalTeamScoreRequired;
                end);
                CurrentTimedGoalData = v24[1];
            end;

            return CurrentTimedGoalData;
        end;

        local v27 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.35),
            Position = UDim2.fromScale(0.025, 0.05),
            AnchorPoint = Vector2.new(0, 0),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v27[i] = v;
            end;
        end;

        local v28 = {
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.075, 0),
                PaddingBottom = UDim.new(0.075, 0)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.025, 0)
            }),
            Title = u2.createElement("TextLabel", {
                Text = "Riddle",
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.2),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        };
        local v29 = #v28;
        local v30 = {
            Size = UDim2.fromScale(1, 0.125)
        };
        local v31 = u12();

        if v31 ~= nil then
            v31 = v31.globalTeamScoreRequired;
        end;

        v30.Text = "Next reveal at <b>" .. StringUtil.formatNumberWithCommas(v31 == nil and 0 or v31) .. "</b>";
        v30.TextColor3 = Color3.fromRGB(255, 255, 255);
        v30.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular);
        v30.TextXAlignment = Enum.TextXAlignment.Left;
        v30.TextYAlignment = Enum.TextYAlignment.Center;
        v30.RichText = true;
        v30.TextScaled = true;
        v30.TextTransparency = 0.3;
        v30.BackgroundTransparency = 1;
        v30.LayoutOrder = 2;
        v28.NextReveal = u2.createElement("TextLabel", v30);
        local v32 = u4.CurrentTimedGoalData and u2.createFragment({
            TimedGoalTrackScore = u2.createElement("TextLabel", {
                LineHeight = 1.5,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 0.6),
                Text = v6,
                TextColor3 = Color3.fromRGB(255, 235, 77),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });

        if v32 then
            v28[v29 + 1] = v32;
        end;

        return u2.createFragment({
            TimedGoalsRiddleCard = u2.createElement("Frame", v27, v28)
        });
    end)
};