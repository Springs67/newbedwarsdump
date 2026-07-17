-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local StringUtil = v1.StringUtil;
local TabsComponent = v1.TabsComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local Consumable = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").Consumable;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local BedBreakEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local getLobbyGadgetImage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage;
local LockerItemCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab");
local LockerTab = v5.LockerTab;
local LockerTabMeta = v5.LockerTabMeta;
local LockerTabOrder = v5.LockerTabOrder;
local TitleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local WinEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local CollectionCore = RuntimeLib.import(script, script.Parent.Parent.Parent, "collection", "collection-core").CollectionCore;
local LockerConstants = RuntimeLib.import(script, script.Parent.Parent, "locker-constants").LockerConstants;
local LockerEmoteItemsGrid = RuntimeLib.import(script, script.Parent, "emote", "locker-emote-items-grid").LockerEmoteItemsGrid;
local LockerEmoteRadialWheel = RuntimeLib.import(script, script.Parent, "emote", "locker-emote-radial-wheel").LockerEmoteRadialWheel;
local LockerItemsGrid = RuntimeLib.import(script, script.Parent, "locker-items-grid").LockerItemsGrid;
local LockerUtil = RuntimeLib.import(script, script.Parent, "locker-util").LockerUtil;
local LockerShowcase = RuntimeLib.import(script, script.Parent, "showcase", "locker-showcase").LockerShowcase;

return {
    LockerCore = v4.new(u3)(function(u6, p7) -- Line: 45
        -- upvalues: LockerTab (copy), LockerUtil (copy), DeviceUtil (copy), LockerConstants (copy), EmoteType (copy), EmoteMeta (copy), KillEffectMeta (copy), KillEffectType (copy), WinEffectMeta (copy), WinEffectType (copy), TitleMeta (copy), TitleType (copy), LobbyGadgetMeta (copy), getLobbyGadgetImage (copy), LobbyGadgetType (copy), u2 (copy), Consumable (copy), getConsumableMeta (copy), BedBreakEffectMeta (copy), BedBreakEffectType (copy), BadgeType (copy), AchievementUtil (copy), getItemSkinMeta (copy), getItemMeta (copy), StringUtil (copy), KnitClient (copy), LockerItemCategory (copy), u3 (copy), CollectionCore (copy), LockerTabMeta (copy), LockerTabOrder (copy), Theme (copy), TabsComponent (copy), AutoCanvasScrollingFrame (copy), LockerEmoteRadialWheel (copy), LockerEmoteItemsGrid (copy), ClientStore (copy), LockerShowcase (copy), LockerItemsGrid (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local _ = p7.useValue;
        local u8, u9 = useState(u6.InitialTab or LockerTab.COLLECTION);
        local u10, u11 = useState(1);
        local v12, u13 = useState(nil);
        local u14, u15 = useState(nil);
        local v16 = LockerUtil.isPreviewTab(u8) and 0.45 or 0.25;
        local v17;

        if DeviceUtil.isSmallScreen() then
            v17 = LockerConstants.TAB_WIDTH_SMALL;
        else
            v17 = LockerConstants.TAB_WIDTH;
        end;

        local function u48() -- Line: 56
            -- upvalues: u8 (copy), LockerTab (ref), u6 (copy), u10 (copy), EmoteType (ref), EmoteMeta (ref), KillEffectMeta (ref), KillEffectType (ref), WinEffectMeta (ref), WinEffectType (ref), TitleMeta (ref), TitleType (ref), LobbyGadgetMeta (ref), getLobbyGadgetImage (ref), LobbyGadgetType (ref), u2 (ref), Consumable (ref), u14 (copy), getConsumableMeta (ref), BedBreakEffectMeta (ref), BedBreakEffectType (ref), BadgeType (ref), AchievementUtil (ref), getItemSkinMeta (ref), getItemMeta (ref), StringUtil (ref)
            if u8 == LockerTab.COLLECTION then
                return nil;
            end;

            if u8 == LockerTab.EMOTES then
                local v18 = u6.LockerDto.selectedEmotes[u10] or EmoteType.NONE;
                local v19 = EmoteMeta[v18];
                local v20 = {
                    name = v19.name
                };
                local image = v19.image;
                v20.imageId = image == nil and "" or image;
                v20.itemEnum = v18;
                v20.lockerTab = u8;
                v20.none = v18 == EmoteType.NONE;

                return v20;
            end;

            if u8 == LockerTab.KILL_EFFECTS then
                local v21 = KillEffectMeta[u6.LockerDto.selectedKillEffect];
                local v22 = {
                    name = v21.name
                };
                local image = v21.image;
                v22.imageId = image == nil and "" or image;
                v22.itemEnum = u6.LockerDto.selectedKillEffect;
                v22.lockerTab = u8;
                v22.none = u6.LockerDto.selectedKillEffect == KillEffectType.NONE;

                return v22;
            end;

            if u8 == LockerTab.WIN_EFFECTS then
                local v23 = WinEffectMeta[u6.LockerDto.selectedWinEffect];
                local v24 = {
                    name = v23.name
                };
                local image = v23.image;
                v24.imageId = image == nil and "" or image;
                v24.itemEnum = u6.LockerDto.selectedWinEffect;
                v24.lockerTab = u8;
                v24.none = u6.LockerDto.selectedWinEffect == WinEffectType.NONE;

                return v24;
            end;

            if u8 == LockerTab.TITLES then
                local v25 = TitleMeta[u6.LockerDto.selectedTitle];
                local v26 = {};
                local name = v25.name;

                if name == nil then
                    name = v25.text;
                end;

                v26.name = name;
                v26.imageId = "";
                v26.itemEnum = u6.LockerDto.selectedTitle;
                v26.lockerTab = u8;
                v26.none = u6.LockerDto.selectedTitle == TitleType.NONE;

                return v26;
            end;

            if u8 == LockerTab.LOBBY_GADGETS then
                local v27 = {
                    name = LobbyGadgetMeta[u6.LockerDto.selectedLobbyGadget].name
                };
                local v28 = getLobbyGadgetImage(u6.LockerDto.selectedLobbyGadget);
                v27.imageId = v28 == nil and "" or v28;
                v27.itemEnum = u6.LockerDto.selectedLobbyGadget;
                v27.lockerTab = u8;
                v27.none = u6.LockerDto.selectedLobbyGadget == LobbyGadgetType.NONE;

                return v27;
            end;

            if u8 == LockerTab.CONSUMABLES then
                local v29 = u2.values(Consumable);
                local v30 = u14;

                if v30 ~= nil then
                    v30 = v30.itemEnum;
                end;

                if v30 == nil then
                    return nil;
                end;

                if (table.find(v29, v30) or 0) - 1 == -1 then
                    return nil;
                end;

                local v31 = getConsumableMeta(v30);
                local v32 = {
                    name = v31.displayName,
                    imageId = v31.image,
                    itemEnum = v30
                };
                local v33 = u14;

                if v33 ~= nil then
                    v33 = v33.consumableId;
                end;

                v32.consumableId = v33;
                v32.lockerTab = u8;

                return v32;
            end;

            if u8 == LockerTab.BREAK_BED_EFFECTS then
                local v34 = BedBreakEffectMeta[u6.LockerDto.selectedBreakBedEffect];
                local v35 = {};
                local v36;

                if v34 == nil then
                    v36 = v34;
                else
                    v36 = v34.name;
                end;

                v35.name = v36;

                if v34 ~= nil then
                    v34 = v34.image;
                end;

                v35.imageId = v34 == nil and "" or v34;
                v35.itemEnum = u6.LockerDto.selectedBreakBedEffect;
                v35.lockerTab = u8;
                v35.none = u6.LockerDto.selectedBreakBedEffect == BedBreakEffectType.NONE;

                return v35;
            end;

            if u8 == LockerTab.BADGES then
                local v37 = u6.LockerDto.featuredBadges[1];

                if v37 == BadgeType.NONE then
                    return {
                        name = "None",
                        imageId = "",
                        none = true,
                        itemEnum = BadgeType.NONE,
                        lockerTab = u8
                    };
                end;

                local v38 = AchievementUtil.getMeta(v37);
                local v39 = {};
                local v40;

                if v38 == nil then
                    v40 = v38;
                else
                    v40 = v38.title;
                end;

                v39.name = v40 == nil and "" or v40;
                local goal = v38.goal;

                if goal ~= nil then
                    goal = goal.value;
                end;

                v39.description = v38.description(goal);
                v39.imageId = "";
                v39.itemEnum = u6.LockerDto.featuredBadges[1];
                v39.lockerTab = u8;

                return v39;
            end;

            if u8 == LockerTab.BED_SKIN then
                if not u6.LockerDto.bedSkin then
                    return {
                        name = "None",
                        imageId = "",
                        itemEnum = "none",
                        none = true,
                        lockerTab = u8
                    };
                end;

                local v41 = getItemSkinMeta(u6.LockerDto.bedSkin);
                local v42 = getItemMeta(v41.itemType);
                local v43 = string.split(v41.skinTag, "_");

                local function _(p44) -- Line: 227
                    -- upvalues: StringUtil (ref)
                    return StringUtil.capitalizeFirstLetter(p44);
                end;

                local v45 = table.create(#v43);

                for i, v in v43 do
                    local _ = i - 1;
                    v45[i] = StringUtil.capitalizeFirstLetter(v);
                end;

                local v46 = table.concat(v45, "");
                local v47 = {};
                local name = v41.name;

                if name == nil then
                    name = v46 .. " " .. v42.displayName;
                end;

                v47.name = name;
                local renderImage = v41.renderImage;
                v47.imageId = renderImage == nil and "" or renderImage;
                v47.itemEnum = u6.LockerDto.bedSkin;
                v47.lockerTab = u8;

                return v47;
            end;
        end;

        useEffect(function() -- Line: 264
            -- upvalues: u8 (copy), LockerTab (ref), u13 (copy), LockerUtil (ref), u6 (copy), u15 (copy), u48 (copy)
            if u8 == LockerTab.COLLECTION then
                u13(nil);
            else
                u13(LockerUtil.buildElementGrid(u8, u6.LockerDto, u6.ConsumableInventory));
            end;

            u15(u48());
        end, { u8, u6.LockerDto, u6.ConsumableInventory });
        useEffect(function() -- Line: 272
            -- upvalues: DeviceUtil (ref), u8 (copy), LockerTab (ref), KnitClient (ref), LockerItemCategory (ref)
            if not DeviceUtil.isHoarceKat() then
                if u8 == LockerTab.BREAK_BED_EFFECTS then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.BED_BREAK_EFFECT);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.BED_BREAK_EFFECT);

                    return;
                end;

                if u8 == LockerTab.EMOTES then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.EMOTE);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.EMOTE);

                    return;
                end;

                if u8 == LockerTab.KILL_EFFECTS then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.KILL_EFFECT);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.KILL_EFFECT);

                    return;
                end;

                if u8 == LockerTab.LOBBY_GADGETS then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.LOBBY_GADGET);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.LOBBY_GADGET);

                    return;
                end;

                if u8 == LockerTab.TITLES then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.TITLE);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.TITLE);

                    return;
                end;

                if u8 == LockerTab.WIN_EFFECTS then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.WIN_EFFECT);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.WIN_EFFECT);

                    return;
                end;

                if u8 == LockerTab.BADGES then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.BADGE);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.BADGE);

                    return;
                end;

                if u8 == LockerTab.BED_SKIN then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.BED_SKIN);
                    KnitClient.Controllers.LockerController:getEquippedLockerItem(LockerItemCategory.BED_SKIN);

                    return;
                end;

                if u8 == LockerTab.COLLECTION then
                    KnitClient.Controllers.LockerController:getLockerCategoryItems(LockerItemCategory.ITEM_SKIN);

                    local function _(p49) -- Line: 320
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.LockerController:getEquippedLockerItem(p49);
                    end;

                    for i, v in {
                        LockerItemCategory.TITLE,
                        LockerItemCategory.EMOTE,
                        LockerItemCategory.KILL_EFFECT,
                        LockerItemCategory.WIN_EFFECT,
                        LockerItemCategory.BED_BREAK_EFFECT,
                        LockerItemCategory.LOBBY_GADGET,
                        LockerItemCategory.BED_SKIN,
                        LockerItemCategory.BADGE,
                        LockerItemCategory.ITEM_SKIN
                    } do
                        local _ = i - 1;
                        KnitClient.Controllers.LockerController:getEquippedLockerItem(v);
                    end;
                end;
            end;
        end, { u8 });
        useEffect(function() -- Line: 331
            -- upvalues: u15 (copy), u48 (copy)
            u15(u48());
        end, { u10 });
        useEffect(function() -- Line: 334
            -- upvalues: DeviceUtil (ref), LockerUtil (ref), u14 (copy), u8 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            LockerUtil.previewElement(u14, u8);
        end, { u14 });
        useEffect(function() -- Line: 342
            -- upvalues: u6 (copy), u8 (copy), LockerTab (ref), u9 (copy)
            if u6.FullScreenData.BackButton.ShouldShowBackButton and u8 ~= LockerTab.COLLECTION then
                u9(LockerTab.COLLECTION);
            end;
        end, { u6.FullScreenData.BackButton.BackButtonClickCount });
        local v50 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0)
        };
        local v51 = {};
        local v52 = #v51;
        local v53;

        if u8 == LockerTab.COLLECTION then
            v53 = u3.createElement(CollectionCore, {
                SetShouldShowBackButton = u6.FullScreenData.BackButton.SetShouldShowBackButton,
                BackButtonClickCount = u6.FullScreenData.BackButton.BackButtonClickCount,
                SelectedEmotes = u6.LockerDto.selectedEmotes,

                OnLockerItemClick = function(p54, p55) -- Line: 359, Name: OnLockerItemClick
                    -- upvalues: u6 (copy), u9 (copy)
                    if p55 then
                        u6.FullScreenData.BackButton.SetShouldShowBackButton(true);
                        u9(p55);
                    end;
                end
            });
        else
            v53 = false;
        end;

        if v53 then
            v51[v52 + 1] = v53;
        end;

        local v56 = #v51;

        if v12 then
            local v57 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v58 = { u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, DeviceUtil.isSmallScreen() and 20 or 40),
                    PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 20 or 40),
                    PaddingTop = UDim.new(0, 60),
                    PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 30 or 60)
                }), u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.01, 0)
                }) };
            local v59 = #v58;
            local v60 = {
                ScrollingFrameProps = {
                    Size = UDim2.new(0, v17, 1, 0),
                    CanvasSize = UDim2.new(0, v17, 0, (DeviceUtil.isSmallScreen() and 30 or 60) * 8 + 80),
                    VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
                }
            };
            local v61 = {};
            local v62 = u2.values(LockerTab);

            local function _(p63) -- Line: 407
                -- upvalues: LockerTabMeta (ref), LockerTabOrder (ref)
                local v64 = {
                    value = p63
                };
                local v65 = LockerTabMeta[p63];

                if v65 ~= nil then
                    v65 = v65.title;
                end;

                if v65 == nil then
                    v65 = p63;
                end;

                v64.text = v65;
                v64.layoutOrder = LockerTabOrder[p63];

                return v64;
            end;

            local v66 = table.create(#v62);
            local v67 = {
                Value = u8
            };

            for i, v in v62 do
                local _ = i - 1;
                local v68 = {
                    value = v
                };
                local v69 = LockerTabMeta[v];

                if v69 ~= nil then
                    v69 = v69.title;
                end;

                if v69 == nil then
                    v69 = v;
                end;

                v68.text = v69;
                v68.layoutOrder = LockerTabOrder[v];
                v66[i] = v68;
            end;

            v67.Tabs = v66;

            function v67.OnChange(p70) -- Line: 431
                -- upvalues: u8 (copy), u13 (copy), u9 (copy)
                if p70.value ~= u8 then
                    u13({});
                    u9(p70.value);
                end;
            end;

            v67.ButtonUIConfig = {
                InactiveBGTransparency = 0.5,
                Padding = {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                },
                MaxTextSize = DeviceUtil.isSmallScreen() and 11 or 18
            };
            v67.ButtonProps = {
                TextWrapped = true,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 60),
                AutomaticSize = Enum.AutomaticSize.None
            };
            v67.UIListLayout = {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                VerticalAlignment = Enum.VerticalAlignment.Center
            };
            v67.ScrollingFrame = {
                Active = true,
                ScrollingFrameProps = {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.new(0, v17, 1, 0),
                    CanvasSize = UDim2.new(0.98, 0, 1, 0),
                    BackgroundColor3 = Theme.backgroundTertiary
                }
            };
            v61[#v61 + 1] = u3.createElement(TabsComponent, v67);
            v58[v59 + 1] = u3.createElement(AutoCanvasScrollingFrame, v60, v61);
            local v71;

            if u8 == LockerTab.EMOTES then
                v71 = u3.createElement(LockerEmoteRadialWheel, {
                    LayoutOrder = 3,
                    Size = UDim2.new(0.45, -(v17 / 2), 1, 0),
                    SelectedEmotes = u6.LockerDto.selectedEmotes,

                    SetSelectedSlot = function(p72) -- Line: 474, Name: SetSelectedSlot
                        -- upvalues: u11 (copy)
                        u11(p72);
                    end,

                    Element = u14
                });
            else
                v71 = false;
            end;

            if v71 then
                v58[v59 + 2] = v71;
            end;

            local v73 = #v58;
            local v74;

            if u8 == LockerTab.EMOTES then
                v74 = u3.createElement(LockerEmoteItemsGrid, {
                    LayoutOrder = 1,
                    Size = UDim2.new(0.54, -(v17 / 2), 1, 0),
                    Tab = u8,
                    MinSize = Vector2.new(0, 400),
                    MaxSize = Vector2.new((1 / 0), (1 / 0)),
                    Elements = v12,
                    EquippedElement = u14,
                    SelectedSlot = u10,

                    OnSelectionChange = function(p75, p76) -- Line: 492, Name: OnSelectionChange
                        -- upvalues: DeviceUtil (ref), ClientStore (ref), LockerUtil (ref), KnitClient (ref), u15 (copy)
                        if DeviceUtil.isHoarceKat() then
                            ClientStore:dispatch({
                                type = "LockerSetEmote",
                                emote = p75,
                                slot = p76
                            });

                            return;
                        end;

                        local v77 = LockerUtil.createLockerItemDisplay({
                            emote = p75
                        });
                        KnitClient.Controllers.LockerController:setEmote(p75, p76);
                        u15(v77);
                    end
                });
            else
                v74 = false;
            end;

            if v74 then
                v58[v73 + 1] = v74;
            end;

            local v78 = #v58;
            local v79;

            if u8 == LockerTab.EMOTES then
                v79 = false;
            else
                v79 = u3.createElement(LockerShowcase, {
                    LayoutOrder = 3,
                    Size = UDim2.new(v16, -(v17 / 2), 1, 0),
                    Element = u14,
                    Tab = u8,

                    RebuildElements = function() -- Line: 516, Name: RebuildElements
                        -- upvalues: u13 (copy), LockerUtil (ref), u8 (copy), u6 (copy)
                        u13(LockerUtil.buildElementGrid(u8, u6.LockerDto, u6.ConsumableInventory));
                    end
                });
            end;

            if v79 then
                v58[v78 + 1] = v79;
            end;

            local v80 = #v58;
            local v81;

            if u8 == LockerTab.EMOTES then
                v81 = false;
            else
                v81 = u3.createElement(LockerItemsGrid, {
                    LayoutOrder = 1,
                    Size = UDim2.new(1 - v16 - 0.01, -(v17 / 2), 1, 0),
                    Tab = u8,
                    ConsumableInventory = u6.ConsumableInventory,
                    MinSize = Vector2.new(0, 400),
                    MaxSize = Vector2.new((1 / 0), (1 / 0)),
                    Elements = v12,
                    EquippedElement = u14,
                    SetElement = u15
                });
            end;

            if v81 then
                v58[v80 + 1] = v81;
            end;

            v12 = u3.createElement("Frame", v57, v58);
        end;

        if v12 then
            v51[v56 + 1] = v12;
        end;

        return u3.createElement("Frame", v50, v51);
    end)
};