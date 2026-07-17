-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    LabelledText = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;
        local _ = p3.useEffect;
        local v4 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            LayoutOrder = p2.LayoutOrder
        };
        local FrameProps = p2.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v4[i] = v;
            end;
        end;

        local v5 = {};
        local v6 = #v5;
        local v7 = {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            Padding = p2.Padding or UDim.new(0, 0),
            HorizontalAlignment = p2.HorizontalAlignment or "Center",
            SortOrder = Enum.SortOrder.LayoutOrder
        };
        local ListLayoutProps = p2.ListLayoutProps;

        if ListLayoutProps then
            for i, v in ListLayoutProps do
                v7[i] = v;
            end;
        end;

        v5[v6 + 1] = u1.createElement("UIListLayout", v7);
        local v8 = {
            Text = p2.Text
        };
        local TextScale = p2.TextScale;
        v8.Size = UDim2.fromScale(0, TextScale == nil and 1 or TextScale);
        v8.TextColor3 = Color3.fromRGB(255, 255, 255);
        v8.TextXAlignment = Enum.TextXAlignment.Center;
        v8.TextScaled = true;
        v8.AutomaticSize = Enum.AutomaticSize.X;
        v8.BorderSizePixel = 0;
        v8.BackgroundTransparency = 1;
        v8.RichText = true;
        v8.Font = Enum.Font.Roboto;
        v8.LayoutOrder = 1;
        v8.TextTransparency = p2.Transparency;
        local TextProps = p2.TextProps;

        if TextProps then
            for i, v in TextProps do
                v8[i] = v;
            end;
        end;

        v5[v6 + 2] = u1.createElement("TextLabel", v8);
        local v9 = {};
        local ImageScale = p2.ImageScale;
        v9.Size = UDim2.fromScale(1, ImageScale == nil and 1 or ImageScale);
        v9.Position = UDim2.fromScale(0.5, 0.5);
        v9.AnchorPoint = Vector2.new(0.5, 0.5);
        v9.Image = p2.Image;
        v9.BackgroundTransparency = 1;
        v9.BorderSizePixel = 0;
        v9.ScaleType = Enum.ScaleType.Fit;
        v9.LayoutOrder = p2.ImageLeft and 0 or 2;
        v9.ImageTransparency = p2.Transparency;
        local ImageProps = p2.ImageProps;

        if ImageProps then
            for i, v in ImageProps do
                v9[i] = v;
            end;
        end;

        v5[v6 + 3] = u1.createElement("ImageLabel", v9, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });

        return u1.createElement("Frame", v4, v5);
    end)
};