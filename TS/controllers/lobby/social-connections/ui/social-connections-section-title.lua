-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ImageId = v1.ImageId;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SocialConnectionsSectionTitle = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), ImageId (copy), Theme (copy), ColorUtil (copy)
        local _ = p5.useState;
        local createElement = u2.createElement;
        local v6 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 24),
            LayoutOrder = p4.LayoutOrder
        };
        local v7 = {};
        local createElement2 = u2.createElement;
        local v8 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v9 = {};
        local v10 = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        });
        local createElement3 = u2.createElement;
        local v11 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v12;

        if p4.Completed then
            v12 = ImageId.CHECK_CIRCLE_SOLID;
        else
            v12 = ImageId.CIRCLE_HOLLOW;
        end;

        v11.Image = v12;
        local v13;

        if p4.Completed then
            v13 = Theme.backgroundSuccess;
        else
            v13 = ColorUtil.WHITE;
        end;

        v11.ImageColor3 = v13;
        v11.ImageTransparency = p4.Completed and 0 or 0.4;
        v9[1], v9[2], v9[3] = v10, createElement3("ImageLabel", v11), u2.createElement("TextLabel", {
    RichText = true,
    TextSize = 16,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    Text = p4.Title,
    TextColor3 = ColorUtil.WHITE,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.Roboto
});
        v7[1], v7[2] = createElement2("Frame", v8, v9), u2.createElement("TextLabel", {
    RichText = true,
    TextSize = 12,
    BackgroundTransparency = 1,
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.fromScale(1, 0.5),
    AutomaticSize = Enum.AutomaticSize.XY,
    Text = p4.Completed and "" or "Incomplete",
    TextColor3 = Theme.textSecondary,
    TextXAlignment = Enum.TextXAlignment.Right,
    Font = Enum.Font.Roboto
});

        return createElement("Frame", v6, v7);
    end)
};