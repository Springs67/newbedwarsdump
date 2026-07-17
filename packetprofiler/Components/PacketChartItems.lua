-- Decompiled with Potassium's decompiler.

local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Packages = require(Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local StudioTheme = require(Components.StudioTheme);

local function GetSizeUnit(p1) -- Line: 10
    if p1 < 1000 then
        return p1, "bytes";
    end;

    if p1 < 1000000 then
        return p1 / 1000, "kilobytes";
    end;

    return p1 / 1000000, "megabytes";
end;

local u2 = Roact.Component:extend("DataChartItem");

function u2.init(p3) -- Line: 22
    -- upvalues: Roact (copy)
    local v4, v5 = Roact.createBinding(false);
    p3.RemoteData = v4;
    p3.ShowRemoteData = v5;
    local v6, v7 = Roact.createBinding(Vector2.zero);
    p3.Size = v6;
    p3.SetSize = v7;
end;

function u2.render(u8) -- Line: 27
    -- upvalues: StudioTheme (copy), Roact (copy), GetSizeUnit (copy)
    local Arc = u8.props.Arc;
    local u9 = {};

    for i, v in u8.props.RemoteData do
        u9[i] = StudioTheme(function(p10) -- Line: 31
            -- upvalues: i (copy), Roact (ref), v (copy), u8 (copy)
            local v12 = { Roact.createElement("TextButton", {
                    AutoLocalize = false,
                    RichText = true,
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    Selectable = false,
                    LayoutOrder = i * 2,
                    Font = Enum.Font.SourceSans,
                    Text = v.Name,
                    TextColor3 = p10:GetColor("BrightText"),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.new(1, 0, 0, 20),
                    Visible = u8.RemoteData
                }, {
                    Padding = Roact.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 4)
                    })
                }), (Roact.createElement("ScrollingFrame", {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    AutomaticCanvasSize = Enum.AutomaticSize.X,
                    LayoutOrder = i * 2 + 1,
                    BackgroundColor3 = p10:GetColor("ScrollBarBackground"),
                    Position = UDim2.fromOffset(0, 20),
                    Size = UDim2.new(1, -12, 0, 0),
                    ClipsDescendants = true,
                    BorderSizePixel = 0,
                    ScrollBarImageColor3 = p10:GetColor("ScrollBar"),
                    ScrollBarThickness = 4,
                    ScrollingDirection = Enum.ScrollingDirection.X,
                    Visible = u8.RemoteData,

                    [Roact.Ref] = function(u11) -- Line: 66
                        if u11 ~= nil then
                            task.delay(0.1, function() -- Line: 71
                                -- upvalues: u11 (copy)
                                local UICorner = Instance.new("UICorner");
                                UICorner.CornerRadius = UDim.new(0, 4);
                                UICorner.Parent = u11;
                            end);
                        end;
                    end
                }, {
                    UIStroke = Roact.createElement("UIStroke", {
                        Transparency = 0.5,
                        Color = p10:GetColor("DropShadow"),
                        LineJoinMode = Enum.LineJoinMode.Round
                    }),
                    Text = Roact.createElement("TextLabel", {
                        AutoLocalize = false,
                        RichText = true,
                        TextSize = 12,
                        BackgroundTransparency = 1,
                        ClipsDescendants = true,
                        Font = Enum.Font.Code,
                        Text = v.Packet,
                        TextColor3 = p10:GetColor("BrightText"),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Size = UDim2.fromScale(1, 1)
                    }, {
                        Padding = Roact.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 8),
                            PaddingRight = UDim.new(0, 8),
                            PaddingLeft = UDim.new(0, 4),
                            PaddingTop = UDim.new(0, 4)
                        })
                    })
                })) };

            return Roact.createFragment(v12);
        end);
    end;

    return StudioTheme(function(p13) -- Line: 111
        -- upvalues: Roact (ref), Arc (copy), GetSizeUnit (ref), u8 (copy), u9 (copy)
        return Roact.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 22),
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Information = Roact.createElement("TextButton", {
                AutoLocalize = false,
                Font = Enum.Font.SourceSans,
                Text = string.format("<font color=\"#%s\"><b>%s</b></font>: %.1f%%, %d %s", Arc.Color:ToHex(), Arc.Name, Arc.Percent, GetSizeUnit(Arc.DataSize)),
                RichText = true,
                TextColor3 = p13:GetColor("BrightText"),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -18, 0, 20),
                Position = UDim2.fromOffset(18, 0),
                ZIndex = 3,

                [Roact.Event.Activated] = function() -- Line: 129
                    -- upvalues: u8 (ref)
                    u8.ShowRemoteData(not u8.RemoteData:getValue());
                end
            }, {
                Padding = Roact.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4)
                })
            }),
            Chevron = Roact.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = u8.RemoteData:map(function(p14) -- Line: 139
                    return p14 and "rbxassetid://18699144520" or "rbxassetid://18699113012";
                end),
                ImageColor3 = p13:GetColor("BrightText"),
                Size = UDim2.fromOffset(16, 16),
                Position = UDim2.fromOffset(0, 2)
            }),
            Container = Roact.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = u8.props.ScrollBarChanged:map(function(p15) -- Line: 148
                    return UDim2.new(1, p15.Visible and -12 or 0, 0, 0);
                end),
                Position = UDim2.fromOffset(8, 24),
                Transparency = 1,

                [Roact.Change.AbsoluteSize] = function(p16) -- Line: 153
                    -- upvalues: u8 (ref)
                    u8.SetSize(p16.AbsoluteSize);
                end
            }, {
                RemoteData = Roact.createFragment(u9),
                UIListLayout = Roact.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    Padding = UDim.new(0, 0)
                })
            }),
            Divider = Roact.createElement("Frame", {
                Transparency = 0.5,
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundColor3 = p13:GetColor("DropShadow"),
                Size = u8.Size:map(function(p17) -- Line: 170
                    return UDim2.new(0, 1, 0, p17.Y);
                end),
                Position = UDim2.fromOffset(0, 26)
            })
        });
    end);
end;

return function(p18) -- Line: 180, Name: DataChartItems
    -- upvalues: Roact (copy), u2 (copy)
    local v19 = 0;
    local v20 = {};

    for _, v in p18.Arcs do
        v19 = v19 - v.Percent;
        v20[v19] = Roact.createElement(u2, {
            Arc = v,
            RemoteData = v.RemoteData,
            ScrollBarChanged = p18.ScrollBarChanged
        });
    end;

    return Roact.createFragment(v20);
end;