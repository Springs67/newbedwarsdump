-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    PillText = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 11
        -- upvalues: u2 (copy), TooltipContainer (copy), AutoSizedText (copy), Empty (copy), Padding (copy), ColorUtil (copy)
        local _ = p4.useState;
        local v5 = {
            BorderSizePixel = 0,
            Size = UDim2.new(0, 100, 0, 25),
            BackgroundColor3 = Color3.fromHex("#39385A")
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local v6 = { u2.createElement("UIStroke", {
                Color = Color3.fromHex("#5D5F92")
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) };
        local v7 = {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Image = p3.Icon
        };
        local v8 = {};
        local v9 = #v8;
        local v10;

        if p3.Tooltip == nil then
            v10 = false;
        else
            v10 = u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = p3.Tooltip,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) });
        end;

        if v10 then
            v8[v9 + 1] = v10;
        end;

        v6[#v6 + 1] = u2.createElement("ImageLabel", v7, v8);
        v6.ScoreContainer = u2.createElement(Empty, {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromScale(0.8, 1)
        }, {
            u2.createElement(Padding, {
                Padding = {
                    Vertical = 4,
                    Horizontal = 8
                }
            }),
            Text = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Right",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                Text = p3.Text,
                TextColor3 = ColorUtil.WHITE
            })
        });

        return u2.createFragment({
            ScorePill = u2.createElement("Frame", v5, v6)
        });
    end)
};