-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local LineFrame = v1.LineFrame;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local FrostyHammerUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade;
local FrostyHammerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local FrostyHammerTierCard = RuntimeLib.import(script, script.Parent, "frosty-hammer-tier-card").FrostyHammerTierCard;
local u3 = GetTarmacAsset("CloseIcon");
local v4 = u2.Component:extend("FrostyHammerComponent");

function v4.init(p5, p6) -- Line: 21
    -- upvalues: FrostyHammerUtil (copy), Players (copy), KnitClient (copy), BedwarsImageId (copy)
    p5:setState({
        upgrades = not p6.tool and {} or FrostyHammerUtil.getUpgradesFromHammer(Players.LocalPlayer)
    });
    local v7 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(Players.LocalPlayer);
    local v8 = {};

    if v7 ~= nil then
        v7 = v7.adetunde;

        if v7 ~= nil then
            v7 = v7.hammerRender;
        end;
    end;

    if v7 == nil then
        v7 = BedwarsImageId.ADETUNDE_HAMMER_RENDER;
    end;

    v8.hammerBackgroundImage = v7;
    p5:setState(v8);
end;

function v4.onClose(p9) -- Line: 43
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.FROSTY_HAMMER_UPGRADES);
end;

function v4.render(u10) -- Line: 46
    -- upvalues: MapUtil (copy), u2 (copy), ColorUtil (copy), u3 (copy), LineFrame (copy), FrostyHammerTierCard (copy), FrostyHammerUpgrade (copy)
    local function _(p11) -- Line: 53
        return p11 >= 3;
    end;

    local function v13(p12) -- Line: 47
        -- upvalues: u10 (copy)
        u10:setState({
            upgrades = p12
        });
    end;

    local v14 = nil;

    for i, v in MapUtil.values(u10.state.upgrades) do
        local _ = i - 1;

        if v >= 3 == true then
            v14 = v;
            break;
        end;
    end;

    local v15 = v14 ~= nil;

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
                Text = "Frosty Hammer Upgrades",
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

                [u2.Event.Activated] = function() -- Line: 100
                    -- upvalues: u10 (copy)
                    return u10:onClose();
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
                    BackgroundTransparency = 1,
                    ScaleType = "Fit",
                    Image = u10.state.hammerBackgroundImage,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.4),
                    AnchorPoint = Vector2.new(0.5, 0.4)
                }),
                u2.createElement(FrostyHammerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.5953405017921147, 0.27137042062415195),
                    Upgrade = FrostyHammerUpgrade.STRENGTH,
                    SetUpgrades = v13,
                    Locked = v15,
                    UpgradeMap = u10.state.upgrades
                }),
                u2.createElement(FrostyHammerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.22258064516129034, 0.7055630936227951),
                    Upgrade = FrostyHammerUpgrade.SPEED,
                    SetUpgrades = v13,
                    Locked = v15,
                    UpgradeMap = u10.state.upgrades
                }),
                u2.createElement(FrostyHammerTierCard, {
                    Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    Position = UDim2.fromScale(0.3093189964157706, 0.04748982360922659),
                    Upgrade = FrostyHammerUpgrade.SHIELD,
                    SetUpgrades = v13,
                    Locked = v15,
                    UpgradeMap = u10.state.upgrades
                }),
                u2.createElement("TextLabel", {
                    Font = "RobotoCondensed",
                    Text = "*You can only upgrade one component to Tier 3.",
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
    FrostyHammerComponent = v4
};