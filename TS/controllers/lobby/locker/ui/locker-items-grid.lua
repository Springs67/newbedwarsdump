-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ElementGrid = v1.ElementGrid;
local Empty = v1.Empty;
local GridElement = v1.GridElement;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AchievementIcon = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local u5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local LockerTab = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local TitleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LockerConstants = RuntimeLib.import(script, script.Parent.Parent, "locker-constants").LockerConstants;
local LockerUtil = RuntimeLib.import(script, script.Parent, "locker-util").LockerUtil;

return {
    LockerItemsGrid = v4.new(u3)(function(u6, p7) -- Line: 29
        -- upvalues: DeviceUtil (copy), LockerConstants (copy), LockerUtil (copy), u5 (copy), LockerTab (copy), getConsumableMeta (copy), ClientStore (copy), KnitClient (copy), u2 (copy), EmoteMeta (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), u3 (copy), EmoteShowcase (copy), RewardShowcase (copy), AchievementIcon (copy), BadgeType (copy), Empty (copy), Theme (copy), GridElement (copy), ElementGrid (copy), TitleMeta (copy), AutoCompleteSearchbar (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local useMemo = p7.useMemo;
        local _ = p7.useValue;
        local u8, u9 = useState(u6.Elements);
        local v10, u11 = useState("");
        useEffect(function() -- Line: 36
            -- upvalues: u9 (copy), u6 (copy), u11 (copy)
            u9(u6.Elements);
            u11("");
        end, { u6.Elements });
        local u12;

        if DeviceUtil.isSmallScreen() then
            u12 = LockerConstants.SEARCH_BAR_HEIGHT_SMALL;
        else
            u12 = LockerConstants.SEARCH_BAR_HEIGHT;
        end;

        local SearchBarPadding = u6.SearchBarPadding;
        local u13 = SearchBarPadding == nil and 13 or SearchBarPadding;
        local u14 = LockerUtil.isPreviewTab(u6.Tab);
        local u15;

        if DeviceUtil.isSmallScreen() then
            u15 = 70;
        elseif u14 then
            u15 = u5.ViewSizeX() * 0.55 / 5.5;
        else
            u15 = u5.ViewSizeX() * 0.75 / 5.5;
        end;

        if u6.Tab == LockerTab.TITLES then
            u15 = u15 / 2;
        end;

        local u16 = {};
        local v71 = useMemo(function() -- Line: 52
            -- upvalues: u6 (copy), LockerTab (ref), getConsumableMeta (ref), u8 (copy), u16 (ref), DeviceUtil (ref), ClientStore (ref), KnitClient (ref), u2 (ref), EmoteMeta (ref), ColorUtil (ref), LockerConstants (ref), SoundManager (ref), GameSound (ref), u3 (ref), EmoteShowcase (ref), RewardShowcase (ref), AchievementIcon (ref), BadgeType (ref), Empty (ref), Theme (ref), GridElement (ref), u14 (copy), u15 (ref), u12 (copy), u13 (copy), ElementGrid (ref)
            if u6.Tab == LockerTab.CONSUMABLES then
                local function v23(p17, p18) -- Line: 55
                    -- upvalues: getConsumableMeta (ref)
                    local itemEnum = p18.itemEnum;
                    local displayInLocker = getConsumableMeta(itemEnum).displayInLocker;

                    if displayInLocker ~= nil then
                        displayInLocker = displayInLocker.merge;
                    end;

                    local function _(p19) -- Line: 63
                        -- upvalues: itemEnum (copy)
                        return p19.id == itemEnum;
                    end;

                    local v20 = displayInLocker and true or false;
                    local v21 = nil;

                    for i, v in p17 do
                        local _ = i - 1;

                        if v.id == itemEnum == true then
                            v21 = v;
                            break;
                        end;
                    end;

                    if v21 and v20 then
                        local amount = v21.amount;
                        v21.amount = (amount == nil and 0 or amount) + 1;

                        return p17;
                    end;

                    local v22 = {};

                    if not v20 then
                        itemEnum = p18.consumableId;
                    end;

                    v22.id = itemEnum;
                    v22.imageId = p18.imageId;
                    v22.alt = p18.name;
                    v22.altFont = Enum.Font.Roboto;
                    v22.altFontWeight = Enum.FontWeight.Bold;
                    v22.altColor = Color3.fromRGB(255, 255, 255);
                    local amount = p18.amount;
                    v22.amount = amount == nil and 1 or amount;
                    v22.expireTime = p18.expireTime;
                    table.insert(p17, v22);

                    return p17;
                end;

                local v24 = {};

                for i = 1, #u8 do
                    v24 = v23(v24, u8[i], i - 1, u8);
                end;

                u16 = v24;
            else
                local v25 = table.create(#u8);

                local function v27(p26) -- Line: 113
                    return {
                        id = p26.itemEnum,
                        imageId = p26.imageId,
                        alt = p26.name,
                        altFont = Enum.Font.Roboto,
                        altFontWeight = Enum.FontWeight.Bold,
                        altColor = Color3.fromRGB(255, 255, 255)
                    };
                end;

                for i, v in u8 do
                    v25[i] = v27(v, i - 1, u8);
                end;

                u16 = v25;
            end;

            local function u38(u28) -- Line: 131
                -- upvalues: u6 (ref), LockerTab (ref), DeviceUtil (ref), ClientStore (ref), KnitClient (ref), u2 (ref), getConsumableMeta (ref)
                if u6.Tab == LockerTab.KILL_EFFECTS then
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "LockerSetKillEffect",
                            killEffect = u28
                        });

                        return;
                    end;

                    KnitClient.Controllers.LockerController:setKillEffect(u28);

                    return;
                end;

                if u6.Tab == LockerTab.WIN_EFFECTS then
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "LockerSetWinEffect",
                            winEffect = u28
                        });

                        return;
                    end;

                    KnitClient.Controllers.LockerController:setWinEffect(u28);

                    return;
                end;

                if u6.Tab == LockerTab.TITLES then
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "LockerSetTitle",
                            title = u28
                        });

                        return;
                    end;

                    KnitClient.Controllers.LockerController:setTitle(u28);

                    return;
                end;

                if u6.Tab == LockerTab.LOBBY_GADGETS then
                    if DeviceUtil.isHoarceKat() then
                        ClientStore:dispatch({
                            type = "LockerSetLobbyGadget",
                            lobbyGadget = u28
                        });

                        return;
                    end;

                    KnitClient.Controllers.LockerController:setLobbyGadget(u28);

                    return;
                end;

                if u6.Tab == LockerTab.CONSUMABLES then
                    local function _(p29) -- Line: 172
                        -- upvalues: u28 (copy)
                        local _ = p29[1];
                        local v30 = p29[2];

                        return v30.consumable == u28 and true or v30.id == u28;
                    end;

                    local v31 = nil;

                    for i, v in u2.entries(u6.ConsumableInventory) do
                        local _ = i - 1;
                        local _ = v[1];
                        local v32 = v[2];

                        if (v32.consumable == u28 and true or v32.id == u28) == true then
                            v31 = v;
                            break;
                        end;
                    end;

                    if v31 == nil then
                        return nil;
                    end;

                    local _ = v31[1];
                    local u33 = getConsumableMeta(v31[2].consumable);

                    if not u33 then
                        return nil;
                    end;

                    local function _(p34) -- Line: 198
                        -- upvalues: u33 (copy), u28 (copy)
                        local displayInLocker = u33.displayInLocker;

                        if displayInLocker ~= nil then
                            displayInLocker = displayInLocker.merge;
                        end;

                        if displayInLocker or u33.mergeInventory then
                            return p34.itemEnum == u28;
                        end;

                        return p34.consumableId == u28;
                    end;

                    local v35 = nil;

                    for i, v in u6.Elements do
                        local _ = i - 1;
                        local displayInLocker = u33.displayInLocker;

                        if displayInLocker ~= nil then
                            displayInLocker = displayInLocker.merge;
                        end;

                        local v36;

                        if displayInLocker or u33.mergeInventory then
                            v36 = v.itemEnum == u28;
                        else
                            v36 = v.consumableId == u28;
                        end;

                        if v36 == true then
                            v35 = v;
                            break;
                        end;
                    end;

                    if v35 then
                        u6.SetElement(v35);
                    end;
                else
                    if u6.Tab == LockerTab.BREAK_BED_EFFECTS then
                        if DeviceUtil.isHoarceKat() then
                            ClientStore:dispatch({
                                type = "LockerSetBreakBedEffect",
                                breakBedEffect = u28
                            });

                            return;
                        end;

                        KnitClient.Controllers.LockerController:setBreakBedEffect(u28);

                        return;
                    end;

                    if u6.Tab == LockerTab.BADGES then
                        if DeviceUtil.isHoarceKat() then
                            ClientStore:dispatch({
                                type = "LockerSetFeaturedBadge",
                                badge = u28
                            });

                            return;
                        end;

                        KnitClient.Controllers.LockerController:setFeaturedBadge(u28);

                        return;
                    end;

                    if u6.Tab == LockerTab.BED_SKIN then
                        local v37;

                        if u28 == "none" then
                            v37 = nil;
                        else
                            v37 = u28;
                        end;

                        if DeviceUtil.isHoarceKat() then
                            ClientStore:dispatch({
                                type = "LockerSetBedSkin",
                                bedSkin = u28
                            });

                            return;
                        end;

                        KnitClient.Controllers.LockerController:setBedSkin(v37);
                    end;
                end;
            end;

            local Elements = u6.Elements;

            if Elements ~= nil then
                local function _(p39) -- Line: 255
                    -- upvalues: u6 (ref)
                    local EquippedElement = u6.EquippedElement;

                    if EquippedElement ~= nil then
                        EquippedElement = EquippedElement.itemEnum;
                    end;

                    return p39.itemEnum == EquippedElement;
                end;

                Elements = -1;

                for i, v in Elements do
                    local _ = i - 1;
                    local EquippedElement = u6.EquippedElement;

                    if EquippedElement ~= nil then
                        EquippedElement = EquippedElement.itemEnum;
                    end;

                    if v.itemEnum == EquippedElement == true then
                        Elements = i - 1;
                        break;
                    end;
                end;
            end;

            local v40 = u16;

            local function v66(u41, p42) -- Line: 276
                -- upvalues: u6 (ref), LockerTab (ref), EmoteMeta (ref), Elements (copy), ColorUtil (ref), DeviceUtil (ref), LockerConstants (ref), u38 (copy), SoundManager (ref), GameSound (ref), u3 (ref), EmoteShowcase (ref), RewardShowcase (ref), AchievementIcon (ref), BadgeType (ref), Empty (ref), Theme (ref), GridElement (ref)
                local v43;

                if u6.Tab == LockerTab.EMOTES then
                    v43 = EmoteMeta[u41.id].animation ~= nil;
                else
                    v43 = false;
                end;

                local expireTime = u41.expireTime;
                local v44 = (expireTime == nil and 0 or expireTime) - os.time();
                local v45 = math.floor(v44 / 3600);
                local v46 = math.floor(v44 / 86400);
                local v47;

                if v44 <= 0 then
                    v47 = nil;
                elseif v45 < 1 then
                    v47 = "Expires SOON";
                elseif v46 < 1 then
                    v47 = "Expires in " .. tostring(v45) .. " hour" .. (v45 > 1 and "s" or "");
                else
                    local v48 = math.floor(v44 / 86400);
                    v47 = "Expires in " .. tostring(v48) .. " day" .. (v46 > 1 and "s" or "");
                end;

                local v49 = {
                    Index = p42,
                    CurrentIndex = Elements,
                    Image = u41.imageId
                };
                local v50 = {
                    ZIndex = 5,
                    Text = u6.Tab == LockerTab.TITLES and u41.alt ~= "None" and "" or u41.alt,
                    TextColor3 = u41.altColor
                };
                local v51;

                if u41.altFont then
                    v51 = Font.new(Font.fromEnum(u41.altFont).Family, u41.altFontWeight or Enum.FontWeight.Regular);
                else
                    v51 = nil;
                end;

                v50.FontFace = v51;
                v50.TextStrokeTransparency = u41.altStrokeColor == nil and 0.5 or 0;
                v50.TextStrokeColor3 = u41.altStrokeColor or ColorUtil.BLACK;
                local v52;

                if DeviceUtil.isSmallScreen() then
                    v52 = LockerConstants.ELEMENT_TEXT_SIZE_SMALL;
                else
                    v52 = LockerConstants.ELEMENT_TEXT_SIZE;
                end;

                v50.TextSize = v52;
                v49.TextElement = v50;

                function v49.OnClick() -- Line: 303
                    -- upvalues: u6 (ref), u41 (copy), u38 (ref), SoundManager (ref), GameSound (ref)
                    if u6.ViewOnly then
                        return nil;
                    end;

                    local id = u41.id;

                    if id ~= "" and id then
                        local EquippedElement = u6.EquippedElement;

                        if EquippedElement ~= nil then
                            EquippedElement = EquippedElement.itemEnum;
                        end;

                        if EquippedElement == u41.id then
                            return nil;
                        end;

                        u38(u41.id);
                        SoundManager:playSound(GameSound.ARMOR_EQUIP);
                    end;
                end;

                v49.ViewOnly = u6.ViewOnly;
                local v53;

                if string.lower(u41.alt) == "none" or not u6.EquippedElement then
                    v53 = p42 == 1;
                else
                    local EquippedElement = u6.EquippedElement;

                    if EquippedElement ~= nil then
                        EquippedElement = EquippedElement.itemEnum;
                    end;

                    v53 = EquippedElement == u41.id;
                end;

                v49.GamepadShouldAutoSelect = v53;
                local v54 = {};
                local v55 = #v54;

                if v43 then
                    v43 = u3.createElement(EmoteShowcase, {
                        Emote = u41.id
                    });
                end;

                if v43 then
                    v54[v55 + 1] = v43;
                end;

                local v56 = #v54;
                local v57;

                if u6.Tab == LockerTab.TITLES then
                    v57 = u3.createElement(RewardShowcase, {
                        Size = UDim2.fromScale(0.7, 0.7),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.6),
                        Reward = {
                            paid = false,
                            title = u41.id
                        }
                    });
                else
                    v57 = false;
                end;

                if v57 then
                    v54[v56 + 1] = v57;
                end;

                local v58 = #v54;
                local v59;

                if u6.Tab == LockerTab.BADGES then
                    local createElement = u3.createElement;
                    local v60 = {
                        Darkened = false,
                        Simple = true
                    };
                    local v61;

                    if u41.id == BadgeType.NONE then
                        v61 = nil;
                    else
                        v61 = u41.id;
                    end;

                    v60.Id = v61;
                    v60.FrameProps = {
                        ZIndex = -1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    };
                    v59 = createElement(AchievementIcon, v60);
                else
                    v59 = false;
                end;

                if v59 then
                    v54[v58 + 1] = v59;
                end;

                local v62 = #v54;
                local v63;

                if u41.amount == nil then
                    v63 = false;
                else
                    v63 = u3.createElement(Empty, {
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.2, 0.2),
                        AnchorPoint = Vector2.new(1, 0),
                        Position = UDim2.fromScale(0.95, 0.05)
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), u3.createElement("TextLabel", {
                            Font = "GothamBold",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Text = "x" .. tostring(u41.amount),
                            TextColor3 = Color3.fromRGB(255, 255, 255)
                        }, { u3.createElement("UIStroke", {
                                Thickness = 1,
                                Color = Color3.fromRGB(0, 0, 0)
                            }) }) });
                end;

                if v63 then
                    v54[v62 + 1] = v63;
                end;

                local v64 = #v54;
                local v65;

                if v47 == nil then
                    v65 = false;
                else
                    v65 = u3.createFragment({
                        ExpireText = u3.createElement(Empty, {
                            BorderSizePixel = 0,
                            Interactable = false,
                            Size = UDim2.fromScale(0.8, 0.2),
                            AnchorPoint = Vector2.new(0.5, 0),
                            Position = UDim2.fromScale(0.5, 0.65)
                        }, { u3.createElement("TextLabel", {
                                Font = "GothamBold",
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(1, 1),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Text = v47,
                                TextColor3 = Theme.textPrimary
                            }, { u3.createElement("UIStroke", {
                                    Thickness = 1,
                                    Color = Color3.fromRGB(0, 0, 0)
                                }) }) })
                    });
                end;

                if v65 then
                    v54[v64 + 1] = v65;
                end;

                return u3.createElement(GridElement, v49, v54);
            end;

            local v67 = table.create(#v40);

            for i, v in v40 do
                v67[i] = v66(v, i - 1, v40);
            end;

            local v68 = {
                ElementSize = UDim2.new(DeviceUtil.isSmallScreen() and (u14 and 0.31 or 0.23) or 0.187, 0, 0, u15),
                DefaultElement = Elements,
                ScrollingFrameProps = {
                    ScrollBarThickness = 2,
                    Size = UDim2.new(1, 0, 1, -40),
                    Position = UDim2.fromOffset(0, u12 + u13),
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                    VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
                },
                UIPaddingProps = {
                    PaddingLeft = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 2),
                    PaddingBottom = UDim.new(0, 65)
                },
                UIGridLayoutProps = {}
            };
            local v69 = {};
            local v70 = #v69;

            for i, v in v67 do
                v69[v70 + i] = v;
            end;

            return u3.createFragment({
                [u6.Tab .. "List"] = u3.createElement(ElementGrid, v68, v69)
            });
        end, { u8 });

        local function u78(p72, u73) -- Line: 464
            -- upvalues: u6 (copy)
            if p72 == "" then
                return u6.Elements;
            end;

            local function _(p74, p75) -- Line: 469
                -- upvalues: u73 (copy)
                return table.find(u73, p74.name) ~= nil;
            end;

            local v76 = 0;
            local v77 = {};

            for i, v in u6.Elements do
                local _ = i - 1;

                if table.find(u73, v.name) ~= nil == true then
                    v76 = v76 + 1;
                    v77[v76] = v;
                end;
            end;

            return v77;
        end;

        local v79 = {
            BackgroundTransparency = 1,
            Size = u6.Size or UDim2.fromScale(1, 1),
            LayoutOrder = u6.LayoutOrder
        };
        local FrameProps = u6.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v79[i] = v;
            end;
        end;

        v79.ClipsDescendants = true;
        local v80 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 14)
            }), u3.createElement("UISizeConstraint", {
                MinSize = u6.MinSize,
                MaxSize = u6.MaxSize
            }) };
        local v81 = {
            Size = UDim2.new(1, 0, 0, u12)
        };
        local v82 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.05, 0)
            }) };
        local v83 = #v82;
        local v84 = {
            BackgroundTransparency = 1,
            Size = UDim2.new(0.4, 0, 0, 16)
        };
        local v85;

        if u6.Tab == LockerTab.CONSUMABLES then
            v85 = "";
        else
            local EquippedElement = u6.EquippedElement;

            if EquippedElement ~= nil then
                EquippedElement = EquippedElement.name;
            end;

            v85 = "<b>Equipped:</b> " .. "<font transparency=\".3\">(" .. (EquippedElement == nil and "" or EquippedElement) .. ")</font>";
        end;

        v84.Text = v85;
        v84.TextXAlignment = Enum.TextXAlignment.Left;
        v84.TextColor3 = ColorUtil.WHITE;
        v84.RichText = true;
        v84.Font = Enum.Font.Roboto;
        v84.TextSize = DeviceUtil.isSmallScreen() and 18 or 24;
        v84.Visible = not u6.ViewOnly;
        v82[v83 + 1] = u3.createElement("TextLabel", v84);
        local v86 = {
            Size = UDim2.new(0.55, 0, 1, 0)
        };
        local Elements = u6.Elements;

        local function v89(p87, p88) -- Line: 550
            -- upvalues: u6 (copy), LockerTab (ref), TitleMeta (ref)
            local name = p88.name;

            if u6.Tab == LockerTab.TITLES then
                table.insert(p87, {
                    key = name,
                    aliases = { TitleMeta[p88.itemEnum].text }
                });

                return p87;
            end;

            if name ~= "" and name then
                table.insert(p87, {
                    key = name
                });
            end;

            return p87;
        end;

        local v90 = {};

        for i = 1, #Elements do
            v90 = v89(v90, Elements[i], i - 1, Elements);
        end;

        v86.Items = v90;
        v86.InputText = v10;

        function v86.OnTextChange(p91, p92) -- Line: 579
            -- upvalues: u9 (copy), u78 (copy), u11 (copy)
            u9((u78(p91, p92)));
            u11(p91);
        end;

        local v93;

        if #u16 == 0 then
            v93 = #u6.Elements;
        else
            v93 = #u16;
        end;

        v86.PlaceHolderText = "Search " .. tostring(v93) .. " " .. u6.Tab;
        v86.MaxCharLength = 30;
        v86.LayoutOrder = 2;
        v86.BarColor = ColorUtil.BLACK;
        v86.BarTransparency = 0.5;
        v82[v83 + 2] = u3.createElement(AutoCompleteSearchbar, v86);
        v80.ListHeader = u3.createElement(Empty, v81, v82);
        v80[#v80 + 1] = v71;

        return u3.createFragment({
            Items = u3.createElement("Frame", v79, v80)
        });
    end)
};