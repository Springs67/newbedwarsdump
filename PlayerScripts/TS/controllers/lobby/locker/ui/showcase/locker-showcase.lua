-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AchievementIcon = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local LobbyTitle = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "title", "ui", "lobby-title").LobbyTitle;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local LockerUtil = RuntimeLib.import(script, script.Parent.Parent, "locker-util").LockerUtil;
local LockerPreviewButtons = RuntimeLib.import(script, script.Parent.Parent, "preview", "locker-preview-buttons").LockerPreviewButtons;

return {
    LockerShowcase = v3.new(u2)(function(u4, p5) -- Line: 23
        -- upvalues: LockerTab (copy), getConsumableMeta (copy), LockerUtil (copy), LockerPreviewUtil (copy), DeviceUtil (copy), u2 (copy), BedwarsImageId (copy), ColorUtil (copy), LobbyTitle (copy), Empty (copy), EmoteShowcase (copy), BadgeType (copy), AchievementIcon (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), ButtonComponent (copy), LockerPreviewButtons (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = u4.Tab == LockerTab.CONSUMABLES;

        if v6 then
            local Element = u4.Element;

            if Element ~= nil then
                Element = Element.itemEnum;
            end;

            v6 = getConsumableMeta(Element);

            if v6 ~= nil then
                v6 = v6.displayInLocker;

                if v6 ~= nil then
                    v6 = v6.usable;
                end;
            end;
        end;

        local v7 = LockerUtil.isPreviewTab(u4.Tab);
        local u8 = LockerPreviewUtil.canPreviewLockerElement(u4.Element, u4.Tab);
        local v9 = LockerPreviewUtil.canReplay(LockerPreviewUtil.lockerElementToPreviewItem(u4.Element, u4.Tab) or {});
        local v10 = DeviceUtil.isHoarceKat() and true or u8;

        local function v25() -- Line: 49
            -- upvalues: u4 (copy), u2 (ref), BedwarsImageId (ref), u8 (copy), ColorUtil (ref), LockerTab (ref), LobbyTitle (ref), Empty (ref), EmoteShowcase (ref), BadgeType (ref), AchievementIcon (ref)
            local Element = u4.Element;

            if Element ~= nil then
                Element = Element.none;
            end;

            if Element then
                Element = u2.createElement("ImageLabel", {
                    ImageTransparency = 0.6,
                    BackgroundTransparency = 1,
                    Image = BedwarsImageId.CANCEL,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    Visible = not u8
                });
            end;

            local v11 = {
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.new(0.9, 0, 0.49, 0),
                BackgroundColor3 = ColorUtil.BLACK,
                BackgroundTransparency = u8 and 1 or 0.5
            };
            local v12 = {
                u2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new((1 / 0), 300)
                }),
                u2.createElement("UIStroke", {
                    Transparency = 0.8,
                    Color = Color3.fromRGB(255, 255, 255),
                    Thickness = u8 and 0 or 1
                }),
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                })
            };
            local v13 = #v12;

            if Element then
                v12[v13 + 1] = Element;
            end;

            local v14;

            if u4.Tab == LockerTab.TITLES then
                local v15 = {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(0.9, 0, 0.5, 0)
                };
                local v16 = {};
                local v17 = #v16;
                local v18 = {};
                local Element2 = u4.Element;

                if Element2 ~= nil then
                    Element2 = Element2.itemEnum;
                end;

                v18.TitleType = Element2;
                v16[v17 + 1] = u2.createElement(LobbyTitle, v18);
                v16[v17 + 2] = u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingRight = UDim.new(0, 6),
                    PaddingLeft = UDim.new(0, 6)
                });
                v14 = u2.createElement(Empty, v15, v16);
            else
                local v19 = u4.Tab == LockerTab.KILL_EFFECTS;

                if v19 then
                    v19 = u4.Element;

                    if v19 ~= nil then
                        v19 = v19.imageId;
                    end;
                end;

                if v19 == "" or not v19 then
                    if u4.Tab == LockerTab.EMOTES then
                        local v20 = {};
                        local Element2 = u4.Element;

                        if Element2 ~= nil then
                            Element2 = Element2.itemEnum;
                        end;

                        v20.Emote = Element2;
                        v14 = u2.createElement(EmoteShowcase, v20);
                    elseif u4.Tab == LockerTab.BADGES then
                        local v21 = {
                            FrameProps = {
                                Size = UDim2.fromScale(0.95, 0.95),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5)
                            }
                        };
                        local Element2 = u4.Element;

                        if Element2 ~= nil then
                            Element2 = Element2.itemEnum;
                        end;

                        local v22;

                        if Element2 == BadgeType.NONE then
                            v22 = nil;
                        else
                            v22 = u4.Element;

                            if v22 ~= nil then
                                v22 = v22.itemEnum;
                            end;
                        end;

                        v21.Id = v22;
                        v21.Darkened = false;
                        v21.Simple = true;
                        v14 = u2.createElement(AchievementIcon, v21);
                    else
                        local v23 = {};
                        local Element2 = u4.Element;

                        if Element2 ~= nil then
                            Element2 = Element2.imageId;
                        end;

                        v23.Image = Element2;
                        v23.AnchorPoint = Vector2.new(0.5, 0.5);
                        v23.Position = UDim2.fromScale(0.5, 0.5);
                        v23.Size = UDim2.fromScale(0.75, 0.75);
                        v23.ScaleType = "Fit";
                        v23.BackgroundTransparency = 1;
                        v23.Visible = not u8;
                        v14 = u2.createElement("ImageLabel", v23);
                    end;
                else
                    local v24 = {};
                    local Element2 = u4.Element;

                    if Element2 ~= nil then
                        Element2 = Element2.imageId;
                    end;

                    v24.Image = Element2;
                    v24.AnchorPoint = Vector2.new(0.5, 0.5);
                    v24.Position = UDim2.fromScale(0.5, 0.5);
                    v24.Size = UDim2.fromScale(0.75, 0.75);
                    v24.ScaleType = "Fit";
                    v24.BackgroundTransparency = 1;
                    v24.Visible = not u8;
                    v14 = u2.createElement("ImageLabel", v24);
                end;
            end;

            v12[#v12 + 1] = v14;

            return u2.createElement("Frame", v11, v12);
        end;

        local v26 = {
            BorderSizePixel = 0,
            Size = u4.Size,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = (u8 or v7) and 1 or 0,
            BackgroundColor3 = ColorUtil.WHITE,
            LayoutOrder = u4.LayoutOrder
        };
        local v27 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 0)
            }), u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, ColorUtil.BLACK) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
            }) };
        local v28 = #v27;
        local v29 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v30 = { u2.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.02, 0)
            }), u2.createElement(v25) };
        local _ = #v30;
        local v31 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0.49, -50)
        };
        local v32 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10)
            }), u2.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 12 or 6)
            }) };
        local v33 = #v32;
        local v34 = {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0)
        };
        local Element = u4.Element;

        if Element ~= nil then
            Element = Element.name;
        end;

        v34.Text = "<b>" .. (Element == nil and "Select an item" or Element) .. "</b>";
        v34.TextColor3 = ColorUtil.WHITE;
        v34.RichText = true;
        v34.Font = Enum.Font.Roboto;
        v34.TextScaled = true;
        v34.LayoutOrder = 2;
        v34.Visible = not u8;
        v32.Title = u2.createElement("TextLabel", v34, { u2.createElement("UITextSizeConstraint", {
                MinTextSize = 18,
                MaxTextSize = DeviceUtil.isSmallScreen() and 18 or 22
            }), u2.createElement("UIStroke", {
                Thickness = 1,
                Color = Color3.fromRGB(0, 0, 0)
            }) });
        local Element2 = u4.Element;

        if Element2 ~= nil then
            Element2 = Element2.description;
        end;

        local v35 = Element2 ~= nil and u2.createElement("TextLabel", {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            RichText = true,
            TextScaled = true,
            TextYAlignment = "Top",
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 0),
            Text = u4.Element.description,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        }, { u2.createElement("UITextSizeConstraint", {
                MinTextSize = 12,
                MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 16
            }) });

        if v35 then
            v32[v33 + 1] = v35;
        end;

        v30.InfoContainer = u2.createElement(Empty, v31, v32);
        v27[v28 + 1] = u2.createElement(Empty, v29, v30);

        if v6 then
            local v36 = {
                Size = UDim2.new(0.75, 0, 0, 40),
                Position = UDim2.new(0.5, 0, 1, -10),
                AnchorPoint = Vector2.new(0.5, 1)
            };
            local Element3 = u4.Element;

            if Element3 ~= nil then
                Element3 = Element3.itemEnum;
            end;

            local v37 = getConsumableMeta(Element3);

            if v37 ~= nil then
                v37 = v37.displayInLocker;

                if v37 ~= nil then
                    v37 = v37.useButtonText;

                    if v37 ~= nil then
                        v37 = string.upper(v37);
                    end;
                end;
            end;

            v36.Text = "<b>" .. (v37 == nil and "ACTIVATE" or v37) .. "</b>";
            v36.TextSize = 16;

            function v36.OnClick() -- Line: 347
                -- upvalues: u4 (copy), DeviceUtil (ref), getConsumableMeta (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
                local Element4 = u4.Element;

                if Element4 ~= nil then
                    Element4 = Element4.consumableId;
                end;

                if Element4 == nil then
                    return nil;
                end;

                if DeviceUtil.isHoarceKat() then
                    return nil;
                end;

                local consumableId = u4.Element.consumableId;
                local itemEnum = u4.Element.itemEnum;
                local displayInLocker = getConsumableMeta(itemEnum).displayInLocker;

                if displayInLocker ~= nil then
                    displayInLocker = displayInLocker.merge;
                end;

                if displayInLocker then
                    local v38 = KnitClient.Controllers.ConsumableController:getConsumablesOfTypeFromInv(itemEnum)[1];

                    if v38 then
                        consumableId = v38[2].id;
                    end;
                end;

                if KnitClient.Controllers.ConsumableController:useConsumableFromLocker(consumableId) then
                    local Element5 = u4.Element;

                    if Element5 ~= nil then
                        Element5 = Element5.itemEnum;
                    end;

                    local v39 = getConsumableMeta(Element5);

                    if v39 ~= nil then
                        v39 = v39.displayInLocker;

                        if v39 ~= nil then
                            v39 = v39.disableOpenSound;
                        end;
                    end;

                    if not v39 then
                        SoundManager:playSound(GameSound.PIRATE_SHOVEL_DIG_TREASURE_FOUND);
                    end;

                    u4.RebuildElements();
                end;
            end;

            v36.LayoutOrder = 4;
            v6 = u2.createElement(ButtonComponent, v36);
        end;

        if v6 then
            v27[v28 + 2] = v6;
        end;

        local v40 = #v27;

        if v10 then
            v10 = u2.createElement(LockerPreviewButtons, {
                CanReplay = v9,
                Tab = u4.Tab,
                Element = u4.Element
            });
        end;

        if v10 then
            v27[v40 + 1] = v10;
        end;

        return u2.createFragment({
            LockerShowcase = u2.createElement("Frame", v26, v27)
        });
    end)
};