-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function tryColor3FromHexString(p6) -- Line: 18
    local v7 = string.gsub(p6, "%s", "");

    if v7 == "" then
        return nil;
    end;

    local v8;

    if string.sub(v7, 1, 1) == "#" then
        v8 = string.sub(v7, 2);
    else
        v8 = v7;
    end;

    local v9 = #v8;

    if v9 ~= 3 and v9 ~= 6 then
        return nil;
    end;

    if #string.gsub(v8, "[^0-9A-Fa-f]", "") == v9 then
        return Color3.fromHex(v7);
    end;

    return nil;
end;

local function normalizeHexInput(p10) -- Line: 37
    local v11 = string.gsub(p10, "[^#0-9A-Fa-f]", "");
    local v12 = string.upper((string.gsub(v11, "#", "")));

    if #v12 > 6 then
        v12 = string.sub(v12, 1, 6);
    end;

    return "#" .. v12;
end;

local function setWheelIndicatorFromHueSat(p13, p14, p15, p16) -- Line: 43
    local X = p13.AbsoluteSize.X;
    local Y = p13.AbsoluteSize.Y;

    if X == 0 or Y == 0 then
        return nil;
    end;

    local v17 = p13.AbsoluteSize.X / 2;
    local v18 = math.clamp(p15, 0, 1);
    local v19 = math.clamp(p16, 0, 1);
    local v20 = v18 * 3.141592653589793 * 2;
    local v21 = v19 * v17;
    local v22 = -1 * v21 * math.cos(v20);
    local v23 = v21 * math.sin(v20);
    p14.Position = UDim2.fromScale(0.5 + v22 / X, 0.5 + v23 / Y);
end;

local v170 = v4.new(u3)(function(u24, p25) -- Line: 59
    -- upvalues: u3 (copy), u2 (copy), ColorUtil (copy), setWheelIndicatorFromHueSat (copy), UserInputService (copy), DeviceUtil (copy), DarkBackground (copy), ScaleComponent (copy), Empty (copy), ButtonComponent (copy), Theme (copy), normalizeHexInput (copy), tryColor3FromHexString (copy), WidgetComponent (copy), SlideIn (copy)
    local useEffect = p25.useEffect;
    local useMemo = p25.useMemo;
    local useState = p25.useState;
    local u26 = useMemo(function() -- Line: 63
        -- upvalues: u24 (copy)
        return u24.Color or Color3.fromRGB(255, 255, 255);
    end, { u24.Color });
    local u27, u28, u29 = useMemo(function() -- Line: 66
        -- upvalues: u26 (copy)
        return Color3.toHSV(u26);
    end, { u26 });
    local u30, u31 = useState(function() -- Line: 69
        -- upvalues: u26 (copy)
        return math.round(u26.R * 255);
    end);
    local u32, u33 = useState(function() -- Line: 72
        -- upvalues: u26 (copy)
        return math.round(u26.G * 255);
    end);
    local u34, u35 = useState(function() -- Line: 75
        -- upvalues: u26 (copy)
        return math.round(u26.B * 255);
    end);
    local v36, u37 = useState(false);
    local v38, u39 = useState(function() -- Line: 79
        -- upvalues: u26 (copy)
        return "#" .. string.upper(Color3.fromRGB(math.round(u26.R * 255), math.round(u26.G * 255), (math.round(u26.B * 255))):ToHex());
    end);
    local u40 = useMemo(function() -- Line: 82
        return {
            current = false
        };
    end, {});
    local v41 = useMemo(function() -- Line: 87
        return { "R", "G", "B" };
    end, {});
    local u42 = useMemo(function() -- Line: 90
        return {
            current = nil
        };
    end, {});
    local u43 = useMemo(function() -- Line: 95
        -- upvalues: u27 (copy), u28 (copy), u29 (copy)
        return {
            current = {
                h = u27,
                s = u28,
                v = u29
            }
        };
    end, { u27, u28, u29 });
    local u44 = useMemo(function() -- Line: 104
        -- upvalues: u24 (copy)
        return {
            current = u24.OnUpdateColor
        };
    end, {});
    u44.current = u24.OnUpdateColor;
    local u45 = useMemo(function() -- Line: 110
        return {
            current = false
        };
    end, {});
    local u46 = u3.createRef();
    local u47 = u3.createRef();
    local u48 = u3.createRef();
    local u49 = u3.createRef();
    local u50 = u3.createRef();
    local u51 = u3.createRef();
    local u52 = u3.createRef();
    useEffect(function() -- Line: 122
        -- upvalues: u46 (copy), u47 (copy), u48 (copy), u49 (copy), u50 (copy), u51 (copy), u52 (copy), u2 (ref), u45 (copy), u43 (copy), u44 (copy), ColorUtil (ref), setWheelIndicatorFromHueSat (ref), u31 (copy), u33 (copy), u35 (copy), u42 (copy), UserInputService (ref)
        local u53 = u46:getValue();
        local u54 = u47:getValue();
        local u55 = u48:getValue();
        local u56 = u49:getValue();
        local u57 = u50:getValue();
        local u58 = u51:getValue();
        local u59 = u52:getValue();

        if not (u53 and (u54 and (u55 and (u56 and (u57 and (u58 and u59)))))) then
            return nil;
        end;

        local u60 = u2.new();
        local u61 = false;
        local u62 = false;

        local function u68() -- Line: 136
            -- upvalues: u45 (ref), u43 (ref), u44 (ref), u58 (copy), u59 (copy), ColorUtil (ref), u57 (copy), setWheelIndicatorFromHueSat (ref), u53 (copy), u54 (copy), u56 (copy), u31 (ref), u33 (ref), u35 (ref)
            u45.current = true;
            local current = u43.current;
            local h = current.h;
            local s = current.s;
            local v = current.v;
            local v63 = Color3.fromHSV(math.clamp(h, 0, 1), math.clamp(s, 0, 1), (math.clamp(v, 0, 1)));
            local v64 = Color3.fromHSV(math.clamp(h, 0, 1), math.clamp(s, 0, 1), 1);
            local current2 = u44.current;

            if current2 ~= nil then
                current2(v63);
            end;

            u58.BackgroundColor3 = v63;
            u59.Color = ColorUtil.darken(v63, 0.5);
            u57.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v64), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) });
            setWheelIndicatorFromHueSat(u53, u54, h, s);
            u56.Position = UDim2.fromScale(0.5, 1 - v);
            local v65 = math.round(v63.R * 255);
            u31((math.clamp(v65, 0, 255)));
            local v66 = math.round(v63.G * 255);
            u33((math.clamp(v66, 0, 255)));
            local v67 = math.round(v63.B * 255);
            u35((math.clamp(v67, 0, 255)));
            task.defer(function() -- Line: 156
                -- upvalues: u45 (ref)
                u45.current = false;
            end);
        end;

        function u42.current(p69, p70, p71) -- Line: 160
            -- upvalues: u45 (ref), u43 (ref), setWheelIndicatorFromHueSat (ref), u53 (copy), u54 (copy), u56 (copy), u57 (copy), u44 (ref), u58 (copy), u59 (copy), ColorUtil (ref), u31 (ref), u33 (ref), u35 (ref)
            if u45.current then
                return nil;
            end;

            local v72 = Color3.fromHSV(math.clamp(u43.current.h, 0, 1), math.clamp(u43.current.s, 0, 1), (math.clamp(u43.current.v, 0, 1)));
            local v73 = math.round(v72.R * 255);
            local v74 = math.round(v72.G * 255);
            local v75 = math.round(v72.B * 255);

            if p69 == v73 and (p70 == v74 and p71 == v75) then
                return nil;
            end;

            local v76 = Color3.fromRGB(p69, p70, p71);
            local v77, v78, v79 = Color3.toHSV(v76);
            u43.current.h = math.clamp(v77, 0, 1);
            u43.current.s = math.clamp(v78, 0, 1);
            u43.current.v = math.clamp(v79, 0, 1);
            setWheelIndicatorFromHueSat(u53, u54, v77, v78);
            u56.Position = UDim2.fromScale(0.5, 1 - v79);
            local v80 = Color3.fromHSV(math.clamp(v77, 0, 1), math.clamp(v78, 0, 1), 1);
            u57.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v80), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) });
            local current = u44.current;

            if current ~= nil then
                current(v76);
            end;

            u58.BackgroundColor3 = v76;
            u59.Color = ColorUtil.darken(v76, 0.5);
            u31(p69);
            u33(p70);
            u35(p71);
        end;

        local function _(p81) -- Line: 191
            -- upvalues: u53 (copy), u54 (copy)
            local X = u53.AbsoluteSize.X;
            local Y = u53.AbsoluteSize.Y;

            if X == 0 or Y == 0 then
                return nil;
            end;

            u54.Position = UDim2.fromScale(0.5 + p81.X / X, 0.5 + p81.Y / Y);
        end;

        local function u90(p82) -- Line: 199
            -- upvalues: u53 (copy), u43 (ref), u54 (copy), u68 (copy)
            local v83 = p82 - (u53.AbsolutePosition + u53.AbsoluteSize / 2);
            local v84 = u53.AbsoluteSize.X / 2;

            if v84 < v83.Magnitude then
                v83 = v83.Unit * v84;
            end;

            local v85 = v83.Magnitude / v84;
            local v86 = Vector2.new(-1 * v83.X, v83.Y);
            local v87 = math.atan2(v86.Y, v86.X);

            if v87 < 0 then
                v87 = v87 + 6.283185307179586;
            end;

            local v88 = math.clamp(v87 / 6.283185307179586, 0, 1);
            local v89 = math.clamp(v85, 0, 1);
            u43.current.h = v88;
            u43.current.s = v89;
            local X = u53.AbsoluteSize.X;
            local Y = u53.AbsoluteSize.Y;

            if X ~= 0 and Y ~= 0 then
                u54.Position = UDim2.fromScale(0.5 + v83.X / X, 0.5 + v83.Y / Y);
            end;

            u68();
        end;

        local function _(p91) -- Line: 219
            -- upvalues: u55 (copy), u43 (ref), u56 (copy), u68 (copy)
            local v92 = math.clamp((p91 - u55.AbsolutePosition.Y) / u55.AbsoluteSize.Y, 0, 1);
            u43.current.v = math.clamp(1 - v92, 0, 1);
            u56.Position = UDim2.fromScale(0.5, v92);
            u68();
        end;

        local function _(p93) -- Line: 225
            return Vector2.new(p93.Position.X, p93.Position.Y);
        end;

        local function _(p94, p95) -- Line: 228
            local AbsolutePosition = p94.AbsolutePosition;
            local AbsoluteSize = p94.AbsoluteSize;

            if AbsoluteSize.X == 0 or AbsoluteSize.Y == 0 then
                return false;
            end;

            local v96;

            if p95.X >= AbsolutePosition.X and (p95.X <= AbsolutePosition.X + AbsoluteSize.X and p95.Y >= AbsolutePosition.Y) then
                v96 = p95.Y <= AbsolutePosition.Y + AbsoluteSize.Y;
            else
                v96 = false;
            end;

            return v96;
        end;

        u60:GiveTask(UserInputService.InputBegan:Connect(function(p97) -- Line: 236
            -- upvalues: u53 (copy), u61 (ref), u90 (copy), u55 (copy), u62 (ref), u43 (ref), u56 (copy), u68 (copy)
            if p97.UserInputType ~= Enum.UserInputType.MouseButton1 and p97.UserInputType ~= Enum.UserInputType.Touch then
                return nil;
            end;

            local v98 = Vector2.new(p97.Position.X, p97.Position.Y);
            local v99 = u53;
            local AbsolutePosition = v99.AbsolutePosition;
            local AbsoluteSize = v99.AbsoluteSize;
            local v100;

            if AbsoluteSize.X == 0 or AbsoluteSize.Y == 0 or (v98.X < AbsolutePosition.X or (v98.X > AbsolutePosition.X + AbsoluteSize.X or v98.Y < AbsolutePosition.Y)) then
                v100 = false;
            else
                v100 = v98.Y <= AbsolutePosition.Y + AbsoluteSize.Y;
            end;

            if v100 then
                u61 = true;
                u90(v98);

                return;
            end;

            local v101 = u55;
            local AbsolutePosition2 = v101.AbsolutePosition;
            local AbsoluteSize2 = v101.AbsoluteSize;
            local v102;

            if AbsoluteSize2.X == 0 or AbsoluteSize2.Y == 0 or (v98.X < AbsolutePosition2.X or (v98.X > AbsolutePosition2.X + AbsoluteSize2.X or v98.Y < AbsolutePosition2.Y)) then
                v102 = false;
            else
                v102 = v98.Y <= AbsolutePosition2.Y + AbsoluteSize2.Y;
            end;

            if v102 then
                u62 = true;
                local v103 = math.clamp((v98.Y - u55.AbsolutePosition.Y) / u55.AbsoluteSize.Y, 0, 1);
                u43.current.v = math.clamp(1 - v103, 0, 1);
                u56.Position = UDim2.fromScale(0.5, v103);
                u68();
            end;
        end));
        u60:GiveTask(UserInputService.InputEnded:Connect(function(p104) -- Line: 249
            -- upvalues: u61 (ref), u62 (ref)
            if p104.UserInputType ~= Enum.UserInputType.MouseButton1 and p104.UserInputType ~= Enum.UserInputType.Touch then
                return nil;
            end;

            u61 = false;
            u62 = false;
        end));
        u60:GiveTask(UserInputService.InputChanged:Connect(function(p105) -- Line: 256
            -- upvalues: u61 (ref), u62 (ref), u90 (copy), u55 (copy), u43 (ref), u56 (copy), u68 (copy)
            if not (u61 or u62) then
                return nil;
            end;

            if p105.UserInputType ~= Enum.UserInputType.MouseMovement and p105.UserInputType ~= Enum.UserInputType.Touch then
                return nil;
            end;

            if u61 then
                u90(Vector2.new(p105.Position.X, p105.Position.Y));
            end;

            if u62 then
                local v106 = math.clamp((p105.Position.Y - u55.AbsolutePosition.Y) / u55.AbsoluteSize.Y, 0, 1);
                u43.current.v = math.clamp(1 - v106, 0, 1);
                u56.Position = UDim2.fromScale(0.5, v106);
                u68();
            end;
        end));
        u68();

        return function() -- Line: 271
            -- upvalues: u42 (ref), u60 (copy)
            u42.current = nil;
            u60:DoCleaning();
        end;
    end, {});
    local v107 = Color3.fromHSV(math.clamp(u43.current.h, 0, 1), math.clamp(u43.current.s, 0, 1), (math.clamp(u43.current.v, 0, 1)));
    local u108 = useMemo(function() -- Line: 277
        -- upvalues: u30 (copy), u32 (copy), u34 (copy)
        return "#" .. string.upper(Color3.fromRGB(u30, u32, u34):ToHex());
    end, { u30, u32, u34 });
    local v109 = {
        DisplayOrder = 20,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v110 = { u3.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = u24.AppId
        }) };
    local v111 = {};
    local v112 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset((u24.Children and 2 or 1) * 350, 400)
    };
    local v113 = { u3.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new((u24.Children and 2 or 1) * 350, 400),
            ScreenPadding = Vector2.new(12, 12)
        }) };
    local v114 = {
        Title = "Color Picker",
        AppId = u24.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 313, Name: OnClose
            -- upvalues: u24 (copy)
            local OnClose = u24.OnClose;

            if OnClose ~= nil then
                OnClose = OnClose();
            end;

            return OnClose;
        end
    };
    local v115 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }) };
    local v116 = #v115;
    local v117 = u24.Children and u3.createElement(Empty, {
        Size = UDim2.fromScale(0.5, 1)
    }, { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), u24.Children });

    if v117 then
        v115[v116 + 1] = v117;
    end;

    local v118 = {
        Size = UDim2.fromScale(u24.Children and 0.5 or 1, 1)
    };
    local v119 = {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        }),
        u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0)
        }),
        ColorPickerContainer = u3.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 250)
        }, {
            ColorWheelContainer = u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 16),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                ColorWheel = u3.createElement("ImageButton", {
                    [u3.Ref] = u46,
                    Size = UDim2.fromOffset(250, 250),
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://6020299385",
                    LayoutOrder = 1
                }, { u3.createElement("Frame", {
                        [u3.Ref] = u47,
                        Size = UDim2.new(0, 10, 0, 10),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), u3.createElement("UIStroke", {
                            Thickness = 2,
                            Color = ColorUtil.BLACK
                        }) }) }),
                Slider = u3.createElement("ImageButton", {
                    [u3.Ref] = u48,
                    Size = UDim2.new(0, 20, 0, 250),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    LayoutOrder = 2
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.25, 0)
                    }), u3.createElement("UIGradient", {
                        [u3.Ref] = u50,
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHSV(math.clamp(u27, 0, 1), math.clamp(u28, 0, 1), 1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)) })
                    }), u3.createElement("Frame", {
                        [u3.Ref] = u49,
                        Size = UDim2.new(1, 10, 0, 10),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        }), u3.createElement("UIStroke", {
                            Thickness = 2,
                            Color = ColorUtil.BLACK
                        }) }) })
            })
        })
    };
    local _ = #v119;
    local v120 = {
        Size = UDim2.new(1, 0, 0, 80)
    };
    local v121 = {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16)
        }),
        PreviewContainerInner = u3.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 28)
        }, {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 16),
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            SelectButtonContainer = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.8, 1)
            }, { u3.createElement(ButtonComponent, {
                    Text = "Select Color",
                    Size = UDim2.fromScale(1, 1),

                    OnClick = function() -- Line: 453, Name: OnClick
                        -- upvalues: u24 (copy), u43 (copy)
                        local OnSelect = u24.OnSelect;

                        if OnSelect ~= nil then
                            OnSelect(Color3.fromHSV(math.clamp(u43.current.h, 0, 1), math.clamp(u43.current.s, 0, 1), (math.clamp(u43.current.v, 0, 1))));
                        end;
                    end
                }) }),
            Preview = u3.createElement("Frame", {
                [u3.Ref] = u51,
                Size = UDim2.fromScale(0.2, 1),
                BackgroundColor3 = v107,
                LayoutOrder = 2
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.2, 0)
                }), u3.createElement("UIStroke", {
                    [u3.Ref] = u52,
                    Thickness = 3
                }), u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        })
    };
    local v122 = {
        Size = UDim2.new(1, 0, 0, 28)
    };
    local v123 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 16)
        }) };
    local v124 = #v123;

    local function v142(p125, u126) -- Line: 494
        -- upvalues: u30 (copy), u32 (copy), u34 (copy), u3 (ref), Empty (ref), ColorUtil (ref), Theme (ref), u42 (copy)
        local u127;

        if u126 == 0 then
            u127 = u30;
        elseif u126 == 1 then
            u127 = u32;
        else
            u127 = u34;
        end;

        local v128 = tostring(u127);

        return u3.createElement(Empty, {
            Size = UDim2.fromScale(0.3, 1)
        }, { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 5)
            }), u3.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.3, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = p125,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            }), u3.createElement("TextBox", {
                Size = UDim2.fromScale(0.7, 1),
                Text = v128,
                PlaceholderText = "255",
                MaxVisibleGraphemes = 3,
                PlaceholderColor3 = Color3.fromRGB(166, 166, 186),
                ClearTextOnFocus = false,
                TextColor3 = ColorUtil.WHITE,
                TextTransparency = 0.5,
                TextScaled = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center,
                BackgroundColor3 = Theme.backgroundTertiary,
                BackgroundTransparency = 0.5,
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),

                [u3.Event.Focused] = function(u129) -- Line: 534
                    -- upvalues: u127 (copy)
                    if u127 ~= 0 then
                        return nil;
                    end;

                    task.defer(function() -- Line: 538
                        -- upvalues: u129 (copy)
                        if not u129.Parent then
                            return nil;
                        end;

                        local v130 = #u129.Text;

                        if v130 == 0 then
                            return nil;
                        end;

                        u129.SelectionStart = 1;
                        u129.CursorPosition = v130 + 1;
                    end);
                end,

                [u3.Event.FocusLost] = function(p131) -- Line: 550
                    -- upvalues: u126 (copy), u30 (ref), u32 (ref), u34 (ref), u42 (ref)
                    if string.gsub(p131.Text, "[^0-9]", "") ~= "" then
                        return nil;
                    end;

                    local v132 = u126 == 0 and 0 or u30;
                    local v133 = u126 == 1 and 0 or u32;
                    local v134 = u126 == 2 and 0 or u34;
                    p131.Text = "0";
                    local current = u42.current;

                    if current ~= nil then
                        current(v132, v133, v134);
                    end;
                end,

                [u3.Change.Text] = function(p135) -- Line: 564
                    -- upvalues: u126 (copy), u30 (ref), u32 (ref), u34 (ref), u42 (ref)
                    local v136 = string.gsub(p135.Text, "[^0-9]", "");

                    if v136 == "" then
                        return nil;
                    end;

                    if #v136 > 3 then
                        v136 = string.sub(v136, 0, 3);
                    end;

                    local v137 = tonumber(v136);

                    if v137 == nil then
                        return nil;
                    end;

                    local v138 = math.clamp(v137, 0, 255);
                    local v139 = tostring(v138);

                    if v139 ~= p135.Text then
                        p135.Text = v139;
                    end;

                    local v140;

                    if u126 == 0 then
                        v140 = v138;
                    else
                        v140 = u30;
                    end;

                    local v141;

                    if u126 == 1 then
                        v141 = v138;
                    else
                        v141 = u32;
                    end;

                    if u126 ~= 2 then
                        v138 = u34;
                    end;

                    local current = u42.current;

                    if current ~= nil then
                        current(v140, v141, v138);
                    end;
                end,

                LayoutOrder = 2
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }) }) });
    end;

    local v143 = table.create(#v41);

    for i, v in v41 do
        v143[i] = v142(v, i - 1, v41);
    end;

    local v144 = {
        Size = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = ColorUtil.WHITE
    };
    local v145 = { u3.createElement("UIListLayout", {
            HorizontalFlex = "SpaceBetween",
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v146 = #v145;

    for i, v in v143 do
        v145[v146 + i] = v;
    end;

    v123[v124 + 1] = u3.createElement(Empty, v144, v145);
    local createElement = u3.createElement;
    local v147 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.4, 1)
    };
    local v148 = {};
    local v149 = u3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    });
    local v150 = u3.createElement("TextLabel", {
        Text = "Hex",
        TextScaled = true,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.28, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        TextColor3 = ColorUtil.WHITE,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    });
    local createElement2 = u3.createElement;
    local v151 = {
        Size = UDim2.fromScale(0.72, 1)
    };

    if not v36 then
        v38 = u108;
    end;

    v151.Text = v38;
    v151.PlaceholderText = "#FFFFFF";
    v151.MaxVisibleGraphemes = 7;
    v151.PlaceholderColor3 = Color3.fromRGB(166, 166, 186);
    v151.ClearTextOnFocus = false;
    v151.TextColor3 = ColorUtil.WHITE;
    v151.TextTransparency = 0.5;
    v151.TextScaled = true;
    v151.TextXAlignment = Enum.TextXAlignment.Left;
    v151.TextYAlignment = Enum.TextYAlignment.Center;
    v151.BackgroundColor3 = Theme.backgroundTertiary;
    v151.BackgroundTransparency = 0.5;
    v151.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal);

    v151[u3.Event.Focused] = function(u152) -- Line: 661
        -- upvalues: u40 (copy), u108 (copy), u37 (copy), u39 (copy)
        u40.current = true;
        local u153 = u108;
        u37(true);
        u39(u153);
        task.defer(function() -- Line: 666
            -- upvalues: u152 (copy), u153 (copy)
            if not u152.Parent then
                return nil;
            end;

            local v154 = #u153;

            if v154 <= 1 then
                return nil;
            end;

            u152.SelectionStart = 2;
            u152.CursorPosition = v154 + 1;
        end);
    end;

    v151[u3.Event.FocusLost] = function(p155) -- Line: 678
        -- upvalues: normalizeHexInput (ref), tryColor3FromHexString (ref), u39 (copy), u108 (copy), u37 (copy), u40 (copy), u42 (copy)
        local v156 = tryColor3FromHexString((normalizeHexInput((string.gsub(p155.Text, "%s", "")))));

        if v156 == nil then
            u39(u108);
            u37(false);
            u40.current = false;

            return nil;
        end;

        local current = u42.current;

        if current ~= nil then
            local v157 = math.round(v156.R * 255);
            local v158 = math.clamp(v157, 0, 255);
            local v159 = math.round(v156.G * 255);
            local v160 = math.clamp(v159, 0, 255);
            local v161 = math.round(v156.B * 255);
            current(v158, v160, (math.clamp(v161, 0, 255)));
        end;

        u37(false);
        u40.current = false;
    end;

    v151[u3.Change.Text] = function(p162) -- Line: 694
        -- upvalues: u40 (copy), normalizeHexInput (ref), u39 (copy), tryColor3FromHexString (ref), u42 (copy)
        if not u40.current then
            return nil;
        end;

        local v163 = normalizeHexInput(p162.Text);

        if v163 ~= p162.Text then
            p162.Text = v163;
        end;

        u39(v163);
        local v164 = tryColor3FromHexString(v163);

        if v164 == nil then
            return nil;
        end;

        local current = u42.current;

        if current ~= nil then
            local v165 = math.round(v164.R * 255);
            local v166 = math.clamp(v165, 0, 255);
            local v167 = math.round(v164.G * 255);
            local v168 = math.clamp(v167, 0, 255);
            local v169 = math.round(v164.B * 255);
            current(v166, v168, (math.clamp(v169, 0, 255)));
        end;
    end;

    v151.LayoutOrder = 2;
    v148[1], v148[2], v148[3] = v149, v150, createElement2("TextBox", v151, { u3.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    }) });
    v123[v124 + 2] = createElement("Frame", v147, v148);
    v121[#v121 + 1] = u3.createElement(Empty, v122, v123);
    v119.PreviewContainer = u3.createElement(Empty, v120, v121);
    v115[#v115 + 1] = u3.createElement(Empty, v118, v119);
    v113[#v113 + 1] = u3.createElement(WidgetComponent, v114, v115);
    v111[#v111 + 1] = u3.createElement("Frame", v112, v113);
    v110[#v110 + 1] = u3.createElement(SlideIn, {}, v111);

    return u3.createElement("ScreenGui", v109, v110);
end);

return {
    ColorPickerApp = v5.connect(function(p171, p172) -- Line: 728
        local v173 = {};

        for i, v in p172 do
            v173[i] = v;
        end;

        return v173;
    end)(v170)
};