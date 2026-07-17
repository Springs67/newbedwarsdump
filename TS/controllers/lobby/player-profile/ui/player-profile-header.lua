-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AchievementIcon = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BadgeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType;
local TitleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local PlayerLevelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local UserInputType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType;
local LobbyTitle = RuntimeLib.import(script, script.Parent.Parent.Parent, "title", "ui", "lobby-title").LobbyTitle;

return {
    PlayerProfileHeader = v3.new(u2)(function(u4, p5) -- Line: 20
        -- upvalues: TitleType (copy), BadgeType (copy), UserInputType (copy), BedwarsImageId (copy), Theme (copy), u2 (copy), DeviceUtil (copy), ColorUtil (copy), PlayerLevelUtil (copy), AchievementIcon (copy), LobbyTitle (copy), Flamework (copy), BedwarsAppIds (copy), TweenService (copy), Empty (copy)
        local _ = p5.useState;
        local ProfileData = u4.ProfileData;

        if ProfileData ~= nil then
            ProfileData = ProfileData.userId;
        end;

        local v6 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(ProfileData) .. "&w=150&h=150";
        local ProfileData2 = u4.ProfileData;

        if ProfileData2 ~= nil then
            ProfileData2 = ProfileData2.level;
        end;

        local ProfileData3 = u4.ProfileData;

        if ProfileData3 ~= nil then
            ProfileData3 = ProfileData3.equipped.selectedTitle;
        end;

        if ProfileData3 == nil then
            ProfileData3 = TitleType.NONE;
        end;

        local ProfileData4 = u4.ProfileData;

        if ProfileData4 ~= nil then
            ProfileData4 = ProfileData4.name;
        end;

        local ProfileData5 = u4.ProfileData;

        if ProfileData5 ~= nil then
            ProfileData5 = ProfileData5.region;
        end;

        local ProfileData6 = u4.ProfileData;

        if ProfileData6 ~= nil then
            ProfileData6 = ProfileData6.platform;
        end;

        local ProfileData7 = u4.ProfileData;

        if ProfileData7 ~= nil then
            ProfileData7 = ProfileData7.equipped.featuredBadges[1];
        end;

        local v7;

        if ProfileData7 == BadgeType.NONE then
            v7 = nil;
        else
            v7 = u4.ProfileData;

            if v7 ~= nil then
                v7 = v7.equipped.featuredBadges[1];
            end;
        end;

        local v8 = {
            [UserInputType.PC] = BedwarsImageId.PC_ICON,
            [UserInputType.GAMEPAD] = BedwarsImageId.GAMEPAD_ICON,
            [UserInputType.MOBILE] = BedwarsImageId.MOBILE_ICON
        };
        local v9 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundSecondary
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v9[i] = v;
            end;
        end;

        local v10 = { u2.createElement("ImageLabel", {
                Image = "rbxassetid://71356717298935",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Crop
            }) };
        local v11 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v12 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                Padding = UDim.new(0.02, 0)
            }),
            AvatarImage = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.2, 0.95),
                Image = v6,
                ScaleType = Enum.ScaleType.Fit
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        };
        local _ = #v12;
        local v13 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.45 or 0.41, 1)
        };
        local v14 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.05, 0)
            }) };
        local v15 = #v14;
        local v16 = {
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 0.25),
            AutomaticSize = Enum.AutomaticSize.X
        };
        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.05, 0)
            }) };
        local v18 = #v17;
        local v19;

        if ProfileData2 == nil then
            v19 = false;
        else
            v19 = u2.createFragment({
                Level = u2.createElement("Frame", {
                    LayoutOrder = 0,
                    BackgroundTransparency = 0.7,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 8),
                        PaddingRight = UDim.new(0, 8),
                        PaddingTop = UDim.new(0, 1)
                    }), u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Text = "Lv. " .. tostring(ProfileData2),
                        TextColor3 = PlayerLevelUtil.getLevelColor(ProfileData2),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.5),
                        Size = UDim2.fromScale(0, 0.7),
                        AutomaticSize = Enum.AutomaticSize.X,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.4, 0)
                    }) })
            });
        end;

        if v19 then
            v17[v18 + 1] = v19;
        end;

        local v20 = #v17;
        local v21;

        if v7 == nil then
            v21 = false;
        else
            v21 = u2.createElement(AchievementIcon, {
                Darkened = false,
                Simple = true,
                ShowTooltip = true,
                Id = v7
            });
        end;

        if v21 then
            v17[v20 + 1] = v21;
        end;

        v14[v15 + 1] = u2.createElement("Frame", v16, v17);
        v14.Title = u2.createElement("Frame", {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.25 or 0.17),
            Visible = ProfileData3 ~= TitleType.NONE
        }, { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5)
            }), u2.createElement(LobbyTitle, {
                TitleType = ProfileData3,
                TextLabelProps = {
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X
                }
            }) });
        local v22 = {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.25 or 0.2)
        };
        local v23 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }),
            Name = u2.createElement("TextLabel", {
                TextScaled = true,
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = ProfileData4 == nil and "" or ProfileData4,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        };
        local _ = #v23;
        local v24 = {};
        local v25;

        if ProfileData6 then
            v25 = v8[ProfileData6];
        else
            v25 = nil;
        end;

        v24.Image = v25;
        v24.Size = UDim2.fromScale(1, 1);
        v24.BackgroundTransparency = 1;
        v24.ImageTransparency = 0.4;
        v24.LayoutOrder = 1;
        v24.ScaleType = Enum.ScaleType.Fit;
        v24.Visible = ProfileData6 ~= nil;
        v23.Platform = u2.createElement("ImageLabel", v24, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v23.RegionIcon = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0.4,
            LayoutOrder = 2,
            Image = BedwarsImageId.SERVER_ICON,
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
            Visible = ProfileData5 ~= nil
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v23.Region = u2.createElement("TextLabel", {
            TextScaled = true,
            TextTransparency = 0.4,
            LayoutOrder = 3,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            Text = ProfileData5,
            TextColor3 = ColorUtil.WHITE,
            Visible = ProfileData5 ~= nil
        });
        v14[v15 + 2] = u2.createElement("Frame", v22, v23);
        v12.PlayerInfo = u2.createElement("Frame", v13, v14);
        local v26 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.32, 0.9)
        };
        local v27 = {};
        local v28 = {
            BackgroundTransparency = 0.4,
            Size = UDim2.fromScale(0.9, DeviceUtil.isSmallScreen() and 0.66 or 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local ProfileData8 = u4.ProfileData;

        if ProfileData8 ~= nil then
            ProfileData8 = ProfileData8.clan;
        end;

        v28.Visible = ProfileData8 ~= nil;
        local v29 = {};
        local v30 = #v29;
        local v31 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v32 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local _ = #v32;
        local v33 = {};
        local ProfileData9 = u4.ProfileData;

        if ProfileData9 ~= nil then
            ProfileData9 = ProfileData9.clan;

            if ProfileData9 ~= nil then
                ProfileData9 = ProfileData9.image;
            end;
        end;

        v33.Image = ProfileData9;
        v33.Size = UDim2.fromScale(0.5, 0.9);
        v33.ScaleType = Enum.ScaleType.Fit;
        v33.BackgroundTransparency = 1;
        v33.LayoutOrder = 0;
        v32.ClanIcon = u2.createElement("ImageLabel", v33, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v34 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.49, 0.45)
        };
        local v35 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.1, 0)
            }) };
        local _ = #v35;
        local v36 = {
            Size = UDim2.fromScale(1, 0.5)
        };
        local ProfileData10 = u4.ProfileData;

        if ProfileData10 ~= nil then
            ProfileData10 = ProfileData10.clan;

            if ProfileData10 ~= nil then
                ProfileData10 = ProfileData10.name;
            end;
        end;

        v36.Text = ProfileData10;
        v36.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v36.TextColor3 = Theme.textPrimary;
        v36.TextScaled = true;
        v36.TextXAlignment = Enum.TextXAlignment.Left;
        v36.BackgroundTransparency = 1;
        v36.LayoutOrder = 0;
        v35.ClanName = u2.createElement("TextLabel", v36);
        local v37 = {
            Size = UDim2.fromScale(1, 0.5)
        };
        local ProfileData11 = u4.ProfileData;

        if ProfileData11 ~= nil then
            ProfileData11 = ProfileData11.clan;

            if ProfileData11 ~= nil then
                ProfileData11 = ProfileData11.tag;
            end;
        end;

        v37.Text = "[" .. tostring(ProfileData11) .. "]";
        v37.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v37.TextColor3 = Theme.textSecondary;
        v37.TextScaled = true;
        v37.TextXAlignment = Enum.TextXAlignment.Left;
        v37.BackgroundTransparency = 1;
        v37.LayoutOrder = 1;
        v35.ClanTag = u2.createElement("TextLabel", v37);
        v32.ClanInfo = u2.createElement("Frame", v34, v35);
        v29[v30 + 1] = u2.createElement("Frame", v31, v32);
        local v40 = {
            Size = UDim2.fromScale(0.28, 0.28),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 5),
            Image = BedwarsImageId.EYE_SOLID,
            BackgroundTransparency = 1,
            ScaleType = Enum.ScaleType.Fit,
            ImageTransparency = 0.4,

            [u2.Event.Activated] = function() -- Line: 400
                -- upvalues: u4 (copy), Flamework (ref), BedwarsAppIds (ref)
                local ProfileData12 = u4.ProfileData;

                if ProfileData12 ~= nil then
                    ProfileData12 = ProfileData12.clan;
                end;

                if ProfileData12 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                        ClanId = u4.ProfileData.clan.id
                    });
                end;
            end,

            [u2.Event.MouseEnter] = function(p38) -- Line: 411
                -- upvalues: TweenService (ref)
                TweenService:Create(p38, TweenInfo.new(0.15), {
                    ImageTransparency = 0.2
                }):Play();
            end,

            [u2.Event.MouseLeave] = function(p39) -- Line: 416
                -- upvalues: TweenService (ref)
                TweenService:Create(p39, TweenInfo.new(0.15), {
                    ImageTransparency = 0.4
                }):Play();
            end
        };
        v29.ClanViewButton = u2.createElement("ImageButton", v40);
        v29[v30 + 2] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.2, 0)
        });
        v27[#v27 + 1] = u2.createElement("Frame", v28, v29);
        v12.Clan = u2.createElement("Frame", v26, v27);
        v10[#v10 + 1] = u2.createElement(Empty, v11, v12);

        return u2.createElement("Frame", v9, v10);
    end)
};