-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local milestonesLayout = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "milestones", "ui", "milestones-config").milestonesLayout;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EggHuntMilestoneProgress = v4.new(u3)(function(u5, p6) -- Line: 12
        -- upvalues: u2 (copy), milestonesLayout (copy), u3 (copy), Theme (copy), ProgressBar (copy), BedwarsImageId (copy), ColorUtil (copy)
        local _ = p6.useState;
        local u7 = u2.values(u5.Milestones);
        table.sort(u7, function(p8, p9) -- Line: 15
            return p8.numRequired < p9.numRequired;
        end);

        local function _(p10, p11, p12) -- Line: 20
            -- upvalues: u7 (copy)
            return p12 >= 1 and p10 < u7[p12 - 1 + 1].numRequired and 0 or (p11 <= p10 and 1 or math.max(0, p10 / p11));
        end;

        local function v27(p13, p14) -- Line: 29
            -- upvalues: u7 (copy), u5 (copy), milestonesLayout (ref), u3 (ref), Theme (ref), ProgressBar (ref), BedwarsImageId (ref), ColorUtil (ref)
            local v15 = #p13.rewards;
            local v16 = u5.Progress >= p13.numRequired;
            local v17;

            if p14 == 0 then
                v17 = milestonesLayout.distanceX / 2;
            else
                v17 = milestonesLayout.distanceX + 30;
            end;

            if v15 > 1 then
                local v18 = v17 - 30;
                local v19 = v15 % 2;

                if v19 == 0 or (v19 ~= v19 or not v19) then
                    v17 = v18 + milestonesLayout.distanceX / 2 + 30;
                else
                    v17 = v18 * (v15 - 1);
                end;
            end;

            if (p14 > 0 and #u7[p14 - 1 + 1].rewards or 0) > 1 then
                v17 = v17 + milestonesLayout.distanceX / 2;
            end;

            local createFragment = u3.createFragment;
            local v20 = {};
            local createElement = u3.createElement;
            local v21 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(0, v17, 1, 0),
                BackgroundColor3 = Theme.backgroundPrimary,
                LayoutOrder = p14
            };
            local v22 = {};
            local createElement2 = u3.createElement;
            local v23 = {
                AcceptZero = true,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5)
            };
            local Progress = u5.Progress;
            local numRequired = p13.numRequired;
            v23.Progress = p14 >= 1 and Progress < u7[p14 - 1 + 1].numRequired and 0 or (numRequired <= Progress and 1 or math.max(0, Progress / numRequired));
            v23.BarColor = milestonesLayout.progressBarColor;
            v23.BarBackgroundColor = milestonesLayout.progressBarBackgroundColor;
            local v24 = createElement2(ProgressBar, v23, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }) });
            local createElement3 = u3.createElement;
            local v25 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ZIndex = 10,
                Size = UDim2.fromScale(1, v16 and 0.9 or 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                Image = BedwarsImageId.CIRCLE_SOLID
            };
            local v26;

            if v16 then
                v26 = ColorUtil.WHITE;
            else
                v26 = ColorUtil.hexColor(4079463);
            end;

            v25.ImageColor3 = v26;
            v25.ScaleType = Enum.ScaleType.Fit;
            v22[1], v22[2], v22[3] = v24, createElement3("ImageLabel", v25), u3.createElement("ImageLabel", {
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ZIndex = 11,
    Size = UDim2.fromScale(1, 1),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(1, 0.5),
    Image = BedwarsImageId.CIRCLE_CHECK_SOLID,
    ImageColor3 = milestonesLayout.progressBarColor,
    ImageTransparency = v16 and 0 or 1,
    ScaleType = Enum.ScaleType.Fit
});
            v20.MilestonesProgressBar = createElement("Frame", v21, v22);

            return createFragment(v20);
        end;

        local v28 = table.create(#u7);

        for i, v in u7 do
            v28[i] = v27(v, i - 1, u7);
        end;

        local v29 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = u5.Size,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = ColorUtil.BLACK,
            LayoutOrder = u5.LayoutOrder
        };
        local v30 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v31 = #v30;

        for i, v in v28 do
            v30[v31 + i] = v;
        end;

        return u3.createFragment({
            MilestonesProgress = u3.createElement("Frame", v29, v30)
        });
    end)
};