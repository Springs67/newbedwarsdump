-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanBorderMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderMeta;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local ClanWarLeaderboardType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-leaderboard").ClanWarLeaderboardType;
local ClanWarMedalsDisplay = RuntimeLib.import(script, script.Parent.Parent, "clan-war-medals-display").ClanWarMedalsDisplay;
local u4 = GetTarmacAsset("CrownIcon");

return {
    ClanWarLeaderboardCard = v3.new(u2)(function(u5) -- Line: 16
        -- upvalues: u2 (copy), Flamework (copy), BedwarsAppIds (copy), u4 (copy), Padding (copy), ClanWarLeaderboardType (copy), ClanWarMedalsDisplay (copy), ClanBorderMeta (copy), Empty (copy), ClanWarUtils (copy)
        local v6 = {
            Size = UDim2.new(0.96, 0, 0, 100),
            BackgroundColor3 = Color3.fromRGB(47, 49, 80),

            [u2.Event.Activated] = function() -- Line: 21
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CLAN_PROFILE);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                    ClanId = u5.ClanId
                });
            end
        };
        local v7 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v8 = #v7;
        local v9;

        if u5.Placement <= 3 then
            local createFragment = u2.createFragment;
            local v10 = {};
            local createElement = u2.createElement;
            local v11 = {
                BackgroundTransparency = 1,
                Rotation = -25,
                ZIndex = 3,
                Position = UDim2.fromOffset(-10, -12),
                Size = UDim2.fromOffset(26, 20.8),
                Image = u4.Image,
                ImageRectOffset = u4.ImageRectOffset,
                ImageRectSize = u4.ImageRectSize
            };
            local v12;

            if u5.Placement == 1 then
                v12 = Color3.fromRGB(255, 192, 79);
            elseif u5.Placement == 2 then
                v12 = Color3.fromRGB(229, 206, 172);
            else
                v12 = Color3.fromRGB(255, 142, 80);
            end;

            v11.ImageColor3 = v12;
            v10.CrownIcon = createElement("ImageLabel", v11);
            v9 = createFragment(v10);
        else
            v9 = nil;
        end;

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local v13 = {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0)
        };
        local v14 = {
            u2.createElement(Padding, {
                Padding = {
                    Vertical = 6,
                    Horizontal = 12
                }
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            PlacementSquare = u2.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.1, 1),
                BackgroundColor3 = Color3.fromRGB(38, 38, 64)
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }),
                PlacementText = u2.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = tostring(u5.Placement),
                    Size = UDim2.fromScale(0.45, 0.45),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            })
        };
        local v15 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.15, 1)
        };
        local v16 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local _ = #v16;
        local v17 = u5.ClanWarLeaderboardType == ClanWarLeaderboardType.WEEKLY;

        if v17 then
            local v18 = {
                Medals = u5.Medals
            };
            local v19 = {
                Size = UDim2.fromScale(0.8, 0.25)
            };
            local Border = u5.Border;
            local v20;

            if Border == 0 or (Border ~= Border or not Border) then
                v20 = UDim2.fromScale(1, 0.95);
            else
                v20 = UDim2.fromScale(1.1, 0.85);
            end;

            v19.Position = v20;
            local Border2 = u5.Border;
            local v21;

            if Border2 == 0 or (Border2 ~= Border2 or not Border2) then
                v21 = Vector2.new(1, 1);
            else
                v21 = Vector2.new(1, 0);
            end;

            v19.AnchorPoint = v21;
            v19.ZIndex = 15;
            v18.FrameProps = v19;
            v17 = u2.createElement(ClanWarMedalsDisplay, v18);
        end;

        local v22 = {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            ZIndex = 5,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            Image = u5.Icon,
            AnchorPoint = Vector2.new(0.5, 0.5)
        };
        local v23 = {};
        local v24 = #v23;

        if v17 then
            v23[v24 + 1] = v17;
        end;

        v16.ClanIcon = u2.createElement("ImageLabel", v22, v23);
        local v25 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit
        };
        local Border = u5.Border;
        local v26;

        if Border == 0 or (Border ~= Border or not Border) then
            v26 = nil;
        else
            v26 = ClanBorderMeta[u5.Border].borderImage;
        end;

        v25.Image = v26;
        v25.ZIndex = 10;
        v16.ClanEmblemBorder = u2.createElement("ImageLabel", v25);
        v14[#v14 + 1] = u2.createElement(Empty, v15, v16);
        v14.ClanIdentity = u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.2, 1)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }),
            ClanName = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 18,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 16),
                Text = u5.Name,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }),
            ClanTag = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                TextSize = 14,
                TextTransparency = 0.3,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 10),
                Text = "[" .. u5.Tag .. "]",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        });
        local v27 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.45, 0.6)
        };
        local v28 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Right",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 7)
            }) };
        local v29 = #v28;
        local v30;

        if u5.Division == nil then
            v30 = false;
        else
            v30 = u2.createFragment({
                Score = u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    SizeConstraint = "RelativeYY",
                    TextXAlignment = "Right",
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 1),
                    Text = "Division " .. tostring(u5.Division),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            });
        end;

        if v30 then
            v28[v29 + 1] = v30;
        end;

        local v31;

        if u5.ClanWarLeaderboardType == ClanWarLeaderboardType.WEEKLY then
            v31 = u2.createFragment({
                TrophyIcon = u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.5),
                    Image = ClanWarUtils.CLAN_WAR_POINT_ICON,
                    ScaleType = Enum.ScaleType.Fit
                })
            });
        else
            v31 = u2.createElement(ClanWarMedalsDisplay, {
                Medals = u5.Medals
            });
        end;

        v28[#v28 + 1] = v31;
        local _ = #v28;
        v28.Score = u2.createElement("TextLabel", {
            AutomaticSize = "X",
            SizeConstraint = "RelativeYY",
            TextXAlignment = "Right",
            TextSize = 14,
            BackgroundTransparency = 1,
            LayoutOrder = 30,
            Size = UDim2.fromScale(0, 1),
            Text = tostring(u5.Score),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        });
        v14.ClanStats = u2.createElement(Empty, v27, v28);
        v7[#v7 + 1] = u2.createElement(Empty, v13, v14);

        return u2.createFragment({
            ClanSearchListingCard = u2.createElement("ImageButton", v6, v7)
        });
    end)
};