-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SlideIn = v1.SlideIn;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ConsumableTypeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").ConsumableTypeMeta;
local ConsumableType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5;

if DeviceUtil.isSmallScreen() then
    u5 = UDim2.fromScale(0.7, 0.8);
else
    u5 = UDim2.fromOffset(1000, 680);
end;

local u6 = UDim2.fromScale(0.5, 0.46);
local u7 = Vector2.new(0.5, 0.5);
local v56 = v3.new(u2)(function(p8, p9) -- Line: 30
    -- upvalues: u2 (copy), BedwarsKitMeta (copy), ConsumableTypeMeta (copy), ConsumableType (copy), Theme (copy), getBedwarsClassMeta (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy), Empty (copy), DeviceUtil (copy), u5 (copy), u6 (copy), u7 (copy), KnitClient (copy), BedwarsImageId (copy), Button (copy), Flamework (copy), BedwarsAppIds (copy), UILayers (copy), ShineEffect (copy), ShineEffectVariation (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p9.useState;
    u2.createRef();
    local u10, u11 = useState(nil);
    local u12;

    if u10 then
        u12 = BedwarsKitMeta[u10];
    else
        u12 = nil;
    end;

    local rentableKits = ConsumableTypeMeta[ConsumableType.KIT_RENTAL_BEGINNER].rentableKits;

    local function u24(u13, p14) -- Line: 36
        -- upvalues: BedwarsKitMeta (ref), Theme (ref), rentableKits (copy), u2 (ref), u11 (copy), u10 (copy), getBedwarsClassMeta (ref), TooltipContainer (ref), AutoSizedText (ref), ColorUtil (ref), Empty (ref)
        local renderImage = BedwarsKitMeta[u13].renderImage;
        local name = BedwarsKitMeta[u13].name;
        local kitClass = BedwarsKitMeta[u13].kitClass;
        local v16 = {
            BackgroundColor3 = Theme.backgroundPrimary,
            Size = UDim2.fromScale(1 / #rentableKits, 1),
            LayoutOrder = p14,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function(p15) -- Line: 45
                -- upvalues: u11 (ref), u13 (copy)
                u11(u13);
            end,

            ClipsDescendants = true,
            ZIndex = 11
        };
        local v17 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.5799086757990868
            }) };
        local v18 = #v17;
        local v19;

        if u10 == nil or u10 ~= u13 then
            v19 = false;
        else
            v19 = u2.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255)
            });
        end;

        if v19 then
            v17[v18 + 1] = v19;
        end;

        v17[#v17 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });
        v17.KitRender = u2.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 11,
            Position = UDim2.fromScale(-0.125, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(1.5, 1.5),
            Image = renderImage,
            ScaleType = Enum.ScaleType.Crop
        });
        local v20 = {
            ZIndex = 11,
            Size = UDim2.fromScale(1, 1)
        };
        local v21 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.04, 0),
                PaddingBottom = UDim.new(0.04, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v22 = #v21;
        local v23;

        if kitClass == nil then
            v23 = false;
        else
            v23 = u2.createFragment({
                KitClassIcon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    LayoutOrder = 1,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 11,
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(1, 0.25),
                    Image = getBedwarsClassMeta(kitClass).imageId,
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            TextSize = 16,
                            Text = getBedwarsClassMeta(kitClass).display,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = ColorUtil.WHITE,
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            TextSize = 14,
                            Text = getBedwarsClassMeta(kitClass).description,
                            Font = Enum.Font.SourceSansSemibold,
                            Limits = Vector2.new(300, 60)
                        }) }) })
            });
        end;

        if v23 then
            v21[v22 + 1] = v23;
        end;

        local _ = #v21;
        v21.KitName = u2.createElement("TextLabel", {
            LayoutOrder = 2,
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 12,
            Size = UDim2.fromScale(1, 0.25),
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromScale(1, 1),
            Text = name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Center
        });
        v17.ContentsContainer = u2.createElement(Empty, v20, v21);

        return u2.createElement("ImageButton", v16, v17);
    end;

    local v25 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v26 = {};
    local v27 = {};
    local _ = #v27;
    local v28 = {
        Size = u5,
        Position = u6,
        AnchorPoint = u7
    };
    local v29 = {};
    local v30 = {
        AppId = "KitRentalPopup",
        ClipsDescendents = false,
        Title = "Beginner Kit Rental",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 171, Name: OnClose
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.LobbyTutorialController:closeKitRentalPopup();
        end,

        ContentUIPadding = u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 0),
            PaddingRight = UDim.new(0, 0)
        })
    };
    local v31 = {
        BackgroundGradient = u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            Size = UDim2.fromScale(1, 0.4),
            BackgroundColor3 = ColorUtil.WHITE
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }), u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 59, 105)), ColorSequenceKeypoint.new(1, Color3.fromRGB(112, 115, 207)) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
            }) })
    };
    local v32 = #v31;
    local v33 = {
        SizeConstraint = "RelativeYY",
        Position = UDim2.fromScale(0.5, 0.4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.85)
    };
    local v34;

    if u12 == nil then
        v34 = u12;
    else
        v34 = u12.renderImage;
    end;

    if v34 == nil then
        v34 = BedwarsImageId.NONE_KIT_RENDER;
    end;

    v33.Image = v34;
    local v35;

    if u12 == nil then
        v35 = u12;
    else
        v35 = u12.renderImage;
    end;

    v33.ImageTransparency = (v35 == "" or not v35) and 0.5 or 0;
    v33.ScaleType = Enum.ScaleType.Crop;
    v33.LayoutOrder = 2;
    v33.BackgroundTransparency = 1;
    v33.BorderSizePixel = 0;
    v31.BackgroundKitRender = u2.createElement("ImageLabel", v33);
    local v36;

    if u12 then
        local v37 = {
            ZIndex = 10,
            Size = UDim2.fromScale(0.5, 0.4),
            Position = UDim2.fromScale(0.05, 0.4),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v38 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v39 = #v38;
        local v40;

        if u12.kitClass == nil then
            v40 = false;
        else
            v40 = u2.createFragment({
                KitClassIcon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    LayoutOrder = 0,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(1, 0.2),
                    Image = getBedwarsClassMeta(u12.kitClass).imageId,
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            TextSize = 16,
                            Text = getBedwarsClassMeta(u12.kitClass).display,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = ColorUtil.WHITE,
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            TextSize = 14,
                            Text = getBedwarsClassMeta(u12.kitClass).description,
                            Font = Enum.Font.SourceSansSemibold,
                            Limits = Vector2.new(300, 60)
                        }) }) })
            });
        end;

        if v40 then
            v38[v39 + 1] = v40;
        end;

        local _ = #v38;
        v38.KitName = u2.createElement("TextLabel", {
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ZIndex = 10,
            Size = UDim2.fromScale(0.8, 0.15),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = u12.name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Left
        });
        local v41 = {
            Size = UDim2.fromScale(0.6, 0.6)
        };
        local description = u12.description;
        v41.Text = description == nil and "" or description;
        v41.RichText = true;
        v41.TextScaled = true;
        v41.TextTransparency = 0.3;
        v41.TextColor3 = Color3.fromRGB(255, 255, 255);
        v41.Font = Enum.Font.Arial;
        v41.BackgroundTransparency = 1;
        v41.TextXAlignment = Enum.TextXAlignment.Left;
        v41.TextYAlignment = "Top";
        v41.LayoutOrder = 2;
        v41.ZIndex = 10;
        v38.KitDescription = u2.createElement("TextLabel", v41, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }) });
        v36 = u2.createFragment({
            SelectedKitInfo = u2.createElement(Empty, v37, v38)
        });
    else
        v36 = u12;
    end;

    if v36 then
        v31[v32 + 1] = v36;
    end;

    local _ = #v31;
    local v42 = {
        ZIndex = 11,
        Size = UDim2.fromScale(0.9, 0.4),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1)
    };
    local v43 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Bottom",
            Padding = UDim.new(0.03, 0.1),
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }) };
    local v44 = #v43;
    local v45 = not u10 and u2.createElement("TextLabel", {
        RichText = true,
        TextScaled = true,
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        ZIndex = 11,
        Size = UDim2.fromScale(0.8, 0.075),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = string.upper("Choose a kit to rent"),
        TextColor3 = Color3.fromRGB(255, 237, 79),
        Font = Enum.Font.ArialBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    });

    if v45 then
        v43[v44 + 1] = v45;
    end;

    local function _(p46, p47) -- Line: 360
        -- upvalues: u24 (copy)
        return u24(p46, p47);
    end;

    local v48 = table.create(#rentableKits);

    for i, v in rentableKits do
        v48[i] = u24(v, i - 1);
    end;

    local v49 = {
        LayoutOrder = 3,
        BackgroundTransparency = 1,
        ZIndex = 11,
        Size = UDim2.fromScale(1, 0.4)
    };
    local v50 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.015, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }) };
    local v51 = #v50;

    for i, v in v48 do
        v50[v51 + i] = v;
    end;

    v43.KitBox = u2.createElement("Frame", v49, v50);
    v43[#v43 + 1] = u2.createElement(Empty, {
        LayoutOrder = 4,
        ZIndex = 11,
        Size = UDim2.fromScale(1, 0.35)
    }, {
        u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.035, 0)
        }),
        RentKitButton = u2.createElement(Button, {
            Text = "Rent Kit",
            LayoutOrder = 3,
            CornerRadius = UDim.new(0.1, 0),
            Size = UDim2.fromScale(0.3, 0.65),
            TextLabel = {
                ZIndex = 2,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.9, 0.65),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            },
            BackgroundColor3 = Color3.fromRGB(44, 184, 96),

            OnClick = function() -- Line: 412, Name: OnClick
                -- upvalues: u10 (copy), Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), Theme (ref), u12 (copy), KnitClient (ref), UILayers (ref)
                local _ = u10 == nil;
                local v52 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
                local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
                local v53 = {
                    Title = "Beginner Kit Rental"
                };
                local v54 = ColorUtil.richTextColor(Theme.mcAqua);
                local v55 = u12;

                if v55 ~= nil then
                    v55 = v55.name;
                end;

                v53.Body = "Are you sure you want to rent the <font color=\"" .. v54 .. "\"><b>" .. tostring(v55) .. "</b></font> kit?";
                v53.PrimaryBtnProps = {
                    Text = "Yes"
                };
                v53.SecondaryBtnProps = {
                    Text = "Cancel"
                };

                function v53.OnPrimaryBtnClick() -- Line: 433
                    -- upvalues: u10 (ref), KnitClient (ref)
                    if u10 ~= nil then
                        KnitClient.Controllers.LobbyTutorialController:selectKitRental(u10);
                    end;
                end;

                function v53.OnSecondaryBtnClick() -- Line: 438
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end;

                v52:openApp(CONFIRMATION_MODAL, v53);
            end
        }, { u2.createElement(ShineEffect, {
                Loop = false,
                OnHover = true,
                Variation = ShineEffectVariation.gradientLarge
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4.669642857142857
            }) }),
        ChooseLaterButton = u2.createElement(Button, {
            Text = "Choose Later",
            LayoutOrder = 4,
            CornerRadius = UDim.new(0.2, 0),
            Size = UDim2.fromScale(0.25, 0.4),
            TextLabel = {
                ZIndex = 2,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.9, 0.65),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            },
            BackgroundColor3 = Theme.backgroundTertiary,

            OnClick = function() -- Line: 466, Name: OnClick
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.LobbyTutorialController:closeKitRentalPopup();
            end
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4.669642857142857
            }) }),
        u2.createElement("TextLabel", {
            Text = "(You can choose later from the locker)",
            RichText = true,
            LineHeight = 1.05,
            TextScaled = true,
            TextTransparency = 0.3,
            BackgroundTransparency = 1,
            LayoutOrder = 5,
            ZIndex = 11,
            Size = UDim2.fromScale(0.35, 0.2),
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.Arial,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
    v31.BottomActionsContainer = u2.createElement(Empty, v42, v43);
    v29[#v29 + 1] = u2.createElement(WidgetComponent, v30, v31);
    v27.PopupBackground = u2.createElement(Empty, v28, v29);
    v26[#v26 + 1] = u2.createElement(SlideIn, {}, v27);

    return u2.createElement("ScreenGui", v25, v26);
end);

return {
    BeginnerKitRentalPopup = v4.connect(function(p57, p58) -- Line: 500
        local v59 = {};

        for i, v in p58 do
            v59[i] = v;
        end;

        return v59;
    end)(v56)
};