-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local GameUpdateKitCardBottom = RuntimeLib.import(script, script.Parent, "promo-card-bottom-section").GameUpdateKitCardBottom;
local GameUpdateKitCardTop = RuntimeLib.import(script, script.Parent, "promo-card-top-section").GameUpdateKitCardTop;

return {
    GameUpdatePromoCard = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: Theme (copy), u1 (copy), GameUpdateKitCardTop (copy), GameUpdateKitCardBottom (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = UDim.new(0.06787330316742081, 0);
        local v6 = UDim.new(0.1188118811881188, 0);
        local v7 = {
            AutomaticSize = "Y",
            BorderSizePixel = 0,
            Size = p3.Size or UDim2.fromScale(0.95, 0),
            BackgroundColor3 = Theme.backgroundTertiary,
            LayoutOrder = p3.LayoutOrder
        };
        local v8 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v9 = #v8;
        local v10;

        if p3.PromoCard.Description == nil then
            v10 = false;
        else
            v10 = u1.createElement(
                "UIAspectRatioConstraint",
                {
                    AspectRatio = 0.9866071428571429,
                    AspectType = "ScaleWithParentSize"
                }
            );
        end;

        if v10 then
            v8[v9 + 1] = v10;
        end;

        local v11 = #v8;
        v8[v11 + 1] = u1.createElement(GameUpdateKitCardTop, {
            store = p3.store,
            PromoCard = p3.PromoCard,
            PaddingHorizontal = v5,
            PaddingVertical = v6
        });
        local v12;

        if p3.PromoCard.Description == nil then
            v12 = false;
        else
            v12 = u1.createElement(GameUpdateKitCardBottom, {
                Description = p3.PromoCard.Description,
                PaddingHorizontal = v5,
                PaddingVertical = v6
            });
        end;

        if v12 then
            v8[v11 + 2] = v12;
        end;

        return u1.createFragment({
            ActionButtonKitPurchase = u1.createElement("ImageLabel", v7, v8)
        });
    end)
};