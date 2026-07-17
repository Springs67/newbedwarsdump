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
    AfkShopAppNavlink = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), TweenService (copy), ColorUtil (copy), Empty (copy), Padding (copy), Theme (copy)
        local useEffect = p5.useEffect;
        local u6, u7 = p5.useState(false);
        local u8 = string.lower(u4.ActivePage) == string.lower(u4.Page);
        local u9 = u2.createRef();
        useEffect(function() -- Line: 17
            -- upvalues: u9 (copy), u8 (copy), u6 (copy), TweenService (ref)
            local v10 = u9:getValue();

            if not v10 then
                return nil;
            end;

            if u8 then
                return nil;
            end;

            if u6 then
                TweenService:Create(v10, TweenInfo.new(0.25), {
                    BackgroundTransparency = 0.75
                }):Play();

                return;
            end;

            TweenService:Create(v10, TweenInfo.new(0.25), {
                BackgroundTransparency = u8 and 0.5 or 1
            }):Play();
        end, { u6 });

        return u2.createElement("ImageButton", {
            Size = UDim2.new(0, 70, 1, 0),
            Selectable = true,
            AutoButtonColor = false,
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = u8 and 0.5 or 1,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function() -- Line: 42
                -- upvalues: u4 (copy)
                u4.OnClick();
            end,

            [u2.Event.MouseEnter] = function() -- Line: 45
                -- upvalues: u7 (copy)
                u7(true);
            end,

            [u2.Event.MouseLeave] = function() -- Line: 48
                -- upvalues: u7 (copy)
                u7(false);
            end,

            [u2.Ref] = u9
        }, {
            ButtonContent = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement(Padding, {
                    Padding = {
                        Top = 8,
                        Bottom = 6,
                        Left = 4,
                        Right = 4
                    }
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0, 0.1)
                }),
                u2.createElement("ImageLabel", {
                    ScaleType = "Fit",
                    SizeConstraint = "RelativeYY",
                    ImageTransparency = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.4),
                    Image = u4.Icon,
                    ImageColor3 = u4.ThemeColor or Theme.textPrimary
                }),
                u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextTransparency = 0,
                    TextXAlignment = "Center",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.9, 0.5),
                    Text = "<b>" .. u4.Text .. "</b>",
                    TextColor3 = u4.ThemeColor or Theme.textPrimary
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) })
            }),
            BottomBorder = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 2),
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = u4.ThemeColor or Theme.textPrimary,
                Transparency = u8 and 0 or 1
            })
        });
    end)
};