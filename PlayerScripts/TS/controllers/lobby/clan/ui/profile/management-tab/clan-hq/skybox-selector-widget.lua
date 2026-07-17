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
local getClanHqSkyboxMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-skybox-meta").getClanHqSkyboxMeta;
local ClanHqSkyboxType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqSkyboxType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SkyboxSelectorWidget = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: ClanHqSkyboxType (copy), Theme (copy), u2 (copy), ScaleComponent (copy), Flamework (copy), ColorUtil (copy), Empty (copy), DividerComponent (copy), getClanHqSkyboxMeta (copy), KnitClient (copy), AutoCanvasScrollingFrame (copy), WidgetComponent (copy)
        local _ = p5.useState;
        local myClan = u4.store.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanHq;

            if myClan ~= nil then
                myClan = myClan.allSkyboxes;
            end;
        end;

        local v6 = myClan == nil and { ClanHqSkyboxType.DEFAULT } or myClan;

        local function _() -- Line: 31
            -- upvalues: u4 (copy), ClanHqSkyboxType (ref)
            local myClan2 = u4.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanHq;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedSykbox;
                end;
            end;

            if myClan2 == nil then
                myClan2 = ClanHqSkyboxType.DEFAULT;
            end;

            return myClan2;
        end;

        local v7 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = Theme.widgetSize
        };
        local v8 = { u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(Theme.widgetSize.X.Offset * 1.3, Theme.widgetSize.Y.Offset * 1.3),
                ScreenPadding = Vector2.new(24, 24)
            }) };
        local v9 = {
            ClipsDescendents = false,
            Title = "Clan Profile",
            AppId = u4.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),

            OnClose = function() -- Line: 65, Name: OnClose
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
        local v10 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement("TextLabel", {
                Text = "Select Skybox",
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

        local function v20(u11) -- Line: 107
            -- upvalues: getClanHqSkyboxMeta (ref), u2 (ref), u4 (copy), KnitClient (ref), Flamework (ref), ClanHqSkyboxType (ref), ColorUtil (ref)
            local v12 = getClanHqSkyboxMeta(u11);
            local v16 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Image = v12.iconId,

                [u2.Event.MouseButton1Click] = function() -- Line: 113
                    -- upvalues: u4 (ref), KnitClient (ref), u11 (copy), Flamework (ref)
                    if u4.store.Clans.myClanId == nil then
                        return nil;
                    end;

                    KnitClient.Controllers.ClanController:selectClanHqSkybox(u4.store.Clans.myClanId, u11):andThen(function(p13) -- Line: 118
                        -- upvalues: Flamework (ref)
                        if not p13.success then
                            local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                            local v15 = {};
                            local errorMessage = p13.errorMessage;
                            v15.message = errorMessage == nil and "An unknown error occurred" or errorMessage;
                            v14:sendErrorNotification(v15);
                        end;
                    end);
                end,

                ClipsDescendants = true
            };
            local v17 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) };
            local v18 = #v17;
            local v19 = false;
            local myClan2 = u4.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.clanHq;

                if myClan2 ~= nil then
                    myClan2 = myClan2.selectedSykbox;
                end;
            end;

            if myClan2 == nil then
                myClan2 = ClanHqSkyboxType.DEFAULT;
            end;

            if myClan2 == u11 then
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
                    Text = v12.title,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u2.createElement("UITextSizeConstraint", {
                        MinTextSize = 8,
                        MaxTextSize = 16
                    }) }) });

            return u2.createElement("ImageButton", v16, v17);
        end;

        local v21 = table.create(#v6);

        for i, v in v6 do
            v21[i] = v20(v, i - 1, v6);
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
                CellSize = UDim2.new(0.2, 0, 0, 80),
                CellPadding = UDim2.new(0, 10, 0, 10)
            }) };
        local v24 = #v23;

        for i, v in v21 do
            v23[v24 + i] = v;
        end;

        v10[#v10 + 1] = u2.createElement(AutoCanvasScrollingFrame, v22, v23);
        v8[#v8 + 1] = u2.createElement(WidgetComponent, v9, v10);

        return u2.createElement("Frame", v7, v8);
    end)
};