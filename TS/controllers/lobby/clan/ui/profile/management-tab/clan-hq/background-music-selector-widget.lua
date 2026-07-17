-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local StringUtil = v1.StringUtil;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getClanHqBackgroundMusicMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta;
local ClanHqBackgroundMusicType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqBackgroundMusicType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BackgroundMusicSelectorWidget = v4.new(u3)(function(u5, p6) -- Line: 20
        -- upvalues: ClanHqBackgroundMusicType (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), Theme (copy), u3 (copy), ScaleComponent (copy), Flamework (copy), ColorUtil (copy), Empty (copy), DividerComponent (copy), getClanHqBackgroundMusicMeta (copy), AutoCanvasScrollingFrame (copy), StringUtil (copy), WidgetComponent (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7, u8 = useState(0);
        local v9, u10 = useState(0);
        local v11, u12 = useState("");
        local myClan = u5.store.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanHq;

            if myClan ~= nil then
                myClan = myClan.allLobbyMusic;
            end;
        end;

        local v13 = myClan == nil and { ClanHqBackgroundMusicType.DEFAULT } or myClan;

        local function _() -- Line: 38
            -- upvalues: u5 (copy), ClanHqBackgroundMusicType (ref)
            local myClan2 = u5.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanHq;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedLobbyMusic;
                end;
            end;

            if myClan2 == nil then
                myClan2 = ClanHqBackgroundMusicType.DEFAULT;
            end;

            return myClan2;
        end;

        local function v18() -- Line: 52
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u2 (ref), u10 (copy), u12 (copy), u8 (copy)
            local u14;

            if DeviceUtil.isHoarceKat() then
                u14 = nil;
            else
                u14 = KnitClient.Controllers.BackgroundMusicController:getActiveTrack();
            end;

            if not u14 then
                return nil;
            end;

            local u15 = u2.new();
            task.defer(function() -- Line: 58
                -- upvalues: u14 (copy), u10 (ref), u12 (ref), u15 (copy), u8 (ref)
                if not u14.IsLoaded then
                    u14.Loaded:Wait();
                end;

                u10(u14.TimeLength);
                u12(u14.Name);
                u15:GiveTask(task.spawn(function() -- Line: 64
                    -- upvalues: u15 (ref), u14 (ref), u8 (ref)
                    local u16 = true;
                    u15:GiveTask(function() -- Line: 66
                        -- upvalues: u16 (ref)
                        u16 = false;
                    end);

                    while true do
                        local v17 = u16 and task.wait(1);

                        if v17 == 0 or (v17 ~= v17 or not v17) then
                            return;
                        end;

                        if u14.IsPlaying then
                            u8(u14.TimePosition);
                        end;
                    end;
                end));
            end);

            return function() -- Line: 81
                -- upvalues: u15 (copy)
                u15:DoCleaning();
            end;
        end;

        local myClan2 = u5.store.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.clanHq;

            if myClan2 ~= nil then
                myClan2 = myClan2.selectedLobbyMusic;
            end;
        end;

        useEffect(v18, { myClan2 });
        local v19 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(Theme.widgetSize.X.Offset / 2, Theme.widgetSize.Y.Offset)
        };
        local v20 = { u3.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(Theme.widgetSize.X.Offset * 1.3 / 2, Theme.widgetSize.Y.Offset * 1.3),
                ScreenPadding = Vector2.new(24, 24)
            }) };
        local v21 = {
            ClipsDescendents = false,
            Title = "Clan Profile",
            AppId = u5.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),

            OnClose = function() -- Line: 113, Name: OnClose
                -- upvalues: Flamework (ref), u5 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
            end,

            ContentUIPadding = u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0),
                PaddingBottom = UDim.new(0, 0),
                PaddingLeft = UDim.new(0, 0),
                PaddingRight = UDim.new(0, 0)
            })
        };
        local v22 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement("TextLabel", {
                Text = "Select Background Music",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0),
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }), u3.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(0.85, 0, 0, 6)
            }, { u3.createElement(DividerComponent, {
                    Position = UDim2.fromOffset(0, -10)
                }) }) };
        local v23 = #v22;

        local function v34(u24) -- Line: 155
            -- upvalues: getClanHqBackgroundMusicMeta (ref), u5 (copy), ClanHqBackgroundMusicType (ref), ColorUtil (ref), Theme (ref), u3 (ref), KnitClient (ref), Flamework (ref)
            local v25 = getClanHqBackgroundMusicMeta(u24);
            local v26 = {
                BorderSizePixel = 0
            };
            local myClan3 = u5.store.Clans.myClan;

            if myClan3 ~= nil then
                myClan3 = myClan3.clanHq;

                if myClan3 ~= nil then
                    myClan3 = myClan3.selectedLobbyMusic;
                end;
            end;

            if myClan3 == nil then
                myClan3 = ClanHqBackgroundMusicType.DEFAULT;
            end;

            local v27;

            if myClan3 == u24 then
                v27 = ColorUtil.brighten(Theme.backgroundTertiary, 0.1);
            else
                v27 = Theme.backgroundTertiary;
            end;

            v26.BackgroundColor3 = v27;

            v26[u3.Event.MouseButton1Click] = function() -- Line: 160
                -- upvalues: u5 (ref), KnitClient (ref), u24 (copy), Flamework (ref)
                if u5.store.Clans.myClanId == nil then
                    return nil;
                end;

                KnitClient.Controllers.ClanController:selectClanHqBackgroundMusic(u5.store.Clans.myClanId, u24):andThen(function(p28) -- Line: 165
                    -- upvalues: Flamework (ref)
                    if not p28.success then
                        local v29 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                        local v30 = {};
                        local errorMessage = p28.errorMessage;
                        v30.message = errorMessage == nil and "An unknown error occurred" or errorMessage;
                        v29:sendErrorNotification(v30);
                    end;
                end);
            end;

            local v31 = { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.25, 0)
                }) };
            local v32 = #v31;
            local v33 = false;
            local myClan4 = u5.store.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.clanHq;

                if myClan4 ~= nil then
                    myClan4 = myClan4.selectedLobbyMusic;
                end;
            end;

            if myClan4 == nil then
                myClan4 = ClanHqBackgroundMusicType.DEFAULT;
            end;

            if myClan4 == u24 then
                v33 = u3.createElement("UIStroke", {
                    Thickness = 3,
                    Color = ColorUtil.WHITE
                });
            end;

            if v33 then
                v31[v32 + 1] = v33;
            end;

            v31[#v31 + 1] = u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                TextColor3 = ColorUtil.WHITE,
                Text = v25.title,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
            }, { u3.createElement("UITextSizeConstraint", {
                    MinTextSize = 8,
                    MaxTextSize = 16
                }) });

            return u3.createElement("ImageButton", v26, v31);
        end;

        local v35 = table.create(#v13);

        for i, v in v13 do
            v35[i] = v34(v, i - 1, v13);
        end;

        local v36 = {
            ScrollingFrameProps = {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.9, 0.75)
            }
        };
        local v37 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4)
            }), u3.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 10,
                HorizontalAlignment = "Center",
                CellSize = UDim2.new(0.6, 0, 0, 30),
                CellPadding = UDim2.new(0, 0, 0, 3)
            }) };
        local v38 = #v37;

        for i, v in v35 do
            v37[v38 + i] = v;
        end;

        v22[v23 + 1] = u3.createElement(AutoCanvasScrollingFrame, v36, v37);
        v22[v23 + 2] = u3.createElement(Empty, {
            LayoutOrder = 4,
            Size = UDim2.new(0.85, 0, 0, 6)
        }, { u3.createElement(DividerComponent) });
        v22[v23 + 3] = u3.createElement(Empty, {
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.8, 0.125)
        }, { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.2, 0)
            }), u3.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0),
                Text = "Playing " .. v11,
                TextYAlignment = Enum.TextYAlignment.Top,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 14
                }) }), u3.createElement(Empty, {
                Size = UDim2.new(1, 0, 0, 3),
                Position = UDim2.fromScale(0.5, 0.6),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u3.createElement(Empty, {
                    Size = UDim2.new(0.825, 0, 0, 3)
                }, { u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.new(v7 / v9, 0, 0, 3),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }), u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 1),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }), u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.new(0, 5, 0, 10),
                        Position = UDim2.fromScale(v7 / v9, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }) }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.new(0.85, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.new(0.15, 0, 0, 15),
                    TextColor3 = ColorUtil.WHITE,
                    Text = StringUtil.formatCountdownTime(v7) .. " / " .. StringUtil.formatCountdownTime(v9),
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u3.createElement("UITextSizeConstraint", {
                        MinTextSize = 8,
                        MaxTextSize = 10
                    }) }) }) });
        v20[#v20 + 1] = u3.createElement(WidgetComponent, v21, v22);

        return u3.createElement("Frame", v19, v20);
    end)
};