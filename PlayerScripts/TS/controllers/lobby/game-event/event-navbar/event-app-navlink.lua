-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EventAppNavlink = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), TweenService (copy), ColorUtil (copy), Padding (copy), Theme (copy), Empty (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(false);
        local u8, u9 = useState(false);
        local u10, _ = useState(u2.createRef());
        local u11, u12 = useState(true);
        useEffect(function() -- Line: 18
            -- upvalues: u4 (copy), u8 (copy), u9 (copy)
            if u8 ~= (string.lower(u4.ActivePage) == string.lower(u4.Page)) then
                u9(string.lower(u4.ActivePage) == string.lower(u4.Page));
            end;
        end, { u4.ActivePage });
        useEffect(function() -- Line: 24
            -- upvalues: u11 (copy), u10 (copy), u8 (copy), u6 (copy), TweenService (ref), u12 (copy)
            if u11 then
                return nil;
            end;

            local v13 = u10:getValue();

            if not v13 then
                return nil;
            end;

            if u8 then
                return nil;
            end;

            if u6 then
                TweenService:Create(v13, TweenInfo.new(0.25), {
                    BackgroundTransparency = 0.75
                }):Play();
            else
                TweenService:Create(v13, TweenInfo.new(0.25), {
                    BackgroundTransparency = u8 and 0.5 or 1
                }):Play();
            end;

            u12(false);
        end, { u6 });
        local v14 = {
            Selectable = true,
            AutoButtonColor = false,
            Size = UDim2.new(0, 70, 1, 0),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v15;

        if u8 then
            v15 = 0.5;
        else
            local InActiveBackgroundTransparency = u4.InActiveBackgroundTransparency;
            v15 = InActiveBackgroundTransparency == nil and 1 or InActiveBackgroundTransparency;
        end;

        v14.BackgroundTransparency = v15;
        v14.BorderSizePixel = 0;

        v14[u2.Event.Activated] = function() -- Line: 64
            -- upvalues: u4 (copy)
            u4.OnClick();
        end;

        v14[u2.Event.MouseEnter] = function() -- Line: 67
            -- upvalues: u7 (copy)
            u7(true);
        end;

        v14[u2.Event.MouseLeave] = function() -- Line: 70
            -- upvalues: u7 (copy)
            u7(false);
        end;

        v14[u2.Ref] = u10;
        local ImageButtonProps = u4.ImageButtonProps;

        if ImageButtonProps then
            for i, v in ImageButtonProps do
                v14[i] = v;
            end;
        end;

        local v16 = {};
        local _ = #v16;
        local v17 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v18 = { u2.createElement(Padding, {
                Padding = {
                    Top = 8,
                    Bottom = 6,
                    Left = 4,
                    Right = 4
                }
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 0.1)
            }) };
        local v19 = #v18;
        local v20;

        if u4.Icon == nil then
            v20 = false;
        else
            v20 = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                ImageTransparency = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.4),
                Image = u4.Icon,
                ImageColor3 = u4.ThemeColor or Theme.textPrimary
            });
        end;

        if v20 then
            v18[v19 + 1] = v20;
        end;

        local v21 = #v18;
        local v22 = {};
        local Icon = u4.Icon;
        v22.Size = UDim2.fromScale(0.9, (Icon == "" or not Icon) and 0.55 or 0.5);
        v22.Text = u4.Text;
        v22.TextColor3 = u4.ThemeColor or Theme.textPrimary;
        v22.TextScaled = true;
        v22.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v22.TextTransparency = 0;
        v22.TextXAlignment = "Center";
        v22.BackgroundTransparency = 1;
        v18[v21 + 1] = u2.createElement("TextLabel", v22, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        local v23 = u4.SubText ~= nil;

        if v23 then
            local v24 = {};
            local Icon2 = u4.Icon;
            v24.Size = UDim2.fromScale(0.9, (Icon2 == "" or not Icon2) and 0.45 or 0.3);
            v24.Text = u4.SubText;
            v24.TextColor3 = Color3.fromRGB(255, 255, 255);
            v24.TextScaled = true;
            v24.FontFace = Font.fromName("Roboto", Enum.FontWeight.SemiBold);
            v24.TextTransparency = 0.3;
            v24.TextXAlignment = "Center";
            v24.BackgroundTransparency = 1;
            v23 = u2.createElement("TextLabel", v24, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) });
        end;

        if v23 then
            v18[v21 + 2] = v23;
        end;

        v16.ButtonContent = u2.createElement(Empty, v17, v18);
        v16.BottomBorder = u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 2),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = u4.ThemeColor or Theme.textPrimary,
            Transparency = u8 and 0 or 1
        });

        return u2.createElement("ImageButton", v14, v16);
    end)
};