-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local LobbyClientConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientConfig;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanMenuInviteCard = v4.new(u3)(function(u5, p6) -- Line: 19
        -- upvalues: u2 (copy), Flamework (copy), BedwarsAppIds (copy), KnitClient (copy), u3 (copy), DeviceUtil (copy), Theme (copy), SoundManager (copy), LobbyClientConfig (copy), TweenService (copy), Empty (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy)
        local _ = p6.useState;
        local u7 = u2.new();

        local function _() -- Line: 22
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = u5.ClanInvite.clanId
            });
        end;

        local function _(p8) -- Line: 27
            -- upvalues: KnitClient (ref), u5 (copy)
            KnitClient.Controllers.ClanController:clanInviteDecision(u5.ClanInvite.clanId, p8);
        end;

        return u3.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 100 or 80),
            BackgroundColor3 = Theme.backgroundPrimary,
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ImageTransparency = 1,
            AutoButtonColor = false,

            [u3.Event.Activated] = function() -- Line: 37
                -- upvalues: SoundManager (ref), LobbyClientConfig (ref), Flamework (ref), BedwarsAppIds (ref), u5 (copy)
                SoundManager:playSound(LobbyClientConfig.sounds.UI_CLICK);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                    ClanId = u5.ClanInvite.clanId
                });
            end,

            [u3.Event.MouseEnter] = function(p9) -- Line: 41
                -- upvalues: u7 (copy), TweenService (ref)
                u7:DoCleaning();
                local u10 = TweenService:Create(p9, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.3
                });
                u10:Play();
                u7:GiveTask(function() -- Line: 47
                    -- upvalues: u10 (copy)
                    u10:Cancel();
                end);
            end,

            [u3.Event.MouseLeave] = function(p11) -- Line: 51
                -- upvalues: u7 (copy), TweenService (ref)
                u7:DoCleaning();
                local u12 = TweenService:Create(p11, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0
                });
                u12:Play();
                u7:GiveTask(function() -- Line: 57
                    -- upvalues: u12 (copy)
                    u12:Cancel();
                end);
            end
        }, {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0),
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.05, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }),
            u3.createElement(Empty, {
                Size = UDim2.fromScale(0.7, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.1, 0)
                }),
                u3.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.55)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.05, 0)
                    }),
                    ClanName = u3.createElement("TextLabel", {
                        AutomaticSize = "Y",
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        LayoutOrder = 1,
                        AutoLocalize = false,
                        Size = UDim2.fromScale(1, 0),
                        Text = "<b>" .. u5.ClanInvite.clanName .. " <font color=\"" .. ColorUtil.richTextColor(Theme.textPrimary) .. "\">[" .. u5.ClanInvite.clanTag .. "]</font></b>",
                        TextColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 20
                        }) }),
                    ClanInviteTime = u3.createElement("TextLabel", {
                        AutomaticSize = "Y",
                        TextTransparency = 0.3,
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        LayoutOrder = 2,
                        AutoLocalize = false,
                        Size = UDim2.fromScale(1, 0),
                        Text = DateTime.fromUnixTimestamp(u5.ClanInvite.time):FormatLocalTime("L LT", "en-us"),
                        TextColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UITextSizeConstraint", {
                            MaxTextSize = DeviceUtil.isSmallScreen() and 11 or 15
                        }) })
                }),
                CardActionText = u3.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    Text = "CLICK TO VIEW CLAN",
                    TextTransparency = 0,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    RichText = true,
                    Font = "ArialBold",
                    LayoutOrder = 2,
                    AutoLocalize = false,
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = Theme.mcYellow
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = DeviceUtil.isSmallScreen() and 12 or 18
                    }) })
            }),
            u3.createElement(Empty, {
                Size = UDim2.fromScale(0.3, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.1, 0)
                }),
                Accept = u3.createElement(IconButton, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.5, 0.5),
                    Image = BedwarsImageId.CHECK_SOLID,
                    IconProps = {
                        ScaleType = "Fit",
                        ImageColor3 = Theme.backgroundSuccess
                    },

                    OnClick = function() -- Line: 172, Name: OnClick
                        -- upvalues: KnitClient (ref), u5 (copy)
                        KnitClient.Controllers.ClanController:clanInviteDecision(u5.ClanInvite.clanId, true);
                    end
                }),
                Decline = u3.createElement(IconButton, {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.fromScale(0.5, 0.5),
                    Image = BedwarsImageId.X,
                    IconProps = {
                        ScaleType = "Fit",
                        ImageColor3 = Theme.backgroundError
                    },

                    OnClick = function() -- Line: 184, Name: OnClick
                        -- upvalues: KnitClient (ref), u5 (copy)
                        KnitClient.Controllers.ClanController:clanInviteDecision(u5.ClanInvite.clanId, false);
                    end
                })
            })
        });
    end)
};