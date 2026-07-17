-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    CustomMatchTabButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 6
        -- upvalues: DeviceUtil (copy), u1 (copy)
        local _ = p3.useState;
        local v4 = DeviceUtil.isSmallScreen();
        local v5 = {};

        for i, v in u2 do
            v5[i] = v;
        end;

        v5.Selected = nil;
        v5.OnClick = nil;
        local v6 = {};

        for i, v in v5 do
            v6[i] = v;
        end;

        v6.TextXAlignment = Enum.TextXAlignment.Center;
        v6.TextYAlignment = Enum.TextYAlignment.Center;
        v6.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v6.BackgroundTransparency = u2.Selected and 0.5 or 0.7;
        local v7;

        if v4 then
            v7 = Enum.FontSize.Size14;
        else
            v7 = Enum.FontSize.Size18;
        end;

        v6.FontSize = v7;
        v6.TextTransparency = 0;

        v6[u1.Event.MouseButton1Click] = function() -- Line: 26
            -- upvalues: u2 (copy)
            if u2.OnClick then
                u2.OnClick();
            end;
        end;

        return u1.createElement("TextButton", v6, { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 2)
            }) });
    end)
};