-- Decompiled with Potassium's decompiler.

local Parent = script.Parent.Parent;
local Components = Parent.Components;
local Packages = require(Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local StudioSettings = require(Components.StudioSettings);
local u1 = Roact.Component:extend("StudioThemeProvider");

function u1.init(u2) -- Line: 11
    -- upvalues: StudioSettings (copy)
    u2:setState({
        CurrentTheme = StudioSettings.Theme
    });
    u2.StudioThemeChanged = StudioSettings.ThemeChanged:Connect(function() -- Line: 15
        -- upvalues: u2 (copy), StudioSettings (ref)
        u2:setState({
            CurrentTheme = StudioSettings.Theme
        });
    end);
end;

function u1.render(p3) -- Line: 22
    -- upvalues: Roact (copy)
    return Roact.oneChild(p3.props[Roact.Children])(p3.state.CurrentTheme);
end;

function u1.willUnmount(p4) -- Line: 27
    p4.StudioThemeChanged:Disconnect();
end;

return function(p5) -- Line: 31, Name: StudioTheme
    -- upvalues: Roact (copy), u1 (copy)
    return Roact.createElement(u1, {}, {
        Component = p5
    });
end;