-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local CornerFiller = v1.CornerFiller;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanSearchInspectCard = v3.new(u2)(function(u4, p5) -- Line: 19
        -- upvalues: ClanPrivacySetting (copy), ClanUtil (copy), ClientStore (copy), KnitClient (copy), Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy), u2 (copy), Theme (copy), CornerFiller (copy), Empty (copy), Padding (copy), ButtonComponent (copy)
        local _ = p5.useState;
        local v6 = u4.Clan.extraData.privacySetting == ClanPrivacySetting.ANYONE_CAN_JOIN and "JOIN" or "CLOSED";
        local v7;

        if u4.Clan.extraData.emblem == "" or u4.Clan.extraData.emblem == nil then
            v7 = ClanUtil.FALLBACK_CLAN_ICON;
        else
            v7 = u4.Clan.extraData.emblem;
        end;

        local v8 = ClientStore:getState().Clans.myClanId ~= nil and true or u4.Clan.extraData.privacySetting ~= ClanPrivacySetting.ANYONE_CAN_JOIN;

        local function v10() -- Line: 24
            -- upvalues: KnitClient (ref), u4 (copy), Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref)
            KnitClient.Controllers.ClanController:requestToJoinClan(u4.Clan.clanId):andThen(function(p9) -- Line: 26
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (ref), SoundManager (ref), GameSound (ref)
                if p9.success and p9.joinedClan then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                        ClanId = u4.Clan.clanId
                    });
                    SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
                end;
            end);
        end;

        local function v11() -- Line: 36
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = u4.Clan.clanId
            });
        end;

        local createFragment = u2.createFragment;
        local v12 = {};
        local createElement = u2.createElement;
        local v13 = {
            LayoutOrder = 2,
            Size = UDim2.new(0.37, 0, 1, 0),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v14 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 9)
            }),
            Header = u2.createElement("Frame", {
                ClipsDescendants = true,
                Size = UDim2.fromScale(1, 0.2),
                BackgroundColor3 = Color3.fromRGB(112, 115, 185)
            }, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 9)
                }),
                BackgroundImage = u2.createElement("ImageLabel", {
                    ImageTransparency = 0.91,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(2.25, 2.25),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = v7,
                    ScaleType = Enum.ScaleType.Fit
                }),
                u2.createElement(CornerFiller, {
                    BottomLeft = true,
                    BottomRight = true
                }),
                ContentContainer = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u2.createElement(Padding, {
                        Padding = UDim.new(0.08, 0)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.03, 0)
                    }),
                    ClanIcon = u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = v7
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    ClanIdentity = u2.createElement(Empty, {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.35, 1)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Left",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.1, 0)
                        }),
                        ClanName = u2.createElement("TextLabel", {
                            AutomaticSize = "Y",
                            TextXAlignment = "Left",
                            TextSize = 20,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0),
                            Text = u4.Clan.name,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                        }),
                        u2.createElement(Empty, {
                            AutomaticSize = "Y",
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0)
                        }, {
                            u2.createElement("UIListLayout", {
                                FillDirection = "Horizontal",
                                VerticalAlignment = "Center",
                                HorizontalAlignment = "Left",
                                SortOrder = "LayoutOrder",
                                Padding = UDim.new(0.1, 0)
                            }),
                            ClanTag = u2.createElement("TextLabel", {
                                AutomaticSize = "XY",
                                TextXAlignment = "Left",
                                TextTransparency = 0.3,
                                TextSize = 16,
                                BackgroundTransparency = 1,
                                LayoutOrder = 2,
                                Size = UDim2.fromScale(0, 0),
                                Text = "[" .. u4.Clan.tag .. "]",
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                            }),
                            ClanLevel = u2.createElement("TextLabel", {
                                AutomaticSize = "XY",
                                TextXAlignment = "Left",
                                TextTransparency = 0.3,
                                TextSize = 16,
                                BackgroundTransparency = 1,
                                LayoutOrder = 3,
                                Size = UDim2.fromScale(0, 0),
                                Text = "Lv. " .. tostring(u4.Clan.extraData.clanLevel),
                                TextColor3 = Theme.mcYellow,
                                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                            })
                        })
                    })
                })
            })
        };
        local createElement2 = u2.createElement;
        local v15 = {
            Size = UDim2.fromScale(1, 0.8),
            Position = UDim2.fromScale(0, 0.2)
        };
        local v16 = {
            u2.createElement(Padding, {
                Padding = {
                    Horizontal = 20,
                    Top = 20,
                    Bottom = 16
                }
            }),
            IntroductionContainer = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.4)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 6)
                }),
                IntroductionTitle = u2.createElement("TextLabel", {
                    Text = "Introduction",
                    TextXAlignment = "Left",
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0, 14),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }),
                ClanIntroduction = u2.createElement("TextLabel", {
                    TextXAlignment = "Left",
                    TextYAlignment = "Top",
                    TextSize = 14,
                    TextWrap = true,
                    TextTransparency = 0.2,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 1, -18),
                    Text = u4.Clan.desc,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                })
            })
        };
        local createElement3 = u2.createElement;
        local v17 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.15),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1)
        };
        local v18 = {};
        local v19 = u2.createElement(ButtonComponent, {
            Text = "VIEW",
            Size = UDim2.fromScale(0.3, 0.8),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            BackgroundColor3 = Theme.backgroundSecondary,
            OnClick = v11
        });
        local createElement4 = u2.createElement;
        local v20 = {
            Size = UDim2.fromScale(0.4, 0.8),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Text = v6,
            OnClick = v10
        };
        local v21;

        if v8 then
            v21 = Theme.Gray;
        else
            v21 = nil;
        end;

        v20.BackgroundColor3 = v21;
        v20.Disabled = v8;
        v18[1], v18[2] = v19, createElement4(ButtonComponent, v20);
        v16.Actions = createElement3(Empty, v17, v18);
        v14.Body = createElement2(Empty, v15, v16);
        v12.ClanInfoCard = createElement("Frame", v13, v14);

        return createFragment(v12);
    end)
};