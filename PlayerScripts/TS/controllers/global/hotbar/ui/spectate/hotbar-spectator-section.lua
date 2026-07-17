-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local CustomMatchTeamButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "creative", "custom-match", "custom-match-team-button").CustomMatchTeamButton;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local HotbarKitViewport = RuntimeLib.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport;
local v40 = v3.new(u2)(function(u6, p7) -- Line: 29
    -- upvalues: RunService (copy), QueueMeta (copy), Players (copy), QueueState (copy), DeviceUtil (copy), KnitClient (copy), PlaceUtil (copy), u2 (copy), ColorUtil (copy), Flamework (copy), ShineEffect (copy), ShineEffectVariation (copy), Empty (copy), Padding (copy), Button (copy), Theme (copy), default (copy), BedwarsAppIds (copy), ClientStore (copy), HotbarKitViewport (copy), CustomMatchTeamButton (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, u9 = useState(true);
    local v10, u11 = useState(false);
    local v12, u13 = useState(RunService:IsStudio() and true or false);
    local u14;

    if u6.QueueType then
        u14 = QueueMeta[u6.QueueType];
    else
        u14 = nil;
    end;

    local v15;

    if Players.LocalPlayer then
        v15 = u6.QueueType ~= nil;

        if u6.PartyQueueState ~= QueueState.NONE then
            v15 = false;
        end;

        local QueueType = u6.QueueType;

        if QueueType then
            if u14 == nil then
                QueueType = u14;
            else
                QueueType = u14.disabled;
            end;
        end;

        if QueueType then
            v15 = false;
        end;
    else
        v15 = true;
    end;

    local v16;

    if DeviceUtil.isHoarceKat() then
        v16 = nil;
    else
        v16 = KnitClient.Controllers.MatchController:getCustomMatchConfig();
    end;

    local v17;

    if v16 then
        v17 = Players.LocalPlayer.UserId == v16.hostUserId;
    else
        v17 = v16;
    end;

    local v18 = (RunService:IsStudio() or PlaceUtil.isStaging()) and true or not v16;
    useEffect(function() -- Line: 72
        -- upvalues: DeviceUtil (ref), u9 (copy), KnitClient (ref), Players (ref), u11 (copy), u13 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        u9(KnitClient.Controllers.SpectateUIController:getButtonsVisibility());
        local u20 = KnitClient.Controllers.SpectateUIController.buttonVisibilityUpdate:Connect(function(p19) -- Line: 77
            -- upvalues: u9 (ref)
            u9(p19);
        end);
        u11(Players.LocalPlayer:GetAttribute("SpectatorAllowPickTeam") == true);
        Players.LocalPlayer:GetAttributeChangedSignal("SpectatorAllowPickTeam"):Connect(function() -- Line: 82
            -- upvalues: Players (ref), u11 (ref)
            u11(Players.LocalPlayer:GetAttribute("SpectatorAllowPickTeam") == true);
        end);
        u13(Players.LocalPlayer:GetAttribute("Eliminated") == true);
        Players.LocalPlayer:GetAttributeChangedSignal("Eliminated"):Connect(function() -- Line: 88
            -- upvalues: Players (ref), u13 (ref)
            u13(Players.LocalPlayer:GetAttribute("Eliminated") == true);
        end);

        return function() -- Line: 92
            -- upvalues: u20 (copy)
            u20:Disconnect();
        end;
    end, {});
    local v21 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Modal = true,
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.7 or 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v22 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 3)
        }) };
    local v23 = #v22;
    local v24 = {
        LayoutOrder = 0,
        Size = UDim2.fromScale(1, 1)
    };
    local v25 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            HorizontalFlex = "SpaceBetween",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.01, 0)
        }) };
    local v26 = #v25;

    if v8 then
        if v15 then
            if v16 == nil then
                v15 = u2.createFragment({ u2.createElement("ImageButton", {
                        Size = UDim2.fromScale(0.344, 1.4),
                        BackgroundColor3 = ColorUtil.WHITE,
                        BorderSizePixel = 0,
                        LayoutOrder = 6,

                        [u2.Event.Activated] = function() -- Line: 135
                            -- upvalues: u6 (copy), Players (ref), Flamework (ref), KnitClient (ref)
                            if u6.PartyLeaderUserId ~= Players.LocalPlayer.UserId then
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                    message = "Only the Party Leader can enter the queue."
                                });

                                return nil;
                            end;

                            KnitClient.Controllers.QueueController:joinQueue(u6.QueueType);
                        end
                    }, {
                        u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 4.65,
                            DominantAxis = "Height"
                        }),
                        u2.createElement(ShineEffect, {
                            Loop = false,
                            OnHover = true,
                            Color = ColorUtil.WHITE,
                            Variation = ShineEffectVariation.solid
                        }),
                        u2.createElement("UIStroke", {
                            Thickness = 2,
                            Color = Color3.fromRGB(114, 255, 120)
                        }, { u2.createElement("UIGradient", {
                                Rotation = -90,
                                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                            }) }),
                        u2.createElement("UIGradient", {
                            Rotation = 90,
                            Color = ColorSequence.new(Color3.fromRGB(35, 218, 53), Color3.fromRGB(54, 235, 94))
                        }),
                        Content = u2.createElement(Empty, {
                            Size = UDim2.fromScale(1, 1)
                        }, { u2.createElement(
                                "UIListLayout",
                                {
                                    FillDirection = "Horizontal",
                                    VerticalAlignment = "Center",
                                    HorizontalAlignment = "Center"
                                }
                            ), u2.createElement(Padding, {
                                Padding = UDim.new(0, 6)
                            }), u2.createElement("TextLabel", {
                                Text = "<b>PLAY AGAIN</b>",
                                Font = "Roboto",
                                TextSize = 18,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                RichText = true,
                                Size = UDim2.fromScale(0.7, 0.75),
                                TextColor3 = ColorUtil.WHITE
                            }) })
                    }) });
            else
                v15 = false;
            end;
        end;
    else
        v15 = v8;
    end;

    if v15 then
        v25[v26 + 1] = v15;
    end;

    local v27 = #v25;

    if v8 then
        if v17 then
            v17 = u2.createFragment({ u2.createElement(Button, {
                    Text = "<b>RESTART</b>",
                    LayoutOrder = 8,
                    Size = UDim2.fromScale(0.28, 1),
                    BackgroundColor3 = Theme.backgroundSuccess,

                    OnClick = function() -- Line: 201, Name: OnClick
                        -- upvalues: default (ref), Flamework (ref)
                        default.Client:GetNamespace("CustomMatches"):Get("RestartCustomMatch"):CallServerAsync():expect();
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            message = "Restarting match..."
                        });
                    end
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 3.795918367346939,
                        DominantAxis = "Height"
                    }) }) });
        end;
    else
        v17 = v8;
    end;

    if v17 then
        v25[v27 + 1] = v17;
    end;

    local v28 = #v25;
    local v29;

    if v8 then
        v29 = u2.createFragment({ u2.createElement(Button, {
                Text = "<b>LOBBY</b>",
                LayoutOrder = 2,
                BackgroundColor3 = Theme.mcRed,
                Size = UDim2.fromScale(0.28, 1),

                OnClick = function() -- Line: 224, Name: OnClick
                    -- upvalues: default (ref)
                    default.Client:Get("TeleportToLobby"):SendToServer();
                end
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 3.795918367346939,
                    DominantAxis = "Height"
                }) }) });
    else
        v29 = v8;
    end;

    if v29 then
        v25[v28 + 1] = v29;
    end;

    local v30 = #v25;
    local v31;

    if v8 then
        v31 = u2.createElement(Button, {
            Text = "<b>KITS</b>",
            LayoutOrder = 10,

            OnClick = function() -- Line: 241, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                    SelectedKit = ClientStore:getState().Bedwars.kit
                });
            end,

            Size = UDim2.fromScale(0.28, 1)
        }, { u2.createElement(HotbarKitViewport, {
                store = u6.store,
                Size = UDim2.fromScale(1.5, 1.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0.02, 0.48)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) });
    else
        v31 = v8;
    end;

    if v31 then
        v25[v30 + 1] = v31;
    end;

    local v32 = #v25;

    if v8 then
        if v12 then
            if v18 then
                v18 = u2.createFragment({ u2.createElement(Button, {
                        Text = "<b>HONOR</b>",
                        LayoutOrder = 11,
                        Size = UDim2.fromScale(0.28, 1),
                        BackgroundColor3 = Theme.backgroundSuccess,

                        OnClick = function() -- Line: 269, Name: OnClick
                            -- upvalues: KnitClient (ref)
                            KnitClient.Controllers.HonorController:toggleGui(true);
                        end
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 3.795918367346939,
                            DominantAxis = "Height"
                        }) }) });
            end;
        else
            v18 = v12;
        end;
    else
        v18 = v8;
    end;

    if v18 then
        v25[v32 + 1] = v18;
    end;

    v22.SpectatorBar = u2.createElement(Empty, v24, v25);
    local v33 = v10 and u14;

    if v33 then
        local Teams = u6.Teams;

        local function _(p34, p35) -- Line: 287
            -- upvalues: u2 (ref), CustomMatchTeamButton (ref), u14 (copy)
            return u2.createElement(CustomMatchTeamButton, {
                AppId = "CustomMatchTeamButton_" .. p34.id,
                Team = p34,
                QueueMeta = u14,
                LayoutOrder = p35
            });
        end;

        local v36 = table.create(#Teams);

        for i, v in Teams do
            v36[i] = u2.createElement(CustomMatchTeamButton, {
                AppId = "CustomMatchTeamButton_" .. v.id,
                Team = v,
                QueueMeta = u14,
                LayoutOrder = i - 1
            });
        end;

        local v37 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v38 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.02, 0)
            }) };
        local v39 = #v38;

        for i, v in v36 do
            v38[v39 + i] = v;
        end;

        v33 = u2.createFragment({
            ["Team Selection Bar"] = u2.createElement(Empty, v37, v38)
        });
    end;

    if v33 then
        v22[v23 + 1] = v33;
    end;

    return u2.createElement("ImageButton", v21, v22);
end);

return {
    HotbarSpectatorSection = v4.connect(function(p41, p42) -- Line: 328
        local v43 = {};

        for i, v in p42 do
            v43[i] = v;
        end;

        v43.store = p41;
        v43.PartyLeaderUserId = p41.Party.leader.userId;
        v43.PartyQueueState = p41.Party.queueState;
        v43.QueueType = p41.Game.queueType;
        v43.Teams = p41.Game.teams;

        return v43;
    end)(v40)
};