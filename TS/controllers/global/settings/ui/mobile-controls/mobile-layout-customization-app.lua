-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Action = v1.Action;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SliderComponent = v1.SliderComponent;
local StringUtil = v1.StringUtil;
local getDefaultMobileLayoutDefinition = v1.getDefaultMobileLayoutDefinition;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MobileLayoutDefinitionConverter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mobile", "mobile-layout-definition-converter").MobileLayoutDefinitionConverter;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local DragWindow = RuntimeLib.import(script, script.Parent, "drag-window").DragWindow;
local v6 = RuntimeLib.import(script, script.Parent, "mobile-layout-customization-plane");
local ButtonUpdateStartSignal = v6.ButtonUpdateStartSignal;
local MobileLayoutCustomizationPlane = v6.MobileLayoutCustomizationPlane;
local MobileLayoutUtil = RuntimeLib.import(script, script.Parent, "mobile-layout-util").MobileLayoutUtil;
local u7 = { "SwordSwing", "Sprint", "Jump", "Ping", "MoveMountDown", "MoveMountUp", "AutoBridge", "Interact", "BlockBreak", "Consume", "FireProjectile", "DropItem" };
local u8 = { "KitPrimary", "KitSecondary", "KitTertiary", "ItemPrimary", "ItemSecondary", "MiscPrimary", "MiscSecondary", "Recall" };
local u9 = nil;
local u10 = nil;
local u11 = nil;

local function v92(p12, p13) -- Line: 32
    -- upvalues: u3 (copy), Flamework (copy), u9 (ref), u8 (copy), u7 (copy), MobileLayoutUtil (copy), StringUtil (copy), u2 (copy), ButtonUpdateStartSignal (copy), DarkBackground (copy), Padding (copy), ColorUtil (copy), SliderComponent (copy), Empty (copy), ButtonComponent (copy), BedwarsImageId (copy), Theme (copy), u10 (ref), MobileLayoutDefinitionConverter (copy), default (copy), DeviceUtil (copy), MapUtil (copy), u11 (ref), DragWindow (copy), MobileLayoutCustomizationPlane (copy)
    local useState = p13.useState;
    local useValue = p13.useValue;
    local useEffect = p13.useEffect;
    local u14, u15 = useState(nil);
    local u16, _ = useState(u3.createRef());
    local u17, _ = useState(u3.createRef());
    local v18 = useValue(Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition);
    local v19 = u9(v18.value, u8);
    local v20 = u9(v18.value, u7);
    local v21 = {};

    for _, v in v19 do
        v21[v[1]] = v[2];
    end;

    local u22 = useValue(v21);
    local v23 = {};

    for _, v in v20 do
        v23[v[1]] = v[2];
    end;

    local u24 = useValue(v23);
    local ButtonMaxSize = MobileLayoutUtil.ButtonMaxSize;

    local function v26(p25) -- Line: 54
        -- upvalues: u15 (copy)
        u15(p25);
    end;

    local function _(p27, p28) -- Line: 57
        -- upvalues: StringUtil (ref)
        return "Position\n" .. StringUtil.roundNumber(p27, 1) .. ", " .. StringUtil.roundNumber(p28, 1);
    end;

    local function _(p29, p30) -- Line: 60
        -- upvalues: StringUtil (ref), ButtonMaxSize (copy)
        return "Scale: " .. StringUtil.roundNumber(p29 / ButtonMaxSize * 100, 1) .. "%";
    end;

    local u31 = useValue({});
    local u32 = useValue({});
    local v33, u34 = useState(false);
    local v35, u36 = useState(false);
    local u37 = useValue({});
    useEffect(function() -- Line: 69
        -- upvalues: u2 (ref), u22 (copy), u37 (copy), u24 (copy), ButtonUpdateStartSignal (ref), u31 (copy), u34 (copy), u32 (copy), u36 (copy)
        local u38 = u2.new();

        local function _(p39, p40) -- Line: 72
            -- upvalues: u37 (ref)
            u37.value[p40] = {
                size = p39.size,
                position = p39.position
            };
        end;

        for i, v in u22.value do
            u37.value[i] = {
                size = v.size,
                position = v.position
            };
        end;

        local function _(p41, p42) -- Line: 85
            -- upvalues: u37 (ref)
            u37.value[p42] = {
                size = p41.size,
                position = p41.position
            };
        end;

        for i, v in u24.value do
            u37.value[i] = {
                size = v.size,
                position = v.position
            };
        end;

        u38:GiveTask(ButtonUpdateStartSignal:Connect(function(p43) -- Line: 97
            -- upvalues: u31 (ref), u34 (ref), u32 (ref), u36 (ref)
            if not p43 then
                return nil;
            end;

            table.insert(u31.value, {
                {
                    ref = p43,
                    size = p43.Size,
                    position = p43.Position
                }
            });
            u34(true);
            table.clear(u32.value);
            u36(false);
        end));

        return function() -- Line: 114
            -- upvalues: u38 (copy)
            u38:DoCleaning();
        end;
    end, {});
    local v44 = {
        DisplayOrder = 100,
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ScreenInsets = "DeviceSafeInsets"
    };
    local v45 = { u3.createElement(DarkBackground, {
            AppId = "MobileCustomizationApp"
        }) };
    local _ = #v45;
    local v46 = {
        DisplayOrder = 120,
        ResetOnSpawn = false
    };
    local v47 = {};
    local v48 = {
        WindowFrameProps = {
            ZIndex = 100,
            Size = UDim2.fromScale(0.3, 0.7)
        }
    };
    local v49 = { u3.createElement(Padding, {
            Padding = UDim.new(0.04, 0)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Bottom",
            Padding = UDim.new(0.03, 0)
        }) };
    local v50 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 0.05),
        TextColor3 = ColorUtil.WHITE
    };
    local v51;

    if u14 == nil then
        v51 = u14;
    else
        v51 = string.split(u14.Name, "-")[2];
    end;

    if v51 == nil then
        if u14 == nil then
            v51 = u14;
        else
            v51 = u14.Name;
        end;
    end;

    v50.Text = "Selected: <b>" .. tostring(v51) .. "</b>";
    v50.RichText = true;
    v50.ZIndex = 100;
    v49[#v49 + 1] = u3.createElement("TextLabel", v50);
    local v52 = {
        LayoutOrder = 1,
        ZIndex = 100,
        Size = UDim2.fromScale(1, 0.175)
    };
    local v53 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Bottom",
            Padding = UDim.new(0.1, 0)
        }) };
    local v54 = #v53;
    local v55 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 0.3),
        TextColor3 = ColorUtil.WHITE
    };
    local v56;

    if u14 == nil then
        v56 = u14;
    else
        v56 = u14.AbsoluteSize.X;
    end;

    local v57;

    if u14 == nil then
        v57 = u14;
    else
        v57 = u14.AbsoluteSize.Y;
    end;

    local _ = v57 == nil and 0 or v57;
    v55.Text = "Scale: " .. StringUtil.roundNumber((v56 == nil and 0 or v56) / ButtonMaxSize * 100, 1) .. "%";
    v55.ZIndex = 100;
    v55[u3.Ref] = u16;
    v53[v54 + 1] = u3.createElement("TextLabel", v55);
    v53[v54 + 2] = u3.createElement(SliderComponent, {
        Max = 1,
        StepSize = 0.01,
        ZIndex = 110,
        Position = UDim2.fromScale(0, 0.3),
        Size = UDim2.fromScale(0.8, 0.35),
        InitialValue = not u14 and 0.5 or u14.AbsoluteSize.X / ButtonMaxSize,
        Min = MobileLayoutUtil.ButtonMinSize / MobileLayoutUtil.ButtonMaxSize,
        ThemeColor = ColorUtil.WHITE,
        BarColor = Color3.fromRGB(43, 43, 43),

        OnChange = function(p58) -- Line: 230, Name: OnChange
            -- upvalues: u14 (copy), ButtonMaxSize (copy), u16 (copy), StringUtil (ref)
            if u14 then
                u14.Size = UDim2.new(0, ButtonMaxSize * p58, 0, ButtonMaxSize * p58);
                local v59 = u16:getValue();

                if v59 then
                    local _ = u14.AbsoluteSize.Y;
                    v59.Text = "Scale: " .. StringUtil.roundNumber(u14.AbsoluteSize.X / ButtonMaxSize * 100, 1) .. "%";
                end;
            end;
        end
    });
    v49.SizeSlider = u3.createElement(Empty, v52, v53);
    local v60 = {
        LayoutOrder = 2,
        ZIndex = 100,
        Size = UDim2.fromScale(1, 0.45)
    };
    local v61 = {};
    local v62 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.49),
        Size = UDim2.fromScale(0.45, 0.3),
        TextColor3 = ColorUtil.WHITE
    };
    local v63;

    if u14 == nil then
        v63 = u14;
    else
        v63 = u14.AbsolutePosition.X;
    end;

    local v64;

    if u14 == nil then
        v64 = u14;
    else
        v64 = u14.AbsolutePosition.Y;
    end;

    v62.Text = "Position\n" .. StringUtil.roundNumber(v63 == nil and 0 or v63, 1) .. ", " .. StringUtil.roundNumber(v64 == nil and 0 or v64, 1);
    v62.ZIndex = 100;
    v62[u3.Ref] = u17;
    v61[#v61 + 1] = u3.createElement("TextLabel", v62);
    v61.LeftArrow = u3.createElement(ButtonComponent, {
        BackgroundTransparency = 0.3,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0.325, 0.325),
        BackgroundColor3 = ColorUtil.BLACK,

        OnClick = function() -- Line: 283, Name: OnClick
            -- upvalues: u14 (copy), u17 (copy), StringUtil (ref), Flamework (ref)
            if u14 then
                u14.Position = u14.Position + UDim2.fromOffset(-1, 0);
                local v65 = u17:getValue();

                if v65 then
                    local Y = u14.AbsolutePosition.Y;
                    v65.Text = "Position\n" .. StringUtil.roundNumber(u14.AbsolutePosition.X, 1) .. ", " .. StringUtil.roundNumber(Y, 1);
                end;
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Tap on a button first"
                });
            end;
        end
    }, { u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }), u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            Image = BedwarsImageId.ARROW_LEFT
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v61.TopArrow = u3.createElement(ButtonComponent, {
        BackgroundTransparency = 0.3,
        Rotation = 90,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.325, 0.325),
        BackgroundColor3 = ColorUtil.BLACK,

        OnClick = function() -- Line: 323, Name: OnClick
            -- upvalues: u14 (copy), u17 (copy), StringUtil (ref), Flamework (ref)
            if u14 then
                u14.Position = u14.Position + UDim2.fromOffset(0, -1);
                local v66 = u17:getValue();

                if v66 then
                    local Y = u14.AbsolutePosition.Y;
                    v66.Text = "Position\n" .. StringUtil.roundNumber(u14.AbsolutePosition.X, 1) .. ", " .. StringUtil.roundNumber(Y, 1);
                end;
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Tap on a button first"
                });
            end;
        end
    }, { u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }), u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            Image = BedwarsImageId.ARROW_LEFT
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v61.RightArrow = u3.createElement(ButtonComponent, {
        BackgroundTransparency = 0.3,
        Rotation = 180,
        ZIndex = 100,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.325, 0.325),
        BackgroundColor3 = ColorUtil.BLACK,

        OnClick = function() -- Line: 363, Name: OnClick
            -- upvalues: u14 (copy), u17 (copy), StringUtil (ref), Flamework (ref)
            if u14 then
                u14.Position = u14.Position + UDim2.fromOffset(1, 0);
                local v67 = u17:getValue();

                if v67 then
                    local Y = u14.AbsolutePosition.Y;
                    v67.Text = "Position\n" .. StringUtil.roundNumber(u14.AbsolutePosition.X, 1) .. ", " .. StringUtil.roundNumber(Y, 1);
                end;
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Tap on a button first"
                });
            end;
        end
    }, { u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }), u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            Image = BedwarsImageId.ARROW_LEFT
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v61.BottomArrow = u3.createElement(ButtonComponent, {
        BackgroundTransparency = 0.3,
        Rotation = 270,
        ZIndex = 100,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(0.325, 0.325),
        BackgroundColor3 = ColorUtil.BLACK,

        OnClick = function() -- Line: 403, Name: OnClick
            -- upvalues: u14 (copy), u17 (copy), StringUtil (ref), Flamework (ref)
            if u14 then
                u14.Position = u14.Position + UDim2.fromOffset(0, 1);
                local v68 = u17:getValue();

                if v68 then
                    local Y = u14.AbsolutePosition.Y;
                    v68.Text = "Position\n" .. StringUtil.roundNumber(u14.AbsolutePosition.X, 1) .. ", " .. StringUtil.roundNumber(Y, 1);
                end;
            else
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Tap on a button first"
                });
            end;
        end
    }, { u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }), u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            Image = BedwarsImageId.ARROW_LEFT
        }), u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v49.ArrowKeys = u3.createElement(Empty, v60, v61);
    v49.UndoRedoButtons = u3.createElement(Empty, {
        ZIndex = 100,
        LayoutOrder = 3,
        Size = UDim2.fromScale(1, 0.1)
    }, { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Bottom",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.03, 0)
        }), u3.createElement(ButtonComponent, {
            Text = "Undo",
            LayoutOrder = 3,
            ZIndex = 100,

            OnClick = function() -- Line: 450, Name: OnClick
                -- upvalues: u31 (copy), u32 (copy), u36 (copy), u34 (copy)
                local value = u31.value;
                local v69 = #value;
                local v70 = value[v69];
                value[v69] = nil;

                if v70 then
                    local u71 = {};

                    local function _(p72) -- Line: 460
                        -- upvalues: u71 (copy)
                        local ref = p72.ref;

                        if ref then
                            table.insert(u71, {
                                ref = p72.ref,
                                size = ref.Size,
                                position = ref.Position
                            });
                            ref.Position = p72.position;
                            ref.Size = p72.size;
                        end;
                    end;

                    for i, v in v70 do
                        local _ = i - 1;
                        local ref = v.ref;

                        if ref then
                            table.insert(u71, {
                                ref = v.ref,
                                size = ref.Size,
                                position = ref.Position
                            });
                            ref.Position = v.position;
                            ref.Size = v.size;
                        end;
                    end;

                    table.insert(u32.value, u71);
                    u36(true);
                    u34(#u31.value ~= 0);
                end;
            end,

            BackgroundColor3 = Theme.backgroundSecondary,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(0.15, 1),
            Disabled = not v33
        }, { u3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(40, 20),
                MaxSize = Vector2.new(120, 50)
            }) }), u3.createElement(ButtonComponent, {
            Text = "Redo",
            LayoutOrder = 4,
            ZIndex = 100,

            OnClick = function() -- Line: 495, Name: OnClick
                -- upvalues: u32 (copy), u31 (copy), u34 (copy), u36 (copy)
                local value = u32.value;
                local v73 = #value;
                local v74 = value[v73];
                value[v73] = nil;

                if v74 then
                    local u75 = {};

                    local function _(p76) -- Line: 505
                        -- upvalues: u75 (copy)
                        local ref = p76.ref;

                        if ref then
                            table.insert(u75, {
                                ref = p76.ref,
                                size = ref.Size,
                                position = ref.Position
                            });
                            ref.Position = p76.position;
                            ref.Size = p76.size;
                        end;
                    end;

                    for i, v in v74 do
                        local _ = i - 1;
                        local ref = v.ref;

                        if ref then
                            table.insert(u75, {
                                ref = v.ref,
                                size = ref.Size,
                                position = ref.Position
                            });
                            ref.Position = v.position;
                            ref.Size = v.size;
                        end;
                    end;

                    table.insert(u31.value, u75);
                    u34(true);
                    u36(#u32.value ~= 0);
                end;
            end,

            BackgroundColor3 = Theme.backgroundSecondary,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(0.15, 1),
            Disabled = not v35
        }, { u3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(40, 20),
                MaxSize = Vector2.new(120, 50)
            }) }) });
    v49.ActionButtons = u3.createElement(Empty, {
        ZIndex = 100,
        LayoutOrder = 4,
        Size = UDim2.fromScale(1, 0.12)
    }, {
        u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Bottom",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.03, 0)
        }),
        u3.createElement(ButtonComponent, {
            Text = "Save",
            TextScaled = true,
            LayoutOrder = 1,
            ZIndex = 100,

            OnClick = function() -- Line: 554, Name: OnClick
                -- upvalues: u10 (ref), u22 (copy), u24 (copy), MobileLayoutDefinitionConverter (ref), Flamework (ref), default (ref)
                local v77 = u10(u22.value);
                local v78 = u10(u24.value);
                local v79 = {};
                local v80 = #v79;
                local v81 = #v77;
                table.move(v77, 1, v81, v80 + 1, v79);
                table.move(v78, 1, #v78, v80 + v81 + 1, v79);
                local v82 = MobileLayoutDefinitionConverter.fromMobileButtonLayouts(v79);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(v82);
                default.Client:Get("UpdateCustomMobileLayout"):SendToServer({
                    mobileLayoutDefinition = v82
                });
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Saved mobile controls"
                });
            end,

            BackgroundColor3 = Theme.backgroundSuccess,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(0.3, 1)
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 16 or 20
            }), u3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(60, 20),
                MaxSize = Vector2.new(120, 50)
            }) }),
        u3.createElement(ButtonComponent, {
            Text = "Reset",
            TextScaled = true,
            LayoutOrder = 2,
            ZIndex = 100,

            OnClick = function() -- Line: 590, Name: OnClick
                -- upvalues: MapUtil (ref), u22 (copy), u24 (copy), u31 (copy), u34 (copy), u11 (ref), u32 (copy), u36 (copy), Flamework (ref)
                local u83 = {};
                local v84 = {};
                local v85 = #v84;
                local v86 = MapUtil.keys(u22.value);
                local v87 = #v86;
                table.move(v86, 1, v87, v85 + 1, v84);
                local v88 = MapUtil.keys(u24.value);
                table.move(v88, 1, #v88, v85 + v87 + 1, v84);

                local function _(p89) -- Line: 600
                    -- upvalues: u83 (copy)
                    local v90 = p89:getValue();

                    if v90 then
                        table.insert(u83, {
                            ref = v90,
                            size = v90.Size,
                            position = v90.Position
                        });
                    end;
                end;

                for i, v in v84 do
                    local _ = i - 1;
                    local v91 = v:getValue();

                    if v91 then
                        table.insert(u83, {
                            ref = v91,
                            size = v91.Size,
                            position = v91.Position
                        });
                    end;
                end;

                table.insert(u31.value, u83);
                u34(true);
                u11(u22.value);
                u11(u24.value);
                table.clear(u32.value);
                u36(false);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Reset mobile controls"
                });
            end,

            BackgroundColor3 = Theme.backgroundError,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(0.3, 1)
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 16 or 20
            }), u3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(60, 20),
                MaxSize = Vector2.new(120, 50)
            }) }),
        u3.createElement(ButtonComponent, {
            Text = "Close",
            TextScaled = true,
            LayoutOrder = 6,
            ZIndex = 100,

            OnClick = function() -- Line: 641, Name: OnClick
                -- upvalues: Flamework (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("MobileCustomizationApp");
            end,

            BackgroundColor3 = Theme.backgroundSecondary,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(0.3, 1)
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 16 or 20
            }), u3.createElement("UISizeConstraint", {
                MinSize = Vector2.new(40, 20),
                MaxSize = Vector2.new(120, 50)
            }) })
    });
    v47[#v47 + 1] = u3.createElement(DragWindow, v48, v49);
    v45.DragWindowScreenGui = u3.createElement("ScreenGui", v46, v47);
    v45.MobileLayoutCustomizationPlane = u3.createElement("ScreenGui", {
        DisplayOrder = 110,
        ResetOnSpawn = false
    }, { u3.createElement(MobileLayoutCustomizationPlane, {
            currentlySelected = u14,
            setCurrentlySelected = v26,
            imageButtons = u24.value,
            textButtons = u22.value
        }) });

    return u3.createFragment({
        MobileLayoutCustomization = u3.createElement("ScreenGui", v44, v45)
    });
end;

u9 = function(u93, u94) -- Line: 676, Name: getLayoutEntries
    -- upvalues: Action (copy), u3 (copy)
    local function _(p95) -- Line: 678
        -- upvalues: u93 (copy), u94 (copy)
        local v96 = u93[p95] ~= nil and table.find(u94, p95) ~= nil;

        return v96;
    end;

    local v97 = {};
    local v98 = 0;

    for i, v in Action.AllMobileActions do
        local _ = i - 1;
        local v99 = u93[v] ~= nil and table.find(u94, v) ~= nil;

        if v99 == true then
            v98 = v98 + 1;
            v97[v98] = v;
        end;
    end;

    local function v103(p100) -- Line: 697
        -- upvalues: u3 (ref), u93 (copy)
        local v101 = u3.createRef();
        local v102 = {
            buttonType = p100
        };

        for i, v in u93[p100] do
            v102[i] = v;
        end;

        return { v101, v102 };
    end;

    local v104 = table.create(#v97);

    for i, v in v97 do
        v104[i] = v103(v, i - 1, v97);
    end;

    return v104;
end;

u11 = function(p105) -- Line: 715, Name: resetButtonPositions
    -- upvalues: getDefaultMobileLayoutDefinition (copy)
    local u106 = getDefaultMobileLayoutDefinition();

    local function _(p107, p108) -- Line: 718
        -- upvalues: u106 (copy)
        local v109 = p108:getValue();
        local v110 = u106[p107.buttonType];

        if v109 and v110 then
            v109.Size = v110.size;
            v109.Position = v110.position;
        end;
    end;

    for i, v in p105 do
        local v111 = i:getValue();
        local v112 = u106[v.buttonType];

        if v111 and v112 then
            v111.Size = v112.size;
            v111.Position = v112.position;
        end;
    end;

    return nil;
end;

u10 = function(p113) -- Line: 731, Name: extractButtonLayouts
    -- upvalues: MapUtil (copy)
    local v114 = MapUtil.entries(p113);

    local function _(p115) -- Line: 733
        local v116 = p115[1];

        return {
            buttonType = p115[2].buttonType,
            size = v116:getValue().Size,
            position = v116:getValue().Position
        };
    end;

    local v117 = table.create(#v114);

    for i, v in v114 do
        local _ = i - 1;
        local v118 = v[1];
        v117[i] = {
            buttonType = v[2].buttonType,
            size = v118:getValue().Size,
            position = v118:getValue().Position
        };
    end;

    return v117;
end;

local v119 = v4.new(u3)(v92);

return {
    MobileLayoutCustomizationApp = v5.connect(function(p120, p121) -- Line: 751
        local v122 = {};

        for i, v in p121 do
            v122[i] = v;
        end;

        return v122;
    end)(v119)
};