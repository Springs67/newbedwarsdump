-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types");
local discountColor = v3.discountColor;
local discountImage = v3.discountImage;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    MerchantDiscount = v2.new(u1)(function(p4, p5) -- Line: 11
        -- upvalues: u1 (copy), TweenService (copy), Empty (copy), Theme (copy), discountColor (copy), discountImage (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u1.createRef();
        useEffect(function() -- Line: 15
            -- upvalues: u6 (copy), TweenService (ref)
            local u7 = u6:getValue();
            local v13 = (function() -- Line: 17
                -- upvalues: u7 (copy), TweenService (ref)
                if u7 then
                    local u8 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential);
                    local v9 = TweenService:Create(u7, u8, {
                        Position = UDim2.fromScale(0, 0)
                    });
                    local v10 = u7:GetDescendants();

                    local function v12(p11) -- Line: 26
                        -- upvalues: TweenService (ref), u8 (copy)
                        if p11:IsA("TextLabel") then
                            TweenService:Create(p11, u8, {
                                TextTransparency = 0
                            }):Play();

                            return;
                        end;

                        if p11:IsA("ImageLabel") then
                            TweenService:Create(p11, u8, {
                                ImageTransparency = 0
                            }):Play();

                            return;
                        end;

                        if p11:IsA("UIStroke") then
                            TweenService:Create(p11, u8, {
                                Transparency = 0
                            }):Play();
                        end;
                    end;

                    for i, v in v10 do
                        v12(v, i - 1, v10);
                    end;

                    return v9;
                end;
            end)();

            if v13 ~= nil then
                v13:Play();
            end;

            return function() -- Line: 51
            end;
        end, {});

        return u1.createFragment({
            DiscountElementWrapper = u1.createElement(Empty, {
                ZIndex = 100,
                Size = UDim2.fromOffset(225, 40),
                Position = UDim2.fromScale(0.025, 0)
            }, {
                DiscountElement = u1.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(-1, 0),
                    ZIndex = 100,
                    BackgroundColor3 = Theme.backgroundPrimary,
                    BorderSizePixel = 3,
                    BorderColor3 = discountColor[p4.item.tier],
                    [u1.Ref] = u6
                }, { u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ZIndex = 102,
                        Image = discountImage[p4.item.tier],
                        Size = UDim2.fromOffset(32, 32),
                        Position = UDim2.fromScale(0.075, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }), u1.createElement("TextLabel", {
                        TextSize = 22,
                        BackgroundTransparency = 1,
                        ZIndex = 101,
                        Font = Enum.Font.Roboto,
                        Text = tostring(p4.refund) .. " " .. p4.item.item.currency .. " refunded",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }) })
            })
        });
    end)
};