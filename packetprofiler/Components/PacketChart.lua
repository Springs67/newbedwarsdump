-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Modules = Parent.Modules;
local Packages = require(Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local Signal = require(Packages.Directory.Signal);
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter);
local StudioTheme = require(Components.StudioTheme);
local PacketCircleArcs = require(Components.PacketCircleArcs);
local PacketChartItems = require(Components.PacketChartItems);
local ChartResize = require(Components.ChartResize);
local TableToSyntaxString = require(Modules.TableToSyntaxString);
local u1 = not RunService:IsRunning();
local u2 = 0;

local function GetRemoteColor() -- Line: 29
    -- upvalues: u2 (ref)
    u2 = (u2 + 0.6180339887498949) % 1;

    return Color3.fromHSV(u2, 0.5, 0.95);
end;

local v3 = ReplicatedStorage:FindFirstChild("RemoteName.profiler", true);
local u4 = nil;

if v3 == nil then
    local u5 = nil;
    u5 = ReplicatedStorage.DescendantAdded:Connect(function(p6) -- Line: 41
        -- upvalues: u4 (ref), u5 (ref)
        if p6.Name == "RemoteName.profiler" then
            local v7 = typeof(require(p6)) == "function";
            assert(v7, "Return of RemoteName.profiler must be a function");
            u4 = require(p6);
            u5:Disconnect();
        end;
    end);
else
    local v8 = typeof(require(v3)) == "function";
    assert(v8, "Return of RemoteName.profiler must be a function");
    u4 = require(v3);
end;

local function GetRemoteData(p9, ...) -- Line: 53
    -- upvalues: u4 (ref)
    local v10 = u4 and u4(p9, ...);

    return v10 or `{p9.Parent}.{p9.Name}`;
end;

local v11 = Roact.Component:extend("PacketChart");

function v11.init(p12) -- Line: 65
    -- upvalues: Signal (copy), Roact (copy)
    p12.ArcsUpdated = Signal.new();
    local v13, v14 = Roact.createBinding(false);
    p12.ChartEnabled = v13;
    p12.SetChartEnabled = v14;
    local v15, v16 = Roact.createBinding({
        Size = 0,
        Visible = false
    });
    p12.ScrollBarChanged = v15;
    p12.SetScrollBarChanged = v16;
    p12.OpenRemoteData = Signal.new();
    p12:setState({
        Arcs = {}
    });
end;

function v11.didMount(u17) -- Line: 80
    -- upvalues: GetRemoteData (copy), TableToSyntaxString (copy), PacketSizeCounter (copy), u2 (ref)
    u17.props.Signals.ProfilerFrameSelected:Connect(function(p18) -- Line: 81
        -- upvalues: GetRemoteData (ref), TableToSyntaxString (ref), PacketSizeCounter (ref), u2 (ref), u17 (copy)
        local v19 = {};

        for _, v in p18.Packets do
            local v20 = GetRemoteData(v.Remote, unpack(v.RawData));
            local Size = v.Size;

            if typeof(v20) == "string" then
                if not v19[v20] then
                    v19[v20] = {
                        Size = 0,
                        Data = {}
                    };
                end;

                local v21 = v19[v20];
                v21.Size = v21.Size + Size;
                local v22 = #v19[v20].Data + 1;
                v19[v20].Data[v22] = {
                    Name = `Remote call {v22}:`,
                    Packet = `{v.Data and TableToSyntaxString(v.Data) or "[None]"}`
                };
            else
                local v23 = {};
                local v24 = 0;

                for i, v2 in v20 do
                    local v25 = PacketSizeCounter.GetPacketSize({
                        RemoteType = "RemoteEvent",
                        RunContext = v.RunContext,
                        PacketData = v2.Arguments
                    }) - PacketSizeCounter.BaseRemoteOverhead;

                    if v.RunContext == "Client" then
                        v25 = v25 - PacketSizeCounter.ClientToServerOverhead;
                    end;

                    v23[i] = v25;
                    v24 = v24 + v25;
                end;

                for i, v2 in v20 do
                    local Name = v2.Name;

                    if not v19[Name] then
                        v19[Name] = {
                            Size = 0,
                            Data = {}
                        };
                    end;

                    local v26 = v19[Name];
                    v26.Size = v26.Size + v23[i] / v24 * Size;
                    v19[Name].Data[#v19[Name].Data + 1] = {
                        Name = v2.Name,
                        Packet = TableToSyntaxString(v2.Arguments, true)
                    };
                end;
            end;
        end;

        local TotalSize = p18.TotalSize;
        local v27 = {};

        for i, v in v19 do
            local v28 = v.Size / TotalSize;
            u2 = (u2 + 0.6180339887498949) % 1;
            local v29 = Color3.fromHSV(u2, 0.5, 0.95);
            table.insert(v27, {
                Name = i,
                DataSize = v.Size,
                Percent = v28 * 100,
                Color = v29,
                RemoteData = v.Data
            });
        end;

        table.sort(v27, function(p30, p31) -- Line: 158
            return p30.Percent > p31.Percent;
        end);
        u17:setState({
            Arcs = v27
        });
    end);
    u17.props.Signals.ProfilerPaused:Connect(function(p32) -- Line: 166
        -- upvalues: u17 (copy)
        u17.SetChartEnabled(p32);
    end);
    u17.props.OnEnabled:Connect(function(p33) -- Line: 169
        -- upvalues: u17 (copy)
        u17.SetChartEnabled(p33);
    end);
end;

function v11.render(u34) -- Line: 174
    -- upvalues: Roact (copy), Packages (copy), Components (copy), StudioTheme (copy), ChartResize (copy), u1 (copy), PacketCircleArcs (copy), PacketChartItems (copy)
    return Roact.createElement(Packages.IsPlugin and require(Components.StudioWidget) or "ScreenGui", ({
        Plugin = {
            WidgetId = "PacketChart",
            WidgetTitle = "Packet Chart",
            InitialDockState = Enum.InitialDockState.Float,
            Enabled = u34.props.Enabled,
            OnEnabled = u34.props.OnEnabled,
            DefaultSize = Vector2.new(350, 200),
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            MinimumSize = Vector2.new(300, 100)
        },
        Client = {
            IgnoreGuiInset = true,
            ResetOnSpawn = false,
            Enabled = u34.ChartEnabled,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    })[Packages.IsPlugin and "Plugin" or "Client"], {
        Holder = StudioTheme(function(u35) -- Line: 193
            -- upvalues: ChartResize (ref), Roact (ref), Packages (ref), u1 (ref), u34 (copy), PacketCircleArcs (ref), PacketChartItems (ref)
            return ChartResize(function(p36) -- Line: 194
                -- upvalues: Roact (ref), Packages (ref), u35 (copy), u1 (ref), u34 (ref), PacketCircleArcs (ref), PacketChartItems (ref)
                local createElement = Roact.createElement;
                local v37 = {
                    BackgroundTransparency = 1,
                    AnchorPoint = Packages.IsPlugin and Vector2.new() or Vector2.new(1, 0),
                    Position = Packages.IsPlugin and UDim2.new() or UDim2.new(1, 0, 0, 61),
                    Size = Packages.IsPlugin and UDim2.fromScale(1, 1) or p36.UISize
                };
                local v38;

                if Packages.IsPlugin then
                    v38 = nil;
                else
                    v38 = p36.SetSizeTarget or nil;
                end;

                v37[Roact.Ref] = v38;

                return createElement("Frame", v37, {
                    Background = Roact.createElement("Frame", {
                        BorderSizePixel = 0,
                        ZIndex = 0,
                        BackgroundColor3 = u35:GetColor("MainBackground"),
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        Notches = Roact.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://18701486909",
                            ImageTransparency = 0.5,
                            AnchorPoint = Vector2.new(0, 1),
                            ImageColor3 = u35:GetColor("BrightText"),
                            Position = UDim2.fromScale(0, 1),
                            Size = UDim2.fromOffset(16, 16)
                        })
                    }),
                    UIStroke = Roact.createElement("UIStroke", {
                        Thickness = 1,
                        Color = u35:GetColor("DropShadow")
                    }),
                    BackgroundCircle = Roact.createElement("Frame", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromOffset(100, 100),
                        Visible = not u1,
                        Position = UDim2.fromOffset(8, 8)
                    }, {
                        BackgroundUI = Roact.createElement("Frame", {
                            BackgroundColor3 = u35:GetColor("ScrollBarBackground"),
                            Size = UDim2.fromScale(1, 1),
                            Visible = #u34.state.Arcs > 0
                        }, {
                            UIStroke = Roact.createElement("UIStroke", {
                                Transparency = 0.5,
                                Color = u35:GetColor("DropShadow"),
                                LineJoinMode = Enum.LineJoinMode.Round
                            }),
                            UICorner = Roact.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 4)
                            })
                        }),
                        PacketCircle = Roact.createElement(PacketCircleArcs, {
                            Arcs = u34.state.Arcs,
                            PluginMouse = u34.props.PluginMouse
                        })
                    }),
                    DataList = Roact.createElement("ScrollingFrame", {
                        BackgroundColor3 = u35:GetColor("MainBackground"),
                        Size = UDim2.new(1, -121, 1, -1),
                        Position = UDim2.new(1, -1, 0, 0),
                        AnchorPoint = Vector2.new(1, 0),
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        CanvasSize = UDim2.new(),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Visible = not u1,
                        ZIndex = 2,
                        BottomImage = "rbxassetid://5234388158",
                        MidImage = "rbxassetid://5234388158",
                        TopImage = "rbxassetid://5234388158",
                        ScrollBarImageColor3 = u35:GetColor("Light"),
                        ScrollBarThickness = 10,

                        [Roact.Change.AbsoluteCanvasSize] = function(p39) -- Line: 265
                            -- upvalues: u34 (ref)
                            u34.SetScrollBarChanged({
                                Size = p39.AbsoluteSize.Y,
                                Visible = p39.AbsoluteSize.Y < p39.AbsoluteCanvasSize.Y
                            });
                        end,

                        [Roact.Change.AbsoluteSize] = function(p40) -- Line: 271
                            -- upvalues: u34 (ref)
                            u34.SetScrollBarChanged({
                                Size = p40.AbsoluteSize.Y,
                                Visible = p40.AbsoluteSize.Y < p40.AbsoluteCanvasSize.Y
                            });
                        end
                    }, {
                        UIListLayout = Roact.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Top,

                            [Roact.Change.AbsoluteContentSize] = function(p41) -- Line: 283
                                p41.Parent.CanvasSize = UDim2.fromOffset(0, p41.AbsoluteContentSize.Y);
                            end
                        }),
                        Items = Roact.createElement(PacketChartItems, {
                            Arcs = u34.state.Arcs,
                            ScrollBarChanged = u34.ScrollBarChanged
                        }),
                        UIPadding = Roact.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 8),
                            PaddingBottom = UDim.new(0, 8)
                        })
                    }),
                    EditModeNotifier = Roact.createElement("TextLabel", {
                        AutoLocalize = false,
                        BackgroundTransparency = 1,
                        Text = "Start session to begin",
                        TextSize = 20,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextColor3 = u35:GetColor("WarningText"),
                        Font = Enum.Font.SourceSans,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        Visible = u1
                    }),
                    ScrollBarOutline = Roact.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundColor3 = u35:GetColor("ScrollBarBackground"),
                        Size = u34.ScrollBarChanged:map(function(p42) -- Line: 313
                            return UDim2.fromOffset(12, p42.Size);
                        end),
                        Position = UDim2.new(1, 0, 0, 0),
                        AnchorPoint = Vector2.new(1, 0),
                        Visible = u34.ScrollBarChanged:map(function(p43) -- Line: 318
                            return p43.Visible;
                        end)
                    })
                });
            end);
        end)
    });
end;

return v11;