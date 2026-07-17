-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    CustomKitCreation_PropertyLabel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), u2 (copy), DeviceUtil (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.new();
        useEffect(function() -- Line: 11
            -- upvalues: u5 (copy)
            return function() -- Line: 12
                -- upvalues: u5 (ref)
                u5:DoCleaning();
            end;
        end, {});

        return u2.createFragment({
            CustomKitCreation_AbilityCustomization_Label = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                TextTransparency = 0,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 45),
                Text = p3.Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = p3.LayoutOrder
            })
        });
    end)
};