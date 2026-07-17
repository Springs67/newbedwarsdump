-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TournamentTeamMembers = v3.new(u2)(function(u5, p6) -- Line: 25
        -- upvalues: RunService (copy), Players (copy), OfflinePlayerUtil (copy), ClientStore (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), KnitClient (copy), UILayers (copy), u2 (copy), BedwarsImageId (copy), Empty (copy), AutoCanvasScrollingFrame (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = RunService:IsStudio() and true or Players.LocalPlayer.UserId == u5.TeamLeader;
        local v8, u9 = useState(nil);
        local v10, u11 = useState({});

        if RunService:IsStudio() then
            local v12 = {};

            for i, v in OfflinePlayerUtil.Dummy.oiogy do
                v12[i] = v;
            end;

            v12.InPartyWithLeader = true;
            u9(v12);
            local v13 = {};

            for i, v in OfflinePlayerUtil.Dummy.Midciel do
                v13[i] = v;
            end;

            v13.InPartyWithLeader = false;
            local v14 = {};

            for i, v in OfflinePlayerUtil.Dummy.spleenhook do
                v14[i] = v;
            end;

            v14.InPartyWithLeader = false;
            u11({ v13, v14 });
        end;

        useEffect(function() -- Line: 50
            -- upvalues: OfflinePlayerUtil (ref), u5 (copy), ClientStore (ref), u9 (copy)
            OfflinePlayerUtil.getOfflinePlayersByUserIds({ u5.TeamLeader }):andThen(function(p15) -- Line: 52
                -- upvalues: ClientStore (ref), u5 (ref), u9 (ref)
                local v16 = {};

                for i, v in p15[1] do
                    v16[i] = v;
                end;

                v16.InPartyWithLeader = ClientStore:getState().Party.leader.userId == u5.TeamLeader;
                u9(v16);
            end);
        end, { u5.TeamLeader });
        useEffect(function() -- Line: 62
            -- upvalues: u5 (copy), OfflinePlayerUtil (ref), ClientStore (ref), u11 (copy)
            if u5.TeamMembers and #u5.TeamMembers ~= 0 then
                OfflinePlayerUtil.getOfflinePlayersByUserIds(u5.TeamMembers):andThen(function(p17) -- Line: 64
                    -- upvalues: ClientStore (ref), u11 (ref)
                    local function v20(p18) -- Line: 66
                        -- upvalues: ClientStore (ref)
                        local v19 = {};

                        for i, v in p18 do
                            v19[i] = v;
                        end;

                        local leaderPartyMembers = ClientStore:getState().Tournament.leaderPartyMembers;
                        v19.InPartyWithLeader = table.find(leaderPartyMembers, p18.userId) ~= nil;

                        return v19;
                    end;

                    local v21 = table.create(#p17);

                    for i, v in p17 do
                        v21[i] = v20(v, i - 1, p17);
                    end;

                    u11(v21);
                end);
            end;
        end, { u5.TeamMembers });

        local function u25(p22, u23) -- Line: 88
            -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), u5 (copy), UILayers (ref)
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Kick " .. p22 .. "?",
                Body = "Are you sure you want to kick " .. p22 .. " from your tournament team? They cannot rejoin this team without a new invitation.",
                PrimaryBtnProps = {
                    Text = "Kick Member",
                    BackgroundColor3 = Theme.backgroundError
                },
                SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.Gray
                },

                OnPrimaryBtnClick = function(p24) -- Line: 101, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u5 (ref), u23 (copy), SoundManager (ref), GameSound (ref)
                    if ({ KnitClient.Controllers.TournamentTeamController:requestKickTournamentTeamMember(u5.TeamId, u23):await() })[1] then
                        SoundManager:playSound(GameSound.UI_CLOSE_2);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end,

                OnSecondaryBtnClick = function() -- Line: 110, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local function u45(u26, p27, p28) -- Line: 115
            -- upvalues: u7 (copy), u2 (ref), BedwarsImageId (ref), u25 (copy), Empty (ref), Players (ref), Flamework (ref)
            local v29, v30;

            if u7 and not u26.InPartyWithLeader then
                v29 = "A86464";
                v30 = "NOT IN PARTY";
            else
                v29 = "CFB15A";
                v30 = "IN PARTY";
            end;

            local v31 = {
                ZIndex = 3,
                Size = UDim2.fromScale(0.74, 0.17),
                LayoutOrder = p27
            };
            local v32 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.015, 0)
                }) };
            local v33 = #v32;
            local v34 = not p28 and u7 and u2.createFragment({
                KickMember = u2.createElement("ImageButton", {
                    Image = BedwarsImageId.KICK_MEMBER_ICON,
                    ImageColor3 = Color3.fromHex("DE4A4A"),
                    ImageTransparency = 0,
                    Size = UDim2.fromScale(0.55, 0.6),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 3,
                    LayoutOrder = 2,
                    ScaleType = Enum.ScaleType.Fit,
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,

                    [u2.Event.Activated] = function() -- Line: 152
                        -- upvalues: u25 (ref), u26 (copy)
                        u25(u26.name, u26.userId);
                    end
                })
            });

            if v34 then
                v32[v33 + 1] = v34;
            end;

            local _ = #v32;
            local v35 = {
                BorderSizePixel = 0,
                ZIndex = 3,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            };
            local v36 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.45, 0)
                }), u2.createElement("UIGradient", {
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex(v29)) })
                }) };
            local v37 = {
                Size = UDim2.fromScale(0.95, 1),
                Position = UDim2.fromScale(0.025, 0)
            };
            local v38 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0.03, 0)
                }) };
            local v39 = #v38;
            local v40 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.1, 1)
            };
            local v41 = {};
            local v42 = #v41;

            if p28 then
                p28 = u2.createFragment({
                    LeaderCrownIcon = u2.createElement("ImageLabel", {
                        Rotation = -15,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 4,
                        Size = UDim2.fromScale(0.5, 0.5),
                        Position = UDim2.fromScale(-0.2, -0.15),
                        Image = BedwarsImageId.LEADER_CROWN_ICON,
                        ImageColor3 = Color3.fromHex("#FFA800"),
                        ScaleType = Enum.ScaleType.Fit,
                        SizeConstraint = Enum.SizeConstraint.RelativeYY
                    })
                });
            end;

            if p28 then
                v41[v42 + 1] = p28;
            end;

            local _ = #v41;
            v41.MemberImage = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 1),
                Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(u26.userId) .. "&w=150&h=150",
                ScaleType = Enum.ScaleType.Fit
            });
            v38["Member Image and Name"] = u2.createElement(Empty, v40, v41);
            v38["Member Name and Status"] = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.6, 0.95)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.01, 0)
                }),
                ["Member Name"] = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    RichText = true,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    Text = "<b>" .. u26.name .. "</b>",
                    Size = UDim2.fromScale(1, 0.6),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 24
                    }) }),
                ["Member Status"] = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    RichText = true,
                    LayoutOrder = 2,
                    ZIndex = 3,
                    BorderSizePixel = 0,
                    Text = v30,
                    Size = UDim2.fromScale(1, 0.4),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 20
                    }) })
            });
            local v43;

            if v30 == "NOT IN PARTY" then
                v43 = u7 and u2.createFragment({
                    ["Add to Party Button"] = u2.createElement("TextButton", {
                        Text = "<b>ADD TO PARTY</b>",
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Size = UDim2.fromScale(0.23, 0.7),
                        BackgroundColor3 = Color3.fromHex("8C90F1"),
                        BorderSizePixel = 0,
                        LayoutOrder = 3,
                        ZIndex = 4,
                        RichText = true,

                        [u2.Event.Activated] = function() -- Line: 278
                            -- upvalues: Players (ref), u26 (copy), Flamework (ref)
                            local v44 = Players:GetPlayerByUserId(u26.userId);

                            if v44 then
                                Flamework.resolveDependency("@easy-games/lobby:client/controllers/party-controller@PartyController"):invitePlayer(v44);
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                                    message = "Invited " .. u26.name .. " to your party."
                                });
                            end;
                        end
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0.5, 0)
                        }) })
                });
            else
                v43 = false;
            end;

            if v43 then
                v38[v39 + 1] = v43;
            end;

            v36[#v36 + 1] = u2.createElement(Empty, v37, v38);
            v32[u26.userId] = u2.createElement("Frame", v35, v36);

            return u2.createFragment({
                [u26.userId] = u2.createElement(Empty, v31, v32)
            });
        end;

        local v46 = {
            ZIndex = 3,
            LayoutOrder = 4,
            Size = UDim2.fromScale(0.95, 0.55),
            Position = UDim2.fromScale(0.025, 0)
        };
        local v47 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.03, 0)
            }),
            ["Section Title"] = u2.createElement("TextLabel", {
                Text = "<b>TEAM MEMBERS</b>",
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0.06),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) })
        };
        local v48 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.8)
        };
        local v49 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.03, 0)
            }) };
        local _ = #v49;
        local v50 = {
            ScrollingFrameProps = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                CanvasSize = UDim2.fromScale(1, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y
            }
        };
        local v51 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.03, 0)
            }) };
        local v52 = #v51;

        if v8 then
            v8 = u45(v8, 0, true);
        end;

        if v8 then
            v51[v52 + 1] = v8;
        end;

        local v53 = #v51;

        local function _(p54, p55) -- Line: 369
            -- upvalues: u45 (copy)
            return u45(p54, p55 + 1);
        end;

        local v56 = table.create(#v10);

        for i, v in v10 do
            v56[i] = u45(v, i - 1 + 1);
        end;

        for i, v in v56 do
            v51[v53 + i] = v;
        end;

        v49.MembersList = u2.createElement(AutoCanvasScrollingFrame, v50, v51);
        v47[#v47 + 1] = u2.createElement(Empty, v48, v49);

        return u2.createFragment({
            ["Team Members"] = u2.createElement(Empty, v46, v47)
        });
    end)
};