-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TournamentTeamUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil;

return {
    TournamentAppIncomingInviteRow = v3.new(u2)(function(u4, p5) -- Line: 21
        -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), KnitClient (copy), UILayers (copy), OfflinePlayerUtil (copy), u2 (copy), Empty (copy), BedwarsImageId (copy), TweenService (copy), EmoteMeta (copy), TournamentTeamUtil (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);

        local function u10(u8) -- Line: 25
            -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Delete invite to " .. u8.teamName .. "?",
                Body = "Are you sure you want to delete your invitation to the Tournament Team \"" .. u8.teamName .. "\"?",
                PrimaryBtnProps = {
                    Text = "Delete Invite",
                    BackgroundColor3 = Theme.backgroundError
                },
                SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.Gray
                },

                OnPrimaryBtnClick = function(p9) -- Line: 40, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u8 (copy), SoundManager (ref), GameSound (ref)
                    if ({ KnitClient.Controllers.TournamentTeamController:declineTournamentTeamInvitation(u8.teamId):await() })[1] then
                        SoundManager:playSound(GameSound.UI_CLOSE_2);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end,

                OnSecondaryBtnClick = function() -- Line: 49, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local function u13(u11) -- Line: 54
            -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Accept invite to " .. u11.teamName .. "?",
                Body = "Are you sure you want to accept the invitation to the Tournament Team \"" .. u11.teamName .. "\"?",
                PrimaryBtnProps = {
                    Text = "Accept Invite",
                    BackgroundColor3 = Theme.backgroundSuccess
                },
                SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.Gray
                },

                OnPrimaryBtnClick = function(p12) -- Line: 68, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u11 (copy), SoundManager (ref), GameSound (ref)
                    if ({ KnitClient.Controllers.TournamentTeamController:acceptTournamentTeamInvitation(u11.teamId):await() })[1] then
                        SoundManager:playSound(GameSound.UI_CLOSE_2);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end,

                OnSecondaryBtnClick = function() -- Line: 77, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        useEffect(function() -- Line: 82
            -- upvalues: OfflinePlayerUtil (ref), u4 (copy), u7 (copy)
            OfflinePlayerUtil.getOfflinePlayersByUserIds({ u4.Invite.invitingPlayer }):andThen(function(p14) -- Line: 84
                -- upvalues: u7 (ref)
                u7(p14[1]);
            end);
        end, { u4.Invite });
        local v15 = {
            ZIndex = 3,
            Size = UDim2.fromScale(0.9, 0.2),
            LayoutOrder = u4.Index
        };
        local v22 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0)
            }),
            InviteActions = u2.createElement(Empty, {
                ZIndex = 3,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.08, 0.9)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Left",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.05, 0)
                }),
                AcceptInviteButton = u2.createElement("ImageButton", {
                    Image = BedwarsImageId.ACCEPT_TOURNAMENT_INVITE_ICON,
                    ImageColor3 = Theme.backgroundSuccess,
                    Size = UDim2.fromScale(0.75, 0.75),
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 4,
                    LayoutOrder = 1,

                    [u2.Event.Activated] = function(p16) -- Line: 123
                        -- upvalues: u13 (copy), u4 (copy)
                        u13(u4.Invite);
                    end,

                    [u2.Event.MouseEnter] = function(p17) -- Line: 126
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p17, TweenInfo.new(0.15), {
                            ImageColor3 = Color3.fromHex("2be067")
                        }):Play();
                    end,

                    [u2.Event.MouseLeave] = function(p18) -- Line: 131
                        -- upvalues: TweenService (ref), Theme (ref)
                        TweenService:Create(p18, TweenInfo.new(0.15), {
                            ImageColor3 = Theme.backgroundSuccess
                        }):Play();
                    end
                }),
                DenyInviteButton = u2.createElement("ImageButton", {
                    Image = BedwarsImageId.DECLINE_TOURNAMENT_INVITE_ICON,
                    ImageColor3 = Theme.backgroundError,
                    Size = UDim2.fromScale(0.75, 0.75),
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 4,
                    LayoutOrder = 2,

                    [u2.Event.Activated] = function(p19) -- Line: 147
                        -- upvalues: u10 (copy), u4 (copy)
                        u10(u4.Invite);
                    end,

                    [u2.Event.MouseEnter] = function(p20) -- Line: 150
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p20, TweenInfo.new(0.15), {
                            ImageColor3 = Color3.fromHex("f03322")
                        }):Play();
                    end,

                    [u2.Event.MouseLeave] = function(p21) -- Line: 155
                        -- upvalues: TweenService (ref), Theme (ref)
                        TweenService:Create(p21, TweenInfo.new(0.15), {
                            ImageColor3 = Theme.backgroundError
                        }):Play();
                    end
                })
            })
        };
        local _ = #v22;
        local v23 = {
            BorderSizePixel = 0,
            ZIndex = 3,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.9, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v24 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.2, 0)
            }),
            u2.createElement("UIGradient", {
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex("CFB15A")) })
            }),
            u2.createElement(Empty, {
                Size = UDim2.fromScale(0.7, 0.95),
                Position = UDim2.fromScale(0.025, 0)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0.03, 0)
                }),
                ["Team Icon"] = u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.3, 1)
                }, {
                    TeamIcon = u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        ZIndex = 3,
                        Size = UDim2.fromScale(1, 1),
                        Image = EmoteMeta[u4.Invite.teamIcon].image,
                        ScaleType = Enum.ScaleType.Fit
                    })
                }),
                ["Team Tag and Name"] = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.7, 0.95)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Left",
                        VerticalAlignment = "Top",
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0.01, 0)
                    }),
                    ["Team Tag"] = u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        RichText = true,
                        LayoutOrder = 2,
                        ZIndex = 3,
                        BorderSizePixel = 0,
                        Text = "<b>#" .. u4.Invite.teamTag .. "</b>",
                        Size = UDim2.fromScale(1, 0.4),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) }),
                    ["Team Name"] = u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        RichText = true,
                        LayoutOrder = 2,
                        ZIndex = 3,
                        BorderSizePixel = 0,
                        Text = u4.Invite.teamName,
                        Size = UDim2.fromScale(1, 0.25),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 20
                        }) })
                })
            })
        };
        local _ = #v24;
        local v25 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.3, 0.9),
            Position = UDim2.fromScale(0.65, 0)
        };
        local v26 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.3, 0)
            }),
            ["Division Info"] = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.25)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.01, 0)
                }),
                DivisionIcon = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.2, 1),
                    Image = BedwarsImageId.TOURNAMENT_DIVISION_ICON,
                    ScaleType = Enum.ScaleType.Fit
                }),
                Division = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    RichText = true,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    Text = TournamentTeamUtil.convertDivisionToText(u4.Invite.division),
                    Size = UDim2.fromScale(0.8, 1),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            })
        };
        local _ = #v26;
        local v27 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.4)
        };
        local v28 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0)
            }),
            InvitingPlayerIcon = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 3,
                Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(u4.Invite.invitingPlayer) .. "&w=150&h=150",
                Size = UDim2.fromScale(0.2, 1),
                ScaleType = Enum.ScaleType.Fit
            })
        };
        local _ = #v28;
        local v29 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.8, 1)
        };
        local v30 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.01, 0)
            }) };
        local _ = #v30;
        local v31 = {};

        if v6 ~= nil then
            v6 = v6.name;
        end;

        v31.Text = "<b>" .. tostring(v6) .. "</b>";
        v31.Size = UDim2.fromScale(1, 0.6);
        v31.TextColor3 = Color3.fromRGB(255, 255, 255);
        v31.BackgroundTransparency = 1;
        v31.TextScaled = true;
        v31.TextXAlignment = Enum.TextXAlignment.Left;
        v31.RichText = true;
        v31.LayoutOrder = 2;
        v31.ZIndex = 3;
        v31.BorderSizePixel = 0;
        v30.InvitingPlayerName = u2.createElement("TextLabel", v31);
        v30.InvitingPlayerStatus = u2.createElement("TextLabel", {
            Text = "INVITED YOU",
            BackgroundTransparency = 1,
            TextScaled = true,
            RichText = true,
            LayoutOrder = 2,
            ZIndex = 3,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.4),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left
        });
        v28["Inviting Player Name"] = u2.createElement(Empty, v29, v30);
        v26["Inviting player info"] = u2.createElement(Empty, v27, v28);
        v24["Team Division and inviting player info"] = u2.createElement(Empty, v25, v26);
        v22[u4.Invite.teamId] = u2.createElement("Frame", v23, v24);

        return u2.createFragment({
            [u4.Invite.teamId] = u2.createElement(Empty, v15, v22)
        });
    end)
};