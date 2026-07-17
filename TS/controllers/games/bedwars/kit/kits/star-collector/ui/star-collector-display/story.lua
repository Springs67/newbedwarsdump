-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local HotbarApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "hotbar-app").HotbarApp;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local StarCollectorDisplay = RuntimeLib.import(script, script.Parent, "star-collector-display").StarCollectorDisplay;

return function(p2) -- Line: 7
    -- upvalues: CreateRoduxApp (copy), HotbarApp (copy), u1 (copy), StarCollectorDisplay (copy)
    local u3 = CreateRoduxApp("hotbar", HotbarApp, {}, {}, {
        Parent = p2
    });
    local u4 = u1.mount(u1.createElement(StarCollectorDisplay, {
        greenStars = 5,
        yellowStars = 5
    }), p2);

    return function() -- Line: 15
        -- upvalues: u1 (ref), u3 (copy), u4 (copy)
        u1.unmount(u3);
        u1.unmount(u4);
    end;
end;