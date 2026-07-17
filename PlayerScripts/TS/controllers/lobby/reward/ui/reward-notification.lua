-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RewardNotificationTile = RuntimeLib.import(script, script.Parent, "reward-notification-tile").RewardNotificationTile;
local v19 = v3.new(u2)(function(p5, p6) -- Line: 10
    -- upvalues: u2 (copy), ColorUtil (copy), RewardNotificationTile (copy), Empty (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;
    local v7 = {
        DisplayOrder = 10,
        ResetOnSpawn = false
    };
    local v8 = {};
    local RewardsToDisplay = p5.RewardsToDisplay;

    if RewardsToDisplay ~= nil then
        RewardsToDisplay = #RewardsToDisplay == 0;
    end;

    local v9 = not RewardsToDisplay and u2.createFragment({
        NewRewardsText = u2.createElement("TextLabel", {
            Text = "New Rewards!",
            TextSize = 14,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            ZIndex = 1,
            Size = UDim2.fromOffset(200, 25),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE
        }, {
            u2.createElement("UIStroke", {
                Thickness = 1,
                Transparency = 0.6,
                Color = Color3.fromRGB(0, 0, 0)
            }),
            NewRewardsTextBackground = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u2.createElement("UIGradient", {
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) }),
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.WHITE), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.93, 0)), ColorSequenceKeypoint.new(1, ColorUtil.WHITE) })
                }) })
        })
    });
    local v10 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.8)
    };
    local v11 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v12 = #v11;

    if v9 then
        v11[v12 + 1] = v9;
    end;

    local _ = #v11;
    local RewardsToDisplay2 = p5.RewardsToDisplay;
    local v13;

    if RewardsToDisplay2 == nil then
        v13 = RewardsToDisplay2;
    else
        local function _(p14, p15) -- Line: 75
            -- upvalues: u2 (ref), RewardNotificationTile (ref)
            return u2.createElement(RewardNotificationTile, {
                Reward = p14,
                Index = p15
            });
        end;

        v13 = table.create(#RewardsToDisplay2);

        for i, v in RewardsToDisplay2 do
            v13[i] = u2.createElement(RewardNotificationTile, {
                Reward = v,
                Index = i - 1
            });
        end;
    end;

    local v16 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y
    };
    local v17 = { u2.createElement("UIGridLayout", {
            FillDirectionMaxCells = 6,
            FillDirection = Enum.FillDirection.Horizontal,
            CellSize = UDim2.new(0, 60, 0, 60),
            CellPadding = UDim2.new(0, 8, 0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v18 = #v17;

    for i, v in v13 do
        v17[v18 + i] = v;
    end;

    v11.RewardNotificationGrid = u2.createElement(Empty, v16, v17);
    v8[#v8 + 1] = u2.createElement("Frame", v10, v11);

    return u2.createFragment({
        RewardNotification = u2.createElement("ScreenGui", v7, v8)
    });
end);

return {
    RewardNotification = v4.connect(function(p20, p21) -- Line: 116
        local v22 = {};

        for i, v in p21 do
            v22[i] = v;
        end;

        v22.RewardsToDisplay = p20.Lobby.rewardsToDisplay;

        return v22;
    end)(v19)
};