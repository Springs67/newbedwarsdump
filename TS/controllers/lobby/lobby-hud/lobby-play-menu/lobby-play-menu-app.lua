-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local Padding = v1.Padding;
local ResetTime = v1.ResetTime;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local RewardList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-list").RewardList;
local FullScreenMenu = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ConsumableType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType;
local getQueueGroupMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").getQueueGroupMeta;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta");
local getQueueMeta = v6.getQueueMeta;
local QueueMeta = v6.QueueMeta;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-playlist", "playlist");
local PLAYLIST_QUEUES_ENABLED = v7.PLAYLIST_QUEUES_ENABLED;
local queuePlaylistManager = v7.queuePlaylistManager;
local KeyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-meta").KeyMeta;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v8 = RuntimeLib.import(script, script.Parent, "lobby-play-menu-pages");
local getFilteredQueueVariant = v8.getFilteredQueueVariant;
local getLobbyPlayMenuPage = v8.getLobbyPlayMenuPage;
local getLobbyPlayMenuPageMeta = v8.getLobbyPlayMenuPageMeta;
local LobbyPlayMenuPage = v8.LobbyPlayMenuPage;
local mapQueueVariants = v8.mapQueueVariants;
local QueueVariantType = v8.QueueVariantType;
local PlayMenuCardContainer = RuntimeLib.import(script, script.Parent, "play-menu-card-container").PlayMenuCardContainer;
local v149 = v4.new(u3)(function(u9, p10) -- Line: 46
    -- upvalues: LobbyPlayMenuPage (copy), u3 (copy), u2 (copy), TweenService (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), default (copy), getLobbyPlayMenuPageMeta (copy), DeviceUtil (copy), FullScreenMenuBackgroundPresets (copy), ColorUtil (copy), Empty (copy), RewardList (copy), TitleType (copy), ConsumableType (copy), mapQueueVariants (copy), QueueVariantType (copy), getQueueGroupMeta (copy), getLobbyPlayMenuPage (copy), getFilteredQueueVariant (copy), queuePlaylistManager (copy), getQueueMeta (copy), KnitClient (copy), KeyMeta (copy), ResetTime (copy), Padding (copy), AutoSizedText (copy), Countdown (copy), PLAYLIST_QUEUES_ENABLED (copy), QueueMeta (copy), RankUtil (copy), PlayMenuCardContainer (copy), EmptyButton (copy), SlideIn (copy), FullScreenMenu (copy)
    local useState = p10.useState;
    local useEffect = p10.useEffect;
    local useMemo = p10.useMemo;
    local v11, u12 = useState(nil);
    local u13, u14 = useState(u9.Page or LobbyPlayMenuPage.GAME_SELECT);
    local u15 = u3.createRef();
    local u16 = u3.createRef();
    useEffect(function() -- Line: 55
        -- upvalues: u12 (copy)
        u12(nil);
    end, { u13 });
    useEffect(function() -- Line: 58
        -- upvalues: u15 (copy), u16 (copy), u2 (ref), TweenService (ref)
        local u17 = u15:getValue();
        local u18 = u16:getValue();
        local u19 = u2.new();

        if u17 then
            u17.Position = UDim2.fromScale(0.3, 0.6);
            u17.TextTransparency = 1;
            task.delay(0.1, function() -- Line: 65
                -- upvalues: TweenService (ref), u17 (copy), u19 (copy)
                local u20 = UDim2.fromScale(0.5, 0.6);
                local u21 = TweenService:Create(u17, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    TextTransparency = 0,
                    Position = u20
                });
                u21:Play();
                u19:GiveTask(function() -- Line: 72
                    -- upvalues: u21 (copy), u17 (ref), u20 (copy)
                    u21:Cancel();
                    u21:Destroy();
                    u17.Position = u20;
                end);
            end);
        end;

        if u18 then
            u18.Position = UDim2.fromScale(0.3, 1);
            u18.TextTransparency = 1;
            local u22 = UDim2.fromScale(0.5, 1);
            local u23 = TweenService:Create(u18, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                Position = u22
            });
            u23:Play();
            u19:GiveTask(function() -- Line: 88
                -- upvalues: u23 (copy), u18 (copy), u22 (copy)
                u23:Cancel();
                u23:Destroy();
                u18.Position = u22;
            end);
        end;

        return function() -- Line: 94
            -- upvalues: u19 (copy)
            u19:DoCleaning();
        end;
    end, { u13 });
    local u24 = nil;

    local function v25() -- Line: 99
        -- upvalues: u24 (ref), u14 (copy), SoundManager (ref), GameSound (ref)
        if u24.parentPage then
            u14(u24.parentPage);
        end;

        SoundManager:playSound(GameSound.UI_CLOSE_2);
    end;

    local function v26() -- Line: 105
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref), u13 (copy), LobbyPlayMenuPage (ref), default (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.LOBBY_PLAY_MENU_APP);
        SoundManager:playSound(GameSound.UI_CLOSE_2);

        if u13 == LobbyPlayMenuPage.WELCOME then
            default.Client:Get("RespondedToTutorialPrompt"):CallServer(false);
        end;
    end;

    u24 = getLobbyPlayMenuPageMeta(u13);
    local v27 = u24.HorizontalAlignment or Enum.HorizontalAlignment.Left;
    local maxCellCount = u24.maxCellCount;
    local v28 = maxCellCount == nil and 5 or maxCellCount;
    local v29 = DeviceUtil.isSmallScreen();
    local v30 = {};
    local v31 = {};

    for i, v in FullScreenMenuBackgroundPresets.BACKGROUND_BLUR_PRESET do
        v30[i] = v;
    end;

    v30.OnClick = v26;
    v31.Background = v30;
    v31.ExitButton = {
        OnClick = v26
    };
    v31.BackButton = {
        ShouldShow = u24.parentPage ~= nil,
        OnClick = v25
    };
    local v32 = {};
    local v33 = {};
    local _ = #v33;
    local v34 = {
        Size = UDim2.fromScale(0.9, 0.85),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v35 = {};
    local _ = #v35;
    local v36 = {
        Size = UDim2.fromScale(1, v29 and 0.25 or 0.2)
    };
    local v37 = {};
    local v38 = #v37;
    local v39;

    if u24.subtitle == nil then
        v39 = false;
    else
        local createFragment = u3.createFragment;
        local v40 = {};
        local createElement = u3.createElement;
        local v41 = {
            [u3.Ref] = u15,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.6),
            Size = UDim2.fromScale(1, 0.65),
            Text = u24.subtitle.Text,
            TextScaled = true,
            TextColor3 = u24.subtitle.Color3 or ColorUtil.WHITE
        };
        local v42;

        if v27 == Enum.HorizontalAlignment.Left then
            v42 = Enum.TextXAlignment.Left;
        elseif v27 == Enum.HorizontalAlignment.Center then
            v42 = Enum.TextXAlignment.Center;
        else
            v42 = Enum.TextXAlignment.Right;
        end;

        v41.TextXAlignment = v42;
        v41.TextYAlignment = Enum.TextYAlignment.Center;
        v41.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v41.BackgroundTransparency = 1;
        v41.TextTransparency = 0;
        v40.HeaderSubtitle = createElement("TextLabel", v41, { u3.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
            }) });
        v39 = createFragment(v40);
    end;

    if v39 then
        v37[v38 + 1] = v39;
    end;

    local _ = #v37;
    local createElement = u3.createElement;
    local v43 = {
        [u3.Ref] = u16,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.75),
        Text = u24.title,
        TextScaled = true,
        TextColor3 = ColorUtil.WHITE
    };
    local v44;

    if v27 == Enum.HorizontalAlignment.Left then
        v44 = Enum.TextXAlignment.Left;
    elseif v27 == Enum.HorizontalAlignment.Center then
        v44 = Enum.TextXAlignment.Center;
    else
        v44 = Enum.TextXAlignment.Right;
    end;

    v43.TextXAlignment = v44;
    v43.TextYAlignment = Enum.TextYAlignment.Center;
    v43.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
    v43.BackgroundTransparency = 1;
    v43.TextTransparency = 0;
    v37.HeaderTitle = createElement("TextLabel", v43, { u3.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.WHITE), ColorSequenceKeypoint.new(1, ColorUtil.darken(ColorUtil.WHITE, 0.6)) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
        }) });
    v35.Header = u3.createElement(Empty, v36, v37);
    local v45 = {
        Size = UDim2.fromScale(1, 0.775),
        Position = UDim2.fromScale(0, v29 and 0.25 or 0.2)
    };
    local v46 = {};
    local v47 = #v46;
    local v48 = {
        Size = UDim2.fromScale(1, v29 and 0.9 or 0.7)
    };
    local v49 = {};
    local v50 = #v49;
    local v51;

    if u13 == LobbyPlayMenuPage.WELCOME then
        v51 = u3.createElement("Frame", {
            BorderSizePixel = 0,
            Transparency = 0.5,
            Size = UDim2.fromScale(0.25, 1),
            BackgroundColor3 = ColorUtil.BLACK
        }, { u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 2)
            }), u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0)
            }), u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), u3.createElement("TextLabel", {
                    RichText = true,
                    LineHeight = 1.05,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.45),
                    Text = "Complete Tutorial for <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 222, 64)) .. "\"><b>FREE</b></font> rewards!",
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    Font = Enum.Font.Arial,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }), u3.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.5)
                }, { u3.createElement(RewardList, {
                        CellSize = UDim2.new(0, 68, 0, 68),
                        CellPadding = UDim2.new(0, 12, 0, 12),
                        Rewards = {
                            {
                                title = TitleType.SCHOLAR
                            },
                            {
                                consumable = {
                                    amount = 1,
                                    consumableType = ConsumableType.KIT_RENTAL_BEGINNER
                                }
                            }
                        }
                    }) }) }) });
    else
        v51 = false;
    end;

    if v51 then
        v49[v50 + 1] = v51;
    end;

    local _ = #v49;
    local v52 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v53 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05),
            PaddingBottom = UDim.new(0.05)
        }), u3.createElement("UIGridLayout", {
            CellSize = UDim2.fromScale((1 - 0.015 * (v28 - 1)) / v28, 1),
            CellPadding = UDim2.fromScale(0.015, 0),
            FillDirection = Enum.FillDirection.Horizontal,
            FillDirectionMaxCells = v28,
            HorizontalAlignment = v27
        }) };
    local v54 = #v53;

    for i, v in useMemo(function() -- Line: 285
        -- upvalues: mapQueueVariants (ref), u24 (ref), ColorUtil (ref), QueueVariantType (ref), getQueueGroupMeta (ref), getLobbyPlayMenuPage (ref), getLobbyPlayMenuPageMeta (ref), getFilteredQueueVariant (ref), queuePlaylistManager (ref), getQueueMeta (ref), u14 (copy), KnitClient (ref), KeyMeta (ref), u9 (copy), ResetTime (ref), u3 (ref), Padding (ref), AutoSizedText (ref), Countdown (ref), PLAYLIST_QUEUES_ENABLED (ref), QueueMeta (ref), DeviceUtil (ref), RankUtil (ref), SoundManager (ref), GameSound (ref), u12 (copy), u13 (copy), PlayMenuCardContainer (ref)
        local u55 = 0;
        local v56 = mapQueueVariants(u24.queueCardVariants);

        local function v146(p57) -- Line: 288
            -- upvalues: ColorUtil (ref), QueueVariantType (ref), getQueueGroupMeta (ref), getLobbyPlayMenuPage (ref), getLobbyPlayMenuPageMeta (ref), getFilteredQueueVariant (ref), queuePlaylistManager (ref), getQueueMeta (ref), u14 (ref), KnitClient (ref), KeyMeta (ref), u9 (ref), ResetTime (ref), u3 (ref), Padding (ref), AutoSizedText (ref), Countdown (ref), PLAYLIST_QUEUES_ENABLED (ref), QueueMeta (ref), DeviceUtil (ref), RankUtil (ref), SoundManager (ref), GameSound (ref), u12 (ref), u55 (ref), u13 (ref), PlayMenuCardContainer (ref)
            local function v141(p58, p59) -- Line: 291
                -- upvalues: ColorUtil (ref), QueueVariantType (ref), getQueueGroupMeta (ref), getLobbyPlayMenuPage (ref), getLobbyPlayMenuPageMeta (ref), getFilteredQueueVariant (ref), queuePlaylistManager (ref), getQueueMeta (ref), u14 (ref), KnitClient (ref), KeyMeta (ref), u9 (ref), ResetTime (ref), u3 (ref), Padding (ref), AutoSizedText (ref), Countdown (ref), PLAYLIST_QUEUES_ENABLED (ref), QueueMeta (ref), DeviceUtil (ref), RankUtil (ref), SoundManager (ref), GameSound (ref), u12 (ref), u55 (ref)
                local v60 = {};
                local u61 = {
                    CardData = v60
                };
                local v62 = nil;
                local v63 = nil;

                local function v79(p64) -- Line: 298
                    -- upvalues: ColorUtil (ref)
                    local description = p64.description;

                    if description ~= nil then
                        description = description.overridePlayMenuDescription;
                    end;

                    if description then
                        return p64.description.text;
                    end;

                    local function _(p65) -- Line: 306
                        -- upvalues: ColorUtil (ref)
                        return "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. p65 .. "</font>";
                    end;

                    local u66;

                    if #p64.teams > 0 then
                        u66 = p64.teams[1].maxPlayers;
                    else
                        u66 = nil;
                    end;

                    local v67 = tostring(#p64.teams);
                    local v68 = "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v67 .. "</font>";
                    local v69 = u66 ~= nil;

                    if v69 then
                        local function _(p70) -- Line: 314
                            -- upvalues: u66 (copy)
                            return p70.maxPlayers == u66;
                        end;

                        v69 = true;

                        for i, v in p64.teams do
                            local _ = i - 1;

                            if v.maxPlayers ~= u66 then
                                v69 = false;
                                break;
                            end;
                        end;
                    end;

                    local v71;

                    if v69 then
                        local v72 = tostring(p64.teams[1].maxPlayers);
                        v71 = "\n🙍‍♂️ Players Per Team: " .. "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v72 .. "</font>";
                    else
                        v71 = "";
                    end;

                    local v73 = tostring(p64.queueSize.max);
                    local v74 = "<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v73 .. "</font>";
                    local teams = p64.teams;

                    local function _(p75, p76) -- Line: 331
                        return p75 + p76.maxPlayers;
                    end;

                    local v77 = 0;

                    for i = 1, #teams do
                        local _ = i - 1;
                        v77 = v77 + teams[i].maxPlayers;
                    end;

                    local v78 = tostring(v77);

                    return "🥊 Teams: " .. v68 .. v71 .. "\n🎉 Max Party Size: " .. v74 .. "\n🏘️ Max Players: " .. ("<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. v78 .. "</font>") .. (p64.description == nil and "" or "\n" .. p64.description.text);
                end;

                if p58.queueVariantType == QueueVariantType.QUEUE_GROUP_TYPE then
                    local v80 = getQueueGroupMeta(p58.queueGroupType);
                    v63 = v80.helperIcons;

                    local function _(p81) -- Line: 353
                        -- upvalues: getFilteredQueueVariant (ref)
                        return getFilteredQueueVariant(p81);
                    end;

                    local v82 = 0;
                    local v83 = {};

                    for i, v in getLobbyPlayMenuPageMeta((getLobbyPlayMenuPage(p58.queueGroupType))).queueCardVariants do
                        local _ = i - 1;
                        local v84 = getFilteredQueueVariant(v);

                        if v84 ~= nil then
                            v82 = v82 + 1;
                            v83[v82] = v84;
                        end;
                    end;

                    local function v89(u85, p86) -- Line: 368
                        -- upvalues: queuePlaylistManager (ref), getQueueMeta (ref)
                        local v87 = nil;

                        if p86.queueType then
                            v87 = p86.queueType;
                        elseif p86.queuePlaylistId then
                            v87 = queuePlaylistManager:getPlaylists()[p86.queuePlaylistId]:getCurrQueue();
                        end;

                        if not v87 then
                            return u85;
                        end;

                        local backgroundImageRender = getQueueMeta(v87).backgroundImageRender;

                        if backgroundImageRender ~= nil then
                            local function _(p88) -- Line: 383
                                -- upvalues: u85 (copy)
                                if table.find(u85, p88) == nil then
                                    table.insert(u85, p88);
                                end;
                            end;

                            for i, v in backgroundImageRender do
                                local _ = i - 1;

                                if table.find(u85, v) == nil then
                                    table.insert(u85, v);
                                end;
                            end;
                        end;

                        return u85;
                    end;

                    local v90 = {};

                    for i = 1, #v83 do
                        v90 = v89(v90, v83[i], i - 1, v83);
                    end;

                    v60.title = v80.title;
                    v60.subtitle = tostring(#v83) .. " QUEUES";
                    v60.description = v80.description;
                    v60.backgroundImages = v90;

                    function u61.OnClick(p91, p92) -- Line: 410
                        -- upvalues: getLobbyPlayMenuPage (ref), u14 (ref)
                        local v93 = getLobbyPlayMenuPage(p91.queueGroupType);

                        if v93 then
                            u14(v93);
                        end;
                    end;
                elseif p58.queueVariantType == QueueVariantType.QUEUE_TYPE then
                    local v94 = getQueueMeta(p58.queueType);
                    v62 = v94.playerLevelReq;
                    v63 = v94.helperIcons;
                    v60.title = string.upper(v94.title);
                    v60.description = v79(v94);
                    v60.backgroundImages = v94.backgroundImageRender;

                    function u61.OnClick(p95, p96) -- Line: 428
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.QueueController:joinQueue(p95.queueType);
                    end;

                    local requiredKeys = v94.requiredKeys;

                    if requiredKeys ~= nil then
                        requiredKeys = requiredKeys[1];
                    end;

                    if requiredKeys then
                        local v97 = KeyMeta[requiredKeys.keyType];
                        local v98 = u9.KeysData[requiredKeys.keyType];
                        v98 = v98;
                        local v99;

                        if v98 ~= nil then
                            v99 = v98.keyRegenStartTime;
                        end;

                        local v100 = nil;
                        local v101;

                        if v99 == 0 or (v99 ~= v99 or not v99) then
                            v101 = v99;
                        else
                            v101 = v97.keyRegen;
                        end;

                        if v101 ~= 0 and (v101 == v101 and v101) then
                            v100 = ResetTime.new(v99):getNextResetTime(v97.keyRegen.cooldown);
                        end;

                        local v102 = {
                            BackgroundTransparency = 0.2,
                            BorderSizePixel = 0,
                            ZIndex = 10,
                            Size = UDim2.new(1, 0, 0, 20),
                            Position = UDim2.fromScale(0.5, 0.98),
                            AnchorPoint = Vector2.new(0.5, 0),
                            BackgroundColor3 = ColorUtil.BLACK
                        };
                        local v103 = { u3.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 10)
                            }), u3.createElement(Padding, {
                                Padding = UDim.new(0, 4)
                            }), u3.createElement("UIListLayout", {
                                FillDirection = "Horizontal",
                                HorizontalAlignment = "Center",
                                VerticalAlignment = "Center",
                                Padding = UDim.new(0, 0)
                            }) };
                        local v104 = #v103;
                        local v105 = {};

                        if v98 ~= nil then
                            v98 = v98.amount;
                        end;

                        local maxAmount = v97.maxAmount;
                        v105.Text = tostring(v98 == nil and 0 or v98) .. ((maxAmount == 0 or (maxAmount ~= maxAmount or not maxAmount)) and "" or "/" .. tostring(v97.maxAmount) .. " ") .. " KEYS ";
                        v105.TextSize = 14;
                        v105.Font = Enum.Font.SourceSansBold;
                        v105.TextYAlignment = Enum.TextYAlignment.Top;
                        v105.TextColor3 = Color3.fromRGB(250, 254, 16);
                        v105.ZIndex = 12;
                        v103[v104 + 1] = u3.createElement(AutoSizedText, v105);
                        local v106;

                        if v100 == nil then
                            v106 = false;
                        else
                            v106 = u3.createElement(Countdown, {
                                PreText = "<b>| IN: </b>",
                                EndTime = v100,
                                TextLabel = {
                                    ZIndex = 12,
                                    Size = UDim2.fromScale(0.45, 1)
                                },
                                CountdownConfig = {
                                    days = false
                                }
                            });
                        end;

                        if v106 then
                            v103[v104 + 2] = v106;
                        end;

                        v60.AbsolutePosElements = { u3.createFragment({
                                NextQueue = u3.createElement("Frame", v102, v103)
                            }) };
                    end;

                    local endTime = v94.endTime;

                    if endTime ~= 0 and (endTime == endTime and endTime) then
                        v60.AbsolutePosElements = { u3.createFragment({
                                NextQueue = u3.createElement("Frame", {
                                    BackgroundTransparency = 0.2,
                                    BorderSizePixel = 0,
                                    ZIndex = 10,
                                    Size = UDim2.new(1, 0, 0, 20),
                                    Position = UDim2.fromScale(0.5, 0.1),
                                    AnchorPoint = Vector2.new(0.5, 0),
                                    BackgroundColor3 = ColorUtil.BLACK
                                }, { u3.createElement(Padding, {
                                        Padding = UDim.new(0, 3)
                                    }), u3.createElement(Countdown, {
                                        PreText = "<font transparency=\".3\">Closes in: </font>",
                                        OnCompleteText = "Queue Closed",
                                        EndTime = v94.endTime,
                                        CountdownConfig = {
                                            seperator = ":",
                                            days = true,
                                            hours = true,
                                            minutes = true,
                                            seconds = true
                                        },
                                        TextLabel = {
                                            ZIndex = 12,
                                            Size = UDim2.fromScale(1, 1)
                                        }
                                    }) })
                            }) };
                    end;
                elseif p58.queueVariantType == QueueVariantType.QUEUE_PLAYLIST then
                    if not PLAYLIST_QUEUES_ENABLED then
                        return nil;
                    end;

                    local v107 = queuePlaylistManager:getPlaylists()[p58.queuePlaylistId];
                    local v108 = v107:getCurrQueue();
                    local v109 = v107:getConfig();

                    if v109 ~= nil then
                        v109 = v109.name;
                    end;

                    local v110 = QueueMeta[v108];
                    local u111 = "";

                    local function _(p112) -- Line: 569
                        -- upvalues: u111 (ref), QueueMeta (ref)
                        u111 = u111 .. QueueMeta[p112].title .. "\n";

                        return { u111 };
                    end;

                    for i, v in v107:getQueues() do
                        local _ = i - 1;
                        u111 = u111 .. QueueMeta[v].title .. "\n";
                    end;

                    v62 = v110.playerLevelReq;
                    v63 = v110.helperIcons;
                    v60.title = v110.title;
                    v60.subtitle = v109 == nil and "LTM" or v109;
                    v60.description = v79(v110);
                    v60.backgroundImages = v110.backgroundImageRender;

                    function u61.OnClick(p113, p114) -- Line: 586
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.QueuePlaylistController:queueForPlaylist(p113.queuePlaylistId);
                    end;

                    v60.AbsolutePosElements = { u3.createFragment({
                            NextQueue = u3.createElement("Frame", {
                                BackgroundTransparency = 0.2,
                                BorderSizePixel = 0,
                                ZIndex = 10,
                                Size = UDim2.new(1, 0, 0, 20),
                                Position = UDim2.fromScale(0.5, 0.98),
                                AnchorPoint = Vector2.new(0.5, 0),
                                BackgroundColor3 = ColorUtil.BLACK
                            }, {
                                u3.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, 10)
                                }),
                                u3.createElement(Padding, {
                                    Padding = UDim.new(0, 4)
                                }),
                                u3.createElement("UIListLayout", {
                                    FillDirection = "Horizontal",
                                    HorizontalAlignment = "Center",
                                    VerticalAlignment = "Center",
                                    Padding = UDim.new(0, 0)
                                }),
                                u3.createElement(Countdown, {
                                    EndTime = v107:getNextRotationTime(),
                                    TextLabel = {
                                        ZIndex = 12,
                                        Size = UDim2.fromScale(0.9, 1)
                                    },
                                    PreText = QueueMeta[v107:getNextQueue()].title .. " in: ",
                                    CountdownConfig = {
                                        days = false,
                                        hours = true,
                                        minutes = true,
                                        seconds = true
                                    }
                                })
                            })
                        }) };
                end;

                local u115 = p58.cardProps or {};
                local v116;

                if u115 == nil then
                    v116 = u115;
                else
                    v116 = u115.CardData;
                end;

                local v117 = v116 == nil and {} or v116;

                if v62 ~= nil then
                    local v118;

                    if DeviceUtil.isHoarceKat() then
                        v118 = 0;
                    else
                        local v119 = KnitClient.Controllers.PlayerLevelController:getPlayerLevel();
                        v118 = v119 == nil and 0 or v119;
                    end;

                    if v118 < v62 then
                        if p58.queueType ~= RankUtil.activeRankMeta.queueType then
                            function u115.OnClick(p120) -- Line: 654
                                -- upvalues: SoundManager (ref), GameSound (ref)
                                SoundManager:playSound(GameSound.UI_ERROR);

                                return nil;
                            end;
                        end;
                    else
                        v62 = nil;
                    end;
                end;

                function u61.OnHover(p121, p122) -- Line: 664
                    -- upvalues: u12 (ref), ColorUtil (ref)
                    local v123;

                    if p122 == nil then
                        v123 = p122;
                    else
                        v123 = p122.description;
                    end;

                    if v123 == "" then
                        v123 = false;
                    end;

                    local v124 = not v123;

                    if not v124 then
                        local title = p122.title;

                        if title == "" then
                            title = false;
                        end;

                        v124 = not title;
                    end;

                    if v124 then
                        u12(nil);

                        return nil;
                    end;

                    u12("<b><font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 222, 64)) .. "\">" .. p122.title .. "</font></b>\n" .. p122.description);
                end;

                local v125;

                if v117 == nil then
                    v125 = v117;
                else
                    v125 = v117.backgroundImages;
                end;

                if v125 == nil then
                    v125 = v60.backgroundImages;
                end;

                local v126 = {};
                local v127 = {};
                local v128 = {};
                local v129;

                if v117 == nil then
                    v129 = v117;
                else
                    v129 = v117.title;
                end;

                if v129 == nil then
                    v129 = v60.title;
                end;

                v128.title = v129;
                local v130;

                if v117 == nil then
                    v130 = v117;
                else
                    v130 = v117.subtitle;
                end;

                if v130 == nil then
                    v130 = v60.subtitle;
                end;

                v128.subtitle = v130;
                local v131;

                if v117 == nil then
                    v131 = v117;
                else
                    v131 = v117.description;
                end;

                if v131 == nil then
                    v131 = v60.description;
                end;

                v128.description = v131;
                v128.backgroundImages = (v125 == nil or #v125 < 1) and { "rbxassetid://100438919893865" } or v125;
                v128.helperIcons = v63;

                if v117 ~= nil then
                    v117 = v117.AbsolutePosElements;
                end;

                if v117 == nil then
                    v117 = v60.AbsolutePosElements;
                end;

                v128.AbsolutePosElements = v117;
                v127.CardData = v128;
                v127.Tag = p58.Tag;
                v127.PlayerLevelReq = v62;

                function v127.OnClick(p132, p133) -- Line: 739
                    -- upvalues: u115 (copy), u61 (copy)
                    local v134 = u115;

                    if v134 ~= nil then
                        v134 = v134.OnClick;
                    end;

                    if v134 then
                        local v135 = u115;

                        if v135 ~= nil then
                            v135.OnClick(p132, p133);
                        end;

                        return nil;
                    end;

                    if u61.OnClick then
                        u61.OnClick(p132, p133);

                        return nil;
                    end;
                end;

                function v127.OnHover(p136, p137) -- Line: 756
                    -- upvalues: u115 (copy), u61 (copy)
                    local v138 = u115;

                    if v138 ~= nil then
                        v138 = v138.OnHover;
                    end;

                    if v138 then
                        local v139 = u115;

                        if v139 ~= nil then
                            v139.OnHover(p136, p137);
                        end;

                        return nil;
                    end;

                    if u61.OnHover then
                        u61.OnHover(p136, p137);

                        return nil;
                    end;
                end;

                v126.props = v127;
                local v140 = u55;
                u55 = u55 + 1;
                v126.Index = v140;
                v126.QueueVariant = p58;

                return v126;
            end;

            local v142 = 0;
            local v143 = {};
            local v144 = {};

            for i, v in p57 do
                local v145 = v141(v, i - 1, p57);

                if v145 ~= nil then
                    v142 = v142 + 1;
                    v143[v142] = v145;
                end;
            end;

            v144.Cards = v143;
            v144.Page = u13;

            return u3.createElement(PlayMenuCardContainer, v144);
        end;

        local v147 = table.create(#v56);

        for i, v in v56 do
            v147[i] = v146(v, i - 1, v56);
        end;

        return v147;
    end, { u13 }) do
        v53[v54 + i] = v;
    end;

    v49.CardContainerInner = u3.createElement(Empty, v52, v53);
    v46.CardContainer = u3.createElement(EmptyButton, v48, v49);
    local v148 = not v29;

    if v148 then
        if v11 == nil then
            v148 = false;
        else
            v148 = u3.createFragment({
                Description = u3.createElement("ImageButton", {
                    BorderSizePixel = 0,
                    Transparency = 0.5,
                    AutoButtonColor = false,
                    Selectable = false,
                    Size = UDim2.fromScale(0.4, 0.25),
                    Position = UDim2.fromScale(0.5, 0.725),
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0.05, 0),
                        PaddingRight = UDim.new(0.05, 0),
                        PaddingTop = UDim.new(0.05, 0),
                        PaddingBottom = UDim.new(0.05, 0)
                    }), u3.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        Size = UDim2.fromScale(1, 1),
                        Text = v11,
                        TextColor3 = ColorUtil.darken(ColorUtil.WHITE, 0.8),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Regular)
                    }) })
            });
        end;
    end;

    if v148 then
        v46[v47 + 1] = v148;
    end;

    v35.Body = u3.createElement(Empty, v45, v46);
    v33.LobbyPlayMenuAppContainer = u3.createElement(Empty, v34, v35);
    v32[#v32 + 1] = u3.createElement(SlideIn, {}, v33);

    return u3.createElement(FullScreenMenu, v31, v32);
end);

return {
    LobbyPlayMenuApp = v5.connect(function(p150, p151) -- Line: 847
        local v152 = {};

        for i, v in p151 do
            v152[i] = v;
        end;

        v152.KeysData = p150.Keys.keysData;

        return v152;
    end)(v149)
};