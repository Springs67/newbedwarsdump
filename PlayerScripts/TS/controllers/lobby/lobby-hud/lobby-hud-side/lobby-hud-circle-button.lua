-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LobbyHudCircleButton = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: Theme (copy), DeviceUtil (copy), ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), Padding (copy)
        local _ = p5.useState;
        local FrameProps = u4.FrameProps;

        if FrameProps ~= nil then
            FrameProps = FrameProps.BackgroundColor3;
        end;

        if FrameProps == nil then
            FrameProps = Theme.backgroundPrimary;
        end;

        local v6 = (DeviceUtil.isSmallScreen() and 70 or 80) * 0.8;
        local v7 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromOffset(v6, v6),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local FrameProps2 = u4.FrameProps;

        if FrameProps2 then
            for i, v in FrameProps2 do
                v7[i] = v;
            end;
        end;

        v7[u2.Event.Activated] = function() -- Line: 36
            -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u4.OnClick();
        end;

        local v8 = {
            u2.createElement(Padding, {
                Padding = UDim.new(0, 8)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }),
            u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(FrameProps, Color3.fromRGB(76, 78, 132))
            }),
            u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = u4.Icon,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.7, 0.7),
                BackgroundColor3 = Color3.fromRGB(120, 123, 188)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        };
        local v9 = #v8;
        local v10 = u4[u2.Children];

        if v10 then
            for i, v in v10 do
                if type(i) == "number" then
                    v8[v9 + i] = v;
                else
                    v8[i] = v;
                end;
            end;
        end;

        return u2.createElement("ImageButton", v7, v8);
    end)
};