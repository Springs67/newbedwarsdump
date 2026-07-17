-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v70 = v4.new(u3)(function(u6, p7) -- Line: 23
    -- upvalues: DeviceUtil (copy), Players (copy), OfflinePlayerUtil (copy), KnitClient (copy), u3 (copy), Theme (copy), Empty (copy), ColorUtil (copy), Button (copy), u2 (copy), Flamework (copy), HostPanelTextBox (copy), HostPanelSetting (copy), AutoCompleteSearchbar (copy), AutoCanvasScrollingFrame (copy), WidgetComponent (copy), SlideIn (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local u8;

    if DeviceUtil.isHoarceKat() then
        u8 = { OfflinePlayerUtil.Dummy.oiogy, OfflinePlayerUtil.Dummy.spleenhook, OfflinePlayerUtil.Dummy.SnickTrix };
    else
        local v9 = Players:GetPlayers();

        local function _(p10) -- Line: 29
            -- upvalues: OfflinePlayerUtil (ref)
            return OfflinePlayerUtil.getOfflinePlayer(p10);
        end;

        u8 = table.create(#v9);

        for i, v in v9 do
            local _ = i - 1;
            u8[i] = OfflinePlayerUtil.getOfflinePlayer(v);
        end;
    end;

    local u11, u12 = useState(u8);
    local u13, u14 = useState(u6.AddedOfflinePlayers);
    local u15, u16 = useState(u6.RegionId);

    local function v22(p17, u18) -- Line: 46
        -- upvalues: u12 (copy), u8 (copy)
        if p17 == "" then
            return u12(u8);
        end;

        local function _(p19) -- Line: 50
            -- upvalues: u18 (copy)
            return table.find(u18, p19.displayName) ~= nil or table.find(u18, p19.name) ~= nil;
        end;

        local v20 = 0;
        local v21 = {};

        for i, v in u8 do
            local _ = i - 1;

            if (table.find(u18, v.displayName) ~= nil or table.find(u18, v.name) ~= nil) == true then
                v20 = v20 + 1;
                v21[v20] = v;
            end;
        end;

        u12(v21);
    end;

    local u23 = nil;

    local function v31(p24, u25) -- Line: 75
        -- upvalues: u23 (ref)
        local u26 = {};

        local function _(p27, p28) -- Line: 78
            -- upvalues: u23 (ref), u25 (copy), u26 (copy)
            local v29 = u23(p27, p28, u25);
            table.insert(u26, v29);
        end;

        for i, v in p24 do
            local v30 = u23(v, i - 1, u25);
            table.insert(u26, v30);
        end;

        return u26;
    end;

    u23 = function(u32, p33, u34) -- Line: 87
        -- upvalues: KnitClient (ref), u3 (ref), Theme (ref), Empty (ref), ColorUtil (ref), Button (ref), u13 (copy), u14 (copy)
        local v35 = KnitClient.Controllers.CustomMatchController.playerAvatarImages[u32.userId];

        return u3.createFragment({
            PlayerRow = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundColor3 = Theme.backgroundPrimary,
                LayoutOrder = p33
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.12, 0)
                }), u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.15, 0),
                        PaddingBottom = UDim.new(0.15, 0),
                        PaddingLeft = UDim.new(0.03, 0),
                        PaddingRight = UDim.new(0.03, 0)
                    }),
                    u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 12)
                    }),
                    u3.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.4, 1)
                    }, { u3.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.05, 0)
                        }), u3.createElement("ImageLabel", {
                            LayoutOrder = 1,
                            ScaleType = "Fit",
                            SizeConstraint = "RelativeYY",
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 1),
                            Image = v35
                        }, { u3.createElement("UICorner", {
                                CornerRadius = UDim.new(100, 0)
                            }) }), u3.createElement(Empty, {
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.76, 1)
                        }, { u3.createElement("UIListLayout", {
                                FillDirection = "Vertical",
                                VerticalAlignment = "Center",
                                SortOrder = "LayoutOrder",
                                Padding = UDim.new(0.05, 0)
                            }), u3.createElement(Empty, {
                                LayoutOrder = 1,
                                Size = UDim2.fromScale(1, 0.55)
                            }, { u3.createElement("UIListLayout", {
                                    FillDirection = "Horizontal",
                                    SortOrder = "LayoutOrder",
                                    Padding = UDim.new(0.03, 0)
                                }), u3.createElement("TextLabel", {
                                    TextScaled = true,
                                    RichText = true,
                                    Font = "Roboto",
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Center",
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 2,
                                    AutoLocalize = false,
                                    Position = UDim2.fromScale(0, 0),
                                    Size = UDim2.fromScale(1, 1),
                                    Text = "<b>" .. u32.displayName .. "</b>",
                                    TextColor3 = ColorUtil.WHITE
                                }, { u3.createElement("UITextSizeConstraint", {
                                        MaxTextSize = 18
                                    }) }) }), u3.createElement("TextLabel", {
                                TextScaled = true,
                                RichText = true,
                                Font = "Roboto",
                                TextXAlignment = "Left",
                                TextYAlignment = "Center",
                                TextTransparency = 0.3,
                                BackgroundTransparency = 1,
                                LayoutOrder = 2,
                                AutoLocalize = false,
                                Size = UDim2.fromScale(1, 0.4),
                                Text = "@" .. u32.name,
                                TextColor3 = ColorUtil.WHITE
                            }, { u3.createElement("UITextSizeConstraint", {
                                    MaxTextSize = 16
                                }) }) }) }),
                    u3.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.new(0.6, -12, 1, 0)
                    }, {
                        u3.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Right",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 8)
                        }),
                        RemoveButton = u3.createElement(Button, {
                            Text = "Remove",
                            ZIndex = 2,
                            CornerRadius = UDim.new(0.12, 0),
                            Size = UDim2.fromScale(0.4, 1),
                            TextLabel = {
                                ZIndex = 2,
                                Font = Enum.Font.ArialBold,
                                Size = UDim2.fromScale(0.95, 0.65)
                            },
                            BackgroundColor3 = Color3.fromRGB(212, 57, 59),

                            OnClick = function() -- Line: 217, Name: OnClick
                                -- upvalues: KnitClient (ref), u34 (copy), u32 (copy), u13 (ref), u14 (ref)
                                if KnitClient.Controllers.WorldGuardController:requestRemovePlayer(u34, u32.userId) then
                                    local function _(p36) -- Line: 220
                                        -- upvalues: u32 (ref)
                                        return p36.userId ~= u32.userId;
                                    end;

                                    local v37 = 0;
                                    local v38 = {};

                                    for i, v in u13 do
                                        local _ = i - 1;

                                        if v.userId ~= u32.userId == true then
                                            v37 = v37 + 1;
                                            v38[v37] = v;
                                        end;
                                    end;

                                    u14(v38);
                                end;
                            end
                        })
                    })
                }) })
        });
    end;

    useEffect(function() -- Line: 243
        -- upvalues: DeviceUtil (ref), u2 (ref), Players (ref), Flamework (ref), u6 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u39 = u2.new();
        local u40 = true;
        u39:GiveTask(function() -- Line: 249
            -- upvalues: u40 (ref)
            u40 = false;

            return u40;
        end);
        local Character = Players.LocalPlayer.Character;
        task.delay(0.1, function() -- Line: 255
            -- upvalues: Character (copy), u40 (ref), u39 (copy), Flamework (ref), u6 (ref)
            local v41 = Character;

            if v41 ~= nil then
                v41 = v41:FindFirstChildWhichIsA("Humanoid");
            end;

            if u40 and v41 then
                u39:GiveTask(v41:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 262
                    -- upvalues: Flamework (ref), u6 (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
                end));
            end;
        end);
        task.delay(0.1, function() -- Line: 268
            -- upvalues: Character (copy), u40 (ref), Flamework (ref), u6 (ref)
            local v42 = Character;

            if v42 ~= nil then
                v42 = v42.PrimaryPart;

                if v42 ~= nil then
                    v42 = v42.Position;
                end;
            end;

            if not v42 then
                return nil;
            end;

            while true do
                local v43 = task.wait(0.05);

                if v43 ~= 0 and (v43 == v43 and v43) then
                    v43 = u40;
                end;

                if v43 == 0 or (v43 ~= v43 or not v43) then
                    return;
                end;

                local PrimaryPart = Character.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                if not PrimaryPart then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);

                    return nil;
                end;

                if ((PrimaryPart - v42) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);

                    return nil;
                end;
            end;
        end);

        return function() -- Line: 305
            -- upvalues: u39 (copy)
            u39:DoCleaning();
        end;
    end);
    local v44 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v45 = {};
    local v46 = {};
    local _ = #v46;
    local v47 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.25, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.7, 0.5)
    };
    local v48 = {};
    local v49 = {
        ClipsDescendents = false,
        Title = "World Guard Menu",
        AppId = u6.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 334, Name: OnClose
            -- upvalues: Flamework (ref), u6 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
        end,

        ContentUIPadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5)
        })
    };
    local v50 = {
        u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Left",
            Padding = UDim.new(0, 10)
        }),
        SpacerFrame = u3.createElement(Empty, {
            LayoutOrder = 0
        })
    };
    local v51 = {
        Name = "Region Name",
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.11),
        LeftSize = UDim2.fromScale(0.27, 1),
        RightSize = UDim2.fromScale(0.73, 1)
    };
    local v52 = {};
    local v53 = #v52;
    v52[v53 + 1] = u3.createElement(HostPanelTextBox, {
        Text = u15,
        PlaceholderText = u15 == nil and "" or u15,
        NumbersOnly = false,
        MaxCharacters = 16,

        OnFocusLost = function(p54) -- Line: 375
            -- upvalues: KnitClient (ref), u15 (copy), u16 (copy)
            if p54 == "" or #p54 < 2 then
                return nil;
            end;

            if KnitClient.Controllers.WorldGuardController:requestRenameRegion(u15, p54) then
                u16(p54);
            end;
        end
    });
    v52[v53 + 2] = u3.createElement("UICorner", {
        CornerRadius = UDim.new(0.12, 0)
    });
    v50["Region Name"] = u3.createElement(HostPanelSetting, v51, v52);
    local v55 = {
        Size = UDim2.fromScale(1, 0.11)
    };

    local function _(p56, p57) -- Line: 392
        table.insert(p56, {
            key = p57.displayName,
            aliases = { p57.name }
        });

        return p56;
    end;

    local v58 = {};

    for i = 1, #u8 do
        local v59 = u8[i];
        local _ = i - 1;
        table.insert(v58, {
            key = v59.displayName,
            aliases = { v59.name }
        });
    end;

    v55.Items = v58;
    v55.InputText = "";
    v55.OnTextChange = v22;
    v55.PlaceHolderText = "Add Player";

    function v55.OnFocusLost(p60) -- Line: 412
        -- upvalues: u11 (copy), Flamework (ref), KnitClient (ref), u15 (copy), u13 (copy), u14 (copy)
        if not p60 then
            return nil;
        end;

        if #u11 == 0 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "[WG]: No online player was found."
            });

            return nil;
        end;

        local v61 = u11[1];

        if KnitClient.Controllers.WorldGuardController:requestAddPlayer(u15, v61.userId) and table.find(u13, v61) == nil then
            local v62 = {};
            local v63 = #v62;
            local v64 = #u13;
            table.move(u13, 1, v64, v63 + 1, v62);
            v62[v63 + v64 + 1] = v61;
            u14(v62);
        end;

        KnitClient.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu();
    end;

    v55.LayoutOrder = 2;
    v50.Searchbar = u3.createElement(AutoCompleteSearchbar, v55);
    local v65 = {
        AdditionalSpace = 40
    };
    local v66 = {
        LayoutOrder = 3
    };
    local v67;

    if DeviceUtil.isMobileControls() then
        v67 = UDim2.new(1, 0, 0.4, 0);
    else
        v67 = UDim2.new(1, 0, 0.52, 0);
    end;

    v66.Size = v67;
    v65.ScrollingFrameProps = v66;
    local v68 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            Padding = UDim.new(0, 4)
        }) };
    local v69 = #v68;

    for i, v in v31(u13, u15) do
        v68[v69 + i] = v;
    end;

    v50[#v50 + 1] = u3.createElement(AutoCanvasScrollingFrame, v65, v68);
    v50["Delete Button"] = u3.createElement(Empty, {
        LayoutOrder = 10,
        Size = UDim2.fromScale(0.3, 0.11),
        Position = UDim2.fromScale(0, 0)
    }, { u3.createElement(Button, {
            Text = "Delete Region",
            ZIndex = 2,
            CornerRadius = UDim.new(0.12, 0),
            Size = UDim2.fromScale(1, 1),
            TextLabel = {
                ZIndex = 2,
                Font = Enum.Font.ArialBold,
                Size = UDim2.fromScale(0.95, 0.65)
            },
            BackgroundColor3 = Color3.fromRGB(212, 57, 59),

            OnClick = function() -- Line: 472, Name: OnClick
                -- upvalues: KnitClient (ref), u15 (copy), Flamework (ref), u6 (copy)
                if KnitClient.Controllers.WorldGuardController:requestRegionDeletion(u15) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
                end;
            end
        }) });
    v48[#v48 + 1] = u3.createElement(WidgetComponent, v49, v50);
    v46[u6.AppId] = u3.createElement("Frame", v47, v48);
    v45[#v45 + 1] = u3.createElement(SlideIn, {}, v46);

    return u3.createElement("ScreenGui", v44, v45);
end);

return {
    WorldGuardMenu = v5.connect(function(p71, p72) -- Line: 487
        local v73 = {
            store = p71
        };

        for i, v in p72 do
            v73[i] = v;
        end;

        return v73;
    end)(v70)
};