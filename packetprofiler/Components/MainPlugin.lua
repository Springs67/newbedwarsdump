-- Decompiled with Potassium's decompiler.

local UserInputService = game:GetService("UserInputService");
local Parent = script.Parent.Parent;
local u1 = Parent:FindFirstAncestorOfClass("Plugin");
local Components = Parent.Components;
local Packages = require(Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local Signal = require(Packages.Directory.Signal);
Roact.setGlobalConfig({
    elementTracing = true
});
local v2 = Roact.Component:extend("MainPlugin");

function v2.init(u3) -- Line: 18
    -- upvalues: Signal (copy), u1 (copy), Packages (copy)
    u3.OnPacketProfilerEnabled = Signal.new();
    local v4;

    if u1 then
        v4 = u1:GetSetting("PacketChartEnabled") == true;
    else
        v4 = false;
    end;

    u3.IsPacketChartEnabled = v4;
    u3.OnPacketChartEnabled = Signal.new();
    local v5 = {};
    local v6;

    if u1 then
        v6 = u1:GetSetting("PacketProfilerEnabled") == true;
    else
        v6 = false;
    end;

    v5.PacketProfilerEnabled = v6;
    u3:setState(v5);

    if Packages.IsPlugin then
        u3.props.PacketProfiler:SetActive(u3.state.PacketProfilerEnabled);
        u3.props.PacketChart:SetActive(u3.IsPacketChartEnabled);
    end;

    u3.Connections = {};
    u3.Signals = {
        ProfilerFrameSelected = Signal.new(),
        ProfilerPaused = Signal.new()
    };

    function u3.OnPacketProfilerClicked() -- Line: 38
        -- upvalues: u3 (copy), u1 (ref)
        local v7 = not u3.state.PacketProfilerEnabled;
        u3.OnPacketProfilerEnabled:Fire(v7);
        u3:setState({
            PacketProfilerEnabled = v7
        });

        if u1 then
            u1:SetSetting("PacketProfilerEnabled", v7);
        end;
    end;

    function u3.OnPacketChartClicked(p8) -- Line: 49
        -- upvalues: u3 (copy), u1 (ref)
        local v9 = p8 or not u3.IsPacketChartEnabled;
        u3.IsPacketChartEnabled = v9;
        u3.OnPacketChartEnabled:Fire(v9);

        if u1 then
            u1:SetSetting("PacketChartEnabled", v9);
        end;
    end;
end;

function v2.didMount(u10) -- Line: 60
    -- upvalues: Packages (copy), UserInputService (copy)
    if Packages.IsPlugin then
        table.insert(u10.Connections, u10.props.PacketProfiler.Click:Connect(u10.OnPacketProfilerClicked));
        table.insert(u10.Connections, u10.props.PacketChart.Click:Connect(u10.OnPacketChartClicked));

        return;
    end;

    table.insert(u10.Connections, UserInputService.InputBegan:Connect(function(p11) -- Line: 65
        -- upvalues: UserInputService (ref), u10 (copy)
        if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            return;
        end;

        if p11.KeyCode == Enum.KeyCode.X then
            u10.OnPacketProfilerClicked();

            return;
        end;

        if p11.KeyCode == Enum.KeyCode.P then
            u10.ProfilerPaused = not u10.ProfilerPaused;
            u10.Signals.ProfilerPaused:Fire(u10.ProfilerPaused);
        end;
    end));
    table.insert(u10.Connections, u10.Signals.ProfilerFrameSelected:Connect(function(p12) -- Line: 78
        -- upvalues: u10 (copy)
        if #p12.Packets == 0 then
            u10.OnPacketChartClicked(false);

            return;
        end;

        u10.OnPacketChartClicked(true);
    end));
end;

function v2.render(p13) -- Line: 88
    -- upvalues: Roact (copy), Components (copy), u1 (copy)
    local createFragment = Roact.createFragment;
    local v14 = {};
    local v15;

    if p13.state.PacketProfilerEnabled then
        v15 = Roact.createElement(require(Components.PacketProfiler), {
            Enabled = true,
            OnEnabled = p13.OnPacketProfilerEnabled,
            Signals = p13.Signals
        }) or nil;
    else
        v15 = nil;
    end;

    v14.PacketProfiler = v15;
    v14.PacketChart = Roact.createElement(require(Components.PacketChart), {
        Enabled = p13.IsPacketChartEnabled,
        OnEnabled = p13.OnPacketChartEnabled,
        Signals = p13.Signals,
        PluginMouse = u1 and u1:GetMouse() or nil
    });

    return createFragment(v14);
end;

function v2.willUnmount(p16) -- Line: 104
    for _, v in p16.Connections do
        v:Disconnect();
    end;

    table.clear(p16.Connections);
end;

return v2;