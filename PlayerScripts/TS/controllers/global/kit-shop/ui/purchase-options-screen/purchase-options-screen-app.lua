-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v19 = v3.new(u2)(function(p5, p6) -- Line: 14
    -- upvalues: SoundManager (copy), GameSound (copy), FullScreenMenuBackgroundPresets (copy), u2 (copy), ColorUtil (copy), Empty (copy), SlideIn (copy), FullScreenMenu (copy)
    local _ = p6.useState;
    p6.useEffect(function() -- Line: 17
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 19
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local v7 = {};
    local v8 = {};

    for i, v in p5.OnBack and {
        OnClick = p5.OnBack
    } or {} do
        v7[i] = v;
    end;

    for i, v in FullScreenMenuBackgroundPresets.BACKGROUND_BLUR_PRESET do
        v7[i] = v;
    end;

    v8.Background = v7;
    v8.ExitButton = p5.OnExit and {
        OnClick = p5.OnExit
    } or nil;
    v8.BackButton = p5.OnBack and {
        OnClick = p5.OnBack
    } or nil;
    v8.EnableButtonBackgroundPanel = true;
    local v9 = {};
    local v10 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.025, 0)
        }) };
    local v11 = {
        BackgroundTransparency = 0.5,
        Size = UDim2.fromScale(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local v12 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        }), u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v13 = #v12;
    local v14;

    if p5.Image == nil then
        v14 = false;
    else
        v14 = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.3, 0.3),
            Image = p5.Image,
            ScaleType = Enum.ScaleType.Fit
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end;

    if v14 then
        v12[v13 + 1] = v14;
    end;

    local v15 = #v12;
    v12[v15 + 1] = u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextTransparency = 0,
        Size = UDim2.fromScale(1, 0.1),
        Text = p5.Title,
        TextColor3 = ColorUtil.WHITE,
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    }, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 40,
            MinTextSize = 12
        }) });
    v12[v15 + 2] = u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextTransparency = 0.5,
        Size = UDim2.fromScale(1, 0.2),
        Text = p5.Description,
        TextColor3 = ColorUtil.WHITE,
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Top
    }, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 28,
            MinTextSize = 8
        }) });
    local v16 = {
        Size = UDim2.fromScale(1, 0.1)
    };
    local v17 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }) };
    local v18 = #v17;

    for i, v in p5.Buttons do
        v17[v18 + i] = v;
    end;

    v12[v15 + 3] = u2.createElement(Empty, v16, v17);
    v10[#v10 + 1] = u2.createElement("Frame", v11, v12);
    v9[#v9 + 1] = u2.createElement(SlideIn, {}, v10);

    return u2.createElement(FullScreenMenu, v8, v9);
end);

return {
    PurchaseOptionsScreenApp = v4.connect(function(p20, p21) -- Line: 136
        local v22 = {
            store = p20
        };

        for i, v in p21 do
            v22[i] = v;
        end;

        return v22;
    end)(v19)
};