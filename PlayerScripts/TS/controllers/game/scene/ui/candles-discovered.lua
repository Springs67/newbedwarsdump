-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    CandlesDiscovered = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local useEffect = p3.useEffect;
        local v4, u5 = p3.useState(0);
        useEffect(function() -- Line: 9
            -- upvalues: u2 (copy), u5 (copy)
            local u7 = u2.candlesDiscoveredSignal:Connect(function(p6) -- Line: 10
                -- upvalues: u5 (ref)
                u5(p6);
            end);

            return function() -- Line: 13
                -- upvalues: u7 (copy)
                u7:Disconnect();
            end;
        end, {});

        return u1.createElement("ScreenGui", {
            ResetOnSpawn = true
        }, {
            ScreenContainer = u1.createElement("Frame", {
                BorderSizePixel = 0,
                Transparency = 1,
                Size = UDim2.fromScale(1, 1)
            }, {
                CandlesDiscoveredContainer = u1.createElement("Frame", {
                    BorderSizePixel = 0,
                    Transparency = 1,
                    Size = UDim2.fromOffset(125, 50),
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromScale(0, 1)
                }, { u1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), u1.createElement("ImageLabel", {
                        LayoutOrder = 1,
                        Image = "rbxassetid://15188466476",
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.4, 1)
                    }), u1.createElement("TextLabel", {
                        LayoutOrder = 2,
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Text = tostring(v4) .. "/8",
                        Size = UDim2.fromScale(0.6, 1),
                        Font = Enum.Font.RobotoMono,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }) })
            })
        });
    end)
};