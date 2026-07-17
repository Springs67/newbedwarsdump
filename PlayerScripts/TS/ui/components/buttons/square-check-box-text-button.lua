-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SquareCheckBoxButton = RuntimeLib.import(script, script.Parent, "square-check-box-button").SquareCheckBoxButton;

return {
    SquareCheckBoxTextButton = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), Empty (copy), SquareCheckBoxButton (copy), ColorUtil (copy)
        local useState = p5.useState;
        local _ = p5.useEffect;
        local _, u6 = useState(false);
        local Checked = u4.Checked;

        if Checked == nil then
            Checked = false;
        end;

        local u7, u8 = useState(Checked);
        local v9 = {};

        for i, v in u4 do
            v9[i] = v;
        end;

        v9.Text = nil;
        v9.Checked = nil;
        v9.OnChecked = nil;
        v9.UIListLayoutProps = nil;
        v9[u2.Children] = nil;
        local v10 = {};

        for i, v in v9 do
            v10[i] = v;
        end;

        v10.BackgroundTransparency = 1;

        v10[u2.Event.Activated] = function() -- Line: 35
            -- upvalues: u8 (copy), u7 (copy), u4 (copy)
            u8(not u7);

            if u4.OnChecked then
                u4.OnChecked(not u7);
            end;
        end;

        v10[u2.Event.MouseEnter] = function() -- Line: 41
            -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
            SoundManager:playSound(GameSound.UI_HOVER);
            u6(true);
        end;

        v10[u2.Event.MouseLeave] = function() -- Line: 45
            -- upvalues: u6 (copy)
            u6(false);
        end;

        local v11 = {};
        local v12 = #v11;
        local v13 = u4[u2.Children];

        if v13 then
            for i, v in v13 do
                if type(i) == "number" then
                    v11[v12 + i] = v;
                else
                    v11[i] = v;
                end;
            end;
        end;

        local v14 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v15 = {};
        local v16 = #v15;
        local v17 = {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 2)
        };
        local UIListLayoutProps = u4.UIListLayoutProps;

        if UIListLayoutProps then
            for i, v in UIListLayoutProps do
                v17[i] = v;
            end;
        end;

        v15[v16 + 1] = u2.createElement("UIListLayout", v17);
        v15[v16 + 2] = u2.createElement(Empty, {
            Size = UDim2.fromScale(0.4, 1),
            LayoutOrder = u4.Text.TextMode == "LEFT" and 1 or 0
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement(SquareCheckBoxButton, {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),

                OnChecked = function(p18) -- Line: 93, Name: OnChecked
                    -- upvalues: u8 (copy), u4 (copy)
                    u8(not p18);

                    if u4.OnChecked then
                        u4.OnChecked(not p18);
                    end;
                end,

                Checked = u7
            }, { u2.createElement("UIStroke", {
                    Transparency = 0.5,
                    Thickness = 1,
                    Color = ColorUtil.WHITE
                }) }) });
        local createElement = u2.createElement;
        local v19 = {
            Size = UDim2.fromScale(0.6, 1)
        };
        local v20 = {};
        local v21 = u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        });
        local createElement2 = u2.createElement;
        local v22 = {
            TextScaled = true,
            BackgroundTransparency = 1,
            TextTransparency = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Text = u4.Text.Text,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = u4.Text.TextXAlignment or Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        };
        local v23;

        if u4.Text.Bold then
            v23 = Enum.FontWeight.Bold;
        else
            v23 = Enum.FontWeight.Regular;
        end;

        v22.FontFace = Font.new("Roboto", v23);
        v22.LayoutOrder = u4.Text.TextMode == "LEFT" and 0 or 1;
        v20[1], v20[2] = v21, createElement2("TextLabel", v22);
        v15[v16 + 3] = createElement(Empty, v19, v20);
        v11[#v11 + 1] = u2.createElement(Empty, v14, v15);

        return u2.createElement("ImageButton", v10, v11);
    end)
};