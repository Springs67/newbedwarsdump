-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local ConfettiGroup = v1.ConfettiGroup;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local ImageId = v1.ImageId;
local PlayerRender = v1.PlayerRender;
local ScaleComponent = v1.ScaleComponent;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v4 = u2.PureComponent:extend("GiftedAppBase");

function v4.init(p5) -- Line: 26
end;

function v4.onClose(p6) -- Line: 28
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p6.props.AppId);
end;

function v4.didMount(p7) -- Line: 31
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.END_GAME);
end;

function v4.render(u8) -- Line: 34
    -- upvalues: DeviceUtil (copy), u2 (copy), DarkBackground (copy), ConfettiGroup (copy), ScaleComponent (copy), ImageId (copy), PlayerRender (copy), ColorUtil (copy), Theme (copy), ShineEffect (copy), ShineEffectVariation (copy), DividerComponent (copy), ButtonComponent (copy), WidgetComponent (copy), SlideIn (copy)
    local v9 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v10 = { u2.createElement(DarkBackground, {
            AppId = u8.props.AppId
        }), u2.createElement(ConfettiGroup, {
            Lifetime = 10
        }) };
    local v11 = {};
    local v12 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(372, 440)
    };
    local v13 = { u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(465, 545),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v14 = {
        ClipsDescendents = true,
        Title = "Congratulations!",
        AppId = u8.props.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        TitleIcon = ImageId.GIFTS_SOLID,

        OnClose = function() -- Line: 71, Name: OnClose
            -- upvalues: u8 (copy)
            return u8:onClose();
        end
    };
    local v15 = { u2.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ImageTransparency = 0.9,
            BackgroundTransparency = 1,
            Image = ImageId.GIFTS_SOLID,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(-0.03, 1.05),
            Size = UDim2.fromScale(0.25, 0.25)
        }) };
    local v16 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v17 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }),
        GiftSentIntro = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.15, -10)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }),
            u2.createElement(PlayerRender, {
                SizeConstraint = "RelativeYY",
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                PlayerUserId = u8.props.fromPlayer.userId
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) }),
            IntroText = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                AutoLocalize = false,
                LayoutOrder = 2,
                Text = "<b>" .. u8.props.fromPlayer.name .. "</b> has sent you a 🎁 gift!",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(0.84, 0, 1, 0),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                Font = Enum.Font.Roboto
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) })
        })
    };
    local v18 = #v17;
    local v19 = {
        Size = UDim2.new(1, 0, 0.225, -10),
        BackgroundColor3 = Theme.backgroundTertiary,
        LayoutOrder = 2,
        ClipsDescendants = true,

        [u2.Event.Activated] = function() -- Line: 148
            -- upvalues: u8 (copy)
            if u8.props.onGiftClick then
                u8.props.onGiftClick();
            end;
        end
    };
    local v20 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u2.createElement("UIStroke", {
            Thickness = 2,
            Color = Theme.textPrimary
        }), u2.createElement(ShineEffect, {
            DelayTime = 6,
            Variation = ShineEffectVariation.solid
        }) };
    local v21 = #v20;
    local v22;

    if u8.props.giftImageId == nil then
        v22 = false;
    else
        v22 = u2.createFragment({
            BackgroundImage = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ImageTransparency = 0.6,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.75, 0.5),
                Size = UDim2.new(1.3, 0, 1.3, 0),
                Image = u8.props.giftImageId
            })
        });
    end;

    if v22 then
        v20[v21 + 1] = v22;
    end;

    local _ = #v20;
    v20.GiftRibbon = u2.createElement("ImageLabel", {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        ZIndex = 4,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.new(0.5, 0, 0.5, 0),
        Image = ImageId.GIFT_RIBBON_DIAGONAL
    });
    local v23 = {
        BackgroundTransparency = 1,
        ZIndex = 3,
        Size = UDim2.new(1, 0, 1, 0)
    };
    local v24 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12)
        }),
        LockImage = u2.createElement("ImageLabel", {
            ImageTransparency = 0.6,
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ZIndex = 3,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.new(0.4, 0, 1, 0),
            Image = ImageId.UNLOCK_SOLID
        })
    };
    local v25 = #v24;
    local v26;

    if u8.props.giftImageId == nil then
        v26 = false;
    else
        v26 = u2.createFragment({
            GiftImage = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 3,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.new(0.7, 0, 1, 0),
                Image = u8.props.giftImageId
            })
        });
    end;

    if v26 then
        v24[v25 + 1] = v26;
    end;

    local v27 = #v24;
    local v28 = u8.props.giftCustomImage and u2.createFragment({
        GiftImageCustom = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.2, 1)
        }, { u8.props.giftCustomImage })
    });

    if v28 then
        v24[v27 + 1] = v28;
    end;

    local _ = #v24;
    v24.GiftName = u2.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        ZIndex = 3,
        Size = UDim2.new(0.6, 0, 1, 0),
        Text = u8.props.giftName,
        TextColor3 = Theme.textPrimary,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    }, { u2.createElement("UITextSizeConstraint", {
            MinTextSize = 20,
            MaxTextSize = 28
        }) });
    v20.ButtonContent = u2.createElement("Frame", v23, v24);
    v17.GiftButtonWrapper = u2.createElement("ImageButton", v19, v20);
    v17[v18 + 1] = u2.createElement(DividerComponent, {
        Margin = 0,
        LayoutOrder = 3
    });
    v17.GiftMessageBox = u2.createElement("Frame", {
        LayoutOrder = 4,
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0.525, -10),
        BackgroundColor3 = Theme.backgroundTertiary
    }, {
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        MessageTitle = u2.createElement("TextLabel", {
            Text = "<b>Message</b>",
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.2, -4),
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 12)
            }) }),
        Message = u2.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            RichText = true,
            LayoutOrder = 2,
            AutoLocalize = false,
            Size = UDim2.new(1, 0, 0.8, -4),
            Text = "\"" .. u8.props.message .. "\" \n\n<font color=\"" .. ColorUtil.richTextColor(Theme.textPrimary) .. "\">-" .. u8.props.fromPlayer.name .. "</font>",
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top
        }, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 16
            }), u2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 12)
            }) })
    });
    local v29 = u8.props.onGiftClick and u2.createFragment({
        GiftConfirmButton = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 5,
            Size = UDim2.new(1, 0, 0.1, -10)
        }, { u2.createElement(ButtonComponent, {
                Text = "Awesome!",
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                Size = UDim2.fromOffset(160, 28),

                OnClick = function() -- Line: 347, Name: OnClick
                    -- upvalues: u8 (copy)
                    return u8.props.onGiftClick();
                end
            }) })
    });

    if v29 then
        v17[v18 + 2] = v29;
    end;

    v15[#v15 + 1] = u2.createElement("Frame", v16, v17);
    v13[#v13 + 1] = u2.createElement(WidgetComponent, v14, v15);
    v11[#v11 + 1] = u2.createElement("Frame", v12, v13);
    v10[#v10 + 1] = u2.createElement(SlideIn, {}, v11);

    return u2.createElement("ScreenGui", v9, v10);
end;

return {
    GiftedApp = v3.connect(function(p30, p31) -- Line: 363
        return p31;
    end)(v4)
};