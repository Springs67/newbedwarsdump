-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v7 = v3.new(u2)(function(p5, p6) -- Line: 10
    -- upvalues: u2 (copy), TopBarCard (copy), BedwarsImageId (copy), ColorUtil (copy)
    local _ = p6.useState;

    return u2.createElement(TopBarCard, {
        LayoutOrder = p5.LayoutOrder
    }, { u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = BedwarsImageId.HUD_KILLS_ICON,
            Size = UDim2.new(0, 16, 0, 16),
            ImageColor3 = Color3.fromRGB(255, 11, 70)
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 16,
            Text = tostring(p5.LocalKills),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        }) });
end);

return {
    HudLocalKills = v4.connect(function(p8, p9) -- Line: 35
        local v10 = {};

        for i, v in p9 do
            v10[i] = v;
        end;

        local v11 = p8.Bedwars.kills[p9.LocalPlayerId];
        v10.LocalKills = v11 == nil and 0 or v11;

        return v10;
    end)(v7)
};