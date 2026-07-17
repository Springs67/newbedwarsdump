-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta");
local getTeamUpgradeDefinition = v6.getTeamUpgradeDefinition;
local isAtMaxTeamUpgradeTier = v6.isAtMaxTeamUpgradeTier;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TeamUpgradeButton = RuntimeLib.import(script, script.Parent, "team-upgrade-button").TeamUpgradeButton;
local v44 = v4.new(u3)(function(u7, p8) -- Line: 25
    -- upvalues: u3 (copy), getTeamUpgradeDefinition (copy), u2 (copy), isAtMaxTeamUpgradeTier (copy), Theme (copy), BedwarsImageId (copy), ColorUtil (copy), DeviceUtil (copy), getItemMeta (copy), TeamUpgradeUtil (copy), Empty (copy), TeamUpgradeButton (copy)
    local _ = p8.useState;
    local _ = p8.useEffect;
    local v9 = u3.createRef();
    local v10 = getTeamUpgradeDefinition(u7.TeamUpgrade);

    if not v10 then
        return u3.createFragment();
    end;

    local u11 = {};
    local v12 = u2.values(v10.tiers);
    table.move(v12, 1, #v12, #u11 + 1, u11);
    local v13 = u7.CurrentTier + 1;
    local v14 = isAtMaxTeamUpgradeTier(u7.CurrentTier, u7.TeamUpgrade) and 0 or v10.tiers[v13].cost;
    local v15 = {
        [u3.Ref] = v9,
        BorderSizePixel = 0,
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local FrameProps = u7.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v15[i] = v;
        end;
    end;

    local v16 = {
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.03, 0)
        }),
        Header = u3.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.1),
            BackgroundColor3 = Theme.backgroundTertiary
        }, { u3.createElement("TextLabel", {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                RichText = true,
                TextScaled = true,
                Text = "<b>" .. v10.name .. "</b>",
                Size = UDim2.fromScale(1, 0.75),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Theme.backgroundTertiary,
                Font = Enum.Font.Roboto,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Center
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.15, 0)
                }) }) })
    };
    local _ = #v16;
    local v17 = {
        Size = UDim2.fromScale(1, 0.825),
        Position = UDim2.fromScale(0, 0.15000000000000002)
    };
    local v18 = {
        u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0.015, 0),
            PaddingBottom = UDim.new(0.025, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0)
        }),
        UpgradeIcon = u3.createElement("ImageLabel", {
            LayoutOrder = 2,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Selectable = false,
            Size = UDim2.fromScale(1, 0.25),
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0),
            Image = v10.icon,
            SizeConstraint = Enum.SizeConstraint.RelativeYY
        }, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) })
    };
    local _ = #v18;

    local function v32(p19, p20) -- Line: 110
        -- upvalues: u7 (copy), u3 (ref), u11 (copy), Theme (ref), BedwarsImageId (ref), ColorUtil (ref), DeviceUtil (ref)
        local v21 = p20 + 1;
        local v22 = v21 <= u7.CurrentTier;
        local v23 = u7.CurrentTier == v21;
        local v24 = { "545791", "6367ac", "6f73b9" };
        local createFragment = u3.createFragment;
        local v25 = {};
        local v26 = "DescriptionTier_" .. tostring(v21);
        local createElement = u3.createElement;
        local v27 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, (math.min(1 / (#u11 + 1), 0.175)))
        };
        local v28 = {};
        local v29;

        if v22 then
            v29 = u3.createFragment({
                UnlockedIndicator = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(0.025, 1),
                    BackgroundColor3 = Theme.backgroundSuccess
                })
            });
        else
            v29 = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                SizeConstraint = "RelativeYY",
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(1, 0.45),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = BedwarsImageId.LOCK_ART
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        end;

        local createElement2 = u3.createElement;
        local v30 = {
            TextScaled = true,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            Text = "T" .. tostring(v21) .. ": " .. p19.description,
            BackgroundColor3 = Color3.fromHex(v24[p20 % #v24 + 1]),
            BorderColor3 = Theme.backgroundTertiary
        };
        local v31;

        if v23 then
            v31 = Enum.FontWeight.Bold;
        else
            v31 = Enum.FontWeight.Regular;
        end;

        v30.FontFace = Font.fromName("Roboto", v31);
        v30.TextColor3 = ColorUtil.WHITE;
        v30.TextTransparency = v22 and 0 or (v23 and 0.2 or 0.4);
        v30.TextXAlignment = Enum.TextXAlignment.Center;
        v28[1], v28[2] = v29, createElement2("TextLabel", v30, { u3.createElement("UITextSizeConstraint", {
        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 28
    }), u3.createElement("UIPadding", {
        PaddingLeft = UDim.new(0.1, 0),
        PaddingRight = UDim.new(0.1, 0),
        PaddingTop = UDim.new(0.05, 0),
        PaddingBottom = UDim.new(0.05, 0)
    }) });
        v25[v26] = createElement("Frame", v27, v28);

        return createFragment(v25);
    end;

    local v33 = table.create(#u11);

    for i, v in u11 do
        v33[i] = v32(v, i - 1, u11);
    end;

    local v34 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.65),
        Position = UDim2.fromScale(0.5, 0.3),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v35 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local v36 = #v35;

    for i, v in v33 do
        v35[v36 + i] = v;
    end;

    v18["Tier Descriptions"] = u3.createElement("Frame", v34, v35);
    local v37;

    if v14 == nil then
        v37 = false;
    else
        v37 = v14 ~= 0;
    end;

    if v37 then
        local v38 = {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.35),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0)
        };
        local v39 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0)
            }), u3.createElement("TextLabel", {
                AutomaticSize = "X",
                RichText = true,
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextWrapped = true,
                TextTransparency = 0.3,
                LayoutOrder = 0,
                Text = tostring(v14),
                Size = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextSize = DeviceUtil.isSmallScreen() and 12 or 20
            }) };
        local v40 = {
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY
        };
        local image = getItemMeta(TeamUpgradeUtil.TEAM_UPGRADE_RESOURCE).image;
        v40.Image = image == nil and "" or image;
        v40.BackgroundTransparency = 1;
        v40.ScaleType = "Fit";
        v40.LayoutOrder = 1;
        v39[#v39 + 1] = u3.createElement("ImageLabel", v40);
        v37 = u3.createFragment({
            ["Cost Info"] = u3.createElement(Empty, v38, v39)
        });
    end;

    local v41 = {
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.275 or 0.245),
        Position = UDim2.fromScale(0, 1),
        AnchorPoint = Vector2.new(0, 1)
    };
    local v42 = {};
    local v43 = #v42;

    if v37 then
        v42[v43 + 1] = v37;
    end;

    local _ = #v42;
    v42["Purchase Button"] = u3.createElement(TeamUpgradeButton, {
        FrameProps = {
            LayoutOrder = 4,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.55),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1)
        },

        Purchased = function() -- Line: 269, Name: Purchased
            -- upvalues: u7 (copy)
            u7.Selected(u7.TeamUpgrade);
        end,

        TeamUpgrade = u7.TeamUpgrade,
        CurrentTier = u7.CurrentTier,
        ObservedInventory = u7.ObservedInventory,
        IsHomeBase = u7.IsHomeBase
    });
    v18.PurchaseSection = u3.createElement(Empty, v41, v42);
    v16.Content = u3.createElement(Empty, v17, v18);

    return u3.createFragment({
        [u7.TeamUpgrade .. "_Card"] = u3.createElement("Frame", v15, v16)
    });
end);

return {
    TeamUpgradeCard = v5.connect(function(p45, p46) -- Line: 284
        local v47 = {};

        for i, v in p46 do
            v47[i] = v;
        end;

        return v47;
    end)(v44)
};