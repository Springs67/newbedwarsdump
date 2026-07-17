-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;

return {
    AfkShopAppCurrencyPill = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: u2 (copy), default (copy), Linear (copy), StringUtil (copy), Padding (copy), AfkShopUtils (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local u6, u7 = p5.useState(0);
        local u8 = u2.createRef();
        useEffect(function() -- Line: 19
            -- upvalues: u8 (copy)
            if not u8:getValue() then
                return nil;
            end;
        end, {});
        local u9 = u2.createRef();
        useEffect(function() -- Line: 26
            -- upvalues: u9 (copy), default (ref), Linear (ref), StringUtil (ref), u6 (copy), u4 (copy), u7 (copy)
            local u10 = u9:getValue();

            if not u10 then
                return nil;
            end;

            default(0.5, Linear, function(p11) -- Line: 31
                -- upvalues: u10 (copy), StringUtil (ref)
                u10.Text = "<b>" .. StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(p11, 0)))) .. "</b>";
            end, u6, u4.CurrAmount);
            u7(u4.CurrAmount);
        end, { u4.CurrAmount });

        return u2.createFragment({
            CurrencyAmountPill = u2.createElement("Frame", {
                Size = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = Color3.fromHex("#39385A"),
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                [u2.Ref] = u8
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center",
                    Padding = UDim.new(0, 6)
                }),
                u2.createElement(Padding, {
                    Padding = {
                        Vertical = 5,
                        Horizontal = 6
                    }
                }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = AfkShopUtils.currencyIcon
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            TextSize = 16,
                            Text = AfkShopUtils.name,
                            Font = Enum.Font.SourceSansBold,
                            Limits = Vector2.new(300, 60)
                        }) }) }),
                u2.createElement("TextLabel", {
                    Size = UDim2.fromScale(0.7, 1),
                    Text = "<b>0</b>",
                    TextColor3 = ColorUtil.WHITE,
                    TextScaled = true,
                    RichText = true,
                    TextXAlignment = "Left",
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    [u2.Ref] = u9
                })
            })
        });
    end)
};