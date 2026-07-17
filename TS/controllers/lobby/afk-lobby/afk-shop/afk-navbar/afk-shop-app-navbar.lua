-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AfkShopAppCurrencyPill = RuntimeLib.import(script, script.Parent, "afk-shop-app-currency-pill").AfkShopAppCurrencyPill;
local AfkShopAppNavlink = RuntimeLib.import(script, script.Parent, "afk-shop-app-navlink").AfkShopAppNavlink;

return {
    AfkShopAppNavbar = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy), AfkShopUtils (copy), Theme (copy), ColorUtil (copy), Empty (copy), Padding (copy), AfkShopAppNavlink (copy), BedwarsImageId (copy), AfkShopAppCurrencyPill (copy), IconButton (copy), Flamework (copy), BedwarsAppIds (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        local function _(p6) -- Line: 22
            -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);

            if p6 == u4.Page then
                return nil;
            end;

            u4.SetPage(p6);
        end;

        return u2.createFragment({
            NavBar = u2.createElement("ImageLabel", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                Image = AfkShopUtils.navbarImage,
                ScaleType = Enum.ScaleType.Crop,
                BackgroundColor3 = Theme.backgroundTertiary
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }),
                Wrapper = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u2.createElement("UIGradient", {
                        Rotation = 45,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5659A4")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5659A4")) }),
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4) })
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 0)
                    }),
                    TitleContainer = u2.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.33, 1)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 2)
                        }),
                        u2.createElement(Padding, {
                            Padding = {
                                Left = 14,
                                Top = 8,
                                Bottom = 8
                            }
                        }),
                        Title = u2.createElement("TextLabel", {
                            Text = "<b>AFK Shop</b>",
                            TextScaled = true,
                            RichText = true,
                            Font = "GothamBlack",
                            BackgroundTransparency = 1,
                            TextXAlignment = "Left",
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.65),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        })
                    }),
                    NavLinks = u2.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.33, 1)
                    }, { u2.createElement(
                            "UIListLayout",
                            {
                                FillDirection = "Horizontal",
                                HorizontalAlignment = "Center",
                                VerticalAlignment = "Bottom"
                            }
                        ), u2.createElement(AfkShopAppNavlink, {
                            Text = "Shop",
                            Page = "shop",
                            Icon = BedwarsImageId.SHOPPING_CART_SOLID,
                            ActivePage = u4.Page,

                            OnClick = function() -- Line: 100, Name: OnClick
                                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                                SoundManager:playSound(GameSound.UI_CLICK);

                                if u4.Page == "shop" then
                                    return;
                                end;

                                u4.SetPage("shop");
                            end,

                            ThemeColor = Color3.fromRGB(255, 214, 36)
                        }) }),
                    HeaderRightSide = u2.createElement(Empty, {
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(0.33, 1)
                    }, {
                        u2.createElement(Padding, {
                            Padding = {
                                Right = 14,
                                Top = 10,
                                Bottom = 10
                            }
                        }),
                        u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Right",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 6)
                        }),
                        CurrencyList = u2.createElement(Empty, {
                            LayoutOrder = 2,
                            Size = UDim2.new(0.85, -6, 0.9, 0)
                        }, { u2.createElement("UIListLayout", {
                                FillDirection = "Horizontal",
                                HorizontalAlignment = "Right",
                                Padding = UDim.new(0.03, 0)
                            }), u2.createElement(AfkShopAppCurrencyPill, {
                                CurrAmount = u4.AfkDataProfile.afkCurrency.currAmount
                            }) }),
                        CloseAppButton = u2.createElement(IconButton, {
                            LayoutOrder = 3,
                            Size = UDim2.fromScale(0.15, 1),
                            Image = BedwarsImageId.X,

                            OnClick = function() -- Line: 140, Name: OnClick
                                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.AFK_APP);
                            end
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) })
                    })
                })
            })
        });
    end)
};