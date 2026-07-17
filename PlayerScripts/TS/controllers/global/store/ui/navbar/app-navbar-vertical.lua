-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    AppNavbarVertical = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), Padding (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local u6 = u4.ActiveBackgroundColor or ColorUtil.WHITE;
        local v7 = {
            AutomaticSize = "XY",
            Size = UDim2.fromScale(0, 0),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v7[i] = v;
            end;
        end;

        local v8 = {};
        local _ = #v8;
        local NavButtons = u4.NavButtons;

        local function v13(u9) -- Line: 30
            -- upvalues: u4 (copy), u2 (ref), u6 (copy), SoundManager (ref), GameSound (ref)
            local v10 = u4.ActiveAppId == u9.Id;
            local createElement = u2.createElement;
            local v11 = {
                Size = UDim2.new(0, 40, 0, 40)
            };
            local v12;

            if v10 then
                v12 = u6;
            else
                v12 = Color3.fromRGB(0, 0, 0);
            end;

            v11.BackgroundColor3 = v12;
            v11.BackgroundTransparency = 0.5;
            v11.BorderSizePixel = 0;

            v11[u2.Event.Activated] = function() -- Line: 37
                -- upvalues: u4 (ref), u9 (copy), SoundManager (ref), GameSound (ref)
                if u4.ActiveAppId == u9.Id then
                    return nil;
                end;

                u4.SetActiveAppId(u9.Id);
                SoundManager:playSound(GameSound.UI_CLICK_2);
                SoundManager:playSound(GameSound.UI_OPEN_2);
            end;

            v11.ZIndex = 2;

            return createElement("ImageButton", v11, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }),
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = Color3.fromRGB(255, 255, 255)
                }, { u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new(Color3.fromRGB(131, 131, 131)),
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.49, 1),
                            NumberSequenceKeypoint.new(0.5, 0.4),
                            NumberSequenceKeypoint.new(1, 0)
                        })
                    }) }),
                Icon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    Size = UDim2.fromScale(0.8, 0.8),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = u9.Icon
                }),
                Title = u2.createElement("TextLabel", {
                    TextScaled = true,
                    TextXAlignment = "Center",
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    Text = u9.Title,
                    Size = UDim2.fromScale(1.25, 0.45),
                    Position = UDim2.fromScale(0.5, 1.45),
                    AnchorPoint = Vector2.new(0.5, 1),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                })
            });
        end;

        local v14 = table.create(#NavButtons);

        for i, v in NavButtons do
            v14[i] = v13(v, i - 1, NavButtons);
        end;

        local v15 = {
            AutomaticSize = "XY",
            Size = UDim2.fromScale(1, 0)
        };
        local v16 = { u2.createElement(Padding, {
                Padding = {
                    Top = 20,
                    Bottom = 32,
                    Horizontal = 16
                }
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 32)
            }) };
        local v17 = #v16;

        for i, v in v14 do
            v16[v17 + i] = v;
        end;

        v8.NavButtons = u2.createElement(Empty, v15, v16);
        v8.Background = u2.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) });

        return u2.createFragment({
            Navbar = u2.createElement(Empty, v7, v8)
        });
    end)
};