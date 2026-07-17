-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    AfkPlaceReturnButton = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: u2 (copy), TweenService (copy), AfkPlaceUtils (copy), Theme (copy), SoundManager (copy), GameSound (copy), Padding (copy), ColorUtil (copy), Empty (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(true);
        local u8 = u2.createRef();
        local u9 = u2.createRef();
        useEffect(function() -- Line: 20
            -- upvalues: u8 (copy), u9 (copy), u4 (copy), u7 (copy), TweenService (ref), AfkPlaceUtils (ref)
            local v10 = u8:getValue();
            local v11 = u9:getValue();

            if u4.ReturnButtonPressed and (v10 and v11) then
                u7(false);
                TweenService:Create(v10, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Transparency = 1
                }):Play();
                TweenService:Create(v11, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    TextTransparency = 1,
                    TextStrokeTransparency = 1
                }):Play();
            end;
        end, { u4.ReturnButtonPressed, v6 });
        local v12 = {
            [u2.Ref] = u8,
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.2, 0.1),
            Position = UDim2.fromScale(0.85, 0.85),
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0,
            Active = v6,

            [u2.Event.Activated] = function() -- Line: 44
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK_2);
                u4.OnClick();
            end,

            ZIndex = 2
        };
        local v13 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local _ = #v13;
        local v14 = {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 3)
            }), u2.createElement(Padding, {
                Padding = {
                    Vertical = 6,
                    Horizontal = 4
                }
            }) };
        local v16 = #v15;
        local v17;

        if u4.Icon == nil then
            v17 = false;
        else
            v17 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 2,
                Image = u4.Icon,
                Size = UDim2.fromScale(1, 0.8)
            });
        end;

        if v17 then
            v15[v16 + 1] = v17;
        end;

        v15[#v15 + 1] = u2.createElement("TextLabel", {
            [u2.Ref] = u9,
            Text = string.upper(u4.Text),
            Size = UDim2.fromScale(0.7, 0.7),
            FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE,
            TextScaled = true,
            TextYAlignment = "Center",
            Font = AfkPlaceUtils.Theme.font,
            TextStrokeTransparency = 1,
            TextSize = 14,
            BackgroundTransparency = 1,
            ZIndex = 2
        });
        v13.Content = u2.createElement(Empty, v14, v15);

        return u2.createFragment({
            LobbyButton = u2.createElement("ImageButton", v12, v13)
        });
    end)
};