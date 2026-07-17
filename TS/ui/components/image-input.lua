-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local TextInputComponent = v1.TextInputComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ImageInput = v3.new(u2)(function(u5, p6) -- Line: 12
        -- upvalues: u4 (copy), u2 (copy), Theme (copy), TextInputComponent (copy), Empty (copy)
        local _ = p6.useValue;
        local v7, u8 = p6.useState("");

        local function _(p9) -- Line: 16
            -- upvalues: u4 (ref)
            local v10 = not u4.startsWith(p9, "rbxassetid://") and tonumber(p9);

            if v10 == 0 or (v10 ~= v10 or not v10) then
                return p9;
            end;

            return "rbxassetid://" .. p9;
        end;

        local StartingValue = u5.StartingValue;

        if StartingValue == nil then
            StartingValue = string.lower(v7);
        end;

        local v11 = not u4.startsWith(StartingValue, "rbxassetid://") and tonumber(StartingValue);

        if v11 ~= 0 and (v11 == v11 and v11) then
            StartingValue = "rbxassetid://" .. StartingValue;
        end;

        local v12 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local ContainerProps = u5.ContainerProps;

        if ContainerProps then
            for i, v in ContainerProps do
                v12[i] = v;
            end;
        end;

        local v13 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }) };
        local v14 = #v13;
        local v15 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.new(0.5, 0, 0, 60),
            AnchorPoint = Vector2.new(0, 1),
            Image = StartingValue,
            ScaleType = Enum.ScaleType.Crop,
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v16 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v17 = #v16;
        local v18;

        if StartingValue == "" then
            v18 = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "NO IMAGE",
                TextTransparency = 0.1,
                TextSize = 12,
                Size = UDim2.new(1, 0, 0, 12),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextColor3 = Color3.new(1, 1, 1),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            });
        else
            v18 = false;
        end;

        if v18 then
            v16[v17 + 1] = v18;
        end;

        v13[v14 + 1] = u2.createElement("ImageLabel", v15, v16);
        local v19 = {
            LayoutOrder = 2,
            Size = UDim2.new(0.5, 0, 0, 46)
        };
        local v20 = {};
        local v21 = #v20;
        local v22 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 12)
        };
        local InputBoxLabel = u5.InputBoxLabel;
        v22.Text = InputBoxLabel == nil and "Image Asset Id" or InputBoxLabel;
        v22.TextXAlignment = Enum.TextXAlignment.Left;
        v22.TextColor3 = Color3.new(1, 1, 1);
        v22.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v22.TextTransparency = 0.1;
        v22.TextSize = 12;
        v20[v21 + 1] = u2.createElement("TextLabel", v22);
        local v23 = {};
        local v24 = {
            Position = UDim2.fromOffset(0, 18),
            Size = UDim2.new(1, 0, 0, 28)
        };
        local StartingValue2 = u5.StartingValue;
        v24.Text = StartingValue2 == nil and "" or StartingValue2;
        v24.PlaceholderText = "rbxassetid://12345";
        v24.ClearTextOnFocus = false;
        v24.TextXAlignment = Enum.TextXAlignment.Left;
        v23.TextBox = v24;

        function v23.OnFocusLost(p25) -- Line: 120
            -- upvalues: u5 (copy), u8 (copy)
            u5.OnInput(p25);
            u8(p25);
        end;

        v23.MaxCharacters = 30;
        v20[v21 + 2] = u2.createElement(TextInputComponent, v23, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) });
        v13[v14 + 2] = u2.createElement(Empty, v19, v20);

        return u2.createFragment({
            ImageInputContainer = u2.createElement(Empty, v12, v13)
        });
    end)
};