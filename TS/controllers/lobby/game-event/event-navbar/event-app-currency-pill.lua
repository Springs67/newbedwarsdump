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
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;

return {
    EventAppCurrencyPill = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: EventCurrencyMeta (copy), u2 (copy), ClientStore (copy), default (copy), Linear (copy), StringUtil (copy), Padding (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local v6 = EventCurrencyMeta[u4.Currency];
        local u7, u8 = p5.useState(0);
        local u9 = u2.createRef();
        useEffect(function() -- Line: 21
            -- upvalues: u9 (copy), ClientStore (ref), u4 (copy)
            local u10 = u9:getValue();

            if not u10 then
                return nil;
            end;

            task.spawn(function() -- Line: 26
                -- upvalues: ClientStore (ref), u4 (ref), u10 (copy)
                task.wait();
                local v11 = {
                    type = "SetEventPartial"
                };
                local v12 = {};
                local currencyGuiLocations = ClientStore:getState().Event.currencyGuiLocations;
                currencyGuiLocations[u4.Currency] = u10.AbsolutePosition;
                v12.currencyGuiLocations = currencyGuiLocations;
                v11.data = v12;
                ClientStore:dispatch(v11);
            end);
        end, {});
        local u13 = u2.createRef();
        useEffect(function() -- Line: 45
            -- upvalues: u13 (copy), default (ref), Linear (ref), StringUtil (ref), u7 (copy), u4 (copy), u8 (copy)
            local u14 = u13:getValue();

            if not u14 then
                return nil;
            end;

            default(0.5, Linear, function(p15) -- Line: 50
                -- upvalues: u14 (copy), StringUtil (ref)
                u14.Text = "<b>" .. StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(p15, 0)))) .. "</b>";
            end, u7, u4.CurrAmount);
            u8(u4.CurrAmount);
        end, { u4.CurrAmount });

        return u2.createFragment({
            CurrencyAmountPill = u2.createElement("Frame", {
                Size = UDim2.fromScale(0.5, 1),
                BackgroundColor3 = Color3.fromHex("#39385A"),
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                [u2.Ref] = u9
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
                    Image = v6.icon
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            TextSize = 16,
                            Text = v6.name,
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
                    [u2.Ref] = u13
                })
            })
        });
    end)
};