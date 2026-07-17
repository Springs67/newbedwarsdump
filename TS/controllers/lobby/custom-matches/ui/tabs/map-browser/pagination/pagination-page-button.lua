-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    PaginationPageButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 8
        -- upvalues: u2 (copy), ColorUtil (copy), Padding (copy)
        local _ = p4.useState;
        local createFragment = u2.createFragment;
        local v5 = {};
        local createElement = u2.createElement;
        local v6 = {
            Text = tostring(u3.Page),
            Size = UDim2.new(0.125, 0, 1, 0),
            TextColor3 = ColorUtil.WHITE,
            TextScaled = true,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
        };
        local v7;

        if u3.CurrentPage == u3.Page then
            v7 = Color3.fromRGB(94, 98, 186);
        else
            v7 = Color3.fromRGB(21, 21, 38);
        end;

        v6.BackgroundColor3 = v7;
        v6.BorderSizePixel = 0;

        v6[u2.Event.Activated] = function() -- Line: 19
            -- upvalues: u3 (copy)
            u3.SetPage(u3.Page);
        end;

        v6.LayoutOrder = u3.Page + 1;
        v5.Page = createElement("TextButton", v6, { u2.createElement(Padding, {
                Padding = {
                    Horizontal = 6,
                    Vertical = 6
                }
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.2, 0)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.75
            }) });

        return createFragment(v5);
    end)
};