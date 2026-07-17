-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local SceneLoadingScreen = RuntimeLib.import(script, script.Parent, "scene-loading-screen").SceneLoadingScreen;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), SceneLoadingScreen (copy)
    local u3 = u1.mount(u1.createElement(SceneLoadingScreen, {
        BackgroundImage = "rbxassetid://10983634478",
        Title = "GRAVEYARD",
        Description = "Beware of the grave keeper. Dig up the correct grave or die.",
        TitleColor = Color3.fromHex("89ffd4")
    }), p2);

    return function() -- Line: 12
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;