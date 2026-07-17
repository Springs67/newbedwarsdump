-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v9 = v3.new(u2)(function(p5, p6) -- Line: 12
    -- upvalues: PlayerLevelUtil (copy), u2 (copy), Empty (copy), ColorUtil (copy), Theme (copy), StringUtil (copy)
    local v7 = PlayerLevelUtil.levelSystem:getCurrExperienceProgression(p5.playerLevelTotalExperience, p5.playerLevel);
    local v8 = PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(p5.playerLevel + 1) - PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(p5.playerLevel);

    return u2.createElement(Empty, {
        Size = UDim2.new(1, 0, 0, 50)
    }, {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }),
        u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 18,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            TextColor3 = PlayerLevelUtil.getLevelColor(p5.playerLevel),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            Text = "Player Level " .. tostring(p5.playerLevel)
        }),
        ProgressBar = u2.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.7,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.2),
            BackgroundColor3 = ColorUtil.BLACK
        }, {
            CurrProgress = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(v7 / v8, 1),
                BackgroundColor3 = Theme.mcGold
            }),
            TotalProgress = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0.7,
                ZIndex = 1,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            })
        }),
        u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 15,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto,
            TextXAlignment = Enum.TextXAlignment.Right,
            Text = StringUtil.roundNumber(v7, 0) .. " / " .. tostring(v8)
        })
    });
end);

return {
    LevelStats = v4.connect(function(p10, p11) -- Line: 74
        local v12 = {};

        for i, v in p11 do
            v12[i] = v;
        end;

        v12.playerLevel = p10.Bedwars.playerLevel;
        v12.playerLevelTotalExperience = p10.Bedwars.playerLevelTotalExperience;

        return v12;
    end)(v9)
};