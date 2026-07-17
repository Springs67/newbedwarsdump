-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local LineFrame = v1.LineFrame;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local FlamethrowerUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
local PyroUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local FlamethrowerTierCard = RuntimeLib.import(script, script.Parent, "flamethrower-tier-card").FlamethrowerTierCard;
local u3 = GetTarmacAsset("CloseIcon");
local v4 = u2.Component:extend("FlamethrowerComponent");

function v4.init(p5, p6) -- Line: 18
    -- upvalues: PyroUtil (copy)
    p5:setState({
        upgrades = not p6.tool and {} or PyroUtil.getUpgradesFromFlamethrower(p6.tool)
    });
end;

function v4.onClose(p7) -- Line: 23
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.FLAMETHROWER_UPGRADES);
end;

function v4.render(u8) -- Line: 26
    -- upvalues: MapUtil (copy), u2 (copy), ColorUtil (copy), u3 (copy), LineFrame (copy), FlamethrowerTierCard (copy), FlamethrowerUpgrade (copy)
    local function _(p9) -- Line: 33
        return p9 >= 3;
    end;

    local function v11(p10) -- Line: 27
        -- upvalues: u8 (copy)
        u8:setState({
            upgrades = p10
        });
    end;

    local v12 = nil;

    for i, v in MapUtil.values(u8.state.upgrades) do
        local _ = i - 1;

        if v >= 3 == true then
            v12 = v;
            break;
        end;
    end;

    local v13 = v12 ~= nil;

    return u2.createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6)
    }, { u2.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder"
            }
        ), u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.0729559748427673)
        }, { u2.createElement("TextLabel", {
                Font = "RobotoCondensed",
                Text = "Flamethrower Upgrades",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Bottom",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.4, 0.9),
                Position = UDim2.fromScale(0, 0),
                TextColor3 = ColorUtil.WHITE
            }), u2.createElement("TextButton", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -15, 0.5, -2),
                Size = UDim2.fromOffset(28, 28),
                BackgroundTransparency = 0.7,
                BackgroundColor3 = ColorUtil.BLACK,
                Text = "",

                [u2.Event.Activated] = function() -- Line: 80
                    -- upvalues: u8 (copy)
                    return u8:onClose();
                end
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromOffset(10, 10),
                    Image = u3.Image,
                    ImageRectOffset = u3.ImageRectOffset,
                    ImageRectSize = u3.ImageRectSize
                }) }) }), u2.createElement("Frame", {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.9270440251572327),
            BackgroundColor3 = ColorUtil.hexColor(0)
        }, { u2.createElement(LineFrame, {
                BorderWidthPixels = 2,
                Size = UDim2.fromScale(1, 1),
                BorderColor3 = ColorUtil.WHITE
            }, {
                u2.createElement("ImageLabel", {
                    Image = "rbxassetid://7286588591",
                    BackgroundTransparency = 1,
                    ScaleType = "Fit",
                    Size = UDim2.fromScale(1.85, 1.85),
                    Position = UDim2.fromScale(0.5, 0.4),
                    AnchorPoint = Vector2.new(0.5, 0.4)
                }),
                u2.createElement(FlamethrowerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.5953405017921147, 0.04748982360922659),
                    Upgrade = FlamethrowerUpgrade.HEAT,
                    SetUpgrades = v11,
                    Locked = v13,
                    UpgradeMap = u8.state.upgrades
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://7287862213",
                    ScaleType = "Fit",
                    Position = UDim2.fromScale(0.7168458781362007, 0.29850746268656714),
                    Size = UDim2.fromScale(0.06164874551971326, 0.10990502035278155)
                }),
                u2.createElement(FlamethrowerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.1867383512544803, 0.7055630936227951),
                    Upgrade = FlamethrowerUpgrade.RANGE,
                    SetUpgrades = v11,
                    Locked = v13,
                    UpgradeMap = u8.state.upgrades
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://7292733307",
                    ScaleType = "Fit",
                    Position = UDim2.fromScale(0.30824372759856633, 0.6241519674355496),
                    Size = UDim2.fromScale(0.08028673835125448, 0.09905020352781546)
                }),
                u2.createElement(FlamethrowerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.13010752688172045, 0.04748982360922659),
                    Upgrade = FlamethrowerUpgrade.POWER,
                    SetUpgrades = v11,
                    Locked = v13,
                    UpgradeMap = u8.state.upgrades
                }),
                u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://7292841146",
                    ScaleType = "Fit",
                    Position = UDim2.fromScale(0.21505376344086022, 0.29850746268656714),
                    Size = UDim2.fromScale(0.03655913978494624, 0.07462686567164178)
                }),
                u2.createElement("TextLabel", {
                    Font = "RobotoCondensed",
                    Text = "*You can only upgrade one component to Tier 4.",
                    TextScaled = true,
                    TextXAlignment = "Right",
                    TextYAlignment = "Bottom",
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.6702508960573477, 0.9430122116689281),
                    Size = UDim2.fromScale(0.3154121863799283, 0.037991858887381276),
                    TextColor3 = ColorUtil.WHITE
                })
            }) }) });
end;

return {
    FlamethrowerComponent = v4
};