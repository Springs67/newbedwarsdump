-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LobbyPerformancePopupPage = v2.new(u1)(function(p3, p4) -- Line: 12
        -- upvalues: BedwarsKit (copy), BedwarsKitMeta (copy), Theme (copy), u1 (copy), Empty (copy), QueueMeta (copy), BedwarsImageId (copy), BattlePassUtils (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = p3.MatchInfo.Kit == BedwarsKit.NONE and "" or " while playing as " .. BedwarsKitMeta[p3.MatchInfo.Kit].name;

        local function v12(p6, p7, p8, p9) -- Line: 16
            -- upvalues: Theme (ref), u1 (ref)
            local v10 = p9 % 2;
            local v11;

            if v10 == 0 or (v10 ~= v10 or not v10) then
                v11 = Theme.backgroundTertiary;
            else
                v11 = Theme.backgroundSecondary;
            end;

            return u1.createFragment({
                [p7 .. "_Row"] = u1.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 0.19),
                    BackgroundColor3 = v11,
                    LayoutOrder = p9
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        SortOrder = "LayoutOrder",
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0.05, 0.05)
                    }),
                    [p7 .. "_Icon"] = u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        LayoutOrder = 0,
                        Size = UDim2.fromScale(0.95, 0.95),
                        SizeConstraint = Enum.SizeConstraint.RelativeYY,
                        Image = p6,
                        ScaleType = Enum.ScaleType.Fit
                    }),
                    [p7 .. "_Label"] = u1.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(0.5, 0.6),
                        Text = p7,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Font = Enum.Font.ArialBold,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    [p7 .. "_Earned"] = u1.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.25, 0.6),
                        Text = p8,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Font = Enum.Font.Arial,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            });
        end;

        return u1.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.9)
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.015, 0),
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }),
            ImageWrapper = u1.createElement("Frame", {
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.38, 0.3)
            }, {
                Image = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsKitMeta[p3.MatchInfo.Kit].renderImage,
                    ScaleType = Enum.ScaleType.Fit
                })
            }),
            Textbox = u1.createElement("Frame", {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.95, 0.65),
                BackgroundColor3 = Theme.backgroundPrimary
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                TextWrapper = u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.9, 0.9),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                }, {
                    u1.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder",
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }),
                    u1.createElement("TextLabel", {
                        RichText = true,
                        LineHeight = 1.05,
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.15),
                        Text = "Your performance was finalized from a " .. QueueMeta[p3.MatchInfo.QueueType].title .. " match you left" .. v5 .. ".",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Font = Enum.Font.Arial,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    u1.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.9, 0.05)
                    }),
                    u1.createElement(Empty, {
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 0.8)
                    }, {
                        u1.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = "LayoutOrder",
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }),
                        v12(BedwarsImageId.BED_COIN_ICON, "BedCoins", tostring(p3.Earned.BedCoins), 1),
                        v12(BattlePassUtils.BATTLE_PASS_SEASON_ICON, "Battlepass XP", tostring(p3.Earned.BattlepassXp), 2),
                        v12(BedwarsImageId.STAR_SOLID, "Player Level XP", tostring(p3.Earned.PlayerLevelXp), 3),
                        v12(BedwarsImageId.CLAN_CP_COIN, "Clan Contribution", tostring(p3.Earned.ClanContribution), 4),
                        v12(BedwarsImageId.STAR_SOLID, "Armor Trim XP", tostring(p3.Earned.ArmorTrimXp), 5)
                    })
                })
            })
        });
    end)
};