-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local GuiService = game:GetService("GuiService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Modules = Parent.Modules;
local Packages = require(Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local PacketSizeCounter = require(Packages.Directory.PacketSizeCounter);
local StudioTheme = require(Components.StudioTheme);
local CircularBuffer = require(Modules.CircularBuffer);
local PacketFrame = require(Components.PacketFrame);
local u1 = GuiService:GetGuiInset();
local u2 = Roact.Component:extend("PacketFrames");
local u3 = not RunService:IsRunning();
local u4 = RunService:IsClient() and "OnClientEvent" or "OnServerEvent";
local u5 = ReplicatedStorage:FindFirstChild("RemoteFunctionEvent.profiler", true);

function u2.init(u6) -- Line: 31
    -- upvalues: Roact (copy), u3 (copy), CircularBuffer (copy), u2 (copy), RunService (copy), PacketSizeCounter (copy), u1 (copy)
    u6.Cleanup = {};
    u6.ProfilerBackgroundRef = Roact.createRef();
    u6.Enabled = not u3;
    u6.PacketFrames = CircularBuffer.new(256);
    u6:setState({
        PacketFrames = u2
    });
    local v7, v8 = Roact.createBinding(u6.PacketFrames);
    u6.PacketsChanged = v7;
    u6.SetPacketsChanged = v8;

    function u6.RemoteCallback(p9, p10, ...) -- Line: 43
        -- upvalues: u6 (copy), RunService (ref), PacketSizeCounter (ref)
        if not u6.Enabled then
            return;
        end;

        local v11;

        if RunService:IsClient() then
            v11 = PacketSizeCounter.GetPacketSize({
                RunContext = "Client",
                RemoteType = p9.ClassName,
                PacketData = { p10, ... }
            });
        else
            v11 = PacketSizeCounter.GetPacketSize({
                RunContext = "Server",
                RemoteType = p9.ClassName,
                PacketData = { ... }
            });
        end;

        local CurrentFrame = u6.CurrentFrame;
        CurrentFrame.TotalSize = CurrentFrame.TotalSize + v11;
        local Packets = u6.CurrentFrame.Packets;
        local v12 = {
            Remote = p9,
            Data = RunService:IsClient() and ({ p10, ... } or { ... }) or { ... },
            RawData = { p10, ... },
            Size = v11,
            RunContext = RunService:IsClient() and "Client" or "Server"
        };
        table.insert(Packets, v12);
    end;

    function u6.InputBegan(p13, p14) -- Line: 73
        -- upvalues: u6 (copy), u1 (ref)
        if p14.UserInputType == Enum.UserInputType.MouseButton1 then
            local v15 = u6.UpdateMouseData(p14.Position.X, p14.Position.Y + u1.Y, true);

            if v15 then
                u6.props.Signals.ProfilerFrameSelected:Fire(v15);
            end;

            u6.props.OnPacketProfilerPaused:Fire(true);
        end;
    end;

    local v16, v17 = Roact.createBinding(Vector2.new(0, 0));
    u6.MousePosition = v16;
    u6.SetMousePosition = v17;
    local v18, v19 = Roact.createBinding(false);
    u6.MouseOver = v18;
    u6.SetMouseOver = v19;
    local u20 = {
        Selected = false,
        Index = 0,
        TotalSize = 0,
        Packets = {}
    };
    local v21, v22 = Roact.createBinding(u20);
    u6.SelectedFrameData = v21;
    u6.SetSelectedFrameData = v22;
    local v23, v24 = Roact.createBinding(u20);
    u6.MouseFrameData = v23;
    u6.SetMouseFrameData = v24;

    function u6.UpdateMouseData(p25, p26, p27) -- Line: 96
        -- upvalues: u6 (copy), u20 (copy)
        u6.SetMousePosition(Vector2.new(p25, p26));
        local v28 = p25 / (u6.ProfilerBackgroundRef:getValue().AbsoluteSize.X * 0.00390625);
        local v29 = 256 - math.floor(v28);
        local v30;

        if p25 > 0 then
            v30 = u6.PacketFrames[v29] or nil;
        else
            v30 = nil;
        end;

        if not v30 then
            u6.SetMouseFrameData(u20);

            return v30;
        end;

        local v31 = {
            Selected = p27,
            Index = v29,
            TotalSize = v30.TotalSize,
            Packets = v30.Packets
        };

        if p27 then
            u6.SetSelectedFrameData(v31);
        end;

        u6.SetMouseFrameData(v31);

        return v30;
    end;

    function u6.MouseEnter(p32, p33, p34) -- Line: 126
        -- upvalues: u3 (ref), u6 (copy)
        if u3 then
            return;
        end;

        u6.UpdateMouseData(p33, p34, false);
        u6.SetMouseOver(true);
    end;

    function u6.MouseMoved(p35, p36, p37) -- Line: 134
        -- upvalues: u3 (ref), u6 (copy)
        if u3 then
            return;
        end;

        u6.UpdateMouseData(p36, p37, false);
    end;

    function u6.MouseLeave(p38) -- Line: 141
        -- upvalues: u3 (ref), u6 (copy)
        if u3 then
            return;
        end;

        u6.UpdateMouseData(-1, -1, false);
        u6.SetMouseOver(false);
    end;

    local v39, v40 = Roact.createBinding(Vector2.zero);
    u6.TooltipSize = v39;
    u6.SetTooltipSize = v40;
end;

function u2.didMount(u41) -- Line: 153
    -- upvalues: u3 (copy), u4 (copy), u5 (ref), ReplicatedStorage (copy), RunService (copy)
    if not u3 then
        table.insert(u41.Cleanup, u41.props.OnPacketProfilerPaused:Connect(function(p42) -- Line: 155
            -- upvalues: u41 (copy)
            u41.Enabled = not p42;
        end));
        u41.CurrentFrame = {
            TotalSize = 0,
            Time = os.clock(),
            Packets = {}
        };
        task.spawn(function() -- Line: 165
            -- upvalues: u41 (copy), u4 (ref), u5 (ref), ReplicatedStorage (ref), RunService (ref)
            for _, descendant in game:GetDescendants() do
                if descendant:IsA("RemoteEvent") or descendant:IsA("UnreliableRemoteEvent") then
                    table.insert(u41.Cleanup, descendant[u4]:Connect(function(...) -- Line: 168
                        -- upvalues: u41 (ref), descendant (copy)
                        u41.RemoteCallback(descendant, ...);
                    end));
                end;
            end;

            table.insert(u41.Cleanup, game.DescendantAdded:Connect(function(u43) -- Line: 174
                -- upvalues: u41 (ref), u4 (ref)
                if u43:IsA("RemoteEvent") or u43:IsA("UnreliableRemoteEvent") then
                    table.insert(u41.Cleanup, u43[u4]:Connect(function(...) -- Line: 176
                        -- upvalues: u41 (ref), u43 (copy)
                        u41.RemoteCallback(u43, ...);
                    end));
                end;
            end));

            if u5 == nil then
                local u44 = nil;
                u44 = ReplicatedStorage.DescendantAdded:Connect(function(p45) -- Line: 183
                    -- upvalues: u5 (ref), u41 (ref), u44 (ref)
                    if p45:IsA("BindableEvent") and p45.Name == "RemoteFunctionEvent.profiler" then
                        u5 = p45;
                        table.insert(u41.Cleanup, u5.Event:Connect(u41.RemoteCallback));
                        u44:Disconnect();
                    end;
                end);
            else
                table.insert(u41.Cleanup, u5.Event:Connect(u41.RemoteCallback));
            end;

            table.insert(u41.Cleanup, RunService.RenderStepped:Connect(function() -- Line: 194
                -- upvalues: u41 (ref)
                if not u41.Enabled then
                    return;
                end;

                u41.PacketFrames:push(u41.CurrentFrame);
                u41.SetPacketsChanged(u41.PacketFrames);
                u41.CurrentFrame = {
                    TotalSize = 0,
                    Time = os.clock(),
                    Packets = {}
                };

                if u41.MouseOver:getValue() then
                    local v46 = u41.MousePosition:getValue();
                    u41.UpdateMouseData(v46.X, v46.Y, u41.SelectedFrameData:getValue().Selected);
                end;
            end));
        end);
    end;
end;

function u2.willUnmount(p47) -- Line: 216
    for _, v in p47.Cleanup do
        v:Disconnect();
    end;
end;

function u2.render(u48) -- Line: 222
    -- upvalues: Roact (copy), PacketFrame (copy), StudioTheme (copy), u3 (copy)
    local v49 = {};

    for i = 1, 256 do
        v49[i] = Roact.createElement(PacketFrame, {
            MaxFrames = 256,
            Index = i,
            PacketsChanged = u48.PacketsChanged,
            MaxFrameSize = u48.props.MaxFrameSize
        });
    end;

    return Roact.createElement("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        [Roact.Event.InputBegan] = u48.InputBegan,
        [Roact.Event.MouseEnter] = u48.MouseEnter,
        [Roact.Event.MouseMoved] = u48.MouseMoved,
        [Roact.Event.MouseLeave] = u48.MouseLeave,
        [Roact.Ref] = u48.ProfilerBackgroundRef
    }, {
        Frames = Roact.createFragment(v49),
        SelectedHighlight = Roact.createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(0.00390625, 1),
            Position = u48.SelectedFrameData:map(function(p50) -- Line: 249
                return UDim2.fromScale(1 - p50.Index / 256, 0);
            end),
            Visible = u48.SelectedFrameData:map(function(p51) -- Line: 253
                if p51 then
                    p51 = p51.Selected;
                end;

                return p51;
            end),
            BackgroundColor3 = Color3.fromHex("#34ff30")
        }),
        FrameHighlight = Roact.createElement("Frame", {
            BackgroundTransparency = 0.25,
            ZIndex = 2,
            BorderSizePixel = 0,
            Size = u48.MouseFrameData:map(function(p52) -- Line: 260
                -- upvalues: u48 (copy)
                local v53 = math.min(p52.TotalSize / u48.props.MaxFrameSize, 1);

                return UDim2.fromScale(0.00390625, v53);
            end),
            AnchorPoint = Vector2.new(0, 1),
            Position = u48.MouseFrameData:map(function(p54) -- Line: 266
                return UDim2.fromScale(1 - p54.Index / 256, 1);
            end),
            Visible = u48.MouseFrameData:map(function(p55) -- Line: 271
                return p55.Index ~= 0;
            end),
            BackgroundColor3 = Color3.fromHex("#e8e8e8")
        }),
        FrameTooltip = StudioTheme(function(p56) -- Line: 276
            -- upvalues: Roact (ref), u48 (copy)
            return Roact.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = p56:GetColor("Dropdown"),
                BorderColor3 = p56:GetColor("Border"),
                Position = u48.MousePosition:map(function(p57) -- Line: 281
                    -- upvalues: u48 (ref)
                    local CurrentCamera = workspace.CurrentCamera;
                    local v58 = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(0, 0);
                    local v59 = u48.TooltipSize:getValue();

                    return UDim2.fromOffset(math.min(p57.X, v58.X - v59.X), p57.Y + 12);
                end),
                Visible = u48.MouseOver,
                ZIndex = 2,

                [Roact.Change.AbsoluteSize] = function(p60) -- Line: 293
                    -- upvalues: u48 (ref)
                    u48.SetTooltipSize(p60.AbsoluteSize);
                end,

                [Roact.Ref] = function(p61) -- Line: 296
                    -- upvalues: u48 (ref)
                    if p61 then
                        u48.SetTooltipSize(p61.AbsoluteSize);
                    end;
                end
            }, {
                UIListLayout = Roact.createElement("UIListLayout", {}),
                FrameLabel = Roact.createElement("TextLabel", {
                    AutoLocalize = false,
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    Text = u48.MouseFrameData:map(function(p62) -- Line: 305
                        return string.format("%d packets, %d bytes", #p62.Packets, p62.TotalSize);
                    end),
                    TextColor3 = p56:GetColor("BrightText"),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Font = Enum.Font.SourceSans,
                    Size = UDim2.fromOffset(200, 16)
                }),
                KBSent = Roact.createElement("TextLabel", {
                    AutoLocalize = false,
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    Text = u48.MouseFrameData:map(function(p63) -- Line: 318
                        return string.format("%.3f KB sent", p63.TotalSize / 1000);
                    end),
                    TextColor3 = p56:GetColor("BrightText"),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Font = Enum.Font.SourceSans,
                    Size = UDim2.fromOffset(200, 16)
                })
            });
        end),
        EditModeNotifier = StudioTheme(function(p64) -- Line: 331
            -- upvalues: Roact (ref), u3 (ref)
            return Roact.createElement("TextLabel", {
                AutoLocalize = false,
                BackgroundTransparency = 1,
                Text = "Start session to begin",
                TextSize = 20,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextColor3 = p64:GetColor("WarningText"),
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                Visible = u3
            });
        end)
    });
end;

return u2;