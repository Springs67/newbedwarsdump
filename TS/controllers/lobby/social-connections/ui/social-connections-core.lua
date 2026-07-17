-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local ImageId = v1.ImageId;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local SocialConnectionsRewardSection = RuntimeLib.import(script, script.Parent, "rewards", "social-connections-reward-section").SocialConnectionsRewardSection;
local SocialConnectionsConnectInfoCard = RuntimeLib.import(script, script.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;
local SocialConnectionsSectionTitle = RuntimeLib.import(script, script.Parent, "social-connections-section-title").SocialConnectionsSectionTitle;
local SocialConnectionsDiscord = RuntimeLib.import(script, script.Parent, "verify-discord", "social-connections-discord").SocialConnectionsDiscord;
local SocialConnectionsGroup = RuntimeLib.import(script, script.Parent, "verify-group", "social-connections-group").SocialConnectionsGroup;

return {
    SocialConnectionsCore = v4.new(u3)(function(u5, p6) -- Line: 22
        -- upvalues: u2 (copy), Flamework (copy), DeviceUtil (copy), KnitClient (copy), u3 (copy), SocialConnectionsRewardSection (copy), SocialConnectionsSectionTitle (copy), SocialConnectionsDiscord (copy), DarkBackground (copy), SlideIn (copy), ScaleComponent (copy), WidgetComponent (copy), ImageId (copy), SocialConnectionsConnectInfoCard (copy), ColorUtil (copy), SocialConnectionsGroup (copy), DividerComponent (copy)
        local _ = p6.useState;
        local useMemo = p6.useMemo;
        local _ = p6.useEffect;

        local function _(p7) -- Line: 27
            return p7 == true;
        end;

        local u8 = true;

        for i, v in u2.values(u5.store.SocialConnections.supportTasks) do
            local _ = i - 1;

            if v ~= true then
                u8 = false;
                break;
            end;
        end;

        local function _(p9) -- Line: 41
            return p9.validated == true;
        end;

        local u10 = true;

        for i, v in u2.values(u5.store.SocialConnections.connections) do
            local _ = i - 1;

            if v.validated ~= true then
                u10 = false;
                break;
            end;
        end;

        local function v11() -- Line: 54
            -- upvalues: Flamework (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
        end;

        local function _() -- Line: 57
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u8 (copy), u10 (copy)
            return not (DeviceUtil.isHoarceKat() or KnitClient.Controllers.SocialConnectionsController.policyDiscordAllowed) and (u8 and 1 or 0) or (u8 and 1 or 0) + (u10 and 1 or 0);
        end;

        local v14 = useMemo(function() -- Line: 65
            -- upvalues: u3 (ref), SocialConnectionsRewardSection (ref), DeviceUtil (ref), KnitClient (ref), u8 (copy), u10 (copy)
            local createElement = u3.createElement;
            local v12 = {
                LayoutOrder = 4
            };
            local v13;

            if DeviceUtil.isHoarceKat() or KnitClient.Controllers.SocialConnectionsController.policyDiscordAllowed then
                v13 = (u8 and 1 or 0) + (u10 and 1 or 0);
            else
                v13 = u8 and 1 or 0;
            end;

            v12.CompletedCount = v13;

            return createElement(SocialConnectionsRewardSection, v12);
        end, {
            u8,
            u10,
            u5.store.SocialConnections.connections.discord.verificationCode,
            u5.store.SocialConnections.connections.discord.validated
        });

        local function _() -- Line: 71
            -- upvalues: DeviceUtil (ref)
            return DeviceUtil.isHoarceKat() and true or true;
        end;

        local v18 = useMemo(function() -- Line: 78
            -- upvalues: DeviceUtil (ref), u3 (ref), SocialConnectionsSectionTitle (ref), u10 (copy), SocialConnectionsDiscord (ref), u5 (copy)
            local v15 = {};
            local v16 = #v15;
            DeviceUtil.isHoarceKat();
            local v17 = true and u3.createFragment({
                ExternalConnections = u3.createElement("Frame", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0, 0)
                }, { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10)
                    }), u3.createElement(SocialConnectionsSectionTitle, {
                        Title = "<b>2. Verify through the game page Social Links</b>",
                        LayoutOrder = 1,
                        Completed = u10
                    }), u3.createElement(SocialConnectionsDiscord, {
                        LayoutOrder = 2,
                        store = u5.store
                    }) })
            });

            if v17 then
                v15[v16 + 1] = v17;
            end;

            return u3.createFragment(v15);
        end, { u5.store.SocialConnections.connections.discord.verificationCode, u5.store.SocialConnections.connections.discord.validated });

        local function _() -- Line: 111
            return "Support & verify for a reward";
        end;

        return u3.createFragment({ u3.createElement(DarkBackground, {
                AppId = u5.AppId
            }), u3.createElement(SlideIn, {}, { u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromOffset(440, 510)
                }, { u3.createElement(ScaleComponent, {
                        MaximumSize = Vector2.new(550, 630),
                        ScreenPadding = Vector2.new(24, 24)
                    }), u3.createElement(WidgetComponent, {
                        ClipsDescendents = false,
                        Title = "Connections",
                        AppId = u5.AppId,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        TitleIcon = ImageId.SATELITE,
                        SubTitle = "Support & verify for a reward",
                        OnClose = v11
                    }, {
                        u3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 10)
                        }),
                        SupportConnections = u3.createElement("Frame", {
                            AutomaticSize = "Y",
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.new(1, 0, 0, 0)
                        }, {
                            u3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical,
                                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                VerticalAlignment = Enum.VerticalAlignment.Center,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                Padding = UDim.new(0, 8)
                            }),
                            u3.createElement(SocialConnectionsSectionTitle, {
                                Title = "<b>1. Support The Game</b>",
                                LayoutOrder = 1,
                                Completed = u8
                            }),
                            u3.createElement(SocialConnectionsConnectInfoCard, {
                                Text = "<b>Like</b>, ⭐ <b>favorite</b>, and ",
                                LayoutOrder = 2,
                                Size = UDim2.new(1, 0, 0, 46),
                                ImageId = ImageId.THUMBS_UP_SOLID,
                                store = u5.store,
                                MiddleElementEmbed = {
                                    rightText = "<b>follow</b> the game",
                                    element = u3.createElement("Frame", {
                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromOffset(18, 12.65625)
                                    }, { u3.createElement("ImageLabel", {
                                            Rotation = 47,
                                            ScaleType = "Fit",
                                            SizeConstraint = "RelativeYY",
                                            BackgroundTransparency = 1,
                                            Size = UDim2.fromOffset(18, 12.65625),
                                            Image = ImageId.WIFI_SOLID,
                                            ImageColor3 = ColorUtil.hexColor(16752398)
                                        }) })
                                }
                            }),
                            u3.createElement(SocialConnectionsGroup, {
                                store = u5.store
                            }),
                            u3.createElement(SocialConnectionsConnectInfoCard, {
                                Text = "<b>Follow</b> our socials on our homepage.",
                                LayoutOrder = 4,
                                Size = UDim2.new(1, 0, 0, 46),
                                ImageId = ImageId.TWITTER_SOLID
                            })
                        }),
                        v18,
                        u3.createElement(DividerComponent, {
                            Margin = 2,
                            LayoutOrder = 3
                        }),
                        v14
                    }) }) }) });
    end)
};