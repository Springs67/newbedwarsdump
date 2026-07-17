-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MerchantItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-meta").MerchantItemCategory;
local TravelingMerchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "traveling-merchant", "traveling-merchant-util").TravelingMerchantUtil;
local u4 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);

return {
    TravelingMerchantItemPopup = v3.new(u2)(function(u5, p6) -- Line: 22
        -- upvalues: getItemMeta (copy), TravelingMerchantUtil (copy), u2 (copy), u1 (copy), MerchantItemCategory (copy), TweenService (copy), u4 (copy), ClientSyncEvents (copy), Theme (copy)
        local useEffect = p6.useEffect;
        local v7 = getItemMeta(u5.merchantItem.item);
        local v8 = getItemMeta(u5.merchantItem.purchaseCurrency);
        local u9 = TravelingMerchantUtil:getStarCountByRarity(u5.merchantItem.rarity);
        local v10 = TravelingMerchantUtil:getRarityColor(u5.merchantItem.rarity);
        local u11 = u2.createRef();
        local u12 = u1.new();
        local u13 = u2.createRef();
        local u14 = u5.merchantItem.category == MerchantItemCategory.ITEM and true or u5.merchantItem.category == MerchantItemCategory.DISCOUNT;
        useEffect(function() -- Line: 35
            -- upvalues: u14 (copy), u13 (copy), TweenService (ref), u4 (ref), u12 (copy)
            if u14 then
                local v15 = u13:getValue();

                if not v15 then
                    return nil;
                end;

                local v16 = TweenService:Create(v15, u4, {
                    Size = v15.Size + UDim2.fromScale(0.15, 0.15)
                });
                v16:Play();
                u12:GiveTask(v16);
            end;

            return function() -- Line: 51
                -- upvalues: u12 (ref)
                u12:DoCleaning();
            end;
        end);
        useEffect(function() -- Line: 57
            -- upvalues: u11 (copy), ClientSyncEvents (ref), u5 (copy)
            local v17 = u11:getValue();

            if not v17 then
                return nil;
            end;

            ClientSyncEvents.TravelingMerchantBillboardMounted:fire(u5.merchantItem, v17);

            return function() -- Line: 63
            end;
        end);
        local v18 = {
            Size = UDim2.fromScale(4, 5),
            StudsOffset = Vector3.new(0, 4, 0),
            [u2.Ref] = u11,
            AlwaysOnTop = true,
            Enabled = false,
            ResetOnSpawn = false,
            Adornee = u5.merchantItemInstance
        };
        local v19 = {};
        local _ = #v19;
        local v20 = {
            Image = "rbxassetid://10667281451",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = v10
        };
        local v21 = {};
        local _ = #v21;
        local v22 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.6),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.7),
            BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        };
        local v23 = {};
        local v24 = #v23;
        local v25 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 0.175)
        };
        local v26 = {};
        local _ = #v26;
        local v27 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.015, 0),
            Size = UDim2.fromScale(0.4, 1)
        };
        local v28 = {};
        local v29 = #v28;

        for i, v in (function() -- Line: 111
            -- upvalues: u9 (copy), u2 (ref)
            local v30 = false;
            local v31 = 0;
            local v32 = {};

            while true do
                if v30 then
                    v31 = v31 + 1;
                else
                    v30 = true;
                end;

                if v31 >= u9 then
                    return v32;
                end;

                local v33 = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://13406746654",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(0.25, 1)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1.03
                    }) });
                table.insert(v32, v33);
            end;
        end)() do
            v28[v29 + i] = v;
        end;

        v28[#v28 + 1] = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 5)
        });
        v26.RankContainer = u2.createElement("Frame", v27, v28);
        v26.NameContainer = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.4, 0),
            Size = UDim2.fromScale(0.6, 1)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                Font = Enum.Font.RobotoMono,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.525, 0.5),
                Size = UDim2.fromScale(1, 0.85),
                Text = not u14 and "TEAM BUFF" or "<b>" .. string.upper(v7.displayName) .. "</b>",
                TextXAlignment = Enum.TextXAlignment.Right,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) });
        v23.RankNameContainer = u2.createElement("Frame", v25, v26);

        if u14 then
            u14 = u2.createFragment({
                ItemContainer = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.175),
                    Size = UDim2.fromScale(1, 0.575)
                }, {
                    ItemFrame = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0.7,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.85, 0.85),
                        BackgroundColor3 = Theme.Gray
                    }, {
                        ImageIcon = u2.createElement("ImageLabel", {
                            [u2.Ref] = u13,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.95, 0.95),
                            Image = v7.image
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) }),
                        ItemQuantity = u2.createElement("TextLabel", {
                            RichText = true,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            TextScaled = true,
                            Text = "<b>x" .. tostring(u5.merchantItem.quantity) .. "</b>",
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.RobotoMono,
                            AnchorPoint = Vector2.new(1, 1),
                            Position = UDim2.fromScale(1, 1),
                            Size = UDim2.fromScale(0.25, 0.25)
                        }),
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }),
                        u2.createElement("UIStroke", {
                            Thickness = 1,
                            Color = Color3.fromRGB(255, 255, 255)
                        })
                    })
                })
            });
        end;

        if u14 then
            v23[v24 + 1] = u14;
        end;

        local v34 = #v23;
        local v35 = u5.merchantItem.category == MerchantItemCategory.BUFF;

        if v35 then
            local v36 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.175),
                Size = UDim2.fromScale(1, 0.575)
            };
            local v37 = {};
            local _ = #v37;
            local v38 = {
                RichText = true
            };
            local v39 = TravelingMerchantUtil:getShopItemBuffDescription(u5.merchantItem.item);
            v38.Text = v39 == nil and "A buff will be applied to your team." or v39;
            v38.TextColor3 = Color3.fromRGB(255, 255, 255);
            v38.Font = Enum.Font.RobotoMono;
            v38.AnchorPoint = Vector2.new(0.5, 0.5);
            v38.Position = UDim2.fromScale(0.5, 0.5);
            v38.Size = UDim2.fromScale(0.9, 0.8);
            v38.BackgroundTransparency = 1;
            v38.BorderSizePixel = 0;
            v38.TextScaled = true;
            v37.ItemQuantity = u2.createElement("TextLabel", v38);
            v35 = u2.createFragment({
                BuffContainer = u2.createElement("Frame", v36, v37)
            });
        end;

        if v35 then
            v23[v34 + 1] = v35;
        end;

        local _ = #v23;
        v23.CostPrefix = u2.createElement("TextLabel", {
            RichText = true,
            Text = "<b>Cost</b>",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 32,
            TextScaled = true,
            TextWrap = false,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.RobotoMono,
            Position = UDim2.fromScale(0.01, 0.735),
            Size = UDim2.fromScale(0.4, 0.25)
        });
        v23.PriceContainer = u2.createElement("Frame", {
            BackgroundTransparency = 0.7,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.67, 0.765),
            Size = UDim2.fromScale(0.5, 0.2),
            BackgroundColor3 = Theme.Gray
        }, {
            CurrencyImageIcon = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Image = v8.image
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            ItemCost = u2.createElement("TextLabel", {
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                Text = "<b>" .. tostring(u5.merchantItem.cost) .. "</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.RobotoMono,
                Size = UDim2.fromScale(0.5, 0.8)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, -8)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }),
            u2.createElement("UIStroke", {
                Thickness = 1,
                Color = Color3.fromRGB(255, 255, 255)
            })
        });
        v21.UsableArea = u2.createElement("Frame", v22, v23);
        v19.BillboardFrame = u2.createElement("ImageLabel", v20, v21);

        return u2.createFragment({
            TravelingMerchantItemPopup = u2.createElement("BillboardGui", v18, v19)
        });
    end)
};