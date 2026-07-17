-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LockerPreviewFullscreenFooter = v3.new(u2)(function(u4) -- Line: 12
        -- upvalues: u2 (copy), ColorUtil (copy), Empty (copy), Button (copy), Theme (copy), KnitClient (copy), BedwarsImageId (copy)
        return u2.createFragment({
            LockerPreviewFullscreenBackground = u2.createFragment({
                LockerPreviewFullscreenBackground = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.2,
                    ZIndex = -1,
                    Size = UDim2.new(2, 0, 0.15, 0),
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u2.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new((1 / 0), 75)
                    }) })
            }),
            u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0.15, 0),
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1)
            }, {
                u2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new((1 / 0), 75)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }),
                LockerPreviewRight = u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 20),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 0,
                        Size = UDim2.fromScale(0.5, 1),
                        Text = "<b>" .. u4.name .. "</b> <font transparency=\'.4\'>(" .. u4.previewName .. ")</font>",
                        TextColor3 = ColorUtil.WHITE,
                        Font = Enum.Font.Roboto,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) }),
                    ReplayButton = u2.createElement(Button, {
                        Text = "<b>REPLAY</b>",
                        LayoutOrder = 1,
                        BackgroundColor3 = Theme.backgroundPrimary,
                        Size = UDim2.fromScale(0.5, 1),

                        OnClick = function() -- Line: 77, Name: OnClick
                            -- upvalues: KnitClient (ref), u4 (copy)
                            KnitClient.Controllers.LockerPreviewController:preview(u4.previewItem);
                        end,

                        CornerRadius = UDim.new(0, 6),
                        Visible = u4.canReplay
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 3.795918367346939,
                            DominantAxis = "Height"
                        }) })
                }),
                LockerPreviewLeft = u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    ReturnButton = u2.createElement(Button, {
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Image = BedwarsImageId.ARROW_LEFT,
                        Size = UDim2.fromScale(0.2, 1),

                        OnClick = function() -- Line: 106, Name: OnClick
                            -- upvalues: KnitClient (ref), u4 (copy)
                            KnitClient.Controllers.LockerPreviewController:closeFullscreenPreview();

                            if u4.onClose then
                                u4.onClose();
                            end;
                        end,

                        CornerRadius = UDim.new(0, 6)
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1,
                            DominantAxis = "Height"
                        }) })
                })
            })
        });
    end)
};