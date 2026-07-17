-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ButtonComponent = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ButtonComponent;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    MenuItem = v2.new(u1)(function(u3, p4) -- Line: 7
        -- upvalues: Theme (copy), u1 (copy), ButtonComponent (copy)
        local v5, u6 = p4.useState(false);
        local u7;

        if u3.item.dangerous then
            u7 = Theme.mcRed;
        else
            u7 = Theme.textPrimary;
        end;

        local u8;

        if u3.item.dangerous then
            u8 = Theme.mcRed;
        else
            u8 = Color3.fromRGB(255, 255, 255);
        end;

        local u9 = Color3.fromRGB(255, 255, 255);

        return u1.createElement(ButtonComponent, {
            TextWrap = true,
            BackgroundTransparency = 1,
            ZIndex = 100,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 30),
            Text = u3.item.text,

            OnClick = function() -- Line: 16, Name: OnClick
                -- upvalues: u3 (copy), u6 (copy)
                u3.item.callback(u6);
                u3.closeMenu();
            end,

            TextColor3 = u8,
            Loading = v5,
            CornerRadius = UDim.new(0, 3),

            OnEnter = function(p10) -- Line: 27, Name: OnEnter
                -- upvalues: u7 (copy), u9 (copy)
                p10.BackgroundColor3 = u7;
                p10.BackgroundTransparency = 0;
                p10.TextColor3 = u9;
            end,

            OnLeave = function(p11) -- Line: 32, Name: OnLeave
                -- upvalues: u8 (copy)
                p11.BackgroundColor3 = u8;
                p11.BackgroundTransparency = 1;
                p11.TextColor3 = u8;
            end
        });
    end)
};