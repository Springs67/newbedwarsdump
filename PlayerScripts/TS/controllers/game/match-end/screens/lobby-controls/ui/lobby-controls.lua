-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local u6 = nil;

local function v39(p7, p8) -- Line: 26
    -- upvalues: u3 (copy), DeviceUtil (copy), KnitClient2 (copy), RunService (copy), PlaceUtil (copy), MatchEndScreensMeta (copy), u6 (ref), ClientSyncEvents (copy), TweenService (copy), ColorUtil (copy), Theme (copy), Button (copy), ClientStore (copy), KnitClient (copy), Players (copy), default (copy), Flamework (copy), ShineEffect (copy), ShineEffectVariation (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState(false);
    local u11, u12 = useState(false);
    local v13, u14 = useState(false);
    local u15, u16 = useState(false);
    local userId = p7.store.Party.leader.userId;
    local queueType = p7.store.Game.queueType;
    local u17 = u3.createRef();
    local u18 = u3.createRef();
    local v19 = DeviceUtil.isSmallScreen() and 30 or 10;
    local v20 = DeviceUtil.isSmallScreen() and 18 or 20;
    local v21 = DeviceUtil.isSmallScreen() and 50 or 65;
    local v22;

    if DeviceUtil.isHoarceKat() then
        v22 = nil;
    else
        v22 = KnitClient2.Controllers.MatchController:getCustomMatchConfig();
    end;

    local v23 = (RunService:IsStudio() or PlaceUtil.isStaging()) and true or not v22;
    useEffect(function() -- Line: 51
        -- upvalues: u17 (copy), u18 (copy), MatchEndScreensMeta (ref), u6 (ref), u16 (copy), u14 (copy), ClientSyncEvents (ref), u10 (copy), DeviceUtil (ref), TweenService (ref)
        local u24 = u17:getValue();
        local u25 = u18:getValue();
        local u26 = nil;

        local function u28(p27) -- Line: 55
            -- upvalues: MatchEndScreensMeta (ref), u26 (ref), u6 (ref), u25 (copy), u16 (ref)
            local displaySecs = MatchEndScreensMeta[p27].displaySecs;
            u26 = u6(displaySecs == nil and 0 or displaySecs, u25);
            u16(false);
            task.delay(0.1, function() -- Line: 62
                -- upvalues: u16 (ref)
                u16(true);
            end);
        end;

        u28(1);
        u14(true);
        ClientSyncEvents.MatchEndScreenEnd:connect(function(p29) -- Line: 70
            -- upvalues: u26 (ref), u14 (ref)
            local v30 = u26;

            if v30 ~= nil then
                v30:Cancel();
            end;

            u14(false);
        end);
        ClientSyncEvents.MatchEndScreenStart:connect(function(p31) -- Line: 78
            -- upvalues: u28 (copy), u14 (ref)
            u28(p31.matchEndScreenType);
            u14(true);
        end);
        ClientSyncEvents.MatchEndScreenStart:connect(function(p32) -- Line: 83
            -- upvalues: u10 (ref)
            if p32.matchEndScreenType ~= 6 then
                return nil;
            end;

            u10(true);
        end);
        task.spawn(function() -- Line: 90
            -- upvalues: DeviceUtil (ref), TweenService (ref), u24 (copy)
            if DeviceUtil.isHoarceKat() then
                task.wait(0.5);
            end;

            TweenService:Create(u24, TweenInfo.new(0.25, Enum.EasingStyle.Cubic), {
                Position = UDim2.fromScale(0.5, 1)
            }):Play();
        end);
    end, {});
    local v33 = {
        Size = UDim2.new(1, 0, 0, v21),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1) + UDim2.fromOffset(0, v21),
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        BackgroundColor3 = ColorUtil.hexColor(1710618),
        [u3.Ref] = u17
    };
    local v34 = {
        DisplayTimer = u3.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 5)
        }, {
            DisplayTimerProgress = u3.createElement("Frame", {
                [u3.Ref] = u18,
                Size = UDim2.fromScale(0, 1),
                BorderSizePixel = 0,
                BackgroundColor3 = Theme.backgroundPrimary,
                ZIndex = 101,
                Visible = not u9
            })
        })
    };
    local _ = #v34;
    local v35 = {
        BackgroundTransparency = 1,
        ZIndex = 100,
        Size = UDim2.new(1, 0, 1, -20),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, v19, 0.5, 0)
    };
    local v36 = {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }),
        NextButton = u3.createElement(Button, {
            LayoutOrder = 1,
            Text = "<b>" .. (u9 and (u11 and "HIDE SUMMARY" or "VIEW SUMMARY") or "NEXT") .. "</b>",
            BackgroundColor3 = Theme.Gray,
            Size = UDim2.fromScale(0.28, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),

            OnClick = function() -- Line: 148, Name: OnClick
                -- upvalues: u9 (copy), u11 (copy), ClientStore (ref), u12 (copy), u15 (copy), KnitClient (ref)
                if not u9 then
                    if u15 then
                        KnitClient.Controllers.MatchEndController:skipCurrDisplay();
                    end;

                    return;
                end;

                if u11 then
                    ClientStore:dispatch({
                        type = "SetMatchEndSummaryVisible",
                        visible = false
                    });
                    u12(false);

                    return;
                end;

                ClientStore:dispatch({
                    type = "SetMatchEndSummaryVisible",
                    visible = true
                });
                u12(true);
            end,

            TextLabel = {
                TextScaled = false,
                TextSize = v20
            },
            CornerRadius = UDim.new(0, 6),
            Visible = v13 or u9
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) })
    };
    local v37 = #v36;
    local v38 = v23 and (DeviceUtil.isHoarceKat() and true or not KnitClient.Controllers.SpectateController:isObserver(Players.LocalPlayer)) and u3.createFragment({
        HonorButton = u3.createElement(Button, {
            Text = "<b>HONOR</b>",
            LayoutOrder = 2,
            BackgroundColor3 = Theme.Gray,
            Size = UDim2.fromScale(0.28, 1),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),

            OnClick = function() -- Line: 191, Name: OnClick
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.HonorController:toggleGui(true);
            end,

            TextLabel = {
                TextScaled = false,
                TextSize = v20
            },
            CornerRadius = UDim.new(0, 6),
            Visible = v13 or u9
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) })
    });

    if v38 then
        v36[v37 + 1] = v38;
    end;

    v34.LeftButtons = u3.createElement("Frame", v35, v36);
    v34.RightButtons = u3.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 100,
        Size = UDim2.new(1, 0, 1, -20),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -v19, 0.5, 0)
    }, {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }),
        LobbyButton = u3.createElement(Button, {
            Text = "<b>LOBBY</b>",
            LayoutOrder = 1,
            BackgroundColor3 = Theme.backgroundSecondary,
            Size = UDim2.fromScale(0.28, 1),

            OnClick = function() -- Line: 230, Name: OnClick
                -- upvalues: default (ref)
                default.Client:Get("TeleportToLobby"):SendToServer();
            end,

            TextLabel = {
                TextScaled = false,
                TextSize = v20
            },
            CornerRadius = UDim.new(0, 6)
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) }),
        PlayAgainButton = u3.createElement("ImageButton", {
            Size = UDim2.fromScale(0.344, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,
            LayoutOrder = 0,

            [u3.Event.Activated] = function() -- Line: 250
                -- upvalues: DeviceUtil (ref), userId (copy), Players (ref), Flamework (ref), KnitClient2 (ref), queueType (copy)
                if DeviceUtil.isHoarceKat() then
                    return nil;
                end;

                if userId ~= Players.LocalPlayer.UserId then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        message = "Only the Party Leader can enter the queue."
                    });

                    return nil;
                end;

                KnitClient2.Controllers.QueueController:joinQueue(queueType);
            end
        }, {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4.65,
                DominantAxis = "Height"
            }),
            u3.createElement(ShineEffect, {
                Loop = false,
                OnHover = true,
                Color = ColorUtil.WHITE,
                Variation = ShineEffectVariation.solid
            }),
            u3.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromRGB(54, 235, 94), Color3.fromRGB(0, 186, 99))
            }),
            u3.createElement("TextLabel", {
                Text = "<b>PLAY AGAIN</b>",
                Font = "Roboto",
                BackgroundTransparency = 1,
                RichText = true,
                Size = UDim2.fromScale(0.7, 0.75),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = ColorUtil.WHITE,
                TextSize = v20
            })
        })
    });

    return u3.createElement("Frame", v33, v34);
end;

u6 = function(p40, u41) -- Line: 295, Name: tweenDisplayTimer
    -- upvalues: TweenService (copy)
    local v42 = TweenService:Create(u41, TweenInfo.new(p40 - 0.01, Enum.EasingStyle.Linear), {
        Size = UDim2.fromScale(1, 1)
    });
    v42:Play();
    v42.Completed:Connect(function() -- Line: 300
        -- upvalues: u41 (copy)
        u41.Size = UDim2.fromScale(0, 1);
    end);

    return v42;
end;

local u43 = nil;

local function LobbyControlsWrapper(p44) -- Line: 306
    -- upvalues: u3 (copy), u43 (ref)
    return u3.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 150,
        ScreenInsets = Enum.ScreenInsets.None
    }, { u3.createElement(u43, {
            store = p44.store,
            DisableViewSummary = p44.DisableViewSummary
        }) });
end;

u43 = v4.new(u3)(v39);

return {
    LobbyControlsWrapper = LobbyControlsWrapper,
    LobbyControls = u43
};