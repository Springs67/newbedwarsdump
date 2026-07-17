-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ScaleComponent = v1.ScaleComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    Badge = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: u2 (copy), ScaleComponent (copy), ColorUtil (copy)
        local _ = p4.useState;
        local v5 = p3.Size or UDim2.new(0, 16, 0, 16);
        local v6 = {
            BorderSizePixel = 0,
            ZIndex = 4,
            Size = v5,
            AnchorPoint = Vector2.new(0.4, 0.4),
            BackgroundColor3 = p3.BackgroundColor or Color3.fromRGB(237, 56, 79),
            AutomaticSize = Enum.AutomaticSize.XY
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = {};
        local v8 = #v7;
        local v9;

        if v5.X.Offset > 0 and v5.Y.Offset > 0 then
            v9 = u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(v5.X.Offset * 1.5, v5.Y.Offset * 1.5)
            });
        else
            v9 = false;
        end;

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local v10 = #v7;
        v7[v10 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        });
        v7[v10 + 2] = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        });
        local v11 = {};
        local Text = p3.Text;
        v11.Text = Text == nil and "NEW" or Text;
        v11.Size = UDim2.fromScale(0.85, 0.85);
        v11.Position = UDim2.fromScale(0.48, 0.48);
        v11.AnchorPoint = Vector2.new(0.5, 0.5);
        v11.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold);
        v11.TextStrokeTransparency = 1;
        v11.TextScaled = true;
        v11.TextXAlignment = Enum.TextXAlignment.Center;
        v11.TextYAlignment = Enum.TextYAlignment.Center;
        v11.TextColor3 = ColorUtil.WHITE;
        v11.ZIndex = 4;
        v11.BackgroundTransparency = 1;
        local TextLabelProps = p3.TextLabelProps;

        if TextLabelProps then
            for i, v in TextLabelProps do
                v11[i] = v;
            end;
        end;

        v7[v10 + 3] = u2.createElement("TextLabel", v11);

        return u2.createElement("Frame", v6, v7);
    end)
};