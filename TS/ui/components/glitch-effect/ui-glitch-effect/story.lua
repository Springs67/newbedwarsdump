-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UIGlitchEffect = RuntimeLib.import(script, script.Parent, "ui-glitch-effect").UIGlitchEffect;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), UIGlitchEffect (copy)
    local u3 = u1.mount(u1.createElement("ScreenGui", {}, { u1.createElement(UIGlitchEffect, {}, {
            DomWAsHere = u1.createElement(
                "UIListLayout",
                {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Center"
                }
            ),
            u1.createElement("ImageLabel", {
                Image = "rbxassetid://10086864148",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 0.3)
            }),
            u1.createElement("TextLabel", {
                Text = "BYE",
                TextScaled = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 0.3)
            })
        }) }), p2);

    return function() -- Line: 26
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;