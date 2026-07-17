-- Decompiled with Potassium's decompiler.

local u1 = script:FindFirstAncestorOfClass("Plugin");
local Modules = u1:FindFirstChildOfClass("Script").Modules;
local Packages = require(Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local v2 = Roact.Component:extend("StudioWidget");

function v2.init(p3) -- Line: 10
    -- upvalues: u1 (copy)
    local v4 = DockWidgetPluginGuiInfo.new(p3.props.InitialDockState, p3.props.Enabled, false, p3.props.DefaultSize.X, p3.props.DefaultSize.Y, p3.props.MinimumSize.X, p3.props.MinimumSize.Y);
    local v5 = u1:CreateDockWidgetPluginGui(p3.props.WidgetId, v4);
    v5.Title = p3.props.WidgetTitle;
    v5.Name = p3.props.WidgetId;
    v5.ZIndexBehavior = p3.props.ZIndexBehavior or Enum.ZIndexBehavior.Global;
    p3.Widget = v5;
end;

function v2.didMount(u6) -- Line: 29
    u6.OnEnabled = u6.props.OnEnabled:Connect(function(p7) -- Line: 30
        -- upvalues: u6 (copy)
        u6.Widget.Enabled = p7;
    end);
    u6.Widget:BindToClose(function() -- Line: 33
        -- upvalues: u6 (copy)
        u6.Widget.Enabled = false;
    end);
end;

function v2.render(p8) -- Line: 38
    -- upvalues: Roact (copy)
    return Roact.createElement(Roact.Portal, {
        target = p8.Widget
    }, p8.props[Roact.Children]);
end;

function v2.didUpdate(p9, p10) -- Line: 44
    if p9.props.Enabled ~= p10.Enabled then
        p9.Widget.Enabled = p9.props.Enabled;
    end;
end;

function v2.willUnmount(p11) -- Line: 50
    p11.OnEnabled:Disconnect();
end;

return v2;