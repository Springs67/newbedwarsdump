-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    TipsUi = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: u2 (copy), TweenService (copy), DeviceUtil (copy), ColorUtil (copy), KnitClient (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local u7 = u2.createRef();
        useEffect(function() -- Line: 19
            -- upvalues: u6 (copy), u7 (copy), u4 (copy), TweenService (ref), DeviceUtil (ref)
            local u8 = u6:getValue();
            local u9 = u7:getValue();
            local Lifetime = u4.Lifetime;
            local u10 = math.max(Lifetime == nil and 10 or Lifetime, 0.6);

            local function u11() -- Line: 30
                -- upvalues: TweenService (ref), u8 (copy), u10 (copy), u9 (copy)
                TweenService:Create(u8, TweenInfo.new(0.1), {
                    Position = UDim2.new(1, -10, 0.1, 10)
                }):Play();
                task.delay(u10 - 0.5, function() -- Line: 34
                    -- upvalues: TweenService (ref), u8 (ref)
                    TweenService:Create(u8, TweenInfo.new(0.5), {
                        Position = UDim2.new(2, -10, 0.1, 10)
                    }):Play();
                end);
                TweenService:Create(u9, TweenInfo.new(u10 - 0.5, Enum.EasingStyle.Linear), {
                    Size = UDim2.new(0, 0, 0, 2)
                }):Play();
            end;

            if DeviceUtil.isHoarceKat() then
                task.delay(1, function() -- Line: 44
                    -- upvalues: u11 (copy)
                    return u11();
                end);

                return;
            end;

            u11();
        end);

        return u2.createFragment({
            Tips = u2.createElement("ScreenGui", {
                DisplayOrder = 49,
                ResetOnSpawn = false,
                IgnoreGuiInset = true
            }, {
                TipsContainer = u2.createElement("ImageButton", {
                    [u2.Ref] = u6,
                    Size = UDim2.new(0.3, 0, 0.2, 0),
                    Position = UDim2.new(2, -10, 0.1, 10),
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundColor3 = ColorUtil.hexColor(295),
                    BackgroundTransparency = 0.2,
                    BorderSizePixel = 0,

                    [u2.Event.Activated] = function() -- Line: 65
                        -- upvalues: DeviceUtil (ref), KnitClient (ref)
                        if DeviceUtil.isHoarceKat() then
                            return nil;
                        end;

                        KnitClient.Controllers.TipsController:dismissTip();
                    end
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.02, 0),
                        PaddingBottom = UDim.new(0.02, 0),
                        PaddingLeft = UDim.new(0.04, 0),
                        PaddingRight = UDim.new(0.04, 0)
                    }),
                    u2.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(380, 90)
                    }),
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 4.222222222222222
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 10)
                    }),
                    u2.createElement("UIStroke", {
                        Thickness = 3,
                        Color = ColorUtil.hexColor(42957)
                    }),
                    u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, -2)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.02, 0)
                        }), u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = BedwarsImageId.EXCLAMATION_CIRCLE,
                            Size = UDim2.fromScale(0.1, 1),
                            ScaleType = Enum.ScaleType.Fit,
                            ImageColor3 = ColorUtil.hexColor(63231)
                        }), u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            TextScaled = true,
                            TextWrapped = true,
                            Text = u4.Text,
                            Size = UDim2.fromScale(0.88, 1),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = 20
                            }) }) }),
                    TipDisplayTimer = u2.createElement("Frame", {
                        [u2.Ref] = u7,
                        Size = UDim2.new(1, 0, 0, 2),
                        Position = UDim2.fromScale(0, 1),
                        AnchorPoint = Vector2.new(0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Color3.fromRGB(0, 199, 227)
                    })
                })
            })
        });
    end)
};