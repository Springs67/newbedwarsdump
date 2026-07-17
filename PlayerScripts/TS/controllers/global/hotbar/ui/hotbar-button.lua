-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    HotbarButton = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: u2 (copy), Theme (copy), TweenService (copy), SoundManager (copy), GameSound (copy), ColorUtil (copy), Empty (copy)
        local _ = p5.useState;
        local u6 = u2.createRef();
        local v11 = {
            LayoutOrder = u4.LayoutOrder,
            Size = UDim2.fromScale(0.3, 0.5),
            BackgroundColor3 = u4.BackgroundColor or Theme.backgroundSecondary,
            BorderSizePixel = 0,

            [u2.Event.MouseEnter] = function(p7) -- Line: 20
                -- upvalues: TweenService (ref), u6 (copy)
                local v8 = TweenService:Create(u6:getValue(), TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.9
                });
                v8:Play();
                v8:Cancel();
            end,

            [u2.Event.MouseLeave] = function(p9) -- Line: 27
                -- upvalues: TweenService (ref), u6 (copy)
                local v10 = TweenService:Create(u6:getValue(), TweenInfo.new(0.12), {
                    BackgroundTransparency = 1
                });
                v10:Play();
                v10:Cancel();
            end,

            [u2.Event.MouseButton1Click] = function() -- Line: 34
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_OPEN);
                u4.OnClick();
            end,

            AutoButtonColor = false
        };
        local v12 = {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = u4.AspectRatio
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u2.createElement("Frame", {
                [u2.Ref] = u6,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE,
                BackgroundTransparency = 1,
                BorderSizePixel = 0
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.05, 0)
                }) }),
            u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center"
                }),
                u2.createElement(Empty, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.5, 0)
                }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = u4.IconSize or UDim2.fromScale(0.6, 0.6),
                    Image = u4.Icon
                }),
                u2.createElement("TextLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Text = u4.Text,
                    Size = UDim2.fromScale(u4.AspectRatio - 0.5 - 0.6 - 0.2, 0.55),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = u4.TextColor or ColorUtil.WHITE
                }),
                u2.createElement(Empty, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.2, 0)
                })
            })
        };
        local v13 = #v12;
        local v14 = u4[u2.Children];

        if v14 then
            for i, v in v14 do
                if type(i) == "number" then
                    v12[v13 + i] = v;
                else
                    v12[i] = v;
                end;
            end;
        end;

        return u2.createElement("ImageButton", v11, v12);
    end)
};