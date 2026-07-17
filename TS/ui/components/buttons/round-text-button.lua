-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local RoundButton = RuntimeLib.import(script, script.Parent, "round-button").RoundButton;

return {
    RoundTextButton = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), RoundButton (copy), DeviceUtil (copy), ColorUtil (copy)
        local v6, u7 = p5.useState(false);
        local v8 = {};

        for i, v in u4 do
            v8[i] = v;
        end;

        v8.Text = nil;
        v8.Image = nil;
        v8.OnClick = nil;
        v8[u2.Children] = nil;
        local v9 = {};

        for i, v in v8 do
            v9[i] = v;
        end;

        v9.AutomaticSize = "X";
        v9.SizeConstraint = "RelativeYY";
        v9.BackgroundTransparency = 1;

        v9[u2.Event.MouseButton1Click] = function() -- Line: 30
            -- upvalues: u4 (copy)
            if u4.OnClick then
                u4.OnClick();
            end;
        end;

        v9[u2.Event.MouseEnter] = function() -- Line: 35
            -- upvalues: SoundManager (ref), GameSound (ref), u7 (copy)
            SoundManager:playSound(GameSound.UI_HOVER);
            u7(true);
        end;

        v9[u2.Event.MouseLeave] = function() -- Line: 39
            -- upvalues: u7 (copy)
            u7(false);
        end;

        v9.Selectable = true;
        local v10 = {};
        local v11 = #v10;
        local v12 = u4[u2.Children];

        if v12 then
            for i, v in v12 do
                if type(i) == "number" then
                    v10[v11 + i] = v;
                else
                    v10[i] = v;
                end;
            end;
        end;

        local v13 = #v10;
        v10[v13 + 1] = u2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 6)
        });
        v10[v13 + 2] = u2.createElement(RoundButton, {
            Size = UDim2.fromScale(0.4, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Image = u4.Image,
            Hovered = v6,
            OnClick = u4.OnClick,
            ZIndex = v8.ZIndex,
            LayoutOrder = u4.Text.TextMode == "LEFT" and 1 or 0,
            ImageButtonProps = {
                Selectable = false
            }
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1,
                DominantAxis = "Height",
                AspectType = DeviceUtil.isSmallScreen() and "FitWithinMaxSize" or "ScaleWithParentSize"
            }) });
        local createElement = u2.createElement;
        local v14 = {
            AutomaticSize = "X",
            SizeConstraint = "RelativeYY",
            TextScaled = true,
            BackgroundTransparency = 1,
            TextTransparency = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = u4.Text.Text,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left
        };
        local v15;

        if u4.Text.Bold then
            v15 = Enum.FontWeight.Bold;
        else
            v15 = Enum.FontWeight.Regular;
        end;

        v14.FontFace = Font.new("Roboto", v15);
        v14.LayoutOrder = u4.Text.TextMode == "LEFT" and 0 or 1;
        v14.ZIndex = v8.ZIndex;
        v10[v13 + 3] = createElement("TextLabel", v14);

        return u2.createElement("ImageButton", v9, v10);
    end)
};