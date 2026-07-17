-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local image = getItemMeta(ItemType.IRON).image;
local image2 = getItemMeta(ItemType.DIAMOND).image;

return {
    RadioactivePlantBillboard = v2.new(u1)(function(u3, p4) -- Line: 13
        -- upvalues: u1 (copy), image (copy), image2 (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(0);
        local v7, u8 = useState(0);
        useEffect(function() -- Line: 20
            -- upvalues: u3 (copy), u6 (copy), u8 (copy)
            u3.radioactivePlantInstance:GetAttributeChangedSignal("IronDeposits"):Connect(function() -- Line: 21
                -- upvalues: u3 (ref), u6 (ref)
                u6((u3.radioactivePlantInstance:GetAttribute("IronDeposits")));
            end);
            u3.radioactivePlantInstance:GetAttributeChangedSignal("DiamondDeposits"):Connect(function() -- Line: 25
                -- upvalues: u3 (ref), u8 (ref)
                u8((u3.radioactivePlantInstance:GetAttribute("DiamondDeposits")));
            end);
        end, {});

        return u1.createFragment({
            RadioactivePlantBillboard = u1.createElement("BillboardGui", {
                ExtentsOffset = Vector3.new(0, 3.5, 0),
                MaxDistance = 30,
                Adornee = u3.radioactivePlantInstance,
                Size = UDim2.fromScale(5, 6)
            }, {
                BillboardFrame = u1.createElement("ImageLabel", {
                    Image = "rbxassetid://10667281451",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    ImageColor3 = Color3.fromRGB(0, 255, 204)
                }, {
                    UsableArea = u1.createElement("Frame", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0.5, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.8, 0.7)
                    }, {
                        DepositedHeader = u1.createElement("TextLabel", {
                            Text = "<b>DEPOSITED</b>",
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            RichText = true,
                            TextScaled = true,
                            Size = UDim2.fromScale(1, 0.25),
                            Font = Enum.Font.RobotoMono,
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }),
                        DepositedContainer = u1.createElement("Frame", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(1, 0.75),
                            Position = UDim2.fromScale(0, 0.35)
                        }, {
                            u1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0.15, 0)
                            }),
                            IronDeposited = u1.createElement("Frame", {
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(1, 0.35)
                            }, {
                                IronIcon = u1.createElement("ImageLabel", {
                                    BackgroundTransparency = 0.75,
                                    BorderSizePixel = 0,
                                    Image = image,
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.fromScale(0.4, 1),
                                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                                    ScaleType = Enum.ScaleType.Fit
                                }, { u1.createElement("UIStroke", {
                                        Thickness = 1,
                                        Transparency = 0.75
                                    }), u1.createElement("UICorner", {
                                        CornerRadius = UDim.new(0, 4)
                                    }) }),
                                IronCounter = u1.createElement("TextLabel", {
                                    BorderSizePixel = 0,
                                    BackgroundTransparency = 1,
                                    RichText = true,
                                    TextScaled = true,
                                    Text = "x<b>" .. tostring(v5) .. "</b>",
                                    Position = UDim2.fromScale(0.4, 0.15),
                                    Size = UDim2.fromScale(0.6, 0.8),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.RobotoMono
                                })
                            }),
                            DiamondsDeposited = u1.createElement("Frame", {
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(1, 0.35),
                                Position = UDim2.fromScale(0, 0.4)
                            }, {
                                DiamondIcon = u1.createElement("ImageLabel", {
                                    BackgroundTransparency = 0.75,
                                    BorderSizePixel = 0,
                                    Image = image2,
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.fromScale(0.4, 1),
                                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                                    ScaleType = Enum.ScaleType.Fit
                                }, { u1.createElement("UIStroke", {
                                        Thickness = 1,
                                        Transparency = 0.75
                                    }), u1.createElement("UICorner", {
                                        CornerRadius = UDim.new(0, 4)
                                    }) }),
                                DiamondsCounter = u1.createElement("TextLabel", {
                                    BorderSizePixel = 0,
                                    BackgroundTransparency = 1,
                                    RichText = true,
                                    TextScaled = true,
                                    Text = "x<b>" .. tostring(v7) .. "</b>",
                                    Position = UDim2.fromScale(0.4, 0.15),
                                    Size = UDim2.fromScale(0.6, 0.8),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.RobotoMono
                                })
                            })
                        })
                    })
                })
            })
        });
    end)
};