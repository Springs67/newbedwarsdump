-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local preloadImages = v1.preloadImages;
local ScaleComponent = v1.ScaleComponent;
local ShineEffect = v1.ShineEffect;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BundleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local BundleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local getEmoteAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local countUnclaimedMilestones = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").countUnclaimedMilestones;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local UgcConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-config").UgcConfig;
local UgcMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta;
local UgcType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-type").UgcType;
local Badge = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge;
local NewPlayerBundleClientUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "store", "ui", "new-player-bundle-util-client").NewPlayerBundleClientUtil;
local BundleSideButton = RuntimeLib.import(script, script.Parent, "bundle", "bundle-lobby-side-button").BundleSideButton;
local LobbyHudCurrency = RuntimeLib.import(script, script.Parent, "lobby-hud-currency").LobbyHudCurrency;
local v6 = RuntimeLib.import(script, script.Parent, "lobby-hud-side-button");
local LobbyHudSideButton = v6.LobbyHudSideButton;
local LobbyHudSideButtonVariant = v6.LobbyHudSideButtonVariant;
local _ = { UgcType.VOID_KNIGHT_KIT_SHOULDER_BUDDY, UgcType.YUZI_KIT_SHOULDER_BUDDY };
local v72 = v4.new(u3)(function(u7, p8) -- Line: 39
    -- upvalues: UgcConfig (copy), NewPlayerBundleClientUtil (copy), countUnclaimedMilestones (copy), AchievementUtil (copy), DeviceUtil (copy), u3 (copy), EventUtil (copy), UgcMeta (copy), preloadImages (copy), u2 (copy), default (copy), BundleMeta (copy), BundleType (copy), TweenService (copy), ScaleComponent (copy), Empty (copy), LobbyHudCurrency (copy), BundleSideButton (copy), EventMeta (copy), Flamework (copy), BedwarsAppIds (copy), LobbyHudSideButton (copy), ShineEffect (copy), BattlePassUtils (copy), BedwarsImageId (copy), getEmoteAsset (copy), EmoteType (copy), Badge (copy), LobbyHudSideButtonVariant (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local v9, _ = useState(false);
    local _, u10 = useState(UgcConfig.UGC_TO_CYCLE[math.random(0, #UgcConfig.UGC_TO_CYCLE - 1) + 1]);
    local u11, u12 = useState((NewPlayerBundleClientUtil.shouldShowNewPlayerBundle()));
    local v13 = countUnclaimedMilestones(u7.playerLevel, u7.milestoneRewardsClaimed);
    local v14 = v13 == nil and 0 or v13;
    local v15 = not u7.achievements and 0 or AchievementUtil.countUnclaimedRewards(u7.achievements);
    local v16 = DeviceUtil.isSmallScreen() and 175 or 185;
    DeviceUtil.isSmallScreen();
    local v17 = 0.03;
    DeviceUtil.isSmallScreen();
    local v18 = 3;
    local v19 = DeviceUtil.isSmallScreen() and 1.5 or 1;
    local v20 = DeviceUtil.isSmallScreen() and 0.8 or 0.95;
    DeviceUtil.isSmallScreen();
    local u21 = u3.createRef();

    local function _(p22) -- Line: 62
        -- upvalues: EventUtil (ref)
        return EventUtil.isEventRunning(p22);
    end;

    local v23 = 0;
    local v24 = {};

    for i, v in EventUtil.getActiveEvents() do
        local _ = i - 1;

        if EventUtil.isEventRunning(v) == true then
            v23 = v23 + 1;
            v24[v23] = v;
        end;
    end;

    local u25 = v24[1];
    useEffect(function() -- Line: 91
        -- upvalues: u21 (copy), u11 (copy), UgcConfig (ref), UgcMeta (ref), preloadImages (ref), u2 (ref), default (ref), BundleMeta (ref), BundleType (ref), NewPlayerBundleClientUtil (ref), u12 (copy), TweenService (ref), u10 (copy)
        local u26 = u21:getValue();

        if not u26 then
            return nil;
        end;

        local u27 = u11;
        local UGC_TO_CYCLE = UgcConfig.UGC_TO_CYCLE;

        local function _(p28) -- Line: 99
            -- upvalues: UgcMeta (ref)
            return UgcMeta[p28].image;
        end;

        local v29 = table.create(#UGC_TO_CYCLE);
        local u30 = {};

        for i, v in UGC_TO_CYCLE do
            local _ = i - 1;
            v29[i] = UgcMeta[v].image;
        end;

        local function _(p31) -- Line: 108
            -- upvalues: u30 (copy)
            table.insert(u30, p31.render);
            local stroke = p31.stroke;

            if stroke ~= "" and stroke then
                table.insert(u30, p31.stroke);
            end;
        end;

        for i, v in v29 do
            local _ = i - 1;
            table.insert(u30, v.render);
            local stroke = v.stroke;

            if stroke ~= "" and stroke then
                table.insert(u30, v.stroke);
            end;
        end;

        preloadImages(u30);
        local u32 = u2.new();
        local u33 = true;
        u32:GiveTask(function() -- Line: 123
            -- upvalues: u33 (ref)
            u33 = false;
        end);
        u32:GiveTask(default.Client:Get("RobuxPurchaseSuccess"):Connect(function(p34) -- Line: 126
            -- upvalues: BundleMeta (ref), BundleType (ref), u27 (ref), NewPlayerBundleClientUtil (ref), u12 (ref)
            if p34.devProductId == BundleMeta[BundleType.NEW_PLAYER_BUNDLE].devProductId and u27 then
                local v35 = NewPlayerBundleClientUtil.shouldShowNewPlayerBundle();
                u12(v35);

                if not v35 then
                    u27 = false;
                end;
            end;
        end));
        local u36 = 0;
        task.spawn(function() -- Line: 138
            -- upvalues: UgcConfig (ref), u33 (ref), u27 (ref), NewPlayerBundleClientUtil (ref), u12 (ref), TweenService (ref), u26 (copy), u32 (copy), u36 (ref), u10 (ref)
            while true do
                local v37 = task.wait(UgcConfig.CYCLE_TIME_SECONDS);

                if v37 == 0 or (v37 ~= v37 or not (v37 and u33)) then
                    break;
                end;

                if u27 then
                    local v38 = NewPlayerBundleClientUtil.shouldShowNewPlayerBundle();
                    u12(v38);

                    if not v38 then
                        u27 = false;
                    end;
                else
                    local v39 = TweenService:Create(u26, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        Size = UDim2.fromScale(0, 0)
                    });
                    v39:Play();
                    u32:GiveTask(v39.Completed:Once(function() -- Line: 159
                        -- upvalues: UgcConfig (ref), u36 (ref), u10 (ref), TweenService (ref), u26 (ref)
                        u36 = u36 + 1;
                        u10(UgcConfig.UGC_TO_CYCLE[u36 % #UgcConfig.UGC_TO_CYCLE + 1]);
                        TweenService:Create(u26, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Size = UDim2.fromScale(1, 1)
                        }):Play();
                    end));
                end;
            end;
        end);

        return function() -- Line: 170
            -- upvalues: u32 (copy)
            u32:DoCleaning();
        end;
    end, {});
    local v40 = {
        ResetOnSpawn = false,
        Enabled = not v9
    };
    local v41 = {};
    local _ = #v41;
    local v42 = {
        Size = UDim2.fromOffset(v16, 600),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.01, DeviceUtil.isSmallScreen() and 0.39 or 0.43)
    };
    local v43 = {
        u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(v16, 600)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }),
        u3.createElement(Empty, {
            LayoutOrder = 2
        }),
        LobbyHudCurrency = u3.createElement(Empty, {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        }, { u3.createElement(LobbyHudCurrency, {
                FrameProps = {
                    LayoutOrder = 2
                },
                BedCoins = u7.bedCoins
            }) })
    };
    local _ = #v43;
    local v44;

    if u11 then
        local v45 = {
            Size = UDim2.new(DeviceUtil.isSmallScreen() and 0.9 or 1, 0, 0, 80),
            LayoutOrder = DeviceUtil.isSmallScreen() and 2 or 1
        };
        local v46 = {};
        local v47 = {
            [u3.Ref] = u21,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v48 = {};
        local v49 = {
            BundleType = BundleType.NEW_PLAYER_BUNDLE
        };
        local newPlayerBundleData = u7.newPlayerBundleData;

        if newPlayerBundleData ~= nil then
            newPlayerBundleData = newPlayerBundleData.firstJoinTime;
        end;

        local v50;

        if newPlayerBundleData == nil then
            v50 = NewPlayerBundleClientUtil.getNewPlayerBundleExpireTime();
        else
            v50 = NewPlayerBundleClientUtil.getNewPlayerBundleExpireTimeFromJoin(u7.newPlayerBundleData.firstJoinTime);
        end;

        v49.EndTime = v50;
        v48[#v48 + 1] = u3.createElement(BundleSideButton, v49);
        v46[#v46 + 1] = u3.createElement(Empty, v47, v48);
        v44 = u3.createFragment({
            BundleWrapper = u3.createElement(Empty, v45, v46)
        });
    else
        v44 = u3.createFragment();
    end;

    local v51 = {
        Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 70 or 145)
    };
    local v52 = {
        u3.createElement("UIListLayout", {
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            FillDirection = DeviceUtil.isSmallScreen() and "Horizontal" or "Vertical",
            VerticalAlignment = DeviceUtil.isSmallScreen() and "Center" or "Bottom",
            Padding = UDim.new(0, 8)
        }),
        [#v52 + 1] = v44
    };

    if u25 then
        local v53 = {};
        local lobbyButtonConfig = EventMeta[u25].lobbyButtonConfig;

        if lobbyButtonConfig ~= nil then
            lobbyButtonConfig = lobbyButtonConfig.icon;
        end;

        if lobbyButtonConfig == nil then
            local navbarImage = EventMeta[u25].navbarImage;
            lobbyButtonConfig = navbarImage == nil and "" or navbarImage;
        end;

        v53.Icon = lobbyButtonConfig;
        local lobbyButtonConfig2 = EventMeta[u25].lobbyButtonConfig;

        if lobbyButtonConfig2 ~= nil then
            lobbyButtonConfig2 = lobbyButtonConfig2.bannerImage;
        end;

        v53.BackgroundImage = lobbyButtonConfig2 == nil and "" or lobbyButtonConfig2;
        v53.Text = EventMeta[u25].name;

        function v53.OnClick() -- Line: 285
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u25 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.EVENT_APP, {
                event = u25
            });
        end;

        local lobbyButtonConfig3 = EventMeta[u25].lobbyButtonConfig;

        if lobbyButtonConfig3 ~= nil then
            lobbyButtonConfig3 = lobbyButtonConfig3.backgroundGradient;
        end;

        if lobbyButtonConfig3 == nil then
            lobbyButtonConfig3 = ColorSequence.new(Color3.fromRGB(0, 251, 255), Color3.fromRGB(0, 119, 245));
        end;

        v53.BackgroundGradient = lobbyButtonConfig3;
        v53.FrameProps = {
            LayoutOrder = 1,
            ImageTransparency = 0.6,
            Size = UDim2.new(0.9, 0, 0, 60)
        };
        v53.TextLabelProps = {
            TextSize = 18,
            Size = UDim2.fromScale(1, 0.4)
        };
        v53.IconProps = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.8, 0.75)
        };
        u25 = u3.createElement(LobbyHudSideButton, v53, { u3.createElement("UIStroke", {
                Transparency = 0.3,
                Thickness = 4,
                Color = Color3.fromRGB(255, 255, 255)
            }), u3.createElement(ShineEffect, {
                Loop = true
            }) });
    end;

    v52[#v52 + 1] = u25;
    v43.ExtraButtons = u3.createElement(Empty, v51, v52);
    local v54 = {
        AutomaticSize = "Y",
        LayoutOrder = 3,
        Size = UDim2.fromScale(v19 * 1, 0)
    };
    local v55 = { u3.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            CellSize = UDim2.fromOffset(v16 * v19 / v18 * v20, v16 * v19 / v18 * v20),
            CellPadding = UDim2.new(0, v16 * v19 / v18 * (1 - (1 - v17)) * v18, 0, v16 * v19 / v18 * (1 - (1 - v17)) * v18),
            FillDirectionMaxCells = v18
        }) };
    local v56 = #v55;
    local v57 = BattlePassUtils.isActiveBattlePass() and u3.createElement(LobbyHudSideButton, {
        Text = "BattlePass",
        Icon = BattlePassUtils.BATTLE_PASS_SEASON_ICON,

        OnClick = function() -- Line: 345, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), BattlePassUtils (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {
                battlepass = BattlePassUtils.BATTLE_PASS_SEASON
            });
        end,

        FrameProps = {
            LayoutOrder = 2
        },
        BackgroundGradient = ColorSequence.new(Color3.fromRGB(247, 209, 89), Color3.fromRGB(245, 143, 8))
    }, { u3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(v16 * v19 / v18 * v20 * 1.85, v16 * v19 / v18 * v20 * 0.9)
        }), u3.createElement("UIStroke", {
            Thickness = 2,
            Color = Color3.fromRGB(255, 230, 138)
        }) });

    if v57 then
        v55[v56 + 1] = v57;
    end;

    local v58 = #v55;
    v55[v58 + 1] = u3.createElement(LobbyHudSideButton, {
        Text = "Missions",
        Icon = BedwarsImageId.MISSION,

        OnClick = function() -- Line: 370, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.MISSIONS, {});
        end,

        FrameProps = {
            LayoutOrder = 3
        }
    });
    v55[v58 + 2] = u3.createElement(LobbyHudSideButton, {
        Text = "Locker",
        LevelLocked = 2,
        Icon = BedwarsImageId.MIRROR_KILL_EFFECT,
        PlayerLevel = u7.playerLevel,

        OnClick = function() -- Line: 382, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LOCKER, {});
        end,

        FrameProps = {
            LayoutOrder = 4
        }
    });
    v55[v58 + 3] = u3.createElement(LobbyHudSideButton, {
        Text = "Clan",
        LevelLocked = 2,
        Icon = BedwarsImageId.CLAN,
        PlayerLevel = u7.playerLevel,

        OnClick = function() -- Line: 394, Name: OnClick
            -- upvalues: u7 (copy), Flamework (ref), BedwarsAppIds (ref)
            local myClanId = u7.myClanId;

            if myClanId == "" or not myClanId then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_MENU, {});

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = u7.myClanId
            });
        end,

        FrameProps = {
            LayoutOrder = 5
        }
    });
    local v59 = {};
    local v60 = getEmoteAsset(EmoteType.LUCKY_GIFT);
    v59.Icon = v60 == nil and "" or v60;
    v59.Text = "Store";
    v59.PlayerLevel = u7.playerLevel;

    function v59.OnClick() -- Line: 416
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.STORE_MENU_APP, {
            AppId = BedwarsAppIds.STORE_MENU_APP
        });
    end;

    v59.FrameProps = {
        LayoutOrder = 6
    };
    v55[v58 + 4] = u3.createElement(LobbyHudSideButton, v59, { u3.createElement(ShineEffect) });
    v43.SquareButtons = u3.createElement(Empty, v54, v55);
    local v61 = {
        AutomaticSize = "Y",
        LayoutOrder = 6,
        Size = UDim2.fromScale(1, 0)
    };
    local v62 = { u3.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 2,
            VerticalAlignment = "Top",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            CellSize = UDim2.fromOffset(v16 / 2 * 0.9, v16 / 2 * (DeviceUtil.isSmallScreen() and 0.45 or 0.42)),
            CellPadding = UDim2.new(0, v16 / 2 * 0.050000000000000044 * 2, 0, v16 / 2 * 0.050000000000000044 * 2)
        }) };
    local v63 = #v62;
    local v64 = {
        Icon = "rbxassetid://12508915374",
        Text = "Milestones",

        OnClick = function() -- Line: 448, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.MILESTONES, {});
        end,

        FrameProps = {
            LayoutOrder = 6
        }
    };
    local v65 = {};
    local v66 = #v65;
    local v67;

    if v14 > 0 then
        v67 = u3.createElement(Badge, {
            Text = tostring(v14)
        });
    else
        v67 = false;
    end;

    if v67 then
        v65[v66 + 1] = v67;
    end;

    v62[v63 + 1] = u3.createElement(LobbyHudSideButton, v64, v65);
    v62[v63 + 2] = u3.createElement(LobbyHudSideButton, {
        Text = "Tournament",
        LevelLocked = 2,
        Icon = BedwarsImageId.TOURNAMENT_QUEUE_ICON,
        PlayerLevel = u7.playerLevel,
        Variant = LobbyHudSideButtonVariant.SHORT,

        OnClick = function() -- Line: 470, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.TOURNAMENT_APP, {});
        end,

        FrameProps = {
            LayoutOrder = 7
        }
    });
    v62[v63 + 3] = u3.createElement(LobbyHudSideButton, {
        Text = "Social",
        Icon = BedwarsImageId.FRIENDS_ICON_SOLID,
        Variant = LobbyHudSideButtonVariant.SHORT,

        OnClick = function() -- Line: 481, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SOCIAL_APP, {});
        end,

        FrameProps = {
            LayoutOrder = 8
        }
    });
    local v68 = {
        Text = "Achievements",
        Icon = BedwarsImageId.ACHIEVEMENT_DEFAULT_ICON,
        Variant = LobbyHudSideButtonVariant.SHORT,

        OnClick = function() -- Line: 492, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ACHIEVEMENTS, {});
        end,

        FrameProps = {
            LayoutOrder = 1
        }
    };
    local v69 = {};
    local v70 = #v69;
    local v71;

    if v15 > 0 then
        v71 = u3.createElement(Badge, {
            Text = tostring(v15)
        });
    else
        v71 = false;
    end;

    if v71 then
        v69[v70 + 1] = v71;
    end;

    v62[v63 + 4] = u3.createElement(LobbyHudSideButton, v68, v69);
    v43.ShortButtons = u3.createElement(Empty, v61, v62);
    v41.LobbyHudSide = u3.createElement(Empty, v42, v43);

    return u3.createFragment({
        LobbyHudSideGui = u3.createElement("ScreenGui", v40, v41)
    });
end);

return {
    LobbyHudSide = v5.connect(function(p73, p74) -- Line: 515
        local v75 = {};

        for i, v in p74 do
            v75[i] = v;
        end;

        v75.myClanId = p73.Clans.myClanId;
        v75.playerLevel = p73.Bedwars.playerLevel;
        v75.milestoneRewardsClaimed = p73.Bedwars.milestoneRewardsClaimed;
        v75.bedCoins = p73.Bedwars.bedCoins;
        v75.achievements = p73.Lobby.achievements;
        v75.newPlayerBundleData = p73.Lobby.robuxStore.newPlayerBundleData;

        return v75;
    end)(v72)
};