-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;

return {
    PlayerStats = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: tabListLayout (copy), ColorUtil (copy), DeviceUtil (copy), u2 (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);
        useEffect(function() -- Line: 13
            -- upvalues: u4 (copy), u7 (copy)
            if u4.Eliminated == true then
                u7(true);
            end;
        end, { u4.Eliminated });
        local v8 = {
            BorderSizePixel = 0,
            Size = UDim2.new(tabListLayout.columns.right.totalWidth, 0, 1, 0),
            BackgroundTransparency = tabListLayout.bgTransparency.playerRow,
            BackgroundColor3 = ColorUtil.hexColor(3750752)
        };
        local v9 = {};
        local _ = #v9;
        local v10 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            TextXAlignment = Enum.TextXAlignment.Center
        };
        local Kills = u4.Kills;
        v10.Text = tostring(Kills == nil and 0 or Kills);
        v10.TextTransparency = v6 and 0.5 or 0;
        v10.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v10.TextSize = DeviceUtil.isSmallScreen() and 13 or 16;
        v10.TextColor3 = ColorUtil.WHITE;
        v10.LayoutOrder = 1;
        v9.KillsStat = u2.createElement("TextLabel", v10);

        return u2.createElement("Frame", v8, v9);
    end)
};