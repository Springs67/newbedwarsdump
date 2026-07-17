-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local NumberCounter = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter;

return {
    PillCounter = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), TooltipContainer (copy), AutoSizedText (copy), Empty (copy), ColorUtil (copy), NumberCounter (copy)
        local _ = p5.useState;
        local MaxAmount = p4.MaxAmount;
        local v6;

        if MaxAmount == 0 or (MaxAmount ~= MaxAmount or not MaxAmount) then
            v6 = p4.Amount;
        else
            v6 = math.min(p4.Amount, p4.MaxAmount);
        end;

        local v7 = {
            BorderSizePixel = 0,
            Size = UDim2.new(0, 100, 0, 25),
            BackgroundColor3 = Color3.fromHex("#39385A")
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v7[i] = v;
            end;
        end;

        local v8 = { u2.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromHex("#5D5F92")
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }) };
        local v9 = {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1.3, 1.3),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0.1, 0.5),
            Image = p4.Icon
        };
        local v10 = {};
        local v11 = #v10;
        local v12;

        if p4.Tooltip == nil then
            v12 = false;
        else
            v12 = u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = p4.Tooltip,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) });
        end;

        if v12 then
            v10[v11 + 1] = v12;
        end;

        v8[#v8 + 1] = u2.createElement("ImageLabel", v9, v10);
        local createElement = u2.createElement;
        local v13 = {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.fromScale(0.8, 1)
        };
        local v14 = {};
        local v15 = u2.createElement("UIPadding", {
            PaddingRight = UDim.new(0.15, 0),
            PaddingTop = UDim.new(0.065, 0),
            PaddingBottom = UDim.new(0.065, 0)
        });
        local v16;

        if p4.DisableCountAnimation then
            v16 = u2.createFragment({
                Count = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Right",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Text = tostring(v6) .. (p4.MaxAmount == nil and "" or "/" .. tostring(p4.MaxAmount)),
                    TextColor3 = ColorUtil.WHITE
                })
            });
        else
            v16 = u2.createFragment({
                Count = u2.createElement(NumberCounter, {
                    Value = v6,
                    TextLabelProps = {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(1, 0),
                        Position = UDim2.fromScale(1, 0),
                        Size = UDim2.fromScale(1, 1),
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }
                })
            });
        end;

        v14[1], v14[2] = v15, v16;
        v8.ScoreContainer = createElement(Empty, v13, v14);

        return u2.createFragment({
            ScorePill = u2.createElement("Frame", v7, v8)
        });
    end)
};