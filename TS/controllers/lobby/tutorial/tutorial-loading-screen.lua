-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local ImageId = v1.ImageId;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v17 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p4, p5) -- Line: 14
    -- upvalues: u2 (copy), TweenService (copy), AfkPlaceUtils (copy), DarkBackground (copy), SlideIn (copy), Theme (copy), ColorUtil (copy), ImageId (copy)
    local _ = p5.useState;
    local useEffect = p5.useEffect;
    local u6 = u2.createRef();
    local u7 = u2.createRef();
    local u8 = nil;
    local u9 = nil;
    local u10 = nil;
    useEffect(function() -- Line: 22
        -- upvalues: u6 (copy), u7 (copy), u8 (ref), u9 (ref), u10 (ref)
        local u11 = false;
        local u12 = u6:getValue();
        local u13 = u7:getValue();
        task.delay(0.9, function() -- Line: 27
            -- upvalues: u11 (ref), u8 (ref), u12 (copy), u9 (ref), u10 (ref), u13 (copy)
            if not u11 then
                u8(u12);
                u9(u12);
                u10(u13);
            end;
        end);

        return function() -- Line: 34
            -- upvalues: u11 (ref)
            u11 = true;
        end;
    end, {});

    u8 = function(p14) -- Line: 38
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p14 then
            return nil;
        end;

        TweenService:Create(p14, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ImageTransparency = 0
        }):Play();
    end;

    u10 = function(p15) -- Line: 47
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p15 then
            return nil;
        end;

        TweenService:Create(p15, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 0
        }):Play();
    end;

    u9 = function(p16) -- Line: 56
        -- upvalues: TweenService (ref)
        if not p16 then
            return nil;
        end;

        TweenService:Create(p16, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
            Rotation = 360
        }):Play();
    end;

    return u2.createElement("ScreenGui", {
        DisplayOrder = 100,
        IgnoreGuiInset = true
    }, {
        u2.createElement(DarkBackground, {
            AppId = "LoadingPlaceDarkBackground",
            DisableCloseOnClick = true,
            BackgroundTransparency = 1
        }),
        u2.createElement(SlideIn, {
            TweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
            StartPosition = UDim2.fromScale(0, 1)
        }, {
            LoadingScreenBackground = u2.createElement("ImageLabel", {
                ImageTransparency = 0,
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                LayoutOrder = 5,
                ZIndex = 2,
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
                BackgroundColor3 = Theme.backgroundSecondary
            })
        }),
        u2.createElement("TextLabel", {
            [u2.Ref] = u7,
            Text = "<b>Teleporting to BedWars Tutorial</b>",
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.62),
            Size = AfkPlaceUtils.Theme.headingThreeSize,
            TextColor3 = ColorUtil.WHITE,
            RichText = true,
            TextScaled = true,
            TextStrokeTransparency = 1,
            TextTransparency = 1,
            TextYAlignment = "Center",
            Font = AfkPlaceUtils.Theme.font,
            BackgroundTransparency = 1,
            ZIndex = 7
        }),
        u2.createElement("ImageLabel", {
            [u2.Ref] = u6,
            Image = ImageId.LOADING_SPINNER,
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.15, 0.15),
            ImageTransparency = 1,
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            ZIndex = 8
        })
    });
end);

return {
    TutorialLoadingScreen = v3.connect(function(p18, p19) -- Line: 120
        local v20 = {};

        for i, v in p19 do
            v20[i] = v;
        end;

        return v20;
    end)(v17)
};