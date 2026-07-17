-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local milestonesLayout = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "milestones", "ui", "milestones-config").milestonesLayout;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v55 = v4.new(u3)(function(u6, p7) -- Line: 13
    -- upvalues: u2 (copy), milestonesLayout (copy), u3 (copy), Theme (copy), ColorUtil (copy), Empty (copy), BedwarsImageId (copy)
    local _ = p7.useState;
    local v8 = u2.values(u6.Milestones);
    table.sort(v8, function(p9, p10) -- Line: 16
        return p9.numRequired < p10.numRequired;
    end);

    local function v50(p11, p12) -- Line: 20
        -- upvalues: u6 (copy), milestonesLayout (ref), u3 (ref), Theme (ref), ColorUtil (ref), Empty (ref), BedwarsImageId (ref)
        local u13 = u6.Progress >= p11.numRequired;
        local _ = p11.claimable == nil;
        local claimable = p11.claimable;

        if claimable ~= nil then
            claimable = claimable.isClaimed;
        end;

        local u14 = #p11.rewards;
        UDim2.fromScale(0.4, 0.4);
        UDim2.fromScale(0.05, 0.05);

        if u14 == 1 then
            UDim2.fromScale(1, 1);
            UDim2.fromScale(0, 0);
        elseif u14 == 2 then
            UDim2.fromScale(0.45, 1);
            UDim2.fromScale(0.05, 0);
        elseif u14 > 2 then
            UDim2.fromScale(0.45, 0.45);
            UDim2.fromScale(0.05, 0.05);
        end;

        local v15 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, u14 * milestonesLayout.distanceX, 1, 0),
            LayoutOrder = p12
        };
        local v16 = { u3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v17 = #v16;
        local v18 = {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.95),
            BackgroundTransparency = u13 and 0 or 0.5,
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v19 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }) };
        local _ = #v19;
        local v20 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.2),
            BackgroundColor3 = p11.milestoneColor or Color3.fromRGB(181, 255, 161)
        };
        local v21 = { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v22 = {
            Size = UDim2.fromScale(1, 1)
        };
        local requiredText = p11.requiredText;

        if requiredText ~= nil then
            requiredText = requiredText.preText;
        end;

        local requiredText2 = p11.requiredText;

        if requiredText2 ~= nil then
            requiredText2 = requiredText2.postText;
        end;

        v22.Text = "<b>" .. (requiredText == nil and "" or requiredText) .. tostring(p11.numRequired) .. (requiredText2 == nil and "" or requiredText2) .. "</b>";
        v22.TextColor3 = ColorUtil.WHITE;
        v22.TextSize = 25;
        v22.RichText = true;
        v22.Font = Enum.Font.Roboto;
        v22.BackgroundTransparency = 1;
        v22.TextTransparency = 0;
        v22.TextXAlignment = Enum.TextXAlignment.Center;
        v22.LayoutOrder = 0;
        v21[#v21 + 1] = u3.createElement("TextLabel", v22);
        v19.MilestoneRequirementHeader = u3.createElement("Frame", v20, v21);
        local v23 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.9, 0.7)
        };
        local v24 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local _ = #v24;
        local rewards = p11.rewards;

        local function v33(p25) -- Line: 135
            -- upvalues: u6 (ref), u3 (ref), Empty (ref), u14 (copy), ColorUtil (ref)
            local v26 = u6.Rewards[p25];
            local v27;

            if v26 == nil then
                v27 = v26;
            else
                v27 = v26.display;

                if v27 ~= nil then
                    v27 = v27.image;
                end;
            end;

            local v28;

            if v27 == "" or not v27 then
                local display = v26.display;

                if display ~= nil then
                    display = display.text;
                end;

                if display == "" or not display then
                    v28 = u3.createFragment();
                else
                    local v29 = {
                        LayoutOrder = 2,
                        Position = UDim2.fromScale(0.5, 0.35),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1 / u14, 1)
                    };
                    local v30 = {};
                    local v31 = {
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.9, 0.5)
                    };
                    local display2 = v26.display;

                    if display2 ~= nil then
                        display2 = display2.text;
                    end;

                    v31.Text = display2;
                    v31.Font = Enum.Font.LuckiestGuy;
                    v31.TextScaled = true;
                    v31.RichText = true;
                    v31.TextColor3 = ColorUtil.WHITE;
                    v31.TextXAlignment = "Center";
                    v31.TextYAlignment = "Center";
                    v31.BackgroundTransparency = 1;
                    v30[#v30 + 1] = u3.createElement("TextLabel", v31);
                    v28 = u3.createFragment({
                        RewardTextDisplay = u3.createElement(Empty, v29, v30)
                    });
                end;
            else
                v28 = u3.createFragment({
                    RewardImage = u3.createElement(Empty, {
                        LayoutOrder = 2,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1 / u14, 0.9)
                    }, { u3.createElement("ImageLabel", {
                            ImageTransparency = 0,
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.9),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = v26.display.image,
                            ScaleType = Enum.ScaleType.Fit
                        }) })
                });
            end;

            local v32 = {
                [#v32 + 1] = v28
            };

            return u3.createFragment(v32);
        end;

        local v34 = table.create(#rewards);

        for i, v in rewards do
            v34[i] = v33(v, i - 1, rewards);
        end;

        local v35 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.75)
        };
        local v36 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 16)
            }) };
        local v37 = #v36;

        for i, v in v34 do
            v36[v37 + i] = v;
        end;

        v24.ImageList = u3.createElement(Empty, v35, v36);
        local v38 = not (claimable and u13);

        if v38 then
            local rewards2 = p11.rewards;

            local function v46(p39) -- Line: 238
                -- upvalues: u6 (ref), Theme (ref), u13 (copy), u3 (ref), u14 (copy), ColorUtil (ref)
                local v40 = u6.Rewards[p39];
                local display = v40.display;

                if display ~= nil then
                    display = display.rewardTypeText;
                end;

                local v41 = display ~= nil;

                if v41 then
                    local v42 = {
                        AutomaticSize = "Y",
                        Size = UDim2.fromScale(1, 0)
                    };
                    local display2 = v40.display;

                    if display2 ~= nil then
                        display2 = string.upper(display2.rewardTypeText);
                    end;

                    v42.Text = "<b>" .. display2 .. "</b>";
                    v42.TextColor3 = Theme.textPrimary;
                    v42.TextSize = 15;
                    v42.RichText = true;
                    v42.Font = Enum.Font.Roboto;
                    v42.BackgroundTransparency = 1;
                    v42.TextTransparency = u13 and 0 or 0.5;
                    v42.TextXAlignment = Enum.TextXAlignment.Center;
                    v42.TextYAlignment = Enum.TextYAlignment.Center;
                    v42.LayoutOrder = 0;
                    v41 = u3.createElement("TextLabel", v42);
                end;

                local v43 = {
                    BorderSizePixel = 0,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1 / u14, 1),
                    BackgroundTransparency = u13 and 0.55 or 0.75,
                    BackgroundColor3 = ColorUtil.BLACK
                };
                local v44 = { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.1, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }) };
                local v45 = #v44;

                if v41 then
                    v44[v45 + 1] = v41;
                end;

                v44[#v44 + 1] = u3.createElement("TextLabel", {
                    TextSize = 24,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.35),
                    Text = "<b>" .. v40.name .. "</b>",
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Roboto,
                    TextTransparency = u13 and 0 or 0.5,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                });

                return u3.createFragment({
                    RewardInfoCard = u3.createElement("Frame", v43, v44)
                });
            end;

            v38 = table.create(#rewards2);

            for i, v in rewards2 do
                v38[i] = v46(v, i - 1, rewards2);
            end;
        end;

        local v47 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.25)
        };
        local v48 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 16)
            }) };
        local v49 = #v48;

        if v38 then
            for i, v in v38 do
                v48[v49 + i] = v;
            end;
        end;

        v24.RewardLabel = u3.createElement(Empty, v47, v48);
        v19.RewardContet = u3.createElement(Empty, v23, v24);
        v16[v17 + 1] = u3.createElement("Frame", v18, v19);
        v16[v17 + 2] = u3.createElement("ImageLabel", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.125, 0.025),
            AutomaticSize = Enum.AutomaticSize.Y,
            Image = BedwarsImageId.TRIANGLE_DOWN,
            ImageColor3 = Theme.backgroundPrimary,
            ImageTransparency = u13 and 0 or 0.5,
            ScaleType = Enum.ScaleType.Stretch
        });

        return u3.createFragment({
            MilestonesReward = u3.createElement("Frame", v15, v16)
        });
    end;

    local v51 = table.create(#v8);

    for i, v in v8 do
        v51[i] = v50(v, i - 1, v8);
    end;

    local v52 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = u6.Size or UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = ColorUtil.WHITE
    };
    local v53 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 30)
        }) };
    local v54 = #v53;

    for i, v in v51 do
        v53[v54 + i] = v;
    end;

    return u3.createFragment({
        MilestonesRewardsContainer = u3.createElement("Frame", v52, v53)
    });
end);

return {
    EggHuntMilestoneRewardsList = v5.connect(function(p56, p57) -- Line: 384
        local v58 = {};

        for i, v in p57 do
            v58[i] = v;
        end;

        return v58;
    end)(v55)
};