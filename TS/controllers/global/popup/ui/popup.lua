-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local RewardList = RuntimeLib.import(script, script.Parent.Parent.Parent, "reward", "ui", "reward-list").RewardList;
local v18 = v3.new(u2)(function(u5, p6) -- Line: 20
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), Padding (copy), ColorUtil (copy), RewardList (copy), Countdown (copy), Flamework (copy), Theme (copy), Button (copy), SlideIn (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local v7 = UDim2.fromOffset(620, 300);
    useEffect(function() -- Line: 24
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 26
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local v8 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v9 = { u2.createElement(DarkBackground, {
            AppId = u5.AppId,
            ImageButtonProps = {
                ZIndex = 0
            }
        }) };
    local v10 = {};
    local _ = #v10;
    local v11 = {
        AutomaticSize = "Y",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Modal = true,
        Size = UDim2.new(0, v7.X.Offset, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#333333")
    };
    local v12 = {
        u2.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new(v7.X.Offset * 1.2, v7.Y.Offset * 1.2),
            ScreenPadding = Vector2.new(30, 30)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        u2.createElement(Padding, {
            Padding = UDim.new(0, 28)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 16)
        }),
        Title = u2.createElement("TextLabel", {
            TextSize = 22,
            Font = "Roboto",
            RichText = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.2),
            Text = "<b>" .. string.upper(u5.title) .. "</b>",
            TextColor3 = ColorUtil.WHITE
        }),
        Message = u2.createElement("TextLabel", {
            AutomaticSize = "Y",
            TextSize = 18,
            Font = "Roboto",
            TextWrap = true,
            RichText = true,
            TextTransparency = 0.2,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0),
            Text = u5.message,
            TextColor3 = ColorUtil.WHITE
        })
    };
    local v13 = #v12;
    local v14 = u5.reward and u2.createElement(RewardList, {
        Rewards = u5.reward,
        FrameProps = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        }
    });

    if v14 then
        v12[v13 + 1] = v14;
    end;

    local v15 = #v12;
    local v16 = u5.countdown and u2.createElement(Countdown, {
        EndTime = u5.countdown.endTime,
        PreText = u5.countdown.preText,
        PostText = u5.countdown.postText,
        CountdownConfig = {
            days = true,
            hours = true,
            minutes = true,
            seconds = true
        },
        TextLabel = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            RichText = true,
            TextScaled = true,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 22),
            TextXAlignment = Enum.TextXAlignment.Center,
            Font = Enum.Font.RobotoMono,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }
    });

    if v16 then
        v12[v15 + 1] = v16;
    end;

    local _ = #v12;
    local v17 = {
        Size = UDim2.new(0.8, 0, 0, 45)
    };
    local buttonText = u5.buttonText;

    if buttonText ~= nil then
        buttonText = string.upper(buttonText);
    end;

    v17.Text = "<b>" .. (buttonText == nil and "OK" or buttonText) .. "</b>";

    function v17.OnClick() -- Line: 150
        -- upvalues: Flamework (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
    end;

    v17.BackgroundColor3 = Theme.mcGreen;
    v17.AutoButtonColor = true;
    v17.LayoutOrder = 3;
    v12.Confirmation = u2.createElement(Button, v17);
    v10.Popup = u2.createElement("ImageButton", v11, v12);
    v9[#v9 + 1] = u2.createElement(SlideIn, {}, v10);

    return u2.createFragment({
        PopupGui = u2.createElement("ScreenGui", v8, v9)
    });
end);

return {
    Popup = v4.connect(function(p19, p20) -- Line: 164
        local v21 = {};

        for i, v in p20 do
            v21[i] = v;
        end;

        return v21;
    end)(v18)
};