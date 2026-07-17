-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local CodesUtil = v1.CodesUtil;
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getEmoteAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MapPublishForm = RuntimeLib.import(script, script.Parent, "map-publish-form").MapPublishForm;
local MapSettingsModal = RuntimeLib.import(script, script.Parent, "map-settings-modal").MapSettingsModal;

return {
    MapSaveCard = v3.new(u2)(function(u4, p5) -- Line: 25
        -- upvalues: PlaceUtil (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), Theme (copy), KnitClient (copy), UILayers (copy), MapSettingsModal (copy), u2 (copy), getEmoteAsset (copy), EmoteType (copy), Empty (copy), IconButton (copy), BedwarsImageId (copy), QueueMeta (copy), CornerFiller (copy), CodesUtil (copy), MapPublishForm (copy), TooltipContainer (copy), AutoSizedText (copy)
        local v6, u7 = p5.useState(false);
        os.date("%x %I:%M %p", u4.MapSave.lastUpdated);
        local v8 = PlaceUtil.isGameServer();

        local function u9() -- Line: 30
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), Theme (ref), u4 (copy), KnitClient (ref), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Delete Map Save?",
                Body = "Are you sure you want to delete the map <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\"><b>" .. u4.MapSave.name .. "</b></font>? You can\'t undo this action!",
                PrimaryBtnProps = {
                    Text = "Delete",
                    BackgroundColor3 = Theme.backgroundError
                },
                SecondaryBtnProps = {
                    Text = "Cancel"
                },

                OnPrimaryBtnClick = function() -- Line: 41, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u4 (ref)
                    KnitClient.Controllers.CustomMatchController:deleteMapSave(u4.MapSave.code);
                end,

                OnSecondaryBtnClick = function() -- Line: 44, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local function u10() -- Line: 49
            -- upvalues: Flamework (ref), MapSettingsModal (ref), u4 (copy), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "MapSettingsModal",
                app = MapSettingsModal
            }, {
                MapSaveDisplayInfo = u4.MapSave
            }, UILayers.OVERLAY);
        end;

        local function v12() -- Line: 57
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), ColorUtil (ref), Theme (ref), u4 (copy), u7 (copy), KnitClient (ref), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Overwrite Map Save?",
                Body = "Are you sure you want to ovewrite the map save <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\"><b>" .. u4.MapSave.name .. "</b></font> with the current map?\n<font color=\"" .. ColorUtil.richTextColor(Theme.mcRed) .. "\" transparency=\"0\"><b>You can\'t undo this action!</b></font>",
                PrimaryBtnProps = {
                    Text = "Overwrite",
                    BackgroundColor3 = Theme.backgroundTertiary
                },
                SecondaryBtnProps = {
                    Text = "Cancel"
                },

                OnPrimaryBtnClick = function() -- Line: 68, Name: OnPrimaryBtnClick
                    -- upvalues: u7 (ref), KnitClient (ref), u4 (ref)
                    u7(true);
                    KnitClient.Controllers.CustomMatchController:saveMap(u4.MapSave.code):andThen(function(p11) -- Line: 71
                        -- upvalues: u7 (ref)
                        u7(false);
                    end);
                end,

                OnSecondaryBtnClick = function() -- Line: 76, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local v13 = {
            Size = UDim2.fromScale(0.3, 1),
            LayoutOrder = u4.MapSave.dateCreated
        };
        local ContainerProps = u4.ContainerProps;

        if ContainerProps then
            for i, v in ContainerProps do
                v13[i] = v;
            end;
        end;

        local v14 = {};
        local v15 = #v14;
        local v16;

        if v8 then
            v16 = u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0.035, 0)
            });
        else
            v16 = v8;
        end;

        if v16 then
            v14[v15 + 1] = v16;
        end;

        local v17 = #v14;
        local v21 = {
            Size = UDim2.fromScale(1, v8 and 0.85 or 1),
            BackgroundColor3 = Theme.backgroundTertiary,
            BorderSizePixel = 0,
            AutoButtonColor = false,

            [u2.Event.Activated] = function(p18) -- Line: 106
                -- upvalues: u4 (copy)
                local OnClick = u4.OnClick;

                if OnClick ~= nil then
                    OnClick();
                end;
            end,

            [u2.Event.MouseEnter] = function(p19) -- Line: 112
                -- upvalues: u4 (copy)
                local OnHover = u4.OnHover;

                if OnHover ~= nil then
                    OnHover(p19);
                end;
            end,

            [u2.Event.MouseLeave] = function(p20) -- Line: 118
                -- upvalues: u4 (copy)
                local OnHoverOut = u4.OnHoverOut;

                if OnHoverOut ~= nil then
                    OnHoverOut(p20);
                end;
            end
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v21[i] = v;
            end;
        end;

        local v22 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0, 0)
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) };
        local v23 = #v22;
        local v24 = {
            Size = UDim2.fromScale(1, 0.45)
        };
        local v25 = {};
        local _ = #v25;
        local v26 = {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromScale(1, 0.7)
        };
        local image = u4.MapSave.image;
        local v27;

        if image == "" or not image then
            v27 = getEmoteAsset(EmoteType.DUCK_CELEBRATION);
        else
            v27 = "rbxassetid://" .. u4.MapSave.image;
        end;

        v26.Image = v27;
        v26.ImageTransparency = 0.1;
        v26.ScaleType = "Crop";
        v26.BackgroundTransparency = 1;
        v25.ThumbnailImage = u2.createElement("ImageLabel", v26);
        local createElement = u2.createElement;
        local v28 = {
            Size = UDim2.fromScale(1, 0.2),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0.05)
        };
        local v29 = { (u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.075, 0),
                PaddingRight = UDim.new(0.075, 0),
                PaddingTop = UDim.new(0.05, 0)
            })) };
        local createElement2 = u2.createElement;
        local v30 = {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.5, 0.8),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5)
        };
        local v31;

        if u4.MapSave.published then
            v31 = Color3.fromRGB(99, 227, 255);
        else
            v31 = Color3.fromRGB(255, 127, 99);
        end;

        v30.BackgroundColor3 = v31;
        v29.PublishedPill = createElement2("Frame", v30, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), u2.createElement("TextLabel", {
                TextScaled = true,
                Font = "GothamBold",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.8, 0.6),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = u4.MapSave.published and "PUBLISHED" or "PRIVATE",
                TextColor3 = ColorUtil.WHITE
            }) });
        v29.TopActionButtons = u2.createElement(Empty, {
            Size = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5)
        }, { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.05, 0)
            }), u2.createElement(IconButton, {
                BackgroundTransparency = 1,
                Tooltip = "Edit Map Save",
                Size = UDim2.fromScale(0.25, 1),
                Image = BedwarsImageId.GEAR_OULTINE_ICON,

                OnClick = function() -- Line: 204, Name: OnClick
                    -- upvalues: u10 (copy)
                    u10();
                end,

                IconProps = {
                    ScaleType = "Fit",
                    Size = UDim2.fromScale(0.8, 0.8)
                }
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }), u2.createElement(IconButton, {
                BackgroundTransparency = 1,
                Tooltip = "Delete Map Save",
                Size = UDim2.fromScale(0.25, 1),
                Image = BedwarsImageId.TRASH_SOLID,

                OnClick = function() -- Line: 221, Name: OnClick
                    -- upvalues: u9 (copy)
                    u9();
                end,

                IconProps = {
                    ScaleType = "Fit",
                    Size = UDim2.fromScale(0.8, 0.8),
                    ImageColor3 = Theme.mcRed
                }
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) });
        v25.TopButtonsList = createElement(Empty, v28, v29);
        v22.HeroBanner = u2.createElement(Empty, v24, v25);
        v22.MapDisplayInfo = u2.createElement(Empty, {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.55)
        }, {
            u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    SortOrder = "LayoutOrder"
                }
            ),
            TopSection = u2.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.45),
                BackgroundColor3 = ColorUtil.hexColor(8554484)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.15, 0),
                    PaddingBottom = UDim.new(0.15, 0),
                    PaddingLeft = UDim.new(0.075, 0),
                    PaddingRight = UDim.new(0.075, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.1, 0)
                }),
                u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.5),
                    Text = "<b>" .. u4.MapSave.name .. "</b>",
                    TextColor3 = ColorUtil.WHITE
                }),
                u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    TextTransparency = 0.3,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.3),
                    Text = QueueMeta[u4.MapSave.queueType].title,
                    TextColor3 = ColorUtil.WHITE
                })
            }),
            BottomSection = u2.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.55),
                BackgroundColor3 = ColorUtil.hexColor(7764697)
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }),
                u2.createElement(CornerFiller, {
                    TopLeft = true,
                    TopRight = true
                }),
                u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.8, 1)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.075, 0),
                        PaddingRight = UDim.new(0.075, 0)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.1, 0)
                    }),
                    u2.createElement("Frame", {
                        BackgroundTransparency = 0.4,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.7),
                        BackgroundColor3 = ColorUtil.hexColor(6185658)
                    }, {
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        }),
                        MapCode = u2.createElement("TextBox", {
                            TextScaled = true,
                            TextXAlignment = "Center",
                            BackgroundTransparency = 1,
                            ClearTextOnFocus = false,
                            TextEditable = false,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.8, 0.7),
                            Text = CodesUtil.displayCode(u4.MapSave.code, "-", 4),
                            Font = Enum.Font.GothamBold,
                            TextColor3 = Theme.textPrimary
                        })
                    }),
                    u2.createElement("TextLabel", {
                        Text = "MAP CODE",
                        TextScaled = true,
                        TextTransparency = 0.3,
                        TextXAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(1, 0.2),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                }),
                u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.15, 0.49),
                    Position = UDim2.fromScale(0.925, 0.15),
                    AnchorPoint = Vector2.new(1, 0)
                }, { u2.createElement("ImageButton", {
                        Position = UDim2.fromScale(1, 0.5),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Size = UDim2.fromScale(1, 0.7),
                        Image = "",
                        BackgroundColor3 = Theme.backgroundSuccess,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        ScaleType = Enum.ScaleType.Fit,

                        [u2.Event.Activated] = function() -- Line: 366
                            -- upvalues: Flamework (ref), MapPublishForm (ref), u4 (copy), UILayers (ref)
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                                appId = "PublishMapModal",
                                app = MapPublishForm
                            }, {
                                MapSaveDisplayInfo = u4.MapSave
                            }, UILayers.OVERLAY);
                        end
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 6)
                        }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                                Text = "Publish Map",
                                TextSize = 16,
                                Font = Enum.Font.SourceSansBold,
                                Limits = Vector2.new(300, 60)
                            }) }), u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = UDim2.fromScale(0.5, 0.5),
                            Image = BedwarsImageId.UPLOAD_ICON_SOLID
                        }, { u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }) }) }) })
            })
        });
        local v32 = u4[u2.Children];

        if v32 then
            for i, v in v32 do
                if type(i) == "number" then
                    v22[v23 + i] = v;
                else
                    v22[i] = v;
                end;
            end;
        end;

        v14.MapSaveCard = u2.createElement("ImageButton", v21, v22);

        if v8 then
            v8 = u2.createFragment({
                ResaveMapButton = u2.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 0.115),
                    Text = v6 and "UPDATING..." or "UPDATE MAP",
                    BackgroundColor3 = ColorUtil.hexColor(6185658),
                    TextColor3 = Theme.textPrimary,
                    TextScaled = true,
                    Font = "GothamBold",
                    LayoutOrder = 2,
                    [u2.Event.Activated] = v12
                }, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.075, 0),
                        PaddingRight = UDim.new(0.075, 0)
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) })
            });
        end;

        if v8 then
            v14[v17 + 1] = v8;
        end;

        return u2.createFragment({
            ["MapSaveCard_" .. tostring(u4.MapSave.dateCreated)] = u2.createElement(Empty, v13, v14)
        });
    end)
};