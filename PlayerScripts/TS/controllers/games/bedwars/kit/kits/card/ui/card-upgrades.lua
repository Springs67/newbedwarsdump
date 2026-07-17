-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local CardUpgrades = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgrades;
local u5 = Color3.fromHex("F7F9F1");
local u6 = Color3.fromHex("A26318");
local u7 = Color3.fromHex("45361A");
local v23 = v3.new(u2)(function(u8, p9) -- Line: 17
    -- upvalues: u2 (copy), DarkBackground (copy), DeviceUtil (copy), ColorUtil (copy), CardUpgrades (copy), u6 (copy), u5 (copy), u7 (copy), SlideIn (copy)
    local _ = p9.useState;
    p9.useEffect(function() -- Line: 20
    end, {});
    local v10 = { u2.createElement(DarkBackground, {
            AppId = u8.AppId
        }) };
    local v11 = {};
    local v12 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.45)
    };
    local v13;

    if DeviceUtil.isSmallScreen() then
        v13 = UDim2.fromScale(0.7, 0.7);
    else
        v13 = UDim2.fromScale(0.7, 0.7);
    end;

    v12.Size = v13;
    local v14 = {
        u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.9878640776699028
        }),
        CardUpgradeText = u2.createElement("TextLabel", {
            Text = "<b>Current Upgrades</b>",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.08),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0),
            Font = Enum.Font.Roboto,
            TextColor3 = ColorUtil.WHITE,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        })
    };
    local _ = #v14;
    local v15 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Size = UDim2.fromScale(0.8, 0.7),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v16 = {};
    local v17 = #v16;

    for i, v in (function() -- Line: 64
        -- upvalues: u8 (copy), CardUpgrades (ref), u2 (ref), u6 (ref), u5 (ref), ColorUtil (ref), u7 (ref)
        local v18 = false;
        local v19 = 0;
        local v20 = {};

        while true do
            if v18 then
                v19 = v19 + 1;
            else
                v18 = true;
            end;

            if v19 >= #u8.cardUpgrades then
                return v20;
            end;

            local v21 = CardUpgrades[u8.cardUpgrades[v19 + 1]];
            local v22 = u2.createFragment({
                ["Card" .. tostring(v19)] = u2.createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    Transparency = 0,
                    Size = UDim2.fromScale(0.3, 1),
                    BackgroundColor3 = u6
                }, {
                    ["CardBase" .. tostring(v19)] = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        Transparency = 0,
                        Size = UDim2.fromScale(0.9, 0.9),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundColor3 = u5
                    }, {
                        ["CardImageContainer" .. tostring(v19)] = u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://13754981872",
                            Size = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.3),
                            ScaleType = Enum.ScaleType.Fit
                        }, {
                            ["CardImage" .. tostring(v19)] = u2.createElement("ImageLabel", {
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(0.8, 0.8),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Image = v21.image,
                                ImageColor3 = v21.color or u6,
                                ScaleType = Enum.ScaleType.Fit
                            })
                        }),
                        ["CardInfo" .. tostring(v19)] = u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            Image = "rbxassetid://13754981985",
                            Size = UDim2.fromScale(0.95, 0.4),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.78)
                        }, {
                            ["CardTitle" .. tostring(v19)] = u2.createElement("Frame", {
                                Size = UDim2.fromScale(0.9, 0.25),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.2),
                                BackgroundColor3 = u6
                            }, { u2.createElement("TextLabel", {
                                    RichText = true,
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromScale(0.9, 0.8),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    Text = "<b>" .. v21.title .. "</b>",
                                    Font = Enum.Font.Roboto,
                                    TextColor3 = ColorUtil.WHITE,
                                    TextXAlignment = Enum.TextXAlignment.Center,
                                    TextYAlignment = Enum.TextYAlignment.Center
                                }), u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, 10)
                                }) }),
                            ["CardDescription" .. tostring(v19)] = u2.createElement("TextLabel", {
                                RichText = true,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(0.9, 0.55),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.65),
                                Text = "<b>" .. v21.description .. "</b>",
                                Font = Enum.Font.Roboto,
                                TextColor3 = u7,
                                TextXAlignment = Enum.TextXAlignment.Center,
                                TextYAlignment = Enum.TextYAlignment.Center
                            })
                        })
                    }),
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 10)
                    })
                })
            });
            table.insert(v20, v22);
        end;
    end)() do
        v16[v17 + i] = v;
    end;

    v16[#v16 + 1] = u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.05)
    });
    v14.CardContainer = u2.createElement("Frame", v15, v16);
    v11[#v11 + 1] = u2.createElement("Frame", v12, v14);
    v10[#v10 + 1] = u2.createElement(SlideIn, {}, v11);

    return u2.createFragment({
        CardUpgrades = u2.createElement("ScreenGui", {}, v10)
    });
end);

return {
    CardUpgradesApp = v4.connect(function(p24, p25) -- Line: 183
        local v26 = {};

        for i, v in p25 do
            v26[i] = v;
        end;

        v26.cardUpgrades = p24.Kit.cardUpgrades;

        return v26;
    end)(v23)
};