-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local FullScreenMenu = RuntimeLib.import(script, script.Parent, "full-screen-menu").FullScreenMenu;
local FullScreenMenuBackgroundPresets = RuntimeLib.import(script, script.Parent, "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), FullScreenMenuBackgroundPresets (copy), FullScreenMenu (copy)
    local v3 = {};
    local v4 = {};

    for i, v in FullScreenMenuBackgroundPresets.BACKGROUND_BLUR_PRESET do
        v3[i] = v;
    end;

    function v3.OnClick() -- Line: 13
        print("backgroundclick");
    end;

    v4.Background = v3;
    v4.BackButton = {
        OnClick = function() -- Line: 18, Name: OnClick
            print("back");
        end
    };
    v4.ExitButton = {
        OnClick = function() -- Line: 23, Name: OnClick
            print("exit");
        end
    };
    local u5 = u1.mount(u1.createElement(FullScreenMenu, v4), p2);

    return function() -- Line: 28
        -- upvalues: u1 (ref), u5 (copy)
        u1.unmount(u5);
    end;
end;