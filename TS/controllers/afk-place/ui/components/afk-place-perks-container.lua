-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v5.MarketplaceService;
local Players = v5.Players;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local VIPUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vip", "vip-util").VIPUtil;
local v23 = v3.new(u2)(function(u6, p7) -- Line: 17
    -- upvalues: AfkPlaceUtils (copy), u2 (copy), Empty (copy), ColorUtil (copy), Flamework (copy), VIPUtil (copy), Players (copy), MarketplaceService (copy), Gamepass (copy), BedwarsImageId (copy)
    local _ = p7.useEffect;
    local _ = p7.useState;
    local v8 = AfkPlaceUtils.vipMultiplier * 100;
    local v9 = AfkPlaceUtils.premiumMultiplier * 100;
    local createElement = u2.createElement;
    local v10 = {
        Size = u6.Size,
        Position = UDim2.fromScale(0.45, 0.7),
        AnchorPoint = Vector2.new(0.5, 0),
        LayoutOrder = u6.LayoutOrder
    };
    local v11 = { (u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 3)
        })) };
    local createElement2 = u2.createElement;
    local v12 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = ColorUtil.WHITE,
        LayoutOrder = u6.LayoutOrder
    };
    local v13 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 20)
        }),
        VipButton = u2.createElement("ImageButton", {
            Size = UDim2.fromScale(0.42, 1),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(20, 20, 20),
            LayoutOrder = 4,
            ClipsDescendants = true,
            AutoButtonColor = not u6.isVip,

            [u2.Event.Activated] = function() -- Line: 56
                -- upvalues: u6 (copy), Flamework (ref), VIPUtil (ref), Players (ref), MarketplaceService (ref), Gamepass (ref)
                if u6.isVip then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "You already have VIP!"
                    });

                    return nil;
                end;

                if not VIPUtil.isPlayerVIP(Players.LocalPlayer) then
                    MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, Gamepass.VIP);
                end;
            end
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u2.createElement("UIStroke", {
                Color = Color3.fromRGB(59, 59, 59)
            }),
            u2.createElement("ImageLabel", {
                ImageTransparency = 0.93,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Crop,
                Image = BedwarsImageId.BED_RED_RENDER,
                BackgroundColor3 = ColorUtil.BLACK
            }),
            Content = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0),
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }),
                Title = u2.createElement("TextLabel", {
                    Text = "VIP",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 0.52),
                    Position = UDim2.fromScale(0, 0.15),
                    Size = UDim2.fromScale(0.6, 0.35),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }),
                Subtitle = u2.createElement("TextLabel", {
                    TextScaled = true,
                    TextTransparency = 0.3,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Text = "+" .. tostring(v8) .. "% faster",
                    AnchorPoint = Vector2.new(0, 0.52),
                    Position = UDim2.fromScale(0, 0.375),
                    Size = UDim2.fromScale(0.6, 0.2),
                    FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }),
                PerkPill = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    LayoutOrder = 5,
                    Size = UDim2.fromScale(0.55, 0.38),
                    Position = UDim2.fromScale(0, 0.57),
                    BackgroundTransparency = u6.isVip and 1 or 0.2,
                    BackgroundColor3 = Color3.fromRGB(59, 144, 80)
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("TextLabel", {
                        TextScaled = true,
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        LayoutOrder = 0,
                        ZIndex = 2,
                        Text = u6.isVip and "PURCHASED" or "PURCHASE",
                        Size = UDim2.fromScale(0.8, 0.8),
                        Position = UDim2.fromScale(0.5, 0.485),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(108, 255, 141),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }) }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5),
                    ScaleType = Enum.ScaleType.Crop,
                    Image = BedwarsImageId.BED_RED_RENDER
                })
            })
        })
    };
    local createElement3 = u2.createElement;
    local v14 = {
        Size = UDim2.fromScale(0.42, 1),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        LayoutOrder = 5,
        ClipsDescendants = true,
        AutoButtonColor = not u6.isPremium,

        [u2.Event.Activated] = function() -- Line: 167
            -- upvalues: u6 (copy), Flamework (ref), MarketplaceService (ref), Players (ref)
            if u6.isPremium then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "You already have Roblox Premium!"
                });

                return nil;
            end;

            MarketplaceService:PromptPremiumPurchase(Players.LocalPlayer);
        end
    };
    local v15 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), u2.createElement("UIStroke", {
            Color = Color3.fromRGB(59, 59, 59)
        }), (u2.createElement("ImageLabel", {
            Image = "rbxasset://textures/ui/PlayerList/PremiumIcon@3x.png",
            ImageTransparency = 0.93,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            BackgroundColor3 = ColorUtil.BLACK
        })) };
    local createElement4 = u2.createElement;
    local v16 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v17 = {
        u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0),
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }),
        Title = u2.createElement("TextLabel", {
            Text = "PREMIUM",
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.52),
            Position = UDim2.fromScale(0, 0.15),
            Size = UDim2.fromScale(0.6, 0.35),
            FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }),
        Subtitle = u2.createElement("TextLabel", {
            TextScaled = true,
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "+" .. tostring(v9) .. "% faster",
            AnchorPoint = Vector2.new(0, 0.52),
            Position = UDim2.fromScale(0, 0.375),
            Size = UDim2.fromScale(0.6, 0.2),
            FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
    };
    local createElement5 = u2.createElement;
    local v18 = {
        BorderSizePixel = 0,
        LayoutOrder = 5,
        Size = UDim2.fromScale(0.55, 0.38),
        Position = UDim2.fromScale(0, 0.57),
        BackgroundTransparency = u6.isVip and 1 or 0.2,
        BackgroundColor3 = Color3.fromRGB(59, 144, 80)
    };
    local v19 = {};
    local v20 = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 6)
    });
    local createElement6 = u2.createElement;
    local v21 = {
        TextScaled = true,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        ZIndex = 2,
        Text = u6.isPremium and "PURCHASED" or "PURCHASE",
        Size = UDim2.fromScale(0.8, 0.8),
        Position = UDim2.fromScale(0.5, 0.485),
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold)
    };
    local v22;

    if u6.isPremium then
        v22 = Color3.fromRGB(130, 130, 130);
    else
        v22 = Color3.fromRGB(108, 255, 141);
    end;

    v21.TextColor3 = v22;
    v21.TextXAlignment = Enum.TextXAlignment.Center;
    v21.TextYAlignment = Enum.TextYAlignment.Center;
    v19[1], v19[2] = v20, createElement6("TextLabel", v21);
    v17.PerkPill = createElement5("Frame", v18, v19);
    v17[2] = u2.createElement("ImageLabel", {
    Image = "rbxasset://textures/ui/PlayerList/PremiumIcon@3x.png",
    SizeConstraint = "RelativeYY",
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(1, 0.65),
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.fromScale(1, 0.5),
    ScaleType = Enum.ScaleType.Fit
});
    v15.Content = createElement4(Empty, v16, v17);
    v13.PremiumButton = createElement3("ImageButton", v14, v15);
    v11.PerksContainer = createElement2("Frame", v12, v13);

    return createElement(Empty, v10, v11);
end);

return {
    AfkPlacePerksContainer = v4.connect(function(p24, p25) -- Line: 272
        local v26 = {};

        for i, v in p25 do
            v26[i] = v;
        end;

        return v26;
    end)(v23)
};