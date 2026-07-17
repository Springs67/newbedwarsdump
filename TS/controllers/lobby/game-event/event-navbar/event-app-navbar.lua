-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local GlobalTeamKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamKey;
local GlobalTeamsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EventAppCurrencyPill = RuntimeLib.import(script, script.Parent, "event-app-currency-pill").EventAppCurrencyPill;
local EventAppNavlink = RuntimeLib.import(script, script.Parent, "event-app-navlink").EventAppNavlink;

return {
    EventAppNavbar = v3.new(u2)(function(u4, p5) -- Line: 25
        -- upvalues: EventMeta (copy), GlobalTeamsUtil (copy), ClientStore (copy), DeviceUtil (copy), GlobalTeamKey (copy), SoundManager (copy), GameSound (copy), Theme (copy), u2 (copy), ColorUtil (copy), Empty (copy), Padding (copy), EventAppNavlink (copy), BedwarsImageId (copy), EmoteMeta (copy), EmoteType (copy), EventAppCurrencyPill (copy), IconButton (copy), Flamework (copy), BedwarsAppIds (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = EventMeta[u4.EventType];
        local v7 = os.time() > v6.endDate;
        local v8 = #v6.shops ~= 0;
        local globalTeamEventKey = v6.globalTeamEventKey;
        local v9 = GlobalTeamsUtil.getGlobalTeamEventMetaFromEventType(u4.EventType);
        local v10;

        if globalTeamEventKey then
            v10 = ClientStore:getState().Event.profileData.events[u4.EventType];

            if v10 ~= nil then
                v10 = v10.globalTeamKey;
            end;
        else
            v10 = nil;
        end;

        if DeviceUtil.isHoarceKat() then
            v10 = GlobalTeamKey.SUMMER_2025_TEAM;
        end;

        local function _(p11) -- Line: 47
            -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);

            if p11 == u4.Page then
                return nil;
            end;

            u4.SetPage(p11);
        end;

        local v12 = {
            Size = UDim2.fromScale(1, 0.1)
        };
        local navbarImage = v6.navbarImage;
        v12.Image = navbarImage == nil and "rbxassetid://10716080072" or navbarImage;
        v12.ScaleType = Enum.ScaleType.Crop;
        v12.BackgroundColor3 = Theme.backgroundTertiary;
        v12.BorderSizePixel = 0;
        v12.LayoutOrder = 1;
        local v13 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }) };
        local _ = #v13;
        local v14 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v15 = {
            u2.createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5659A4")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5659A4")) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4) })
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0)
            }),
            TitleContainer = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.33, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 2)
                }),
                u2.createElement(Padding, {
                    Padding = {
                        Left = 14,
                        Top = 8,
                        Bottom = 8
                    }
                }),
                Title = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "GothamBlack",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.65),
                    Text = "<b>" .. v6.name .. "</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }),
                SubTitle = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.35),
                    Text = "<font transparency=\".3\">Event Period:</font> <b>" .. os.date("%B %d", v6.startDate) .. " - " .. os.date("%B %d", v6.endDate) .. "</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            })
        };
        local _ = #v15;
        local customPagesConfig = v6.customPagesConfig;

        if customPagesConfig ~= nil then
            customPagesConfig = customPagesConfig.setTeamPage;
        end;

        if customPagesConfig then
            customPagesConfig = not v7 and u2.createElement(EventAppNavlink, {
                Text = "Team",
                Page = "team",
                Icon = BedwarsImageId.PEOPLE_GROUP_ICON,
                ActivePage = u4.Page,

                OnClick = function() -- Line: 142, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u4.Page == "team" then
                        return;
                    end;

                    u4.SetPage("team");
                end
            });
        end;

        local v16 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.33, 1)
        };
        local v17 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Bottom"
                }
            ) };
        local v18 = #v17;

        if customPagesConfig then
            v17[v18 + 1] = customPagesConfig;
        end;

        local v19 = #v17;
        local customPagesConfig2 = v6.customPagesConfig;

        if customPagesConfig2 ~= nil then
            customPagesConfig2 = customPagesConfig2.infoPage;
        end;

        if customPagesConfig2 then
            customPagesConfig2 = u2.createElement(EventAppNavlink, {
                Text = "Info",
                Page = "info",
                Icon = BedwarsImageId.HELP_ICON_SOLID,
                ActivePage = u4.Page,

                OnClick = function() -- Line: 174, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u4.Page == "info" then
                        return;
                    end;

                    u4.SetPage("info");
                end
            });
        end;

        if customPagesConfig2 then
            v17[v19 + 1] = customPagesConfig2;
        end;

        local v20 = #v17;
        local v21 = not v7 and #v6.missionGenerators ~= 0 and u2.createElement(EventAppNavlink, {
            Text = "Missions",
            Page = "missions",
            Icon = BedwarsImageId.CLIPBOARD_SOLID,
            ActivePage = u4.Page,

            OnClick = function() -- Line: 188, Name: OnClick
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);

                if u4.Page == "missions" then
                    return;
                end;

                u4.SetPage("missions");
            end
        });

        if v21 then
            v17[v20 + 1] = v21;
        end;

        local v22 = #v17;
        local checkInSystem = v6.checkInSystem;

        if checkInSystem then
            local v23 = {};
            local image = EmoteMeta[EmoteType.LUCKY_GIFT].image;
            v23.Icon = image == nil and "" or image;
            v23.Text = "CheckIn";
            v23.Page = "checkin";
            v23.ActivePage = u4.Page;

            function v23.OnClick() -- Line: 207
                -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);

                if u4.Page == "checkin" then
                    return;
                end;

                u4.SetPage("checkin");
            end;

            checkInSystem = u2.createElement(EventAppNavlink, v23);
        end;

        if checkInSystem then
            v17[v22 + 1] = checkInSystem;
        end;

        local v24 = #v17;
        local v25;

        if v9 == nil or (v9.sharedTeamRewards == nil or #v9.sharedTeamRewards <= 0) then
            v25 = false;
        else
            v25 = u2.createElement(EventAppNavlink, {
                Text = "Global Team Milestones",
                Page = "global-team-milestones",
                Icon = BedwarsImageId.THUMB_TACK_SOLID,
                ActivePage = u4.Page,

                OnClick = function() -- Line: 221, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u4.Page == "global-team-milestones" then
                        return;
                    end;

                    u4.SetPage("global-team-milestones");
                end
            });
        end;

        if v25 then
            v17[v24 + 1] = v25;
        end;

        local v26 = #v17;
        local v27;

        if v10 then
            if v9 then
                v27 = v9.timedGoals;
            else
                v27 = v9;
            end;
        else
            v27 = v10;
        end;

        if v27 then
            local v28 = 0;

            for _ in v9.timedGoals do
                v28 = v28 + 1;
            end;

            v27 = v28 > 0 and (v9.timedGoals[v10] and u2.createElement(EventAppNavlink, {
                Text = "Timed Goals",
                Page = "global-team-timed-goals",
                Icon = BedwarsImageId.HUD_TIMER_ICON,
                ActivePage = u4.Page,

                OnClick = function() -- Line: 248, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u4.Page == "global-team-timed-goals" then
                        return;
                    end;

                    u4.SetPage("global-team-timed-goals");
                end
            }));
        end;

        if v27 then
            v17[v26 + 1] = v27;
        end;

        local v29 = #v17;

        if v8 then
            v8 = u2.createElement(EventAppNavlink, {
                Text = "Shop",
                Page = "shop",
                Icon = BedwarsImageId.SHOPPING_CART_SOLID,
                ActivePage = u4.Page,

                OnClick = function() -- Line: 264, Name: OnClick
                    -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u4.Page == "shop" then
                        return;
                    end;

                    u4.SetPage("shop");
                end,

                ThemeColor = Color3.fromRGB(255, 214, 36)
            });
        end;

        if v8 then
            v17[v29 + 1] = v8;
        end;

        v15.NavLinks = u2.createElement(Empty, v16, v17);
        local v30 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.33, 1)
        };
        local v31 = { u2.createElement(Padding, {
                Padding = {
                    Right = 14,
                    Top = 10,
                    Bottom = 10
                }
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 6)
            }) };
        local _ = #v31;

        local function _(p32) -- Line: 295
            -- upvalues: u4 (copy), u2 (ref), EventAppCurrencyPill (ref)
            local v33 = u4.EventDataProfile.currencies[p32];
            local v34 = {
                Currency = p32
            };

            if v33 ~= nil then
                v33 = v33.currAmount;
            end;

            v34.CurrAmount = v33 == nil and 0 or v33;

            return u2.createElement(EventAppCurrencyPill, v34);
        end;

        local v35 = 0;
        local v36 = {};

        for i, v in v6.currencies do
            local _ = i - 1;
            local v37 = u4.EventDataProfile.currencies[v];
            local v38 = {
                Currency = v
            };

            if v37 ~= nil then
                v37 = v37.currAmount;
            end;

            v38.CurrAmount = v37 == nil and 0 or v37;
            local v39 = u2.createElement(EventAppCurrencyPill, v38);

            if v39 ~= nil then
                v35 = v35 + 1;
                v36[v35] = v39;
            end;
        end;

        local v40 = {
            LayoutOrder = 2,
            Size = UDim2.new(0.85, -6, 0.9, 0)
        };
        local v41 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                Padding = UDim.new(0.03, 0)
            }) };
        local v42 = #v41;

        for i, v in v36 do
            v41[v42 + i] = v;
        end;

        v31.CurrencyList = u2.createElement(Empty, v40, v41);
        v31.CloseAppButton = u2.createElement(IconButton, {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.15, 1),
            Image = BedwarsImageId.X,

            OnClick = function() -- Line: 341, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.EVENT_APP);
            end
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v15.HeaderRightSide = u2.createElement(Empty, v30, v31);
        v13.Wrapper = u2.createElement("Frame", v14, v15);

        return u2.createFragment({
            NavBar = u2.createElement("ImageLabel", v12, v13)
        });
    end)
};