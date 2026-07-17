-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getQueueGroupMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").getQueueGroupMeta;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local QueueSelectionQueueButton = RuntimeLib.import(script, script.Parent, "queue-selection-queue-button").QueueSelectionQueueButton;

return {
    QueueSelectionAppCore = v3.new(u2)(function(p4, p5) -- Line: 21
        -- upvalues: getQueueGroupMeta (copy), ClientStore (copy), QueueMeta (copy), QueueState (copy), Flamework (copy), BedwarsAppIds (copy), u2 (copy), ScaleComponent (copy), QueueSelectionQueueButton (copy), AutoCanvasScrollingFrame (copy), Empty (copy), Theme (copy), ColorUtil (copy), DeviceUtil (copy), WidgetComponent (copy), SlideIn (copy)
        local _ = p5.useEffect;
        local v6 = getQueueGroupMeta(p4.QueueSelectionType);

        local function u9(p7) -- Line: 24
            -- upvalues: ClientStore (ref), QueueMeta (ref), QueueState (ref), Flamework (ref), BedwarsAppIds (ref)
            local Party = ClientStore:getState().Party;
            local v8 = QueueMeta[p7];

            if Party.queueState ~= QueueState.NONE then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You are already in another queue. Leave to join " .. v8.title .. "."
                });

                return nil;
            end;

            Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p7);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.QUEUE_SELECTION);
        end;

        local v10 = {};
        local v11 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(500, 380)
        };
        local v12 = { u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(789, 543),
                ScreenPadding = Vector2.new(24, 24)
            }) };
        local v13 = {
            AppId = p4.AppId,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Title = v6.title
        };
        local v14 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.025, 0)
            }) };
        local v15 = #v14;

        local function _(p16, p17) -- Line: 67
            -- upvalues: QueueMeta (ref), u2 (ref), QueueSelectionQueueButton (ref), u9 (copy)
            if QueueMeta[p16].disabled then
                return nil;
            end;

            return u2.createElement(QueueSelectionQueueButton, {
                QueueType = p16,
                OnClick = u9
            });
        end;

        local v18 = 0;
        local v19 = {};

        for i, v in v6.queues do
            local _ = i - 1;
            local v20;

            if QueueMeta[v].disabled then
                v20 = nil;
            else
                v20 = u2.createElement(QueueSelectionQueueButton, {
                    QueueType = v,
                    OnClick = u9
                });
            end;

            if v20 ~= nil then
                v18 = v18 + 1;
                v19[v18] = v20;
            end;
        end;

        local v21 = {
            ScrollingFrameProps = {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Selectable = false,
                Size = UDim2.fromScale(0.55, 1)
            }
        };
        local v22 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 6)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.025, 0)
            }) };
        local v23 = #v22;

        for i, v in v19 do
            v22[v23 + i] = v;
        end;

        v14[v15 + 1] = u2.createElement(AutoCanvasScrollingFrame, v21, v22);
        v14[v15 + 2] = u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.425, 1)
        }, { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0.025, 0)
            }), u2.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundTertiary
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }),
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.05, 0),
                    PaddingLeft = UDim.new(0.06, 0),
                    PaddingRight = UDim.new(0.06, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0.025, 0)
                }),
                u2.createElement("TextLabel", {
                    SizeConstraint = "RelativeXX",
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    TextYAlignment = "Top",
                    TextXAlignment = "Left",
                    Text = "<b>Description</b>",
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0),
                    Font = Enum.Font.Roboto,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 18
                    }) }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    RichText = true,
                    TextScaled = true,
                    TextYAlignment = "Top",
                    TextXAlignment = "Left",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.8),
                    Font = Enum.Font.Roboto,
                    TextColor3 = ColorUtil.WHITE,
                    Text = v6.description
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 18
                    }) })
            }) });
        v12[#v12 + 1] = u2.createElement(WidgetComponent, v13, v14);
        v10[#v10 + 1] = u2.createElement("Frame", v11, v12);

        return u2.createElement(SlideIn, {}, v10);
    end)
};