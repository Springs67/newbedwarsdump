-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ReportTicketResult = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "report", "report").ReportTicketResult;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SpectateMode = RuntimeLib.import(script, script.Parent.Parent.Parent, "spectate", "spectate-controller").SpectateMode;
local v61 = v4.new(u3)(function(u6, p7) -- Line: 24
    -- upvalues: SpectateMode (copy), BedwarsKit (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), KnitClient (copy), ReportTicketResult (copy), BedwarsImageId (copy), ColorUtil (copy), UILayers (copy), u3 (copy), ScaleComponent (copy), Empty (copy), Padding (copy), BedwarsKitMeta (copy), QueueMeta (copy), Button (copy), u2 (copy)
    local useState = p7.useState;
    local v8, u9 = useState(false);
    local u10, u11 = useState(SpectateMode.PLAYER);
    local v12 = UDim2.fromOffset(750, 100);
    local NONE = BedwarsKit.NONE;
    local SuspectInfo = u6.SuspectInfo;

    if SuspectInfo ~= nil then
        SuspectInfo = SuspectInfo.kit;
    end;

    if SuspectInfo then
        NONE = u6.SuspectInfo;

        if NONE ~= nil then
            NONE = NONE.kit;
        end;
    end;

    local function u16() -- Line: 41
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), SpectateMode (ref), ReportTicketResult (ref), u9 (copy), BedwarsImageId (ref), ColorUtil (ref), u6 (copy), UILayers (ref)
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

            OnPrimaryBtnClick = function() -- Line: 52, Name: OnPrimaryBtnClick
                -- upvalues: KnitClient (ref), SpectateMode (ref), Flamework (ref), ReportTicketResult (ref), u9 (ref), BedwarsImageId (ref), ColorUtil (ref), Theme (ref), u6 (ref)
                KnitClient.Controllers.SpectateController:setSpectateMode(SpectateMode.ALL);
                Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(ReportTicketResult.BANNED);
                u9(true);
                local v13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                local v14 = {
                    image = BedwarsImageId.EASY_GAMES_LOGO
                };
                local v15 = ColorUtil.richTextColor(Theme.mcAqua);
                local SuspectInfo2 = u6.SuspectInfo;

                if SuspectInfo2 ~= nil then
                    SuspectInfo2 = SuspectInfo2.displayName;
                end;

                v14.message = "<b>Resolved <font color=\"" .. v15 .. "\">" .. tostring(SuspectInfo2) .. "</font> as <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 34, 34)) .. "\">BANNED</font></b>";
                v13:sendInfoNotification(v14);
            end,

            OnSecondaryBtnClick = function() -- Line: 69, Name: OnSecondaryBtnClick
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end
        });
    end;

    local function v18(p17) -- Line: 74
        -- upvalues: u3 (ref), ColorUtil (ref)
        return u3.createFragment({
            SuspectInfo = u3.createElement("TextLabel", {
                RichText = true,
                TextSize = 12,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                Text = "<b>" .. p17.Title .. ":</b> <font transparency=\".3\">" .. p17.Value .. "</font>",
                Font = Enum.Font.Roboto,
                TextColor3 = ColorUtil.WHITE
            })
        });
    end;

    local function v23(p19) -- Line: 89
        local v20 = math.floor(p19 / 86400);
        local v21 = math.floor(p19 % 86400 / 3600);
        local v22 = math.floor(p19 % 3600 / 60);

        return (v20 <= 0 and "" or tostring(v20) .. "d ") .. (v21 <= 0 and "" or tostring(v21) .. "h ") .. (v22 <= 0 and "" or tostring(v22) .. "m ");
    end;

    local v24 = {
        ResetOnSpawn = false,
        DisplayOrder = 1001
    };
    local v25 = {};
    local _ = #v25;
    local v26 = {
        Size = v12,
        Position = UDim2.fromScale(0.5, 0.01),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v27 = { u3.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new(v12.X.Offset * 1.2, v12.Y.Offset * 1.2),
            ScreenPadding = Vector2.new(30, 30)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        }) };
    local _ = #v27;
    local v28 = {
        Size = UDim2.fromScale(1, 0.7)
    };
    local v29 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local _ = #v29;
    local v30 = {
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.25, 1),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    };
    local v31 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }), u3.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1),
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(u6.ReportTicket.reported) .. "&w=150&h=150"
        }) };
    local v32 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.2, 1)
    };
    local v33 = { u3.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder"
            }
        ) };
    local _ = #v33;
    local v34 = {
        AutomaticSize = "Y",
        Size = UDim2.fromScale(1, 0)
    };
    local SuspectInfo2 = u6.SuspectInfo;

    if SuspectInfo2 ~= nil then
        SuspectInfo2 = SuspectInfo2.team;

        if SuspectInfo2 ~= nil then
            SuspectInfo2 = string.upper(SuspectInfo2.name);
        end;
    end;

    v34.Text = tostring(SuspectInfo2) .. " TEAM";
    v34.RichText = true;
    v34.TextSize = 10;
    v34.Font = Enum.Font.Roboto;
    local SuspectInfo3 = u6.SuspectInfo;

    if SuspectInfo3 ~= nil then
        SuspectInfo3 = SuspectInfo3.team;

        if SuspectInfo3 ~= nil then
            SuspectInfo3 = SuspectInfo3.color;
        end;
    end;

    v34.TextColor3 = SuspectInfo3;
    v34.TextXAlignment = "Left";
    v34.BackgroundTransparency = 1;
    v34.LayoutOrder = 1;
    v33.Tag = u3.createElement("TextLabel", v34);
    local v35 = {
        AutomaticSize = "Y",
        Size = UDim2.fromScale(1, 0)
    };
    local SuspectInfo4 = u6.SuspectInfo;

    if SuspectInfo4 ~= nil then
        SuspectInfo4 = SuspectInfo4.displayName;
    end;

    v35.Text = "<b>" .. tostring(SuspectInfo4) .. "</b>";
    v35.RichText = true;
    v35.TextSize = 14;
    v35.Font = Enum.Font.Roboto;
    v35.TextColor3 = ColorUtil.WHITE;
    v35.TextXAlignment = "Left";
    v35.BackgroundTransparency = 1;
    v35.LayoutOrder = 2;
    v33.DisplayName = u3.createElement("TextLabel", v35);
    local v36 = {
        AutomaticSize = "Y",
        Size = UDim2.fromScale(1, 0)
    };
    local SuspectInfo5 = u6.SuspectInfo;

    if SuspectInfo5 ~= nil then
        SuspectInfo5 = SuspectInfo5.username;
    end;

    v36.Text = "@" .. tostring(SuspectInfo5);
    v36.RichText = true;
    v36.TextSize = 10;
    v36.Font = Enum.Font.Roboto;
    v36.TextColor3 = ColorUtil.WHITE;
    v36.TextTransparency = 0.3;
    v36.TextXAlignment = "Left";
    v36.BackgroundTransparency = 1;
    v36.LayoutOrder = 3;
    v33.Username = u3.createElement("TextLabel", v36);
    v31[#v31 + 1] = u3.createElement(Empty, v32, v33);
    v29.SuspectInfo = u3.createElement("Frame", v30, v31);
    local v37 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.75, 1),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    };
    local v38 = {
        u3.createElement(Padding, {
            Padding = {
                Vertical = 8,
                Horizontal = 12
            }
        }),
        u3.createElement("UIGridLayout", {
            FillDirection = "Vertical",
            FillDirectionMaxCells = 4,
            VerticalAlignment = "Center",
            CellSize = UDim2.new(0.33, 0, 0.25, 0),
            CellPadding = UDim2.fromOffset(0, 0)
        }),
        u3.createElement(v18, {
            Title = "# Reports",
            Value = tostring(u6.ReportTicket.reports)
        }),
        u3.createElement(v18, {
            Title = "# Priority Reports",
            Value = tostring(u6.ReportTicket.priorityReports)
        })
    };
    local v39 = #v38;
    local v40 = {
        Title = "# Punishments"
    };
    local SuspectInfo6 = u6.SuspectInfo;

    if SuspectInfo6 ~= nil then
        SuspectInfo6 = SuspectInfo6.numPunishments;
    end;

    v40.Value = tostring(SuspectInfo6 == nil and 0 or SuspectInfo6);
    v38[v39 + 1] = u3.createElement(v18, v40);
    v38[v39 + 2] = u3.createElement(v18, {
        Title = "Kit",
        Value = BedwarsKitMeta[NONE].name
    });
    local v41 = {
        Title = "# Wins"
    };
    local SuspectInfo7 = u6.SuspectInfo;

    if SuspectInfo7 ~= nil then
        SuspectInfo7 = SuspectInfo7.wins;
    end;

    v41.Value = tostring(SuspectInfo7);
    v38[v39 + 3] = u3.createElement(v18, v41);
    local v42 = {
        Title = "# Matches"
    };
    local SuspectInfo8 = u6.SuspectInfo;

    if SuspectInfo8 ~= nil then
        SuspectInfo8 = SuspectInfo8.numMatchesPlayed;
    end;

    v42.Value = tostring(SuspectInfo8);
    v38[v39 + 4] = u3.createElement(v18, v42);
    local v43 = {
        Title = "W/L"
    };
    local SuspectInfo9 = u6.SuspectInfo;

    if SuspectInfo9 ~= nil then
        SuspectInfo9 = SuspectInfo9.wlRatio;
    end;

    v43.Value = tostring(SuspectInfo9);
    v38[v39 + 5] = u3.createElement(v18, v43);
    local v44 = {
        Title = "K/D"
    };
    local SuspectInfo10 = u6.SuspectInfo;

    if SuspectInfo10 ~= nil then
        SuspectInfo10 = SuspectInfo10.kdRatio;
    end;

    v44.Value = tostring(SuspectInfo10);
    v38[v39 + 6] = u3.createElement(v18, v44);
    local v45 = u6.QueueType and u3.createElement(v18, {
        Title = "QueueType",
        Value = QueueMeta[u6.QueueType].title
    });

    if v45 then
        v38[v39 + 7] = v45;
    end;

    local v46 = #v38;
    local v47 = u6.SuspectInfo and u3.createElement(v18, {
        Title = "BW Age",
        Value = v23(u6.SuspectInfo.bwAccAge)
    });

    if v47 then
        v38[v46 + 1] = v47;
    end;

    local v48 = #v38;
    v38[v48 + 1] = u3.createElement(v18, {
        Title = "First Reported",
        Value = DateTime.fromUnixTimestampMillis(u6.ReportTicket.firstReported):FormatUniversalTime("lll", "en-us")
    });
    v38[v48 + 2] = u3.createElement(v18, {
        Title = "Last Reported",
        Value = DateTime.fromUnixTimestampMillis(u6.ReportTicket.lastReported):FormatUniversalTime("lll", "en-us")
    });
    v29.SuspectStats = u3.createElement("Frame", v37, v38);
    v27.TopHudContainer = u3.createElement(Empty, v28, v29);
    local createElement = u3.createElement;
    local v49 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.3)
    };
    local v50 = {};
    local v51 = u3.createElement("UIListLayout", {
        FillDirection = "Horizontal",
        HorizontalAlignment = "Center",
        VerticalAlignment = "Center",
        Padding = UDim.new(0.03, 0)
    });
    local v52;

    if v8 then
        v52 = u3.createElement(Button, {
            Text = "<b>NEXT REPORT</b>",
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.3, 1),
            BackgroundColor3 = Color3.fromRGB(8, 224, 33),

            OnClick = function() -- Line: 414, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsImageId (ref)
                Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getNextTicket();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "<b>Retrieving next report ticket</b>",
                    image = BedwarsImageId.EASY_GAMES_LOGO
                });
            end
        });
    else
        v52 = u3.createFragment({ u3.createElement(Button, {
                Text = "<b>BAN</b>",
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Color3.fromRGB(255, 34, 34),

                OnClick = function() -- Line: 358, Name: OnClick
                    -- upvalues: u16 (copy)
                    u16();
                end
            }), u3.createElement(Button, {
                Text = "<b>SKIP</b>",
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Color3.fromRGB(35, 149, 255),

                OnClick = function() -- Line: 367, Name: OnClick
                    -- upvalues: KnitClient (ref), SpectateMode (ref), Flamework (ref), ReportTicketResult (ref), BedwarsImageId (ref), ColorUtil (ref), Theme (ref), u6 (copy), u9 (copy)
                    KnitClient.Controllers.SpectateController:setSpectateMode(SpectateMode.ALL);
                    Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(ReportTicketResult.PENDING);
                    local v53 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                    local v54 = {
                        image = BedwarsImageId.EASY_GAMES_LOGO
                    };
                    local v55 = ColorUtil.richTextColor(Color3.fromRGB(35, 149, 255));
                    local v56 = ColorUtil.richTextColor(Theme.mcAqua);
                    local SuspectInfo11 = u6.SuspectInfo;

                    if SuspectInfo11 ~= nil then
                        SuspectInfo11 = SuspectInfo11.displayName;
                    end;

                    v54.message = "<b><font color=\"" .. v55 .. "\">SKIPPED</font> <font color=\"" .. v56 .. "\">" .. tostring(SuspectInfo11) .. "</font></b>";
                    v53:sendInfoNotification(v54);
                    u9(true);
                end
            }), u3.createElement(Button, {
                Text = "<b>INNOCENT</b>",
                LayoutOrder = 4,
                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Color3.fromRGB(8, 224, 33),

                OnClick = function() -- Line: 391, Name: OnClick
                    -- upvalues: KnitClient (ref), SpectateMode (ref), Flamework (ref), ReportTicketResult (ref), BedwarsImageId (ref), ColorUtil (ref), Theme (ref), u6 (copy), u9 (copy)
                    KnitClient.Controllers.SpectateController:setSpectateMode(SpectateMode.ALL);
                    Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):resolveCurrentTicket(ReportTicketResult.AQUITTED);
                    local v57 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                    local v58 = {
                        image = BedwarsImageId.EASY_GAMES_LOGO
                    };
                    local v59 = ColorUtil.richTextColor(Theme.mcAqua);
                    local SuspectInfo11 = u6.SuspectInfo;

                    if SuspectInfo11 ~= nil then
                        SuspectInfo11 = SuspectInfo11.displayName;
                    end;

                    v58.message = "<b>Resolved <font color=\"" .. v59 .. "\">" .. tostring(SuspectInfo11) .. "</font> as <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(8, 224, 33)) .. "\">INNOCENT</font></b>";
                    v57:sendInfoNotification(v58);
                    u9(true);
                end
            }) });
    end;

    v50[1], v50[2] = v51, v52;
    v50.SpectateModeToggle = u3.createElement("ImageButton", {
        Size = UDim2.fromScale(0.1, 1),

        [u3.Event.Activated] = function() -- Line: 425
            -- upvalues: u10 (copy), u2 (ref), SpectateMode (ref), KnitClient (ref), u11 (copy)
            local v60 = (u10 + 1) % #u2.keys(SpectateMode);
            KnitClient.Controllers.SpectateController:setSpectateMode(v60);
            u11(v60);
        end,

        BackgroundColor3 = Theme.mcGold,
        BorderSizePixel = 0,
        LayoutOrder = 1
    }, {
        u3.createElement(Padding, {
            Padding = {
                Horizontal = 10,
                Vertical = 6
            }
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 4)
        }),
        u3.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.8),
            Image = BedwarsImageId.EYE_REGULAR
        }),
        u3.createElement("TextLabel", {
            AutomaticSize = "X",
            RichText = true,
            TextScaled = true,
            Font = "Roboto",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 0.8),
            Text = "<b>" .. SpectateMode[u10] .. "</b>",
            TextColor3 = ColorUtil.WHITE
        })
    });
    v27.ActionButtons = createElement(Empty, v49, v50);
    v25.OverwatchHud = u3.createElement(Empty, v26, v27);

    return u3.createFragment({
        OverwatchHudGui = u3.createElement("ScreenGui", v24, v25)
    });
end);

return {
    OverwatchHud = v5.connect(function(p62, p63) -- Line: 474
        local v64 = {};

        for i, v in p63 do
            v64[i] = v;
        end;

        v64.QueueType = p62.Game.queueType;

        return v64;
    end)(v61)
};