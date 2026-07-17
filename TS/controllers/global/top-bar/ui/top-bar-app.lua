-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local TopBarButton = v1.TopBarButton;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local MissionsApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "missions", "ui", "missions-app").MissionsApp;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role");
local CustomMatchRole = v7.CustomMatchRole;
local CustomMatchRoleAttribute = v7.CustomMatchRoleAttribute;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local RateMapModal = RuntimeLib.import(script, script.Parent.Parent.Parent, "map", "published-maps", "rate-map-modal").RateMapModal;
local SettingsApp = RuntimeLib.import(script, script.Parent.Parent.Parent, "settings", "ui", "settings-app").SettingsApp;
local TopBarGameApp = RuntimeLib.import(script, script.Parent, "game", "top-bar-game-app").TopBarGameApp;
local TopBarDropdownItem = RuntimeLib.import(script, script.Parent, "top-bar-dropdown-item").TopBarDropdownItem;
local v73 = v4.new(u3)(function(u8, p9) -- Line: 37
    -- upvalues: DeviceUtil (copy), PlaceUtil (copy), QueueType (copy), QueueMeta (copy), Flamework (copy), KnitClient (copy), Players (copy), CustomMatchRoleAttribute (copy), CustomMatchRole (copy), u6 (copy), u3 (copy), EmoteShowcase (copy), EmoteMeta (copy), EmoteType (copy), u2 (copy), SettingsApp (copy), UILayers (copy), SoundManager (copy), GameSound (copy), Theme (copy), TopBarGameApp (copy), TopBarButton (copy), BedwarsImageId (copy), ClientSyncEvents (copy), ColorUtil (copy), TopBarDropdownItem (copy), MissionsApp (copy), BedwarsAppIds (copy), RateMapModal (copy), AutoCanvasScrollingFrame (copy)
    local useState = p9.useState;
    local useEffect = p9.useEffect;
    local v10 = DeviceUtil.isMobileControls();
    local v11 = PlaceUtil.isLobbyServer();
    local u12 = PlaceUtil.isGameServer() or u8.ForceGameApp;
    local v13;

    if DeviceUtil.isHoarceKat() then
        v13 = QueueType.SKYWARS_TO2;
    else
        v13 = u8.QueueType or QueueType.BEDWARS_TEST;
    end;

    local v14;

    if DeviceUtil.isHoarceKat() then
        v14 = QueueMeta[v13];
    else
        v14 = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v13);
    end;

    local u15, u16 = useState(false);
    local v17, u18 = useState(false);
    local v19, u20 = useState(false);
    local v21, u22 = useState(false);
    local CustomMatchMapSaveInfoDto = u8.CustomMatchMapSaveInfoDto;

    if CustomMatchMapSaveInfoDto ~= nil then
        CustomMatchMapSaveInfoDto = CustomMatchMapSaveInfoDto.isMapPublished;
    end;

    local v23 = (v19 and 1 or 0) + 3 + (v21 and 1 or 0) + (v10 and 1 or 0) + (v14.rankCategory and 1 or 0) + (CustomMatchMapSaveInfoDto and 1 or 0);
    local v24 = v23 * 32 + (v23 - 1) * 8;
    useEffect(function() -- Line: 59
        -- upvalues: DeviceUtil (ref), u12 (copy), PlaceUtil (ref), KnitClient (ref), u22 (copy), u20 (copy), Players (ref), CustomMatchRoleAttribute (ref), CustomMatchRole (ref)
        if DeviceUtil.isHoarceKat() or not u12 then
            return nil;
        end;

        local v25 = { "anticheat_mod", "admin", "artist" };

        if PlaceUtil.isStaging() then
            table.insert(v25, "tester");
        end;

        if not KnitClient.Controllers.PermissionController:hasAnyPermissions(v25) then
            local u28 = Players.LocalPlayer:GetAttributeChangedSignal(CustomMatchRoleAttribute):Connect(function() -- Line: 76
                -- upvalues: Players (ref), CustomMatchRoleAttribute (ref), CustomMatchRole (ref), u20 (ref), u22 (ref)
                local v26 = Players.LocalPlayer:GetAttribute(CustomMatchRoleAttribute);
                local v27 = v26 == CustomMatchRole.COHOST and true or v26 == CustomMatchRole.HOST;
                u20(v27);
                u22(v27);
            end);

            return function() -- Line: 82
                -- upvalues: u28 (ref)
                u28:Disconnect();
            end;
        end;

        u22(true);
        u20(true);

        return nil;
    end, {});
    useEffect(function() -- Line: 86
        -- upvalues: u8 (copy), Players (ref), u20 (copy), u22 (copy)
        local LocalPlayerId = u8.LocalPlayerId;

        if LocalPlayerId == nil then
            LocalPlayerId = Players.LocalPlayer.UserId;
        end;

        if LocalPlayerId == u8.CustomHostUserId then
            u20(true);
            u22(true);
        end;
    end, { u8.CustomHostUserId });

    local function u39() -- Line: 98
        -- upvalues: u15 (copy), KnitClient (ref), Players (ref), u6 (ref), u3 (ref), EmoteShowcase (ref), EmoteMeta (ref), EmoteType (ref), DeviceUtil (ref), u2 (ref), u16 (copy)
        if u15 and KnitClient.Controllers.RadialWheelController:isRadialWheelOpen() then
            KnitClient.Controllers.RadialWheelController:closeRadialWheel();
        else
            local v29 = {};

            for i, v in Players.LocalPlayer:GetAttributes() do
                if u6.startsWith(i, "EmoteTypeSlot") and v ~= nil then
                    local v30 = tonumber(u6.slice(i, #i - 1));
                    local v31 = {
                        element = u3.createElement(EmoteShowcase, {
                            Emote = v
                        })
                    };
                    local v32 = EmoteMeta[v];

                    if v32 ~= nil then
                        v32 = v32.name;
                    end;

                    if v32 == nil then
                        v32 = "Slot " .. tostring((v30 == nil and 0 or v30) + 1);
                    end;

                    v31.title = v32;

                    function v31.onSelect() -- Line: 131
                        -- upvalues: KnitClient (ref), v (copy)
                        KnitClient.Controllers.EmoteController:emote(v);
                        KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                    end;

                    v29[v30] = v31;
                end;
            end;

            local v33 = false;
            local v34 = 1;

            while true do
                if true then
                    if v33 then
                        v34 = v34 + 1;
                    else
                        v33 = true;
                    end;
                end;

                if v34 > 8 then
                    break;
                end;

                if v29[v34] == nil then
                    v29[v34] = {
                        title = "",
                        element = u3.createElement(EmoteShowcase, {
                            Emote = EmoteType.NONE
                        }),

                        onSelect = function() -- Line: 157, Name: onSelect
                            -- upvalues: KnitClient (ref)
                            KnitClient.Controllers.RadialWheelController:closeRadialWheel();
                        end
                    };
                end;
            end;

            local v35 = DeviceUtil.isMobileControls() or DeviceUtil.isGamepadControls();

            if not DeviceUtil.isHoarceKat() then
                local RadialWheelController = KnitClient.Controllers.RadialWheelController;
                local v36 = u2.values(v29);
                local v37 = UDim2.fromScale(0.5, 0.5);
                local v38;

                if v35 then
                    v38 = UDim2.fromScale(0.6, 0.6);
                else
                    v38 = nil;
                end;

                RadialWheelController:openRadialWheel(v36, 8, nil, not v35, v37, v38);
            end;
        end;

        u16(not u15);
    end;

    local function u40() -- Line: 174
        -- upvalues: Flamework (ref), SettingsApp (ref), UILayers (ref), SoundManager (ref), GameSound (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "SettingsApp",
            app = SettingsApp
        }, {}, UILayers.MAIN);
        SoundManager:playSound(GameSound.UI_OPEN_2);
    end;

    local v41 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };
    local v42 = {};
    local v43 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.1, 0.035),
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.new(1, -10, 0, Theme.topBarTopOffset)
    };
    local v44 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }) };
    local v45 = #v44;
    local v46;

    if u12 then
        v46 = u3.createElement(TopBarGameApp, {
            AppId = "TopBarGameApp",
            LocalPlayerId = u8.LocalPlayerId
        });
    else
        v46 = u12;
    end;

    if v46 then
        v44[v45 + 1] = v46;
    end;

    local v47 = #v44;

    if v11 then
        v11 = u3.createFragment({ u3.createElement(TopBarButton, {
                Text = "Patch Notes",
                LayoutOrder = 0,

                OnClick = function() -- Line: 217, Name: OnClick
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.GameUpdatesController:openGameUpdateApp();
                end
            }), u3.createElement(TopBarButton, {
                ImageScale = 0.9,
                LayoutOrder = 1,
                ToolTip = "PROFILE",
                Image = BedwarsImageId.TOPBAR_PROFILE_ICON,

                OnClick = function() -- Line: 225, Name: OnClick
                    -- upvalues: KnitClient (ref), Players (ref)
                    KnitClient.Controllers.PlayerProfileUIController:openPlayerProfile(Players.LocalPlayer);
                end
            }) });
    end;

    if v11 then
        v44[v47 + 1] = v11;
    end;

    local v48 = #v44;

    if v10 then
        v10 = u3.createElement(TopBarButton, {
            LayoutOrder = 50,
            ToolTip = "SHIFT LOCK",
            Image = BedwarsImageId.HUD_MOBILE_SHIFT_LOCK,

            OnClick = function(p49, p50) -- Line: 239, Name: OnClick
                -- upvalues: KnitClient (ref)
                if KnitClient.Controllers.MobileShiftLockController:isEnabled() then
                    KnitClient.Controllers.MobileShiftLockController:disable();
                    p50(false);

                    return;
                end;

                KnitClient.Controllers.MobileShiftLockController:enable();
                p50(true);
            end
        });
    end;

    if v10 then
        v44[v48 + 1] = v10;
    end;

    local v51 = #v44;
    local v52 = not u12 and u3.createElement(TopBarButton, {
        LayoutOrder = 51,
        ToolTip = "EMOTE",
        Image = BedwarsImageId.TOPBAR_EMOTE_ICON,

        OnClick = function() -- Line: 257, Name: OnClick
            -- upvalues: u39 (copy)
            u39();
        end
    });

    if v52 then
        v44[v51 + 1] = v52;
    end;

    local v53 = #v44;
    local v58 = not u12 and u3.createElement(TopBarButton, {
        ToolTip = "SETTINGS",
        LayoutOrder = 53,
        Image = BedwarsImageId.GEAR_OULTINE_ICON,
        SelectedState = {
            Image = BedwarsImageId.GEAR_FILLED_ICON
        },

        OnClick = function(p54, u55) -- Line: 271, Name: OnClick
            -- upvalues: u40 (copy), ClientSyncEvents (ref)
            u40();
            u55(not p54);
            local u56 = nil;
            u56 = ClientSyncEvents.AppClose:connect(function(p57) -- Line: 276
                -- upvalues: u55 (copy), u56 (ref)
                if p57.appId == "SettingsApp" then
                    u55(false);
                    u56:Destroy();
                end;
            end);
        end
    });

    if v58 then
        v44[v53 + 1] = v58;
    end;

    local v59 = #v44;

    if u12 then
        u12 = u3.createElement(TopBarButton, {
            LayoutOrder = 100,
            Image = BedwarsImageId.ELLIPSIS,

            OnClick = function(p60, p61) -- Line: 292, Name: OnClick
                -- upvalues: u18 (copy)
                p61(not p60);
                u18(not p60);
            end
        });
    end;

    if u12 then
        v44[v59 + 1] = u12;
    end;

    v42.TopBarApp = u3.createElement("Frame", v43, v44);
    local v62 = {
        BackgroundTransparency = 0.4,
        Size = UDim2.new(0, 136, 0, v24 + 10),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -10, 0, Theme.topBarTopOffset + 32 + 10),
        BackgroundColor3 = ColorUtil.BLACK,
        Visible = v17
    };
    local v63 = { u3.createElement("UISizeConstraint", {
            MaxSize = Vector2.new((1 / 0), 300)
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }) };
    local v64 = {
        ScrollingFrameProps = {
            Size = UDim2.new(1, 0, 0, v24) - UDim2.fromOffset(10, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        }
    };
    local v65 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 8)
        }), u3.createElement(TopBarDropdownItem, {
            Text = "Settings",
            LayoutOrder = 0,
            Image = BedwarsImageId.GEAR_OULTINE_ICON,
            OnClick = u40
        }), u3.createElement(TopBarDropdownItem, {
            Text = "Emote",
            LayoutOrder = 2,
            Image = BedwarsImageId.TOPBAR_EMOTE_ICON,
            OnClick = u39
        }) };
    local v66 = #v65;
    local v67 = not (v14.disableMissionProgress or u8.IsCustom) and u3.createElement(TopBarDropdownItem, {
        Text = "Missions",
        LayoutOrder = 1,
        Image = BedwarsImageId.TOPBAR_MISSIONS_ICON,

        OnClick = function() -- Line: 353, Name: OnClick
            -- upvalues: Flamework (ref), MissionsApp (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                app = MissionsApp,
                appId = BedwarsAppIds.MISSIONS
            }, {
                HideSidebar = true
            });
        end
    });

    if v67 then
        v65[v66 + 1] = v67;
    end;

    local v68 = #v65;

    if v19 then
        v19 = u3.createElement(TopBarDropdownItem, {
            Text = "Host Panel",
            LayoutOrder = 10,

            OnClick = function() -- Line: 369, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CUSTOM_MATCH_HOST_PANEL, {});
                SoundManager:playSound(GameSound.UI_OPEN_2);
            end
        });
    end;

    if v19 then
        v65[v68 + 1] = v19;
    end;

    local v69 = #v65;

    if v21 then
        v21 = u3.createElement(TopBarDropdownItem, {
            Text = "Scripts",
            LayoutOrder = 11,

            OnClick = function() -- Line: 381, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SCRIPT_EDITOR, {});
                SoundManager:playSound(GameSound.UI_OPEN_2);
            end,

            Disabled = not v21
        });
    end;

    if v21 then
        v65[v69 + 1] = v21;
    end;

    local v70 = #v65;
    local v71 = v14.rankCategory and u3.createElement(TopBarDropdownItem, {
        Text = "Report",
        LayoutOrder = 21,

        OnClick = function() -- Line: 394, Name: OnClick
            -- upvalues: Flamework (ref), ColorUtil (ref), Theme (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                message = "Report a user with video proof at: <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">easy.gg/report</font>"
            });
        end,

        Disabled = not v14.rankCategory
    });

    if v71 then
        v65[v70 + 1] = v71;
    end;

    local v72 = #v65;
    local CustomMatchMapSaveInfoDto2 = u8.CustomMatchMapSaveInfoDto;

    if CustomMatchMapSaveInfoDto2 ~= nil then
        CustomMatchMapSaveInfoDto2 = CustomMatchMapSaveInfoDto2.isMapPublished;
    end;

    if CustomMatchMapSaveInfoDto2 then
        CustomMatchMapSaveInfoDto2 = u3.createElement(TopBarDropdownItem, {
            Text = "Rate Map",
            LayoutOrder = 20,

            OnClick = function() -- Line: 414, Name: OnClick
                -- upvalues: u8 (copy), Flamework (ref), RateMapModal (ref)
                if not u8.CustomMatchMapSaveInfoDto then
                    return nil;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                    appId = "RateMapModal",
                    app = RateMapModal
                }, {
                    mapData = {
                        mapId = u8.CustomMatchMapSaveInfoDto.mapId,
                        mapTitle = u8.CustomMatchMapSaveInfoDto.mapTitle,
                        creatorUserId = u8.CustomMatchMapSaveInfoDto.creatorUserId,
                        thumbnailImage = u8.CustomMatchMapSaveInfoDto.thumbnailImage
                    }
                });
            end
        });
    end;

    if CustomMatchMapSaveInfoDto2 then
        v65[v72 + 1] = CustomMatchMapSaveInfoDto2;
    end;

    v63[#v63 + 1] = u3.createElement(AutoCanvasScrollingFrame, v64, v65);
    v42[#v42 + 1] = u3.createElement("Frame", v62, v63);

    return u3.createFragment({
        TopBarAppGui = u3.createElement("ScreenGui", v41, v42)
    });
end);

return {
    TopBarApp = v5.connect(function(p74, p75) -- Line: 442
        local v76 = {};

        for i, v in p75 do
            v76[i] = v;
        end;

        v76.QueueType = p74.Game.queueType;
        v76.CustomMatchMapSaveInfoDto = p74.CustomMatch.mapSaveData;
        local customMatch = p74.Game.customMatch;

        if customMatch ~= nil then
            customMatch = customMatch.hostUserId;
        end;

        v76.CustomHostUserId = customMatch;
        v76.IsCustom = p74.Game.customMatch ~= nil;

        return v76;
    end)(v73)
};