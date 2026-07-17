-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetUIScaleAncestors = v1.GetUIScaleAncestors;
local ImageId = v1.ImageId;
local ShineEffect = v1.ShineEffect;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    BasePurchaseButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 13
        -- upvalues: u2 (copy), GetUIScaleAncestors (copy), ColorUtil (copy), DeviceUtil (copy), ShineEffect (copy), ImageId (copy), Empty (copy), Button (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(0);
        local TextPositionScaleShift = u3.TextPositionScaleShift;
        local v7, u8 = useState(TextPositionScaleShift == nil and 0 or TextPositionScaleShift);
        local u9 = u2.createRef();
        useEffect(function() -- Line: 23
            -- upvalues: u9 (copy), GetUIScaleAncestors (ref), u8 (copy)
            local v10 = u9:getValue();

            if v10 and #GetUIScaleAncestors(v10) ~= 0 then
                u8(0.05);
            end;
        end, {});
        useEffect(function() -- Line: 32
            -- upvalues: u6 (copy), u3 (copy)
            u6(u3.Price);
        end, { u3.Price });
        local v11 = {
            Selectable = true,
            AutoButtonColor = true,
            AnchorPoint = u3.AnchorPoint or Vector2.new(0, 0),
            Position = u3.Position or UDim2.fromScale(0, 0),
            Size = u3.Size or UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),

            OnClick = function() -- Line: 40, Name: OnClick
                -- upvalues: u3 (copy)
                u3.OnClick();
            end
        };
        local LayoutOrder = u3.LayoutOrder;
        v11.LayoutOrder = LayoutOrder == nil and 4 or LayoutOrder;
        v11.CornerRadius = UDim.new(0, 3);
        local ZIndex = u3.ZIndex;
        v11.ZIndex = (ZIndex == nil and 1 or ZIndex) + 1;
        local ButtonProps = u3.ButtonProps;

        if ButtonProps then
            for i, v in ButtonProps do
                v11[i] = v;
            end;
        end;

        v11.GamepadShouldAutoSelect = u3.GamepadShouldAutoSelect;
        v11[u2.Ref] = u9;
        local v12 = not u3.IgnoreAspectRatio;

        if v12 then
            local v13 = {};
            local AspectRatio = u3.AspectRatio;
            v13.AspectRatio = AspectRatio == nil and 3.1666666666666665 or AspectRatio;
            v12 = u2.createElement("UIAspectRatioConstraint", v13);
        end;

        local v14 = {};
        local v15 = #v14;

        if v12 then
            v14[v15 + 1] = v12;
        end;

        local v16 = #v14;
        v14[v16 + 1] = u2.createElement("UIGradient", {
            Rotation = 90,
            Color = u3.ButtonGradient or ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 206, 92)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 166, 76)) })
        });
        local v17 = {};
        local ButtonGradient = u3.ButtonGradient;

        if ButtonGradient ~= nil then
            ButtonGradient = ButtonGradient.Keypoints[1];
        end;

        local v18;

        if ButtonGradient then
            local ButtonGradient2 = u3.ButtonGradient;

            if ButtonGradient2 ~= nil then
                ButtonGradient2 = ButtonGradient2.Keypoints[1].Value;
            end;

            v18 = ColorUtil.brighten(ButtonGradient2, 0.2);
        else
            v18 = Color3.fromRGB(105, 242, 143);
        end;

        v17.Color = v18;
        v17.Thickness = DeviceUtil.isSmallScreen() and 1 or 2;
        v17.Transparency = 0.7;
        v14[v16 + 2] = u2.createElement("UIStroke", v17);
        local Effects = u3.Effects;

        if Effects ~= nil then
            Effects = Effects.Shine;
        end;

        if Effects == nil then
            Effects = u2.createElement(ShineEffect, {
                Speed = 1
            });
        end;

        if type(Effects) == "table" then
            v14[v16 + 3] = Effects;
        end;

        local v19 = #v14;
        local v20 = {
            Size = UDim2.fromScale(1, u3.Discount == nil and 1 or 0.75),
            Position = UDim2.fromScale(v7, 0)
        };
        local ZIndex2 = u3.ZIndex;
        v20.ZIndex = (ZIndex2 == nil and 1 or ZIndex2) + 1;
        local v21 = v5 ~= -1;

        if v21 then
            local v22 = {};
            local Icon = u3.Icon;

            if Icon == nil then
                Icon = ImageId.ROBUX;
            end;

            v22.Image = Icon;
            v22.ImageColor3 = Color3.fromRGB(255, 255, 255);
            v22.BackgroundTransparency = 1;
            v22.BorderSizePixel = 0;
            v22.Size = UDim2.fromScale(0.6, 0.6);
            v22.ScaleType = "Fit";
            v22.SizeConstraint = "RelativeYY";
            v22.LayoutOrder = 1;
            local ZIndex3 = u3.ZIndex;
            v22.ZIndex = (ZIndex3 == nil and 1 or ZIndex3) + 1;
            v21 = u2.createElement("ImageLabel", v22);
        end;

        local v23 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.04, 0)
            }) };
        local v24 = #v23;

        if v21 then
            v23[v24 + 1] = v21;
        end;

        local v25 = #v23;
        local v26 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            AutoLocalize = false,
            LayoutOrder = 2,
            Text = tostring(v5 == -1 and "FREE" or v5)
        };
        local v27;

        if v5 == -1 then
            v27 = UDim2.fromScale(1, 0.65);
        else
            v27 = UDim2.fromScale(0, 0.65);
        end;

        v26.Size = v27;
        local v28;

        if v5 == -1 then
            v28 = Enum.AutomaticSize.None;
        else
            v28 = Enum.AutomaticSize.X;
        end;

        v26.AutomaticSize = v28;
        v26.TextColor3 = Color3.fromRGB(255, 255, 255);
        local v29;

        if v5 == -1 then
            v29 = Enum.TextXAlignment.Center;
        else
            v29 = Enum.TextXAlignment.Left;
        end;

        v26.TextXAlignment = v29;
        v26.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        local ZIndex3 = u3.ZIndex;
        v26.ZIndex = (ZIndex3 == nil and 1 or ZIndex3) + 1;
        v23[v25 + 1] = u2.createElement("TextLabel", v26);
        local v30 = u3[u2.Children];

        if v30 then
            for i, v in v30 do
                if type(i) == "number" then
                    v23[v25 + 1 + i] = v;
                else
                    v23[i] = v;
                end;
            end;
        end;

        v14.Content = u2.createElement(Empty, v20, v23);
        local Discount = u3.Discount;

        if Discount then
            local v31 = {
                Size = UDim2.fromScale(1, 0.3),
                Position = UDim2.fromScale(0.05 + v7, 0.9),
                AnchorPoint = Vector2.new(0, 1)
            };
            local ZIndex4 = u3.ZIndex;
            v31.ZIndex = (ZIndex4 == nil and 1 or ZIndex4) + 1;
            local v32 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0.04, 0)
                }) };
            local v33 = #v32;
            local v34 = {};
            local Icon = u3.Icon;

            if Icon == nil then
                Icon = ImageId.ROBUX;
            end;

            v34.Image = Icon;
            v34.ImageColor3 = Color3.fromRGB(255, 71, 71);
            v34.BackgroundTransparency = 1;
            v34.BorderSizePixel = 0;
            v34.Size = UDim2.fromScale(0.95, 0.95);
            v34.ScaleType = "Fit";
            v34.SizeConstraint = "RelativeYY";
            v34.LayoutOrder = 1;
            local ZIndex5 = u3.ZIndex;
            v34.ZIndex = (ZIndex5 == nil and 1 or ZIndex5) + 1;
            v32[v33 + 1] = u2.createElement("ImageLabel", v34);
            local v35 = {
                AutomaticSize = "X",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                AutoLocalize = false,
                TextXAlignment = "Left",
                LayoutOrder = 2,
                Text = "<s>" .. tostring(u3.Discount.OriginalPrice) .. "</s>",
                Size = UDim2.fromScale(0, 1),
                TextColor3 = Color3.fromRGB(255, 71, 71),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            };
            local ZIndex6 = u3.ZIndex;
            v35.ZIndex = (ZIndex6 == nil and 1 or ZIndex6) + 1;
            v32[v33 + 2] = u2.createElement("TextLabel", v35);
            Discount = u2.createFragment({
                Discount = u2.createElement(Empty, v31, v32)
            });
        end;

        if Discount then
            v14[v19 + 1] = Discount;
        end;

        return u2.createElement(Button, v11, v14);
    end)
};