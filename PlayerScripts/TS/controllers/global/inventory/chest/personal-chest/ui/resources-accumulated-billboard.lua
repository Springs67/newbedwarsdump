-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;

return {
    ResourcesAccumulatedBillboard = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: u1 (copy), ItemType (copy), u2 (copy), BalanceFile (copy)
        local useEffect = p5.useEffect;
        local useState = p5.useState;
        local _ = p5.useMemo;
        local v6, u7 = useState(0);
        local v8, u9 = useState(0);
        local v10, u11 = useState(false);
        useEffect(function() -- Line: 20
            -- upvalues: u1 (ref), u4 (copy), ItemType (ref), u7 (copy), u9 (copy), u11 (copy)
            local u12 = u1.new();
            u12:GiveTask(u4.updateResourceCountsSignal:Connect(function(p13) -- Line: 22
                -- upvalues: ItemType (ref), u7 (ref), u9 (ref)
                local v14 = p13[ItemType.IRON];
                u7(v14 == nil and 0 or v14);
                local v15 = p13[ItemType.EMERALD];
                u9(v15 == nil and 0 or v15);
            end));
            u12:GiveTask(u4.enableBillboardSignal:Connect(function(p16) -- Line: 38
                -- upvalues: u11 (ref)
                u11(p16);
            end));

            return function() -- Line: 41
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end;
        end, {});

        return u2.createFragment({
            ChestBillboard = u2.createElement("BillboardGui", {
                ExtentsOffset = Vector3.new(0, 3, 0),
                AlwaysOnTop = true,
                Adornee = u4.chest,
                Size = UDim2.fromScale(5, 6),
                MaxDistance = BalanceFile.SPLIT_RANGE,
                Enabled = v10
            }, {
                BillboardFrame = u2.createElement("ImageLabel", {
                    Image = "rbxassetid://10667281451",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    ImageColor3 = Color3.fromRGB(0, 255, 204)
                }, {
                    UsableArea = u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0.5, 0.6),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.8, 0.7)
                    }, {
                        AccumulatedHeader = u2.createElement("TextLabel", {
                            Text = "RESOURCES ACCUMULATED",
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            RichText = true,
                            TextScaled = true,
                            Size = UDim2.fromScale(1, 0.225),
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }),
                        Container = u2.createElement("Frame", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(1, 0.725),
                            Position = UDim2.fromScale(0, 0.3725)
                        }, {
                            u2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0.15, 0)
                            }),
                            IronAccumulated = u2.createElement("Frame", {
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(1, 0.35)
                            }, {
                                IronIcon = u2.createElement("ImageLabel", {
                                    Image = "rbxassetid://6850537969",
                                    BackgroundTransparency = 0.75,
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.fromScale(0.4, 1),
                                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                                    ScaleType = Enum.ScaleType.Fit
                                }, { u2.createElement("UIStroke", {
                                        Thickness = 1,
                                        Transparency = 0.75
                                    }), u2.createElement("UICorner", {
                                        CornerRadius = UDim.new(0, 4)
                                    }) }),
                                IronCounter = u2.createElement("TextLabel", {
                                    BorderSizePixel = 0,
                                    BackgroundTransparency = 1,
                                    RichText = true,
                                    TextScaled = true,
                                    Text = "x<b>" .. tostring(v6) .. "</b>",
                                    Position = UDim2.fromScale(0.4, 0.15),
                                    Size = UDim2.fromScale(0.6, 0.8),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                                })
                            }),
                            EmeraldsAccumulated = u2.createElement("Frame", {
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(1, 0.35),
                                Position = UDim2.fromScale(0, 0.4)
                            }, {
                                EmeraldIcon = u2.createElement("ImageLabel", {
                                    Image = "rbxassetid://6850538075",
                                    BackgroundTransparency = 0.75,
                                    BorderSizePixel = 0,
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.fromScale(0.4, 1),
                                    SizeConstraint = Enum.SizeConstraint.RelativeXY,
                                    ScaleType = Enum.ScaleType.Fit
                                }, { u2.createElement("UIStroke", {
                                        Thickness = 1,
                                        Transparency = 0.75
                                    }), u2.createElement("UICorner", {
                                        CornerRadius = UDim.new(0, 4)
                                    }) }),
                                EmeraldCounter = u2.createElement("TextLabel", {
                                    BorderSizePixel = 0,
                                    BackgroundTransparency = 1,
                                    RichText = true,
                                    TextScaled = true,
                                    Text = "x<b>" .. tostring(v8) .. "</b>",
                                    Position = UDim2.fromScale(0.4, 0.15),
                                    Size = UDim2.fromScale(0.6, 0.8),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                                })
                            })
                        })
                    })
                })
            })
        });
    end)
};