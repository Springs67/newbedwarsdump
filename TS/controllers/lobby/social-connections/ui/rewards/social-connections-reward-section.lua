-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ImageId = v1.ImageId;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SocialConnectionsRewardSection = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: DeviceUtil (copy), KnitClient (copy), u2 (copy), ImageId (copy), Theme (copy), ColorUtil (copy), BattlePassUtils (copy)
        local _ = p5.useState;
        local v6 = DeviceUtil.isHoarceKat() and 2 or (KnitClient.Controllers.SocialConnectionsController.policyDiscordAllowed and 2 or 1);
        local v7 = p4.CompletedCount == v6;
        local createElement = u2.createElement;
        local v8 = {
            AutomaticSize = "Y",
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 0),
            LayoutOrder = p4.LayoutOrder
        };
        local v9 = {};
        local createElement2 = u2.createElement;
        local v10 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.1, 0.5),
            Size = UDim2.fromOffset(36, 36)
        };
        local v11;

        if v7 then
            v11 = ImageId.UNLOCK_SOLID;
        else
            v11 = ImageId.LOCK_SOLID;
        end;

        v10.Image = v11;
        v9[1], v9[2] = createElement2("ImageLabel", v10), u2.createElement("Frame", {
    AutomaticSize = "Y",
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 0)
}, { u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 8)
    }), u2.createElement("TextLabel", {
        RichText = true,
        TextSize = 16,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = (v7 and "<b><font color=\"#30C35C\">Unlocked</font></b>" or "Complete all tasks to unlock") .. " (<font color=\"#FFFFFF\">" .. tostring(p4.CompletedCount) .. "</font>/" .. tostring(v6) .. ")",
        TextColor3 = Theme.textSecondary,
        TextXAlignment = Enum.TextXAlignment.Center,
        Font = Enum.Font.Roboto
    }), u2.createElement("Frame", {
        AutomaticSize = "XY",
        BackgroundTransparency = 0.7,
        LayoutOrder = 2,
        Size = UDim2.new(DeviceUtil.isSmallScreen() and 0.5 or 0, 0, 0, 0),
        BackgroundColor3 = ColorUtil.BLACK
    }, { u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8),
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10)
        }), u2.createElement("ImageLabel", {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(16, 16),
            Image = BattlePassUtils.BATTLE_PASS_SEASON_ICON
        }), u2.createElement("TextLabel", {
            Text = "<b>+20%</b> Battle Pass XP",
            RichText = true,
            TextSize = 16,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 28, 0.5, 0),
            Size = UDim2.new(0, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Roboto
        }) }) });

        return createElement("Frame", v8, v9);
    end)
};