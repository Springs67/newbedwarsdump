-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DarkBackground = v1.DarkBackground;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local GameReset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset;
local GlobalTeamEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-event-meta").GlobalTeamEvents;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EventCheckinPage = RuntimeLib.import(script, script.Parent, "event-checkin", "ui", "event-checkin-page").EventCheckinPage;
local Summer2025EventInfoPage = RuntimeLib.import(script, script.Parent, "event-info-page", "summer-2025-event-info-page").Summer2025EventInfoPage;
local EventMissions = RuntimeLib.import(script, script.Parent, "event-missions", "ui", "event-missions").EventMissions;
local EventAppNavbar = RuntimeLib.import(script, script.Parent, "event-navbar", "event-app-navbar").EventAppNavbar;
local EventShop = RuntimeLib.import(script, script.Parent, "event-shop", "ui", "event-shop").EventShop;
local EventTeams = RuntimeLib.import(script, script.Parent, "event-teams", "ui", "event-teams").EventTeams;
local GlobalTeamEventRewardsGUI = RuntimeLib.import(script, script.Parent, "event-teams", "ui", "global-team-event-rewards-gui").GlobalTeamEventRewardsGUI;
local GlobalTeamTimedGoalsGUI = RuntimeLib.import(script, script.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-gui").GlobalTeamTimedGoalsGUI;
local v62 = v4.new(u3)(function(u6, p7) -- Line: 31
    -- upvalues: EventMeta (copy), ClientStore (copy), GlobalTeamEvents (copy), u2 (copy), u3 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), EventAppNavbar (copy), Padding (copy), AutoSizedText (copy), ColorUtil (copy), Empty (copy), ButtonComponent (copy), KnitClient (copy), Countdown (copy), GameReset (copy), EventType (copy), Summer2025EventInfoPage (copy), EventTeams (copy), EventShop (copy), EventMissions (copy), GlobalTeamEventRewardsGUI (copy), GlobalTeamTimedGoalsGUI (copy), EventCheckinPage (copy)
    local useState = p7.useState;
    local u8 = EventMeta[u6.event];
    local v9 = u6.eventDataProfile.events[u6.event];
    local u10 = os.time() > u8.endDate;
    local u11 = #u8.shops ~= 0;
    local customPagesConfig = u8.customPagesConfig;

    if customPagesConfig ~= nil then
        customPagesConfig = customPagesConfig.infoPage;
    end;

    local customPagesConfig2 = u8.customPagesConfig;

    if customPagesConfig2 ~= nil then
        customPagesConfig2 = customPagesConfig2.setTeamPage;
    end;

    local u12 = #u8.missionGenerators ~= 0;
    local v13;

    if u8.globalTeamEventKey == nil then
        v13 = nil;
    else
        v13 = ClientStore:getState().Event.profileData.events[u6.event];

        if v13 ~= nil then
            v13 = v13.globalTeamKey;
        end;
    end;

    local u14, v15 = useState(function() -- Line: 58
        -- upvalues: u6 (copy), customPagesConfig2 (copy), u10 (copy), u12 (copy), u11 (copy), customPagesConfig (copy), u8 (copy), GlobalTeamEvents (ref)
        return u6.tab == nil and (customPagesConfig2 and not u10 and "team" or ((u10 or not u12) and u11 and "shop" or (customPagesConfig and "info" or (u8.checkInSystem and "checkin" or (u8.globalTeamEventKey and (GlobalTeamEvents[u8.globalTeamEventKey].timedGoals and "global-team-timed-goals" or "global-team-milestones") or "missions"))))) or u6.tab;
    end);
    local v17 = (function() -- Line: 79
        -- upvalues: u14 (copy), u8 (copy)
        local v16 = string.lower(u14);

        if v16 == "shop" then
            local shopPageDesc = u8.shopPageDesc;

            return shopPageDesc == nil and "The shop will stay open for a week after the event ends." or shopPageDesc;
        end;

        if v16 ~= "missions" then
            return v16 == "checkin" and "Don’t miss out! Swing by every day for something awesome 🎁" or "";
        end;

        local missionPageDesc = u8.missionPageDesc;

        return missionPageDesc == nil and "Complete Missions to earn currency to spend in the Event Shop!" or missionPageDesc;
    end)();
    local v18 = u2.values(u6.eventDataProfile.events);

    local function v24(p19, p20) -- Line: 104
        local v21 = {};
        local v22 = #v21;
        local v23 = #p19;
        table.move(p19, 1, v23, v22 + 1, v21);
        local itemsPurchased = p20.itemsPurchased;
        table.move(itemsPurchased, 1, #itemsPurchased, v22 + v23 + 1, v21);

        return v21;
    end;

    local v25 = {};

    for i = 1, #v18 do
        v25 = v24(v25, v18[i], i - 1, v18);
    end;

    local v26 = {
        DisplayOrder = 21,
        ResetOnSpawn = false
    };
    local v27 = { u3.createElement(DarkBackground, {
            AppId = u6.AppId
        }) };
    local _ = #v27;
    local v28 = {
        BackgroundTransparency = 0.05,
        Selectable = false,
        AutoButtonColor = false,
        Active = true,
        Modal = true,
        Size = UDim2.fromOffset(690, 480),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Theme.backgroundSecondary,
        ScaleType = Enum.ScaleType.Crop
    };
    local v29 = {
        u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(1035, 720),
            ScreenPadding = Vector2.new(80, 80)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }),
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }),
        u3.createElement(EventAppNavbar, {
            EventDataProfile = u6.eventDataProfile,
            EventType = u6.event,
            Page = u14,
            SetPage = v15
        })
    };
    local _ = #v29;
    local v30 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.9)
    };
    local v31 = { u3.createElement(Padding, {
            Padding = {
                Vertical = string.lower(u14) == "team" and 0 or 8,
                Horizontal = string.lower(u14) == "team" and 0 or 8
            }
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.02, 0)
        }) };
    local v32 = #v31;
    local v33;

    if v17 == "" then
        v33 = false;
    else
        v33 = u3.createFragment({
            PageDescription = u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextTransparency = 0.3,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.04),
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Text = v17,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        });
    end;

    if v33 then
        v31[v32 + 1] = v33;
    end;

    local v34 = #v31;

    if v9 then
        local v35 = string.lower(u14) == "info";

        if v35 then
            local customPagesConfig3 = u8.customPagesConfig;

            if customPagesConfig3 ~= nil then
                customPagesConfig3 = customPagesConfig3.infoPage;

                if customPagesConfig3 ~= nil then
                    customPagesConfig3 = customPagesConfig3.description;
                end;
            end;

            local v36 = customPagesConfig3 ~= nil;

            if v36 then
                local v37 = {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0, 70)
                };
                local v38 = { u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 10)
                    }), u3.createElement(AutoSizedText, {
                        Text = "Event Info",
                        TextSize = 20,
                        BackgroundTransparency = 1,
                        ZIndex = 2,
                        LayoutOrder = 1,
                        Font = Enum.Font.SourceSansBold,
                        TextColor3 = ColorUtil.WHITE,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }) };
                local v39 = {};
                local customPagesConfig4 = u8.customPagesConfig;

                if customPagesConfig4 ~= nil then
                    customPagesConfig4 = customPagesConfig4.infoPage;

                    if customPagesConfig4 ~= nil then
                        customPagesConfig4 = customPagesConfig4.description;
                    end;
                end;

                v39.Text = customPagesConfig4;
                v39.Font = Enum.Font.SourceSans;
                v39.TextColor3 = ColorUtil.WHITE;
                v39.Limits = Vector2.new(690, 600);
                v39.TextSize = 16;
                v39.TextYAlignment = Enum.TextYAlignment.Top;
                v39.TextXAlignment = Enum.TextXAlignment.Left;
                v39.BackgroundTransparency = 1;
                v39.ZIndex = 2;
                v39.LayoutOrder = 2;
                v38[#v38 + 1] = u3.createElement(AutoSizedText, v39);
                v36 = u3.createElement(Empty, v37, v38);
            end;

            local v40 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v41 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 16)
                }) };
            local v42 = #v41;

            if v36 then
                v41[v42 + 1] = v36;
            end;

            local v43 = #v41;
            local customPagesConfig4 = u8.customPagesConfig;

            if customPagesConfig4 ~= nil then
                customPagesConfig4 = customPagesConfig4.infoPage;

                if customPagesConfig4 ~= nil then
                    customPagesConfig4 = customPagesConfig4.playButtonQueue;
                end;
            end;

            if customPagesConfig4 then
                customPagesConfig4 = u3.createElement(ButtonComponent, {
                    Text = "Play Event Queue",
                    LayoutOrder = 3,

                    OnClick = function() -- Line: 288, Name: OnClick
                        -- upvalues: KnitClient (ref), u8 (copy)
                        KnitClient.Controllers.QueueController:joinQueue(u8.customPagesConfig.infoPage.playButtonQueue);
                    end
                });
            end;

            if customPagesConfig4 then
                v41[v43 + 1] = customPagesConfig4;
            end;

            local v44 = #v41;
            local customPagesConfig5 = u8.customPagesConfig;

            if customPagesConfig5 ~= nil then
                customPagesConfig5 = customPagesConfig5.infoPage;

                if customPagesConfig5 ~= nil then
                    customPagesConfig5 = customPagesConfig5.LNYEnvelopes;
                end;
            end;

            local v45 = customPagesConfig5 ~= nil and u3.createElement(Empty, {
                LayoutOrder = 4,
                Size = UDim2.new(1, 0, 0, 240)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 10)
                }), u3.createElement(AutoSizedText, {
                    Text = "Daily Envelope Collection",
                    TextSize = 20,
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    LayoutOrder = 1,
                    Font = Enum.Font.SourceSansBold,
                    TextColor3 = ColorUtil.WHITE,
                    Limits = Vector2.new(300, 60),
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextXAlignment = Enum.TextXAlignment.Left
                }), u3.createElement(Countdown, {
                    PreText = "Resets in: ",
                    EndTime = GameReset.resetTime:getNextDailyResetTime(),
                    TextLabel = {
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0, 18),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Regular)
                    },
                    CountdownConfig = {
                        minutes = true,
                        hours = true,
                        days = false
                    }
                }) });

            if v45 then
                v41[v44 + 1] = v45;
            end;

            local v46 = #v41;
            local v47;

            if u6.event == EventType.SUMMER_2025 then
                v47 = u3.createElement(Summer2025EventInfoPage, {
                    AppId = "Summer2025EventInfoPage"
                });
            else
                v47 = false;
            end;

            if v47 then
                v41[v46 + 1] = v47;
            end;

            v35 = u3.createFragment({
                EventInfo = u3.createElement(Empty, v40, v41)
            });
        end;

        local v48 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, v17 == "" and 1 or 0.94)
        };
        local v49 = {};
        local v50 = #v49;

        if v35 then
            v49[v50 + 1] = v35;
        end;

        local v51 = #v49;
        local v52;

        if string.lower(u14) == "team" then
            v52 = not u10 and u3.createElement(EventTeams, {
                EventType = u6.event
            });
        else
            v52 = false;
        end;

        if v52 then
            v49[v51 + 1] = v52;
        end;

        local v53 = #v49;
        local v54;

        if string.lower(u14) == "shop" then
            v54 = u3.createElement(EventShop, {
                Shop = u8.shops[1],
                EventShopItemsPurchased = v9.itemsPurchased,
                AllTimeItemsPurchased = v25,
                EventType = u6.event
            });
        else
            v54 = false;
        end;

        if v54 then
            v49[v53 + 1] = v54;
        end;

        local v55 = #v49;
        local v56 = not u10;

        if v56 then
            if string.lower(u14) == "missions" then
                v56 = u6.activeMissions and u3.createElement(EventMissions, {
                    MissionsMap = u6.activeMissions,
                    ClaimedMissions = v9.missionsClaimed,
                    EventType = u6.event
                });
            else
                v56 = false;
            end;
        end;

        if v56 then
            v49[v55 + 1] = v56;
        end;

        local v57 = #v49;
        local v58;

        if string.lower(u14) == "global-team-milestones" then
            v58 = u3.createElement(GlobalTeamEventRewardsGUI, {
                EventType = u6.event,
                GlobalTeamKey = v13
            });
        else
            v58 = false;
        end;

        if v58 then
            v49[v57 + 1] = v58;
        end;

        local v59 = #v49;

        if string.lower(u14) == "global-team-timed-goals" then
            if v13 then
                v13 = u3.createElement(GlobalTeamTimedGoalsGUI, {
                    EventType = u6.event,
                    GlobalTeamKey = v13
                });
            end;
        else
            v13 = false;
        end;

        if v13 then
            v49[v59 + 1] = v13;
        end;

        local v60 = #v49;
        local v61;

        if string.lower(u14) == "checkin" then
            v61 = u8.checkInSystem and u3.createElement(EventCheckinPage, {
                AppId = "EventCheckinPage",
                CheckInSystem = u8.checkInSystem,
                EventType = u6.event
            });
        else
            v61 = false;
        end;

        if v61 then
            v49[v60 + 1] = v61;
        end;

        v9 = u3.createElement(Empty, v48, v49);
    end;

    if v9 then
        v31[v34 + 1] = v9;
    end;

    v29.Content = u3.createElement(Empty, v30, v31);
    v27.EventApp = u3.createElement("ImageButton", v28, v29);

    return u3.createFragment({
        EventShop = u3.createElement("ScreenGui", v26, v27)
    });
end);

return {
    EventApp = v5.connect(function(p63, p64) -- Line: 432
        local v65 = {};

        for i, v in p64 do
            v65[i] = v;
        end;

        v65.eventDataProfile = p63.Event.profileData;
        v65.activeMissions = p63.Event.activeMissions[p64.event];

        return v65;
    end)(v62)
};