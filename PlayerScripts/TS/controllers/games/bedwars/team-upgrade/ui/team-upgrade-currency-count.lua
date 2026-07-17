-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local LabelledText = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText;
local StudioQueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TeamUpgradeCurrencyCount = v3.new(u2)(function(p5, p6) -- Line: 20
        -- upvalues: TeamUpgradeUtil (copy), RunService (copy), StudioQueueType (copy), KnitClient (copy), QueueType (copy), u2 (copy), Theme (copy), DeviceUtil (copy), BedwarsImageId (copy), Players (copy), TooltipContainer (copy), AutoSizedText (copy), LabelledText (copy), getItemMeta (copy)
        local _ = p6.useState;
        local v7 = TeamUpgradeUtil.getPlayerResourceAmount(p5.ObservedInventory);
        local v8 = TeamUpgradeUtil.getTeamResourceAmount(p5.ObservedInventory);
        local v9;

        if RunService:IsStudio() then
            v9 = StudioQueueType;
        else
            v9 = KnitClient.Controllers.MatchController:getQueueType();
        end;

        local v10 = p5.IsHomeBase and v9 ~= QueueType.BEDWARS_OG_TO4;
        local v11 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = p5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v11[i] = v;
            end;
        end;

        local v12 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v13 = #v12;
        local v14 = {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        };
        local ListProps = p5.ListProps;

        if ListProps then
            for i, v in ListProps do
                v14[i] = v;
            end;
        end;

        v12[v13 + 1] = u2.createElement("UIListLayout", v14);
        local createElement = u2.createElement;
        local v15 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.45, 1),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local v16 = {};
        local v17 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4
        });
        local createElement2 = u2.createElement;
        local v18 = {
            ScaleType = "Fit",
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1.3, 1.3),
            Position = UDim2.fromScale(-0.1, 0.45),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v19;

        if DeviceUtil.isHoarceKat() then
            v19 = BedwarsImageId.CLOSED_CHEST_RENDER;
        else
            v19 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(Players.LocalPlayer.UserId) .. "&w=150&h=150";
        end;

        v18.Image = v19;
        v16[1], v16[2], v16[3], v16[4] = v17, createElement2("ImageLabel", v18, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
            Text = "Inventory",
            TextSize = 16,
            Font = Enum.Font.SourceSansBold,
            Limits = Vector2.new(300, 60)
        }) }) }), u2.createElement(LabelledText, {
    TextScale = 0.7,
    Text = "<b>" .. tostring(v7) .. "</b>",
    Image = getItemMeta(p5.Currency).image,
    FrameProps = {
        LayoutOrder = 31,
        Size = UDim2.fromScale(0.75, 1),
        Position = UDim2.fromScale(1, 0),
        AnchorPoint = Vector2.new(1, 0)
    },
    ImageProps = {
        Size = UDim2.fromScale(1, 1),
        SizeConstraint = Enum.SizeConstraint.RelativeXY
    },
    HorizontalAlignment = Enum.HorizontalAlignment.Right
}), u2.createElement("UICorner", {
    CornerRadius = UDim.new(1, 0)
});
        v12.InventoryCount = createElement("Frame", v15, v16);

        if v10 then
            local createFragment = u2.createFragment;
            local v20 = {};
            local createElement3 = u2.createElement;
            local v21 = {
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.45, 1),
                BackgroundColor3 = Theme.backgroundTertiary
            };
            local v22 = {};
            local v23 = u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4
            });
            local v24 = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1.7, 1.7),
                Position = UDim2.fromScale(-0.1, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Image = BedwarsImageId.TEAM_CRATE_RENDER
            }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        Text = "Team Crate",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
            local v25;

            if p5.IsHomeBase then
                v25 = u2.createElement(LabelledText, {
                    TextScale = 0.7,
                    Text = "<b>" .. tostring(v8) .. "</b>",
                    Image = getItemMeta(p5.Currency).image,
                    FrameProps = {
                        LayoutOrder = 31,
                        Size = UDim2.fromScale(0.75, 1),
                        Position = UDim2.fromScale(1, 0),
                        AnchorPoint = Vector2.new(1, 0)
                    },
                    TextProps = {
                        TextXAlignment = Enum.TextXAlignment.Right
                    },
                    ImageProps = {
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = Enum.SizeConstraint.RelativeXY
                    },
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                });
            else
                v25 = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 31,
                    Size = UDim2.fromScale(0.75, 1),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0)
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "Enemy Base",
                            TextSize = 16,
                            Font = Enum.Font.SourceSansBold,
                            Limits = Vector2.new(300, 60),
                            TextColor3 = Color3.fromRGB(252, 97, 97)
                        }), u2.createElement(AutoSizedText, {
                            Text = "Can\'t use team crate here",
                            TextSize = 14,
                            Font = Enum.Font.SourceSans,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Limits = Vector2.new(300, 60),
                            TextColor3 = Color3.fromRGB(191, 191, 191)
                        }) }), u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.7, 0.7),
                        Position = UDim2.fromScale(0.4, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Image = BedwarsImageId.NOT_HOME_ICON
                    }), u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
            end;

            v22[1], v22[2], v22[3], v22[4] = v23, v24, v25, u2.createElement("UICorner", {
    CornerRadius = UDim.new(1, 0)
});
            v20.TeamCrateCount = createElement3("Frame", v21, v22);
            v10 = createFragment(v20);
        end;

        if v10 then
            v12[v13 + 2] = v10;
        end;

        return u2.createFragment({
            TeamUpgradeCurrencyCount = u2.createElement("Frame", v11, v12)
        });
    end)
};