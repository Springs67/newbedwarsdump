-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MilestoneRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local milestonesLayout = RuntimeLib.import(script, script.Parent, "milestones-config").milestonesLayout;
local u4 = nil;
local u5 = nil;

local function v22(p6, p7) -- Line: 14
    -- upvalues: u2 (copy), milestonesLayout (copy), Theme (copy), ProgressBar (copy), u4 (ref), u5 (ref), BedwarsImageId (copy), ColorUtil (copy), MilestoneRewards (copy)
    local playerLevel = p6.store.Bedwars.playerLevel;
    local playerLevelTotalExperience = p6.store.Bedwars.playerLevelTotalExperience;

    local function v17(p8, p9) -- Line: 17
        -- upvalues: u2 (ref), milestonesLayout (ref), Theme (ref), ProgressBar (ref), u4 (ref), playerLevel (copy), playerLevelTotalExperience (copy), u5 (ref), BedwarsImageId (ref), ColorUtil (ref)
        local createFragment = u2.createFragment;
        local v10 = {};
        local createElement = u2.createElement;
        local v11 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0
        };
        local v12;

        if p9 == 0 then
            v12 = milestonesLayout.distanceX / 2;
        else
            v12 = milestonesLayout.distanceX;
        end;

        v11.Size = UDim2.new(0, v12, 1, 0);
        v11.BackgroundColor3 = Theme.backgroundPrimary;
        local v13 = {};
        local v14 = u2.createElement(ProgressBar, {
            AcceptZero = true,
            Size = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Progress = u4(playerLevel, playerLevelTotalExperience, p8, p9),
            BarColor = milestonesLayout.progressBarColor,
            BarBackgroundColor = milestonesLayout.progressBarBackgroundColor
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) });
        local createElement2 = u2.createElement;
        local v15 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 10,
            Size = UDim2.fromScale(1, u5(playerLevel, p8) and 0.9 or 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Image = BedwarsImageId.CIRCLE_SOLID
        };
        local v16;

        if u5(playerLevel, p8) then
            v16 = ColorUtil.WHITE;
        else
            v16 = ColorUtil.hexColor(4079463);
        end;

        v15.ImageColor3 = v16;
        v15.ScaleType = Enum.ScaleType.Fit;
        v13[1], v13[2], v13[3] = v14, createElement2("ImageLabel", v15), u2.createElement("ImageLabel", {
    BorderSizePixel = 0,
    BackgroundTransparency = 1,
    ZIndex = 11,
    Size = UDim2.fromScale(1, 1),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(1, 0.5),
    Image = BedwarsImageId.CIRCLE_CHECK_SOLID,
    ImageColor3 = milestonesLayout.progressBarColor,
    ImageTransparency = u5(playerLevel, p8) and 0 or 1,
    ScaleType = Enum.ScaleType.Fit
});
        v10.MilestonesProgressBar = createElement("Frame", v11, v13);

        return createFragment(v10);
    end;

    local v18 = table.create(#MilestoneRewards);

    for i, v in MilestoneRewards do
        v18[i] = v17(v, i - 1, MilestoneRewards);
    end;

    local v19 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = p6.Size,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = ColorUtil.BLACK,
        LayoutOrder = p6.LayoutOrder
    };
    local v20 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v21 = #v20;

    for i, v in v18 do
        v20[v21 + i] = v;
    end;

    return u2.createFragment({
        MilestonesProgress = u2.createElement("Frame", v19, v20)
    });
end;

u5 = function(p23, p24) -- Line: 94, Name: meetsLevelRequirement
    return p24.levelRequirement <= p23;
end;

u4 = function(p25, p26, p27, p28) -- Line: 97, Name: getProgress
    -- upvalues: u5 (ref), PlayerLevelUtil (copy), MilestoneRewards (copy)
    if u5(p25, p27) then
        return 1;
    end;

    local v29 = math;
    local v30 = MilestoneRewards[p28 - 1 + 1];

    if v30 ~= nil then
        v30 = v30.levelRequirement;
    end;

    local v31 = (p26 - PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(v30 == nil and 0 or v30)) / PlayerLevelUtil.levelSystem:getTotalExperienceForLevel(p27.levelRequirement);

    return v29.max(0, v31);
end;

return {
    meetsLevelRequirement = u5,
    getProgress = u4,
    MilestonesProgress = v3.new(u2)(v22)
};