-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local LassoWarsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;

return {
    LassoWarsUpgradeCard = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: LassoWarsUtil (copy), Players (copy), DeviceUtil (copy), u2 (copy), KnitClient (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), getItemMeta (copy)
        local _ = p5.useEffect;
        local v6, u7 = p5.useState(LassoWarsUtil.getCurrentUpgradeLevelForPlayer(Players.LocalPlayer, u4.upgradeType));
        local v8 = u4.upgradeMeta.upgrades[v6 + 1 + 1];
        local v9 = false;
        local v10;

        if v8 == nil then
            v9 = true;
            v10 = nil;
        else
            v10 = tostring(v8.price);
        end;

        local v11 = #u4.upgradeMeta.upgrades - 1;
        local v12 = DeviceUtil.isSmallScreen();
        local v13 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = u4.cardSize,
            Position = UDim2.fromScale(0, 0),
            LayoutOrder = u4.LayoutOrder
        };
        local v14 = {};
        local _ = #v14;
        local v16 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.85, 1),
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromHex("#D9D7C7"),
            ZIndex = 1,

            [u2.Event.MouseButton1Click] = function() -- Line: 46
                -- upvalues: KnitClient (ref), u4 (copy), u7 (copy)
                local v15 = KnitClient.Controllers.LassoWarsController:requestLassoUpgrade(u4.upgradeType);

                if v15 ~= 0 and (v15 == v15 and v15) then
                    u7(v15);
                end;
            end
        };
        local v17 = {
            u2.createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromHex("#AC714A")
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }),
            UpgradeIcon = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 4,
                Size = UDim2.fromScale(0.6, 0.3),
                Position = UDim2.fromScale(0.5, 0.25),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = u4.upgradeMeta.icon,
                ScaleType = Enum.ScaleType.Fit
            }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = u4.upgradeMeta.displayName,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }), u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = u4.upgradeMeta.description,
                        Font = Enum.Font.SourceSans,
                        Limits = Vector2.new(300, 60)
                    }) }) }),
            OuterHexagonBorder = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://10899316316",
                Rotation = 90,
                ZIndex = 2,
                Size = UDim2.fromScale(0.6, 0.3),
                Position = UDim2.fromScale(0.5, 0.25),
                AnchorPoint = Vector2.new(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                ImageColor3 = Color3.fromHex("#AC714A")
            }, {
                u2.createElement("UIGradient", {
                    Rotation = 0,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(Color3.fromHex("#AC714A"), 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(Color3.fromHex("#AC714A"), 0.9)) })
                }),
                InnerHexagonBorder = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://10899316316",
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.715, 0.75),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ImageColor3 = Color3.fromHex("#3A160E")
                }, { u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(Color3.fromHex("#3A160E"), 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(Color3.fromHex("#3A160E"), 0.9)) })
                    }) })
            }),
            u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0.2,
                ZIndex = 10,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.48),
                Size = UDim2.fromScale(0.8, 0.2),
                Text = u4.upgradeMeta.displayName,
                TextSize = v12 and 14 or 20,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }),
            u2.createElement("Frame", {
                BackgroundTransparency = 0,
                ZIndex = 5,
                Size = UDim2.fromScale(0.8, 0.15),
                Position = UDim2.fromScale(0.5, 0.66),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromHex("#AC714A")
            }, {
                u2.createElement("UIStroke", {
                    Thickness = 3,
                    Color = Color3.fromHex("#3A160E")
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }),
                UpgradeLevelText = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextStrokeTransparency = 0.2,
                    ZIndex = 6,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.8, 1),
                    Text = tostring(v6) .. " / " .. tostring(v11),
                    TextSize = v12 and 14 or 20,
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.SourceSansBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            })
        };
        local _ = #v17;
        local v18 = {
            BackgroundTransparency = 0,
            ZIndex = 5,
            Size = UDim2.fromScale(0.6, 0.15),
            BackgroundColor3 = Color3.fromHex("#178649"),
            Position = UDim2.fromScale(0.5, 0.88),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v19 = { u2.createElement("UIStroke", {
                Thickness = 3,
                Color = Color3.fromHex("#3A160E")
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            }) };
        local v20 = #v19;
        local v21 = not v9 and u2.createFragment({
            CoinIcon = u2.createElement("ImageLabel", {
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                ZIndex = 6,
                Size = UDim2.fromScale(0.3, 1),
                Image = getItemMeta(LassoWarsUtil.LASSO_WARS_COIN_ITEM).image,
                ScaleType = Enum.ScaleType.Fit
            })
        });

        if v21 then
            v19[v20 + 1] = v21;
        end;

        local v22 = #v19;
        local v23 = not v9 and u2.createFragment({
            UpgradePrice = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0.2,
                ZIndex = 6,
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.3, 1),
                Text = v10,
                TextSize = v12 and 14 or 20,
                TextColor3 = Color3.fromHex("#DFCA3A"),
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });

        if v23 then
            v19[v22 + 1] = v23;
        end;

        local v24 = #v19;

        if v9 then
            v9 = u2.createFragment({
                UpgradePrice = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "MAXED",
                    TextStrokeTransparency = 0.2,
                    ZIndex = 6,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    TextSize = v12 and 14 or 20,
                    TextColor3 = Color3.fromHex("#DFCA3A"),
                    Font = Enum.Font.SourceSansBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            });
        end;

        if v9 then
            v19[v24 + 1] = v9;
        end;

        v17.ItemPuchaseButton = u2.createElement("Frame", v18, v19);
        v14.InnerUpgradeFrame = u2.createElement("ImageButton", v16, v17);

        return u2.createFragment({
            OuterUpgradeFrame = u2.createElement("Frame", v13, v14)
        });
    end)
};