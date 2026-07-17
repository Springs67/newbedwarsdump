-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    GameUpdateKitCardTop = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: Theme (copy), u2 (copy), ImageId (copy), ButtonComponent (copy), TweenService (copy), ColorUtil (copy), ShineEffect (copy), ShineEffectVariation (copy), Empty (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local PromoCard = p4.PromoCard;

        local function v11() -- Line: 18
            -- upvalues: PromoCard (copy), Theme (ref), u2 (ref), ImageId (ref), ButtonComponent (ref)
            local v6 = {
                LayoutOrder = 4,
                ZIndex = 4,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 0.98),
                Size = UDim2.new(1, 0, 0.35, 0)
            };
            local v7;

            if PromoCard.isOwned then
                v7 = Theme.backgroundError;
            else
                v7 = Theme.backgroundSuccess;
            end;

            v6.BackgroundColor3 = v7;

            function v6.OnClick() -- Line: 24
                -- upvalues: PromoCard (ref)
                if PromoCard.OnClick then
                    PromoCard.OnClick();
                end;
            end;

            v6.CornerRadius = UDim.new(0.2, 0);
            local v8 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0.04, 0)
                }) };
            local v9 = #v8;
            local v10 = not PromoCard.isOwned and u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                LayoutOrder = 1,
                ZIndex = 4,
                Image = ImageId.ROBUX,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0.65, 0.65)
            });

            if v10 then
                v8[v9 + 1] = v10;
            end;

            v8[#v8 + 1] = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                RichText = true,
                AutoLocalize = false,
                Font = "Roboto",
                TextXAlignment = "Left",
                LayoutOrder = 2,
                ZIndex = 4,
                Text = "<b>" .. tostring(PromoCard.isOwned and "PURCHASED" or PromoCard.Price) .. "</b>",
                Size = UDim2.fromScale(0, 0.45),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            });

            return u2.createElement(ButtonComponent, v6, v8);
        end;

        local u12 = u2.createRef();
        useEffect(function() -- Line: 75
            -- upvalues: u12 (copy), TweenService (ref)
            local u13 = u12:getValue();
            u13.MouseEnter:Connect(function() -- Line: 77
                -- upvalues: u13 (copy), TweenService (ref)
                local v14 = TweenInfo.new(0.3, Enum.EasingStyle.Circular);
                TweenService:Create(u13:WaitForChild("ImageBackground"), v14, {
                    Size = UDim2.fromScale(1.6, 1.6)
                }):Play();
                TweenService:Create(u13:WaitForChild("ImageBlackOverlay"), v14, {
                    Transparency = 1
                }):Play();
            end);
            u13.MouseLeave:Connect(function() -- Line: 88
                -- upvalues: u13 (copy), TweenService (ref)
                local v15 = TweenInfo.new(0.3, Enum.EasingStyle.Circular);
                TweenService:Create(u13:WaitForChild("ImageBackground"), v15, {
                    Size = UDim2.fromScale(1.75, 1.75)
                }):Play();
                TweenService:Create(u13:WaitForChild("ImageBlackOverlay"), v15, {
                    Transparency = 0.7
                }):Play();
            end);
        end, {});
        local v16 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            [u2.Ref] = u12,
            [u2.Event.Activated] = PromoCard.OnClick
        };
        local v17 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 2.0849056603773586
            }),
            ImageBackground = u2.createElement("ImageLabel", {
                AutomaticSize = "Y",
                ImageTransparency = 0.7,
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1.5, 1.5),
                Image = PromoCard.BannerImage
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }) }),
            ImageBlackOverlay = u2.createElement("Frame", {
                BackgroundTransparency = 0.7,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }) }),
            u2.createElement(ShineEffect, {
                Speed = 0.55,
                Loop = false,
                OnHover = true,
                ZIndex = 3,
                Variation = ShineEffectVariation.solid
            })
        };
        local v18 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = { u2.createElement("UIPadding", {
                PaddingTop = p4.PaddingVertical,
                PaddingBottom = p4.PaddingVertical,
                PaddingLeft = p4.PaddingHorizontal,
                PaddingRight = p4.PaddingHorizontal
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v20 = #v19;
        local v21 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.4, 1)
        };
        local v22 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1,
                AspectType = "ScaleWithParentSize"
            }) };
        local v23 = #v22;
        local v24;

        if PromoCard.PromoItemImage == nil then
            v24 = false;
        else
            v24 = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = PromoCard.PromoItemImage
            });
        end;

        if v24 then
            v22[v23 + 1] = v24;
        end;

        local v25 = #v22;
        local v26 = PromoCard.PromoItemImageElement and PromoCard.PromoItemImageElement;

        if v26 then
            v22[v25 + 1] = v26;
        end;

        v19[v20 + 1] = u2.createElement("ImageLabel", v21, v22);
        local v27 = {
            Size = UDim2.new(0.5499999999999999, 0, 1, 0)
        };
        local v28 = {};
        local v29 = #v28;
        local v30 = {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            TextXAlignment = "Left",
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.new(1, 0, 0.15, 0),
            Font = Enum.Font.Roboto,
            TextColor3 = ColorUtil.WHITE
        };
        local ItemType = PromoCard.ItemType;

        if ItemType ~= nil then
            ItemType = string.upper(ItemType);
        end;

        v30.Text = "<b>" .. ItemType .. "</b>";
        v30.AutoLocalize = false;
        v30.LayoutOrder = 1;
        v30.ZIndex = 4;
        v28[v29 + 1] = u2.createElement("TextLabel", v30);
        v28[v29 + 2] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            TextXAlignment = "Left",
            AutoLocalize = false,
            LayoutOrder = 2,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0.18),
            Size = UDim2.new(1, 0, 0.3, 0),
            Font = Enum.Font.Roboto,
            TextColor3 = Theme.textPrimary,
            Text = "<b>" .. PromoCard.Name .. "</b>"
        });
        local v31;

        if p4.PromoCard.Price == nil or p4.PromoCard.Price <= 0 then
            v31 = false;
        else
            v31 = u2.createElement(v11);
        end;

        if v31 then
            v28[v29 + 3] = v31;
        end;

        v19[v20 + 2] = u2.createElement(Empty, v27, v28);
        v17[#v17 + 1] = u2.createElement("Frame", v18, v19);

        return u2.createFragment({
            TopHalf = u2.createElement("ImageButton", v16, v17)
        });
    end)
};