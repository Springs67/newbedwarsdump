-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta");
local getSortedTeamUpgrades = v5.getSortedTeamUpgrades;
local getTeamUpgradeDefinition = v5.getTeamUpgradeDefinition;
local v23 = v3.new(u2)(function(u6, p7) -- Line: 12
    -- upvalues: getSortedTeamUpgrades (copy), getTeamUpgradeDefinition (copy), u2 (copy), Empty (copy), ColorUtil (copy)
    local _ = p7.useState;
    local _ = p7.useEffect;
    local v8 = getSortedTeamUpgrades();

    local function v14(p9) -- Line: 16
        -- upvalues: u6 (copy), getTeamUpgradeDefinition (ref)
        local v10 = 0;

        if u6.TeamUpgrades and u6.TeamUpgrades[p9] ~= nil then
            local v11 = u6.TeamUpgrades[p9];
            v10 = v11 == nil and 0 or v11;
        end;

        local v12 = {
            stat = p9
        };
        local v13 = getTeamUpgradeDefinition(p9);

        if v13 ~= nil then
            v13 = v13.icon;
        end;

        v12.icon = v13;
        v12.level = v10;

        return v12;
    end;

    local u15 = table.create(#v8);

    for i, v in v8 do
        u15[i] = v14(v, i - 1, v8);
    end;

    local v16 = {
        ZIndex = 5
    };
    local FrameProps = u6.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v16[i] = v;
        end;
    end;

    local function v19(p17, p18) -- Line: 61
        -- upvalues: u2 (ref), Empty (ref), u15 (copy), ColorUtil (ref), u6 (copy)
        return u2.createFragment({
            StatUpgradeTabDisplay = u2.createElement(Empty, {
                Size = UDim2.fromScale(1 / #u15 - 0.03, 0.9)
            }, {
                StatUpgradeTabIcon = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 61,
                    Size = UDim2.fromScale(0.75, 0.75),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = p17.icon,
                    ImageColor3 = ColorUtil.WHITE,
                    ImageTransparency = u6.Eliminated == true and 0.75 or 0.15,
                    LayoutOrder = p18
                }, {
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }),
                    u2.createElement("UIGradient", {
                        Rotation = 45,
                        Color = ColorSequence.new(Color3.fromRGB(213, 217, 229), Color3.fromRGB(189, 191, 201)),
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
                    }),
                    StatUpgradeTabLevel = u2.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 62,
                        Size = UDim2.fromScale(0.5, 1),
                        AnchorPoint = Vector2.new(1, 1),
                        Position = UDim2.fromScale(1, 1.2),
                        Text = "<b>" .. tostring(p17.level) .. "</b>",
                        Font = Enum.Font.SourceSans,
                        TextColor3 = ColorUtil.WHITE,
                        TextTransparency = u6.Eliminated == true and 0.6 or 0,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextYAlignment = Enum.TextYAlignment.Bottom
                    })
                })
            })
        });
    end;

    local v20 = table.create(#u15);

    for i, v in u15 do
        v20[i] = v19(v, i - 1, u15);
    end;

    local v21 = { u2.createElement("UIListLayout", {
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Center",
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.03, 0)
        }), u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.03, 0)
        }) };
    local v22 = #v21;

    for i, v in v20 do
        v21[v22 + i] = v;
    end;

    return u2.createElement(Empty, v16, v21);
end);

return {
    TeamUpgradeDisplay = v4.connect(function(p24, p25) -- Line: 132
        local v26 = {};

        for i, v in p25 do
            v26[i] = v;
        end;

        v26.TeamUpgrades = p24.Bedwars.teamUpgrades[p25.Team.id];

        return v26;
    end)(v23)
};