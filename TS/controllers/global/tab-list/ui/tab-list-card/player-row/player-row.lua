-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local Padding = v1.Padding;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "bw-player-render");
local BWPlayerRender = v6.BWPlayerRender;
local PlayerRenderFallbackMode = v6.PlayerRenderFallbackMode;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local getKitArrayFromCommaSeparatedString = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitArrayFromCommaSeparatedString;
local PlayerName = RuntimeLib.import(script, script.Parent, "player-name").PlayerName;
local PlayerStats = RuntimeLib.import(script, script.Parent, "player-stats").PlayerStats;
local v63 = v4.new(u3)(function(u7, p8) -- Line: 31
    -- upvalues: Players (copy), OfflinePlayerUtil (copy), u3 (copy), tabListLayout (copy), ColorUtil (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), default (copy), UILayers (copy), u2 (copy), DeviceUtil (copy), KnitClient (copy), getQueueMeta (copy), GameType (copy), getKitArrayFromCommaSeparatedString (copy), ButtonComponent (copy), GamePlayerUtil (copy), Empty (copy), Padding (copy), BWPlayerRender (copy), PlayerRenderFallbackMode (copy), PlayerName (copy), PlayerStats (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState(false);
    local v11, u12 = useState(nil);
    local u13 = Players:GetPlayerByUserId(u7.Player.userId);
    local u14;

    if Players.LocalPlayer then
        u14 = u7.Player.userId == Players.LocalPlayer.UserId;
    else
        u14 = u7.Player.userId == OfflinePlayerUtil.Dummy.oiogy.userId;
    end;

    local function v16(p15) -- Line: 39
        -- upvalues: u3 (ref)
        local BackgroundTransparency = p15.BackgroundTransparency;
        local BackgroundColor3 = p15.BackgroundColor3;

        return u3.createFragment({
            RowOverlay = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = BackgroundTransparency,
                BackgroundColor3 = BackgroundColor3
            })
        });
    end;

    local function v17() -- Line: 51
        -- upvalues: u3 (ref), tabListLayout (ref), ColorUtil (ref)
        return u3.createFragment({
            BottomDivider = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, tabListLayout.rows.cards.card.playerRow.bottomBorderHeight),
                Position = UDim2.new(0, 0, 1, -1),
                AnchorPoint = Vector2.new(0, 0),
                BackgroundTransparency = tabListLayout.bgTransparency.playerRow,
                BackgroundColor3 = ColorUtil.hexColor(8159178)
            })
        });
    end;

    local function u19(u18) -- Line: 63
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), Theme (ref), default (ref), UILayers (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
            Title = "Ban Player?",
            Body = "Are you sure you want to permanantly ban this player?",
            PrimaryBtnProps = {
                Text = "BAN",
                BackgroundColor3 = Theme.backgroundError
            },
            SecondaryBtnProps = {
                Text = "CANCEL"
            },

            OnPrimaryBtnClick = function() -- Line: 74, Name: OnPrimaryBtnClick
                -- upvalues: default (ref), u18 (copy), Flamework (ref)
                default.Client:Get("BanPlayer"):CallServerAsync(u18);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Banned " .. u18.DisplayName
                });
            end,

            OnSecondaryBtnClick = function() -- Line: 80, Name: OnSecondaryBtnClick
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end
        });
    end;

    useEffect(function() -- Line: 85
        -- upvalues: u2 (ref), DeviceUtil (ref), KnitClient (ref), getQueueMeta (ref), GameType (ref), Players (ref), u7 (copy), getKitArrayFromCommaSeparatedString (ref), u12 (copy)
        local u20 = u2.new();
        u20:GiveTask(task.spawn(function() -- Line: 87
            -- upvalues: DeviceUtil (ref), KnitClient (ref), getQueueMeta (ref), GameType (ref), Players (ref), u7 (ref), getKitArrayFromCommaSeparatedString (ref), u12 (ref), u20 (copy)
            local v21 = DeviceUtil.isHoarceKat() and { false, nil } or { KnitClient.Controllers.MatchController:getQueueTypeAsync():await() };
            local v22 = v21[2];

            if not (v21[1] and v22) then
                return nil;
            end;

            if getQueueMeta(v22).game ~= GameType.COMBINED_KIT then
                u12(u7.PlayerKit and { u7.PlayerKit } or nil);

                return;
            end;

            local u23 = Players:GetPlayerByUserId(u7.Player.userId);

            if not u23 then
                return nil;
            end;

            local function _() -- Line: 100
                -- upvalues: u23 (copy), getKitArrayFromCommaSeparatedString (ref), u12 (ref)
                local v24 = u23:GetAttribute("PlayingAsKits");

                if v24 ~= "" and v24 then
                    u12((getKitArrayFromCommaSeparatedString(v24)));
                end;
            end;

            local v25 = u23:GetAttribute("PlayingAsKits");

            if v25 ~= "" and v25 then
                u12((getKitArrayFromCommaSeparatedString(v25)));
            end;

            u20:GiveTask(u23:GetAttributeChangedSignal("PlayingAsKits"):Connect(function() -- Line: 108
                -- upvalues: u23 (copy), getKitArrayFromCommaSeparatedString (ref), u12 (ref)
                local v26 = u23:GetAttribute("PlayingAsKits");

                if v26 ~= "" and v26 then
                    u12((getKitArrayFromCommaSeparatedString(v26)));
                end;
            end));
        end));
    end, { u7.PlayerKit });

    local function v51() -- Line: 116
        -- upvalues: u14 (copy), u3 (ref), DeviceUtil (ref), ButtonComponent (ref), Flamework (ref), u7 (copy), OfflinePlayerUtil (ref), GamePlayerUtil (ref), Theme (ref), KnitClient (ref), u19 (copy), default (ref), Empty (ref), Padding (ref), BWPlayerRender (ref), PlayerRenderFallbackMode (ref), u13 (copy)
        local v27 = not u14;

        if v27 then
            local v28 = {
                AutomaticSize = "Y",
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 30)
            };
            local v33 = {
                u3.createElement("UIListLayout", {
                    SortOrder = "LayoutOrder",
                    VerticalAlignment = "Center",
                    FillDirection = DeviceUtil.isSmallScreen() and "Vertical" or "Horizontal",
                    Padding = UDim.new(0, 4)
                }),
                ReportPlayerButton = u3.createElement(ButtonComponent, {
                    Text = "<b>REPORT</b>",
                    ZIndex = 20,
                    LayoutOrder = 1,
                    Size = UDim2.new(DeviceUtil.isSmallScreen() and 1 or 0.5, -4, 0, 30),

                    OnClick = function() -- Line: 134, Name: OnClick
                        -- upvalues: Flamework (ref), u7 (ref), OfflinePlayerUtil (ref), GamePlayerUtil (ref)
                        if Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):reportPlayer(u7.Player.userId) then
                            local v29 = OfflinePlayerUtil.getPlayer(u7.Player);
                            local v30 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                            local v31 = {};
                            local v32;

                            if v29 then
                                v32 = GamePlayerUtil.getGamePlayer(v29):getDisplayName();
                            else
                                v32 = u7.Player.displayName;
                            end;

                            v31.message = "Reported " .. v32;
                            v30:sendInfoNotification(v31);
                        end;
                    end,

                    BackgroundColor3 = Theme.backgroundSecondary,
                    CornerRadius = UDim.new(0, 0)
                })
            };
            local v34 = #v33;
            local v37 = not DeviceUtil.isHoarceKat() and KnitClient.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist" }) and u3.createFragment({
                BanPlayerButton = u3.createFragment({
                    BanPlayerButton = u3.createElement(ButtonComponent, {
                        Text = "<b>BAN</b>",
                        ZIndex = 20,
                        LayoutOrder = 2,
                        Size = UDim2.new(DeviceUtil.isSmallScreen() and 1 or 0.25, -4, 0, 30),

                        OnClick = function() -- Line: 155, Name: OnClick
                            -- upvalues: OfflinePlayerUtil (ref), u7 (ref), u19 (ref)
                            local v35 = OfflinePlayerUtil.getPlayer(u7.Player);

                            if v35 then
                                u19(v35);
                            end;
                        end,

                        BackgroundColor3 = Theme.mcRed,
                        CornerRadius = UDim.new(0, 0)
                    })
                }),
                KickPlayerButton = u3.createFragment({
                    KickPlayerButton = u3.createElement(ButtonComponent, {
                        Text = "<b>KICK</b>",
                        ZIndex = 20,
                        LayoutOrder = 3,
                        Size = UDim2.new(DeviceUtil.isSmallScreen() and 1 or 0.25, -4, 0, 30),

                        OnClick = function() -- Line: 171, Name: OnClick
                            -- upvalues: OfflinePlayerUtil (ref), u7 (ref), default (ref)
                            local v36 = OfflinePlayerUtil.getPlayer(u7.Player);

                            if v36 then
                                default.Client:Get("KickPlayer"):CallServerAsync(v36);
                            end;
                        end,

                        BackgroundColor3 = Theme.mcGold,
                        CornerRadius = UDim.new(0, 0)
                    })
                })
            });

            if v37 then
                v33[v34 + 1] = v37;
            end;

            v27 = u3.createFragment({
                ActionButtonsRow = u3.createElement(Empty, v28, v33)
            });
        end;

        local v38 = {
            AutomaticSize = "Y",
            BorderSizePixel = 0,
            ZIndex = 20,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 40),
            Position = UDim2.fromScale(0, 1),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v39 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }), (u3.createElement(Padding, {
                Padding = UDim.new(0, 8)
            })) };
        local createElement = u3.createElement;
        local v40 = {
            ZIndex = 20,
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v41 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 6)
            }), (u3.createElement(BWPlayerRender, {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 20,
                FallbackMode = PlayerRenderFallbackMode.NONE,
                Size = UDim2.new(1, 0, 1, 0),
                PlayerUserId = u7.Player.userId
            })) };
        local createElement2 = u3.createElement;
        local v42 = {
            LayoutOrder = 2,
            ZIndex = 20,
            Size = UDim2.new(0.5, 0, 1, 0)
        };
        local v43 = { (u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.15, 0)
            })) };
        local createElement3 = u3.createElement;
        local v44 = {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.65, 0)
        };
        local v45 = {
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            }),
            ["@"] = u3.createElement("TextLabel", {
                Text = "@",
                BackgroundTransparency = 1,
                AutomaticSize = "X",
                BorderSizePixel = 0,
                AutoLocalize = false,
                TextSize = 16,
                LayoutOrder = 1,
                ZIndex = 20,
                Size = UDim2.new(0, 0, 1, 0),
                Font = Enum.Font.SourceSansBold,
                TextColor3 = Color3.fromRGB(0, 217, 255)
            })
        };
        local createElement4 = u3.createElement;
        local v46 = {
            PlaceholderText = ""
        };
        local v47;

        if u13 then
            v47 = GamePlayerUtil.getGamePlayer(u13):getUsername();
        else
            v47 = u7.Player.name;
        end;

        v46.Text = v47;
        v46.BackgroundTransparency = 1;
        v46.Size = UDim2.new(1, 0, 1, 0);
        v46.BorderSizePixel = 0;
        v46.AutoLocalize = false;
        v46.TextScaled = true;
        v46.Font = Enum.Font.SourceSansBold;
        v46.TextColor3 = Color3.fromRGB(0, 217, 255);
        v46.TextXAlignment = "Left";
        v46.LayoutOrder = 2;
        v46.TextEditable = false;
        v46.ClearTextOnFocus = false;
        v46.ZIndex = 20;

        v46[u3.Change.Text] = function(p48) -- Line: 279
            -- upvalues: u13 (ref), GamePlayerUtil (ref), u7 (ref)
            local v49;

            if u13 then
                v49 = GamePlayerUtil.getGamePlayer(u13):getUsername();
            else
                v49 = u7.Player.name;
            end;

            p48.Text = v49;
        end;

        v45.PlayerUsername = createElement4("TextBox", v46);
        v43.PlayerUsername = createElement3(Empty, v44, v45);
        v41.PlayerNames = createElement2(Empty, v42, v43);
        v39.PlayerInfo = createElement(Empty, v40, v41);
        local v50 = #v39;

        if v27 then
            v39[v50 + 1] = v27;
        end;

        return u3.createFragment({
            PlayerDropdown = u3.createElement("Frame", v38, v39)
        });
    end;

    local v52 = {
        AutomaticSize = "Y",
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v53;

    if u7.IsEliminated then
        v53 = u7.LayoutOrder + 100;
    else
        v53 = u7.LayoutOrder;
    end;

    v52.LayoutOrder = v53;
    local v54 = {};
    local v55 = #v54;
    local v56;

    if u7.IsEliminated then
        v56 = u3.createElement(v16, {
            BackgroundTransparency = 0.3,
            BackgroundColor3 = ColorUtil.BLACK
        });
    elseif u14 then
        v56 = u3.createElement(v16, {
            BackgroundTransparency = 0.3,
            BackgroundColor3 = ColorUtil.WHITE
        });
    else
        v56 = nil;
    end;

    if v56 then
        v54[v55 + 1] = v56;
    end;

    local v57 = #v54;
    local v58 = {
        AutomaticSize = "Y",
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v60 = {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0)
        }),
        PlayerRow = u3.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, u7.LastRow and 0 or -1),
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            AutoButtonColor = false,

            [u3.Event.Activated] = function(p59) -- Line: 329
                -- upvalues: u10 (copy), u9 (copy)
                u10(not u9);
            end,

            LayoutOrder = 1
        }, {
            u3.createElement("UISizeConstraint", {
                MaxSize = tabListLayout.maxRowSize,
                MinSize = Vector2.new(0, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }),
            u3.createElement(PlayerName, {
                Player = u7.Player,
                Kits = v11,
                IsEarlyLeave = u7.IsLeave,
                ContentTransparency = u7.IsEliminated and 0.6 or nil
            }),
            u3.createElement(PlayerStats, {
                Player = u7.Player,
                Team = u7.Team,
                Kills = u7.Kills,
                Eliminated = u7.IsEliminated,
                ShowStats = u7.GameType == GameType.BEDWARS
            })
        })
    };
    local v61 = #v60;

    if u9 then
        u9 = u3.createElement(v51);
    end;

    if u9 then
        v60[v61 + 1] = u9;
    end;

    v54.Content = u3.createElement(Empty, v58, v60);
    local v62 = not u7.LastRow and u3.createElement(v17);

    if v62 then
        v54[v57 + 1] = v62;
    end;

    return u3.createFragment({
        PlayerRowContainer = u3.createElement(Empty, v52, v54)
    });
end);

return {
    PlayerRow = v5.connect(function(p64, p65) -- Line: 375
        -- upvalues: GameType (copy), getQueueMeta (copy), Players (copy)
        local v66 = p64.Bedwars.finalDeaths[p65.Player.userId];
        local v67 = p64.Bedwars.kills[p65.Player.userId];
        local BEDWARS = GameType.BEDWARS;
        local queueType = p64.Game.queueType;

        if queueType then
            if getQueueMeta(queueType).disableTablistStats then
                v66 = false;
                v67 = 0;
            end;

            BEDWARS = getQueueMeta(queueType).game;
        end;

        local v68 = {};

        for i, v in p65 do
            v68[i] = v;
        end;

        v68.IsEliminated = v66;
        v68.IsLeave = not Players:GetPlayerByUserId(p65.Player.userId);
        v68.PlayerKit = p64.Bedwars.kits[p65.Player.userId];
        v68.Kills = v67;
        v68.BedStatus = p64.Bedwars.teamBedStatus[p65.Team.id];
        v68.GameType = BEDWARS;

        return v68;
    end)(v63)
};