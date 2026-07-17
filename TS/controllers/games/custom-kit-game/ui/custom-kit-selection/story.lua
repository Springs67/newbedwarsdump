-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CustomKitGame_KitSelectionGUI = RuntimeLib.import(script, script.Parent, "custom-kit-game-kit-selection-gui").CustomKitGame_KitSelectionGUI;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), CustomKitGame_KitSelectionGUI (copy)
    local u3 = u1.mount(u1.createElement(CustomKitGame_KitSelectionGUI, {
        CustomKits = { {
                name = "My Kit",
                id = "0",
                stats = {},
                abilities = {}
            }, {
                name = "Your Kit",
                id = "1",
                stats = {},
                abilities = {}
            } },

        OnKitClicked = function() -- Line: 18, Name: OnKitClicked
            return true;
        end
    }), p2);

    return function() -- Line: 22
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;