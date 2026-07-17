-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getClanPodiumBannerMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-meta").getClanPodiumBannerMeta;
local ClanPodiumBannerType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    PodiumBannerSelectorWidget = v3.new(u2)(function(u4) -- Line: 17
        -- upvalues: ClanPodiumBannerType (copy), Theme (copy), u2 (copy), ScaleComponent (copy), Flamework (copy), ColorUtil (copy), Empty (copy), DividerComponent (copy), getClanPodiumBannerMeta (copy), KnitClient (copy), AutoCanvasScrollingFrame (copy), WidgetComponent (copy)
        local myClan = u4.store.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanLobby;

            if myClan ~= nil then
                myClan = myClan.allPodiumBanners;
            end;
        end;

        local v5 = (myClan == nil or #myClan <= 0) and { ClanPodiumBannerType.DEFAULT } or myClan;

        local function _() -- Line: 27
            -- upvalues: u4 (copy), ClanPodiumBannerType (ref)
            local myClan2 = u4.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanLobby;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedPodiumBanner;
                end;
            end;

            if myClan2 == nil then
                myClan2 = ClanPodiumBannerType.DEFAULT;
            end;

            return myClan2;
        end;

        local v6 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = Theme.widgetSize
        };
        local v7 = { u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(Theme.widgetSize.X.Offset * 1.3, Theme.widgetSize.Y.Offset * 1.3),
                ScreenPadding = Vector2.new(24, 24)
            }) };
        local v8 = {
            ClipsDescendents = false,
            Title = "Clan Profile",
            AppId = u4.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),

            OnClose = function() -- Line: 61, Name: OnClose
                -- upvalues: Flamework (ref), u4 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u4.AppId);
            end,

            ContentUIPadding = u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 0),
                PaddingLeft = UDim.new(0, 0),
                PaddingRight = UDim.new(0, 0)
            })
        };
        local v9 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement("TextLabel", {
                Text = "Select Lobby Podium Banner",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0),
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }), u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(0.85, 0, 0, 6)
            }, { u2.createElement(DividerComponent, {
                    Position = UDim2.fromOffset(0, -10)
                }) }) };

        local function v20(u10) -- Line: 103
            -- upvalues: getClanPodiumBannerMeta (ref), u4 (copy), ClanPodiumBannerType (ref), ColorUtil (ref), Theme (ref), u2 (ref), KnitClient (ref), Flamework (ref)
            local v11 = getClanPodiumBannerMeta(u10);
            local v12 = {
                BorderSizePixel = 0
            };
            local myClan2 = u4.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanLobby;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedPodiumBanner;
                end;
            end;

            if myClan2 == nil then
                myClan2 = ClanPodiumBannerType.DEFAULT;
            end;

            local v13;

            if myClan2 == u10 then
                v13 = ColorUtil.brighten(Theme.backgroundTertiary, 0.1);
            else
                v13 = Theme.backgroundTertiary;
            end;

            v12.BackgroundColor3 = v13;
            v12.Image = v11.iconId;

            v12[u2.Event.MouseButton1Click] = function() -- Line: 109
                -- upvalues: u4 (ref), KnitClient (ref), u10 (copy), Flamework (ref)
                if u4.store.Clans.myClanId == nil then
                    return nil;
                end;

                KnitClient.Controllers.ClanController:selectClanPodiumBanner(u4.store.Clans.myClanId, u10):andThen(function(p14) -- Line: 114
                    -- upvalues: Flamework (ref)
                    if not p14.success then
                        local v15 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                        local v16 = {};
                        local errorMessage = p14.errorMessage;
                        v16.message = errorMessage == nil and "An unknown error occurred" or errorMessage;
                        v15:sendErrorNotification(v16);
                    end;
                end);
            end;

            v12.ClipsDescendants = true;
            local v17 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) };
            local v18 = #v17;
            local v19 = false;
            local myClan3 = u4.store.Clans.myClan;

            if myClan3 ~= nil then
                myClan3 = myClan3.clanLobby;

                if myClan3 ~= nil then
                    myClan3 = myClan3.selectedPodiumBanner;
                end;
            end;

            if myClan3 == nil then
                myClan3 = ClanPodiumBannerType.DEFAULT;
            end;

            if myClan3 == u10 then
                v19 = u2.createElement("UIStroke", {
                    Thickness = 3,
                    Color = ColorUtil.WHITE
                });
            end;

            if v19 then
                v17[v18 + 1] = v19;
            end;

            v17[#v17 + 1] = u2.createElement("Frame", {
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromScale(1, 0.2),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }), u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    Text = v11.title,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u2.createElement("UITextSizeConstraint", {
                        MinTextSize = 8,
                        MaxTextSize = 16
                    }) }) });

            return u2.createElement("ImageButton", v12, v17);
        end;

        local v21 = table.create(#v5);

        for i, v in v5 do
            v21[i] = v20(v, i - 1, v5);
        end;

        local v22 = {
            ScrollingFrameProps = {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.9, 0.75)
            }
        };
        local v23 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), u2.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 10,
                HorizontalAlignment = "Center",
                CellSize = UDim2.new(0.2, 0, 0, 128),
                CellPadding = UDim2.new(0, 10, 0, 10)
            }) };
        local v24 = #v23;

        for i, v in v21 do
            v23[v24 + i] = v;
        end;

        v9[#v9 + 1] = u2.createElement(AutoCanvasScrollingFrame, v22, v23);
        v7[#v7 + 1] = u2.createElement(WidgetComponent, v8, v9);

        return u2.createElement("Frame", v6, v7);
    end)
};