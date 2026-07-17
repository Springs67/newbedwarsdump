-- Decompiled with Potassium's decompiler.

local Players = game:GetService("Players");
local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Packages = require(Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local Signal = require(Packages.Directory.Signal);
local StudioTheme = require(Components.StudioTheme);
local PacketFrames = require(Components.PacketFrames);
local TopbarButtonsGroup = require(Components.TopbarButtonsGroup);
local TopbarButton = require(Components.TopbarButton);
local u1 = Packages.IsPlugin and game:GetService("CoreGui") or Players.LocalPlayer.PlayerGui;
local v2 = Roact.Component:extend("PacketProfiler");

function v2.init(u3) -- Line: 22
    -- upvalues: Roact (copy), Signal (copy)
    u3:setState({
        MaxFrameSize = 1000
    });
    u3.Cleanup = {};
    local v4, v5 = Roact.createBinding(false);
    u3.PacketProfilerPaused = v4;
    u3.SetPacketProfilerPaused = v5;
    u3.OnPacketProfilerPaused = Signal.new();
    table.insert(u3.Cleanup, u3.OnPacketProfilerPaused:Connect(function(p6) -- Line: 32
        -- upvalues: u3 (copy)
        u3.SetPacketProfilerPaused(p6);
    end));

    function u3.Pause(p7) -- Line: 36
        -- upvalues: u3 (copy)
        u3.OnPacketProfilerPaused:Fire(p7);
    end;
end;

function v2.didMount(u8) -- Line: 41
    table.insert(u8.Cleanup, u8.props.Signals.ProfilerPaused:Connect(function(p9) -- Line: 42
        -- upvalues: u8 (copy)
        u8.Pause(p9);
    end));
end;

function v2.willUnmount(p10) -- Line: 46
    for _, v in p10.Cleanup do
        v:Disconnect();
    end;
end;

function v2.render(u11) -- Line: 52
    -- upvalues: Packages (copy), Roact (copy), u1 (copy), StudioTheme (copy), PacketFrames (copy), TopbarButton (copy), TopbarButtonsGroup (copy)
    local u12 = Packages.IsPlugin and "Left" or "Right";
    local u13 = Packages.IsPlugin and -1 or 1;

    return Roact.createElement(Roact.Portal, {
        target = u1
    }, {
        PacketProfiler = Roact.createElement("ScreenGui", {
            DisplayOrder = 10,
            IgnoreGuiInset = true,
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            Background = StudioTheme(function(p14) -- Line: 65
                -- upvalues: Roact (ref), PacketFrames (ref), u11 (copy)
                return Roact.createElement("Frame", {
                    BorderSizePixel = 1,
                    BackgroundColor3 = p14:GetColor("Light"),
                    BorderColor3 = p14:GetColor("Border"),
                    Size = UDim2.new(1, 0, 0, 50),
                    Position = UDim2.fromOffset(0, 10)
                }, {
                    PacketFrames = Roact.createElement(PacketFrames, {
                        Enabled = u11.props.Enabled,
                        MaxFrameSize = u11.state.MaxFrameSize,
                        OnPacketProfilerPaused = u11.OnPacketProfilerPaused,
                        OnPacketProfilerEnabled = u11.props.OnEnabled,
                        Signals = u11.props.Signals
                    })
                });
            end),
            Topbar = StudioTheme(function(p15) -- Line: 82
                -- upvalues: Roact (ref), u12 (copy), TopbarButton (ref), u13 (copy), TopbarButtonsGroup (ref), u11 (copy)
                return Roact.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundColor3 = p15:GetColor("Item"),
                    Size = UDim2.new(1, 0, 0, 10)
                }, {
                    UIListLayout = Roact.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = u12 == "Left" and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 5)
                    }),
                    Title = Roact.createElement(TopbarButton, {
                        Text = "PacketProfiler",
                        Theme = p15,
                        LayoutOrder = u13
                    }),
                    MaxKBScale = Roact.createElement(TopbarButtonsGroup, {
                        Text = "Max KB scale",
                        Theme = p15,
                        Options = {
                            {
                                Name = "10 B",

                                Callback = function() -- Line: 107, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 10
                                    });
                                end
                            },
                            {
                                Name = "100 B",

                                Callback = function() -- Line: 115, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 100
                                    });
                                end
                            },
                            {
                                Name = "1 KB",

                                Callback = function() -- Line: 123, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 1000
                                    });
                                end
                            },
                            {
                                Name = "10 KB",

                                Callback = function() -- Line: 131, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 10000
                                    });
                                end
                            },
                            {
                                Name = "50 KB",

                                Callback = function() -- Line: 139, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 50000
                                    });
                                end
                            },
                            {
                                Name = "100 KB",

                                Callback = function() -- Line: 147, Name: Callback
                                    -- upvalues: u11 (ref)
                                    u11:setState({
                                        MaxFrameSize = 100000
                                    });
                                end
                            }
                        },
                        LayoutOrder = u13 * 2
                    }),
                    PausedLabel = Roact.createElement(TopbarButton, {
                        Text = u11.PacketProfilerPaused:map(function(p16) -- Line: 157
                            return p16 and "[Paused]" or "[Running]";
                        end),
                        Theme = p15,

                        OnClick = function() -- Line: 161, Name: OnClick
                            -- upvalues: u11 (ref)
                            u11.props.Signals.ProfilerPaused:Fire(not u11.PacketProfilerPaused:getValue());
                        end,

                        LayoutIndex = u13 * 3
                    })
                });
            end)
        })
    });
end;

return v2;