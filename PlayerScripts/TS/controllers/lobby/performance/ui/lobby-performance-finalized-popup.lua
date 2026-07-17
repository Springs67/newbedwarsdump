-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LobbyPerformancePopupPage = RuntimeLib.import(script, script.Parent, "lobby-performance-popup-page").LobbyPerformancePopupPage;
local u4 = UDim2.fromScale(0.55, 0.75);
local u5 = UDim2.fromScale(0.5, 0.46);
local u6 = Vector2.new(0.5, 0.5);

return {
    LobbyPerformanceFinalizedPopup = v3.new(u2)(function(u7, p8) -- Line: 20
        -- upvalues: u2 (copy), LobbyPerformancePopupPage (copy), DeviceUtil (copy), DarkBackground (copy), u4 (copy), u5 (copy), u6 (copy), Theme (copy), Empty (copy), IconButton (copy), BedwarsImageId (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), SlideIn (copy)
        local useEffect = p8.useEffect;
        local u9, u10 = p8.useState(0);
        local u11 = #u7.data;

        local function v13() -- Line: 25
            -- upvalues: u7 (copy), u9 (copy), u11 (copy), u2 (ref), LobbyPerformancePopupPage (ref)
            local v12 = u7.data[math.clamp(u9, 0, u11 - 1) + 1];

            return u2.createElement(LobbyPerformancePopupPage, {
                Earned = v12.Earned,
                MatchInfo = v12.MatchInfo
            });
        end;

        local function _(p14) -- Line: 32
            -- upvalues: u10 (copy), u9 (copy), u11 (copy)
            u10((math.clamp(u9 + p14, 0, u11 - 1)));
        end;

        useEffect(function() -- Line: 35
        end, { u9 });
        local v15 = {
            DisplayOrder = 20,
            IgnoreGuiInset = DeviceUtil.isSmallScreen()
        };
        local v16 = { u2.createElement(DarkBackground, {
                AppId = "MatchPerformancePopup",
                BackgroundTransparency = 0.4,
                IgnoreClickDuration = 1,

                OnClick = function() -- Line: 44, Name: OnClick
                    return false;
                end
            }) };
        local v17 = {};
        local v18 = {
            LayoutOrder = 1,
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            Size = u4,
            Position = u5,
            AnchorPoint = u6,
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local v19 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v20 = {
            Size = UDim2.fromScale(0.99, 0.99),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v21 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }),
            Header = u2.createElement(Empty, {
                LayoutOrder = 0,
                Size = UDim2.new(1, 0, 0.05, 0)
            }, { u2.createElement(IconButton, {
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.X,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    Position = UDim2.fromScale(0.925, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),

                    OnClick = function() -- Line: 90, Name: OnClick
                        -- upvalues: KnitClient (ref), SoundManager (ref), GameSound (ref)
                        KnitClient.Controllers.LobbyPerformancePopupController:hidePopup();
                        SoundManager:playSound(GameSound.UI_CLOSE_2);
                    end
                }) }),
            v13()
        };
        local v22 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 0.05),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v23 = {};
        local v24 = #v23;
        local v25;

        if #u7.data > 1 then
            v25 = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.015, 0),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }),
                LeftButton = u2.createElement(IconButton, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.TRIANGLE_ARROW_LEFT,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),

                    OnClick = function() -- Line: 125, Name: OnClick
                        -- upvalues: u10 (copy), u9 (copy), u11 (copy), SoundManager (ref), GameSound (ref)
                        u10((math.clamp(u9 + -1, 0, u11 - 1)));
                        SoundManager:playSound(GameSound.UI_CLICK);
                    end
                }),
                PageIndicator = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    LayoutOrder = 2,
                    BackgroundTransparency = 0.9,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    Text = tostring(u9),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.ArialBold,
                    Position = UDim2.fromScale(0.9, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }),
                RightButton = u2.createElement(IconButton, {
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.TRIANGLE_ARROW_RIGHT,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),

                    OnClick = function() -- Line: 152, Name: OnClick
                        -- upvalues: u10 (copy), u9 (copy), u11 (copy), SoundManager (ref), GameSound (ref)
                        u10((math.clamp(u9 + 1, 0, u11 - 1)));
                        SoundManager:playSound(GameSound.UI_CLICK);
                    end
                })
            });
        else
            v25 = false;
        end;

        if v25 then
            v23[v24 + 1] = v25;
        end;

        v21[#v21 + 1] = u2.createElement(Empty, v22, v23);
        v19[#v19 + 1] = u2.createElement(Empty, v20, v21);
        v17[#v17 + 1] = u2.createElement("Frame", v18, v19);
        v16[#v16 + 1] = u2.createElement(SlideIn, {}, v17);

        return u2.createElement("ScreenGui", v15, v16);
    end)
};