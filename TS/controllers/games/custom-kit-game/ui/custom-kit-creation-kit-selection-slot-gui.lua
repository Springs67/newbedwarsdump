-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    CustomKitCreation_KitSelection_SlotGUI = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: u2 (copy), Empty (copy), DeviceUtil (copy), Button (copy), ColorUtil (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;

        return u2.createFragment({
            CustomKitCreation_KitSelection_SlotGUI = u2.createElement(Empty, {
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 40 or 50),
                LayoutOrder = u4.LayoutOrder
            }, {
                SelectButton = u2.createElement(Button, {
                    BorderSizePixel = 0,
                    LayoutOrder = u4.LayoutOrder,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE,
                    BackgroundTransparency = u4.Selected and 0.7 or 0.8,

                    OnClick = function() -- Line: 25, Name: OnClick
                        -- upvalues: u4 (copy)
                        u4.OnClicked();
                    end,

                    CornerRadius = UDim.new(0, 0)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.01, 0),
                        PaddingBottom = UDim.new(0.01, 0),
                        PaddingLeft = UDim.new(0.01, 0),
                        PaddingRight = UDim.new(0.01, 0)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.02, 0),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    KitName = u2.createElement("TextLabel", {
                        LayoutOrder = 0,
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        ZIndex = 60,
                        Size = UDim2.fromScale(0.75, 0.6),
                        Position = UDim2.fromScale(1, 0.5),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Text = u4.Kit.name,
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Left
                    }),
                    EditButton = u2.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.1, 0.6),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,

                        [u2.Event.Activated] = function() -- Line: 62
                            -- upvalues: u4 (copy)
                            u4.OnEditClicked();
                        end,

                        [u2.Event.MouseEnter] = function(p6) -- Line: 65
                            p6.ImageTransparency = 0.3;
                        end,

                        [u2.Event.MouseLeave] = function(p7) -- Line: 68
                            p7.ImageTransparency = 0;
                        end,

                        Image = BedwarsImageId.EDIT_FILLED_ICON,
                        ZIndex = 120,
                        LayoutOrder = 2,
                        Selectable = true,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    TrashButton = u2.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.1, 0.6),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,

                        [u2.Event.Activated] = function() -- Line: 87
                            -- upvalues: u4 (copy)
                            u4.OnDeleteClicked();
                        end,

                        [u2.Event.MouseEnter] = function(p8) -- Line: 90
                            p8.ImageTransparency = 0.3;
                        end,

                        [u2.Event.MouseLeave] = function(p9) -- Line: 93
                            p9.ImageTransparency = 0;
                        end,

                        Image = BedwarsImageId.TRASH_ICON,
                        ZIndex = 120,
                        LayoutOrder = 3,
                        Selectable = true,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                })
            })
        });
    end)
};