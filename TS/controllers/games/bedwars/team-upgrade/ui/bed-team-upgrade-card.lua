-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedTeamUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade;
local getBedTeamUpgradeDefinition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-util").getBedTeamUpgradeDefinition;
local TeamUpgradeTheme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-theme").TeamUpgradeTheme;
local TeamUpgradeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-util").TeamUpgradeUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v26 = v3.new(u2)(function(u5, p6) -- Line: 22
    -- upvalues: u2 (copy), getBedTeamUpgradeDefinition (copy), BedPlatingUtil (copy), TeamUpgradeUtil (copy), TeamUpgradeTheme (copy), DeviceUtil (copy), BedTeamUpgrade (copy), KnitClient (copy), Theme (copy), Empty (copy), SoundManager (copy), GameSound (copy), getItemMeta (copy), ColorUtil (copy), Countdown (copy), Button (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7 = u2.createRef();
    local v8 = getBedTeamUpgradeDefinition(u5.BedTeamUpgrade);

    if not v8 then
        return u2.createFragment();
    end;

    local v9, u10 = useState(nil);
    local cost = v8.cost;
    local Purchased = u5.Purchased;
    local v11 = u5.BedStatus == BedPlatingUtil.BedStatus.BED_BROKEN;
    local v12 = not TeamUpgradeUtil.hasEnoughForBedTeamUpgrade(u5.ObservedInventory, u5.BedTeamUpgrade, u5.IsHomeBase);
    local u13 = true;
    local v14 = "";
    local success = TeamUpgradeTheme.success;

    if Purchased then
        success = TeamUpgradeTheme.disabled;
    elseif v11 then
        success = TeamUpgradeTheme.disabled;
        v14 = "Cannot Purchase";
        u13 = false;
    elseif v12 then
        v14 = "Not Enough - " .. tostring(cost);
        success = TeamUpgradeTheme.error;
        u13 = false;
    end;

    useEffect(function() -- Line: 51
        -- upvalues: DeviceUtil (ref), u5 (copy), BedTeamUpgrade (ref), KnitClient (ref), u10 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        if u5.BedTeamUpgrade == BedTeamUpgrade.BED_SHIELD then
            u10((KnitClient.Controllers.BedShieldUpgradeController:getLocalBedShieldTimer()));
        end;
    end, { u5.Purchased });
    useEffect(function() -- Line: 60
    end, { v9 });
    local v15 = {
        [u2.Ref] = v7,
        BorderSizePixel = 0,
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local FrameProps = u5.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v15[i] = v;
        end;
    end;

    local v16 = {
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.08, 0)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }),
        ["Upgrade Info"] = u2.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.65),
            Position = UDim2.fromScale(0, 0.05)
        }, {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.015, 0),
                PaddingBottom = UDim.new(0.025, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.08, 0)
            }),
            UpgradeIcon = u2.createElement("ImageLabel", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Selectable = true,
                Size = UDim2.fromScale(0.8, 1),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0),
                Image = v8.icon,
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ScaleType = Enum.ScaleType.Fit
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            ["Text Content"] = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.75, 0.9)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 0)
                }),
                u2.createElement("TextLabel", {
                    LayoutOrder = 1,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>" .. v8.name .. "</b>",
                    Size = UDim2.fromScale(1, 0.4),
                    BackgroundColor3 = Theme.backgroundTertiary,
                    Font = Enum.Font.Roboto,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left
                }),
                Description = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    RichText = true,
                    TextScaled = true,
                    TextWrapped = true,
                    TextTransparency = 0.22,
                    LayoutOrder = 2,
                    Text = v8.description,
                    Size = UDim2.fromScale(1, 0.6),
                    Font = Enum.Font.Roboto,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            })
        })
    };
    local _ = #v16;
    local v17 = {
        LayoutOrder = 2,
        Selectable = true,
        Size = UDim2.fromScale(1, 0.35),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = success,
        BackgroundTransparency = Purchased and 0.1 or 0,
        CornerRadius = UDim.new(0.15),

        OnClick = function() -- Line: 168, Name: OnClick
            -- upvalues: SoundManager (ref), GameSound (ref), u13 (ref), Purchased (copy), u5 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);

            if u13 and not Purchased then
                u5.AttemptPurchase(u5.BedTeamUpgrade);
            end;
        end
    };
    local v18 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.2, 0)
        }) };
    local v19 = not Purchased and (v12 or u13);

    if v19 then
        local v20 = {
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY
        };
        local image = getItemMeta(TeamUpgradeUtil.TEAM_UPGRADE_RESOURCE).image;
        v20.Image = image == nil and "" or image;
        v20.BackgroundTransparency = 1;
        v20.LayoutOrder = 2;
        v19 = u2.createElement("ImageLabel", v20, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end;

    local v21 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v22 = {};
    local v23 = u2.createElement("UIListLayout", {
        FillDirection = "Horizontal",
        HorizontalAlignment = "Center",
        VerticalAlignment = "Center",
        SortOrder = "LayoutOrder",
        Padding = UDim.new(0, 0)
    });
    local v24;

    if u13 then
        if Purchased then
            if v9 == 0 or (v9 ~= v9 or not v9) then
                v24 = u2.createElement("TextLabel", {
                    Text = "Bed Alarm Active",
                    AutomaticSize = "X",
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextWrapped = true,
                    TextTransparency = 0.3,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.8, 0.7),
                    AnchorPoint = Vector2.new(0, 0),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Regular),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextSize = DeviceUtil.isSmallScreen() and 12 or 20
                });
            else
                v24 = u2.createElement(Countdown, {
                    UseOsClock = true,
                    OnCompleteText = "Bed Shield Expiring...",
                    DisableHideOnComplete = true,
                    EndTime = v9,
                    CountdownConfig = {
                        days = false,
                        hours = false,
                        minutes = true,
                        seconds = true,
                        disablePadding = false,
                        seperator = ":"
                    },
                    PreText = v9 - os.clock() > 0 and "Remaining Time: " or "",
                    TextLabel = {
                        TextTransparency = 0.22,
                        Size = UDim2.fromScale(0.8, 0.7),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Regular),
                        TextColor3 = ColorUtil.WHITE
                    }
                });
            end;
        else
            v24 = u2.createElement("TextLabel", {
                AutomaticSize = "X",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextWrapped = true,
                LayoutOrder = 1,
                Text = tostring(cost),
                Size = UDim2.fromScale(0.2, 1),
                AnchorPoint = Vector2.new(0, 0),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextSize = DeviceUtil.isSmallScreen() and 12 or 20
            });
        end;
    else
        v24 = u2.createElement("TextLabel", {
            AutomaticSize = "X",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextWrapped = true,
            TextTransparency = 0.15,
            LayoutOrder = 1,
            Text = string.upper(v14),
            Size = UDim2.fromScale(0.5, 0.7),
            AnchorPoint = Vector2.new(0, 0),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextSize = DeviceUtil.isSmallScreen() and 12 or 20
        });
    end;

    v22[1], v22[2] = v23, v24;
    local v25 = #v22;

    if v19 then
        v22[v25 + 1] = v19;
    end;

    v18[#v18 + 1] = u2.createElement(Empty, v21, v22);
    v16["Cost Bar"] = u2.createElement(Button, v17, v18);

    return u2.createFragment({
        [u5.BedTeamUpgrade .. "_Card"] = u2.createElement("Frame", v15, v16)
    });
end);

return {
    BedTeamUpgradeCard = v4.connect(function(p27, p28) -- Line: 293
        local v29 = {};

        for i, v in p28 do
            v29[i] = v;
        end;

        return v29;
    end)(v26)
};