-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfileKitShopCard = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: BedwarsKitMeta (copy), u2 (copy), ColorUtil (copy), BedwarsImageId (copy), Theme (copy), ButtonComponent (copy), StringUtil (copy), KitViewport (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = BedwarsKitMeta[u4.Kit];

        local function v9() -- Line: 17
            -- upvalues: u4 (copy), u2 (ref), ColorUtil (ref), BedwarsImageId (ref), Theme (ref), ButtonComponent (ref), StringUtil (ref)
            if u4.Locked then
                return u2.createFragment({
                    ShopLockedOverlay = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0.4,
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 0.7),
                        AnchorPoint = Vector2.new(0.5, 1),
                        Position = UDim2.fromScale(0.5, 1),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, {
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 6)
                        }),
                        u2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0.15, 0),
                            PaddingBottom = UDim.new(0.15, 0),
                            PaddingLeft = UDim.new(0.05, 0),
                            PaddingRight = UDim.new(0.05, 0)
                        }),
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            Padding = UDim.new(0.1, 0)
                        }),
                        u2.createElement("ImageLabel", {
                            SizeConstraint = "RelativeYY",
                            ScaleType = "Fit",
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.3),
                            Image = BedwarsImageId.LOCK_SOLID
                        }),
                        u2.createElement("TextLabel", {
                            TextScaled = true,
                            RichText = true,
                            Font = "Roboto",
                            TextXAlignment = "Center",
                            TextYAlignment = "Center",
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.6),
                            Text = "<b>Unlocked when <font color=\"" .. ColorUtil.richTextColor(Theme.mcYellow) .. "\">(Kit Shop Lv." .. tostring(u4.Index - 1) .. ")</font> reached</b>",
                            TextColor3 = ColorUtil.WHITE
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 14
                            }) })
                    })
                });
            end;

            if u4.Purchased then
                return u2.createElement(ButtonComponent, {
                    Text = "Purchased",
                    Disabled = true,
                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Size = UDim2.fromScale(0.9, 0.4),
                    BackgroundColor3 = Theme.backgroundPrimary,

                    OnClick = function() -- Line: 95, Name: OnClick
                    end
                });
            end;

            local createElement = u2.createElement;
            local v7 = {
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(0.9, 0.4)
            };
            local v8;

            if u4.CantBuy then
                v8 = Theme.backgroundError;
            else
                v8 = Theme.backgroundSuccess;
            end;

            v7.BackgroundColor3 = v8;
            v7.Text = StringUtil.formatNumberWithCommas(u4.Price) .. " Coins";

            function v7.OnClick() -- Line: 78
                -- upvalues: u4 (ref)
                if u4.CantBuy or u4.Disabled then
                    return nil;
                end;

                u4.OnPurchase(u4.Kit);
            end;

            v7.Disabled = u4.Disabled;
            v7.Loading = u4.Loading;

            return createElement(ButtonComponent, v7);
        end;

        return u2.createFragment({
            ClanKitCard = u2.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.3, 1),
                BackgroundColor3 = Theme.backgroundTertiary
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0.1, 0)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.05, 0),
                    PaddingLeft = UDim.new(0.1, 0),
                    PaddingRight = UDim.new(0.1, 0)
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                u2.createElement(KitViewport, {
                    Size = UDim2.fromScale(1, 0.6),
                    Kit = u4.Kit
                }),
                u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.3)
                }, { u2.createElement("TextLabel", {
                        AutomaticSize = "Y",
                        SizeConstraint = "RelativeXX",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0),
                        Text = "<b>" .. v6.name .. "</b>",
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }), v9() })
            })
        });
    end)
};