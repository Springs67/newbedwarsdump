-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local u3 = { "<b>Preparing shop   </b>", "<b>Preparing shop.  </b>", "<b>Preparing shop.. </b>", "<b>Preparing shop...</b>" };

return {
    TravelingMerchantUnlockCountdown = v2.new(u1)(function(p4, p5) -- Line: 12
        -- upvalues: u1 (copy), u3 (copy), TweenService (copy)
        local useEffect = p5.useEffect;
        local u6 = u1.createRef();
        local u7 = true;
        local u8 = 0;
        useEffect(function() -- Line: 18
            -- upvalues: u6 (copy), u7 (ref), u3 (ref), u8 (ref)
            local u9 = u6:getValue();

            if u9 then
                task.spawn(function() -- Line: 21
                    -- upvalues: u7 (ref), u3 (ref), u8 (ref), u9 (copy)
                    while u7 do
                        u9.Text = u3[u8 % #u3 + 1];
                        u8 = u8 + 1;
                        task.wait(1);
                    end;
                end);
            end;

            return function() -- Line: 30
                -- upvalues: u7 (ref)
                u7 = false;
            end;
        end);
        local u10 = u1.createRef();
        local u11 = TweenInfo.new(p4.shopOpensIn, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
        useEffect(function() -- Line: 37
            -- upvalues: u10 (copy), TweenService (ref), u11 (copy)
            local v12 = u10:getValue();

            if v12 then
                TweenService:Create(v12, u11, {
                    Size = UDim2.fromScale(0, v12.Size.Y.Scale)
                }):Play();
            end;

            return function() -- Line: 45
            end;
        end);

        return u1.createFragment({
            TravelingMerchantCountdown = u1.createElement("BillboardGui", {
                StudsOffset = Vector3.new(1.25, 5, 0),
                AlwaysOnTop = true,
                MaxDistance = 30,
                ResetOnSpawn = false,
                Size = UDim2.fromScale(6, 0.8),
                Adornee = p4.wagonInstance
            }, {
                u1.createElement("TextLabel", {
                    RichText = true,
                    [u1.Ref] = u6,
                    Text = u3[1],
                    Font = Enum.Font.RobotoMono,
                    Size = UDim2.fromOffset(300, 100),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextSize = 26,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u1.createElement("UIPadding", {
                        PaddingTop = UDim.new(-1.5, 0)
                    }) }),
                CountdownContainer = u1.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.5,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    ClockIcon = u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://13417217968",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.1, 0.5),
                        Size = UDim2.fromScale(0.25, 0.75)
                    }, { u1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 0.87,
                            DominantAxis = Enum.DominantAxis.Height
                        }) }),
                    InnerCountdownProgress = u1.createElement("Frame", {
                        BackgroundTransparency = 0.75,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.75, 0.6),
                        Position = UDim2.fromScale(0.5725, 0.5),
                        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    }, {
                        OuterCountdownProgress = u1.createElement("Frame", {
                            [u1.Ref] = u10,
                            Size = UDim2.fromScale(0.95, 0.75),
                            Position = UDim2.fromScale(0.025, 0.1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BorderSizePixel = 0
                        }),
                        u1.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        })
                    }),
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }),
                    u1.createElement("UIStroke", {
                        Thickness = 5,
                        Color = Color3.fromRGB(255, 255, 255)
                    })
                })
            })
        });
    end)
};