-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;

return {
    CustomKitCreation_AbilityPropertyDropdownGUI = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: CustomKitUtil (copy), u2 (copy), DropdownComponent (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local u6 = CustomKitUtil.getAbilityPropertyDropdownItems(u4.CommonProps.Ability, u4.CustomAbilityProperty);

        local function v9(u7) -- Line: 13
            -- upvalues: u6 (copy)
            local function _(p8) -- Line: 14
                -- upvalues: u7 (copy)
                return p8.value == u7;
            end;

            for i, v in u6 do
                local _ = i - 1;

                if v.value == u7 == true then
                    return v;
                end;
            end;

            return nil;
        end;

        local v10 = #u6 ~= 0;

        if v10 then
            local v11 = {
                Size = UDim2.new(1, 0, 0, 50),
                LayoutOrder = u4.LayoutOrder
            };
            local v12 = {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 0),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                CustomKitCreation_AbilityPropertyDropdown_Label = u2.createElement("TextLabel", {
                    TextTransparency = 0,
                    TextSize = 20,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(0.45, 1),
                    Text = u4.Label,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            };
            local _ = #v12;
            local v13 = {};
            local DefaultValue = u4.DefaultValue;
            local v14;

            if DefaultValue == "" or not DefaultValue then
                v14 = u6[1];
            else
                v14 = v9(u4.DefaultValue) or u6[1];
            end;

            v13.DefaultItem = v14;
            v13.Items = u6;

            function v13.OnItemSelected(p15) -- Line: 58
                -- upvalues: u4 (copy)
                u4.OnItemChanged(p15);
            end;

            v13.Size = UDim2.fromScale(0.55, 1);
            v13.LayoutOrder = 1;
            local DefaultValue2 = u4.DefaultValue;
            local v16;

            if DefaultValue2 == "" or not DefaultValue2 then
                v16 = u6[1];
            else
                v16 = v9(u4.DefaultValue);
            end;

            v12["CustomKitCreation_AbilityPropertyDropdown_" .. tostring(v16)] = u2.createElement(DropdownComponent, v13);
            local DefaultValue3 = u4.DefaultValue;
            local createFragment = u2.createFragment;
            local v17 = {};
            local v18;

            if DefaultValue3 == "" or not DefaultValue3 then
                v18 = u6[1];
            else
                v18 = v9(u4.DefaultValue);
            end;

            v17["CustomKitCreation_AbilityPropertyDropdownWrapper_" .. tostring(v18)] = u2.createElement(Empty, v11, v12);
            v10 = createFragment(v17);
        end;

        local v19 = {};
        local v20 = #v19;

        if v10 then
            v19[v20 + 1] = v10;
        end;

        return u2.createFragment(v19);
    end)
};