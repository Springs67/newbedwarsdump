-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CustomKitCreation_MainGUI = RuntimeLib.import(script, script.Parent, "custom-kit-creation-main-gui").CustomKitCreation_MainGUI;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), CustomKitCreation_MainGUI (copy)
    local u3 = u1.mount(u1.createElement(CustomKitCreation_MainGUI, {
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

        OnSave = function() -- Line: 18, Name: OnSave
            return true;
        end
    }), p2);

    return function() -- Line: 22
        -- upvalues: u1 (ref), u3 (copy)
        u1.unmount(u3);
    end;
end;