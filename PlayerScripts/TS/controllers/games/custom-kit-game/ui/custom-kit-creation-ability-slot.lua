-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomKitCreation_AbilitySlot = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: u2 (copy), u3 (copy), Empty (copy), DeviceUtil (copy), Button (copy), Theme (copy), ColorUtil (copy), CustomKitUtil (copy), BedwarsImageId (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u2.new();
        useEffect(function() -- Line: 18
            -- upvalues: u7 (copy)
            return function() -- Line: 19
                -- upvalues: u7 (ref)
                u7:DoCleaning();
            end;
        end, {});
        local createFragment = u3.createFragment;
        local v8 = {};
        local createElement = u3.createElement;
        local v9 = {
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 45),
            LayoutOrder = u5.LayoutOrder
        };
        local v10 = {};
        local v11;

        if u5.Ability == nil then
            local createElement2 = u3.createElement;
            local v12 = {
                LayoutOrder = u5.LayoutOrder,
                Size = UDim2.fromScale(1, 1)
            };
            local v13 = {};
            local createElement3 = u3.createElement;
            local v14 = {
                Text = "N/A",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.new(0.2, 0, 0, DeviceUtil.isSmallScreen() and 30 or 40),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                TextColor3 = Color3.fromRGB(150, 150, 150),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            };
            local v15;

            if DeviceUtil.isSmallScreen() then
                v15 = Enum.FontSize.Size24;
            else
                v15 = Enum.FontSize.Size28;
            end;

            v14.FontSize = v15;
            v14.TextXAlignment = Enum.TextXAlignment.Left;
            v13.AbilityName = createElement3("TextLabel", v14);
            v13[1] = u3.createElement(Button, {
    LayoutOrder = 1,
    Text = "CREATE ABILITY",
    Selectable = true,
    ZIndex = 60,
    Size = UDim2.new(0.7, 0, 0, DeviceUtil.isSmallScreen() and 30 or 40),
    Position = UDim2.fromScale(1, 0.5),
    AnchorPoint = Vector2.new(1, 0.5),
    BackgroundColor3 = Theme.buttonPrimary,

    OnClick = function() -- Line: 53, Name: OnClick
        -- upvalues: u5 (copy)
        u5.OnClicked();
    end,

    TextLabel = {
        ZIndex = 61,
        TextSize = 26,
        Size = UDim2.fromScale(0.8, 0.55),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
});
            v11 = createElement2(Empty, v12, v13);
        else
            v11 = u3.createElement(Empty, {
                LayoutOrder = u5.LayoutOrder,
                Size = UDim2.fromScale(1, 1)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0.02, 0),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u3.createElement("TextLabel", {
                    LayoutOrder = 1,
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    ZIndex = 60,
                    Size = UDim2.fromScale(0.78, 1),
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Text = "<b>" .. u5.Ability.name .. "</b> <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(125, 125, 125)) .. "\">(" .. tostring(CustomKitUtil.getTotalAbilityCost(u5.Ability)) .. " points)</font>",
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.Roboto,
                    TextXAlignment = Enum.TextXAlignment.Left
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 26
                    }) }), u3.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.2, 1)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0.1, 0)
                    }),
                    EditButton = u3.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.495, 0.6),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,

                        [u3.Event.Activated] = function() -- Line: 110
                            -- upvalues: u5 (copy)
                            u5.OnClicked();
                        end,

                        [u3.Event.MouseEnter] = function(p16) -- Line: 113
                            p16.ImageTransparency = 0.3;
                        end,

                        [u3.Event.MouseLeave] = function(p17) -- Line: 116
                            p17.ImageTransparency = 0;
                        end,

                        Image = BedwarsImageId.EDIT_FILLED_ICON,
                        ZIndex = 120,
                        LayoutOrder = 2,
                        Selectable = true,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    TrashButton = u3.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.495, 0.6),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,

                        [u3.Event.Activated] = function() -- Line: 135
                            -- upvalues: u5 (copy)
                            u5.OnDeleteClicked();
                        end,

                        [u3.Event.MouseEnter] = function(p18) -- Line: 138
                            p18.ImageTransparency = 0.3;
                        end,

                        [u3.Event.MouseLeave] = function(p19) -- Line: 141
                            p19.ImageTransparency = 0;
                        end,

                        Image = BedwarsImageId.TRASH_ICON,
                        ZIndex = 120,
                        LayoutOrder = 3,
                        Selectable = true,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                }) });
        end;

        v10[1] = v11;
        v8.CustomKitCreation_KitSelection_AbilitySlotGUI = createElement(Empty, v9, v10);

        return createFragment(v8);
    end)
};