-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AchievementsSidebarBottom = RuntimeLib.import(script, script.Parent, "achievements-sidebar-bottom").AchievementsSidebarBottom;
local AchievementsSidebarCenter = RuntimeLib.import(script, script.Parent, "achievements-sidebar-center").AchievementsSidebarCenter;
local AchievementsSidebarTop = RuntimeLib.import(script, script.Parent, "achievements-sidebar-top").AchievementsSidebarTop;
local v22 = v3.new(u2)(function(p5, p6) -- Line: 16
    -- upvalues: AchievementUtil (copy), DeviceUtil (copy), Theme (copy), u2 (copy), Empty (copy), ColorUtil (copy), AchievementsSidebarTop (copy), AchievementsSidebarCenter (copy), AchievementsSidebarBottom (copy), AutoCanvasScrollingFrame (copy)
    local _ = p6.useState;
    local SelectedAch = p5.SelectedAch;
    local v7;

    if SelectedAch then
        v7 = AchievementUtil.getMeta(SelectedAch);
    else
        v7 = nil;
    end;

    local v8;

    if SelectedAch then
        v8 = p5.ProfileData;

        if v8 ~= nil then
            v8 = v8.achievements[SelectedAch];
        end;
    else
        v8 = nil;
    end;

    local v9;

    if v8 == nil then
        v9 = v8;
    else
        v9 = v8.achieved;
    end;

    if v9 == nil then
        v9 = false;
    end;

    local v10;

    if v8 == nil then
        v10 = v8;
    else
        v10 = v8.dateAchieved;
    end;

    local v11 = DeviceUtil.isSmallScreen() and 5 or 10;
    local v12 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local FrameProps = p5.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v12[i] = v;
        end;
    end;

    local v13 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }) };
    local v14 = {};
    local v15 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v16;

    if DeviceUtil.isSmallScreen() and SelectedAch then
        v16 = nil;
    else
        v16 = UDim2.fromScale(1, 1);
    end;

    v15.CanvasSize = v16;
    v14.ScrollingFrameProps = v15;
    local v17 = { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v11),
            PaddingBottom = UDim.new(0, v11),
            PaddingLeft = UDim.new(0, v11),
            PaddingRight = UDim.new(0, v11)
        }) };
    local v18 = #v17;
    local v19;

    if SelectedAch == nil then
        v19 = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 1)
        }, { u2.createElement("TextLabel", {
                Text = "(Select an achievement)",
                TextSize = 24,
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                TextWrapped = true,
                Size = UDim2.fromScale(1, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AutomaticSize = Enum.AutomaticSize.Y,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center
            }) });
    else
        v19 = false;
    end;

    if v19 then
        v17[v18 + 1] = v19;
    end;

    local v20 = #v17;
    local v21;

    if SelectedAch == nil then
        v21 = false;
    else
        v21 = u2.createFragment({
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }),
            u2.createElement(AchievementsSidebarTop, {
                DateAchieved = v10,
                Achieved = v9,
                FrameProps = {
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.03)
                }
            }),
            u2.createElement(Empty, {
                Size = UDim2.fromScale(0, 0.02)
            }),
            u2.createElement(AchievementsSidebarCenter, {
                AchievementId = SelectedAch,
                AchievementMeta = v7,
                ProfileData = p5.ProfileData,
                FrameProps = {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.75)
                }
            }),
            u2.createElement(AchievementsSidebarBottom, {
                AchievementId = SelectedAch,
                AchievementMeta = v7,
                AchievementData = v8,
                FrameProps = {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.2)
                }
            })
        });
    end;

    if v21 then
        v17[v20 + 1] = v21;
    end;

    v13[#v13 + 1] = u2.createElement(AutoCanvasScrollingFrame, v14, v17);

    return u2.createElement("Frame", v12, v13);
end);

return {
    AchievementsSidebar = v4.connect(function(p23, p24) -- Line: 146
        local v25 = {};

        for i, v in p24 do
            v25[i] = v;
        end;

        v25.store = p23;

        return v25;
    end)(v22)
};