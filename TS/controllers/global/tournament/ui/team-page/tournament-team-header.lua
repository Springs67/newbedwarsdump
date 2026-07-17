-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local TournamentQueueUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil;
local TournamentTeamUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil;

return {
    TournamentTeamHeader = v3.new(u2)(function(u4, p5) -- Line: 21
        -- upvalues: TournamentTeamUtil (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), UILayers (copy), u2 (copy), Empty (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), EmoteMeta (copy), HostPanelTextBox (copy), TournamentQueueUtil (copy)
        local useState = p5.useState;
        local _ = p5.useEffect;
        local v6, u7 = useState(TournamentTeamUtil.convertNameToTag(u4.TeamName));
        local v8, u9 = useState(u4.TeamName);
        local _, u10 = useState("");

        local function u13(u11) -- Line: 27
            -- upvalues: u10 (copy), TournamentTeamUtil (ref), KnitClient (ref), u4 (copy), u9 (copy), u7 (copy), SoundManager (ref), GameSound (ref)
            if u11 == "" then
                u10("Your tournament team must have a name.");

                return nil;
            end;

            if #u11 > TournamentTeamUtil.MAX_TEAM_NAME_LENGTH then
                u10("Your tournament team name must be less than " .. tostring(TournamentTeamUtil.MAX_TEAM_NAME_LENGTH) .. " characters.");

                return nil;
            end;

            u10("");
            KnitClient.Controllers.TournamentTeamController:updateTournamentTeamName(u4.TeamId, u11):andThen(function(p12) -- Line: 38
                -- upvalues: u10 (ref), u9 (ref), u11 (copy), u7 (ref), SoundManager (ref), GameSound (ref)
                if not p12.success then
                    u10("Your team name could not be updated. Error: " .. tostring(p12.errorMessage));
                    SoundManager:createSound(GameSound.ERROR_NOTIFICATION);

                    return;
                end;

                u10("");
                u9(u11);
                u7(p12.tag);
            end);
        end;

        local function u15() -- Line: 50
            -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u4 (copy), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Delete " .. u4.TeamName .. "?",
                Body = "Are you sure you want to delete your Tournament Team \"" .. u4.TeamName .. "\"? This action cannot be undone.",
                PrimaryBtnProps = {
                    Text = "Delete Team",
                    BackgroundColor3 = Theme.backgroundError
                },
                SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.Gray
                },

                OnPrimaryBtnClick = function(p14) -- Line: 63, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u4 (ref), SoundManager (ref), GameSound (ref)
                    if ({ KnitClient.Controllers.TournamentTeamController:requestDisbandTournamentTeam(u4.TeamId):await() })[1] then
                        SoundManager:playSound(GameSound.UI_CLOSE_2);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end,

                OnSecondaryBtnClick = function() -- Line: 72, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local function u17() -- Line: 77
            -- upvalues: SoundManager (ref), GameSound (ref), Flamework (ref), BedwarsAppIds (ref), u4 (copy), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_OPEN);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
                Title = "Leave " .. u4.TeamName .. "?",
                Body = "Are you sure you want to leave the Tournament Team \"" .. u4.TeamName .. "\"? You cannot rejoin this team without a new invitation.",
                PrimaryBtnProps = {
                    Text = "Leave Team",
                    BackgroundColor3 = Theme.backgroundError
                },
                SecondaryBtnProps = {
                    Text = "Cancel",
                    BackgroundColor3 = Theme.Gray
                },

                OnPrimaryBtnClick = function(p16) -- Line: 90, Name: OnPrimaryBtnClick
                    -- upvalues: KnitClient (ref), u4 (ref), SoundManager (ref), GameSound (ref)
                    if ({ KnitClient.Controllers.TournamentTeamController:leaveTournamentTeam(u4.TeamId):await() })[1] then
                        SoundManager:playSound(GameSound.UI_CLOSE_2);

                        return;
                    end;

                    SoundManager:playSound(GameSound.ERROR_NOTIFICATION);
                end,

                OnSecondaryBtnClick = function() -- Line: 99, Name: OnSecondaryBtnClick
                    -- upvalues: Flamework (ref), UILayers (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
                end
            });
        end;

        local v18 = {};
        local _ = #v18;
        local v19 = {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.3)
        };
        local v20 = { (u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            })) };
        local createElement = u2.createElement;
        local v21 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.08, 0.25)
        };
        local v22 = {};
        local v23 = u2.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center"
            }
        );
        local v24;

        if u4.IsLocalLeader then
            v24 = u2.createFragment({
                DeleteTeam = u2.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 0.55),
                    Image = BedwarsImageId.TRASH_ICON,
                    ImageColor3 = Color3.fromHex("DE4A4A"),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,

                    [u2.Event.Activated] = function() -- Line: 134
                        -- upvalues: u15 (copy)
                        u15();
                    end,

                    SizeConstraint = "RelativeYY",
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "Delete Team",
                            TextSize = 16,
                            Font = Enum.Font.SourceSansBold,
                            Limits = Vector2.new(300, 60),
                            TextColor3 = Theme.mcRed
                        }) }) })
            });
        else
            v24 = u2.createFragment({
                LeaveTeam = u2.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 0.55),
                    Image = BedwarsImageId.KICK_MEMBER_ICON,
                    ImageColor3 = Color3.fromHex("DE4A4A"),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,

                    [u2.Event.Activated] = function() -- Line: 157
                        -- upvalues: u17 (copy)
                        u17();
                    end,

                    SizeConstraint = "RelativeYY",
                    ScaleType = Enum.ScaleType.Fit
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "Leave Team",
                            TextSize = 16,
                            Font = Enum.Font.SourceSansBold,
                            Limits = Vector2.new(300, 60),
                            TextColor3 = Theme.mcRed
                        }) }) })
            });
        end;

        v22[1], v22[2] = v23, v24;
        v20["Right Vertical Bar"] = createElement(Empty, v21, v22);
        local _ = #v20;
        local v25 = {
            LayoutOrder = 1,
            Position = UDim2.fromScale(0.025, 0.025),
            Size = UDim2.fromScale(0.9, 0.95)
        };
        local v26 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.01, 0)
            }),
            TeamIcon = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.3, 1)
            }, {
                EditTeamIcon = u2.createElement("ImageLabel", {
                    ImageTransparency = 0.5,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = 4,
                    Size = UDim2.fromScale(0.12, 0.12),
                    Position = UDim2.fromScale(0, 0),
                    Image = BedwarsImageId.EDIT_FILLED_ICON,
                    ImageColor3 = Color3.fromRGB(255, 255, 255),
                    ScaleType = Enum.ScaleType.Fit
                }),
                ["Team Icon Image"] = u2.createElement("ImageButton", {
                    Size = UDim2.fromScale(1, 1),
                    Image = EmoteMeta[u4.TeamIcon].image,
                    BackgroundTransparency = 0.75,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ScaleType = Enum.ScaleType.Fit,
                    ZIndex = 3,
                    SizeConstraint = "RelativeYY",

                    [u2.Event.Activated] = function() -- Line: 213
                        -- upvalues: u4 (copy)
                        u4.SetOpenEmoteSelectionScreen();
                    end
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }) })
            })
        };
        local _ = #v26;
        local v27 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.7, 1)
        };
        local v28 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.03, 0)
            }),
            TeamTag = u2.createElement("TextLabel", {
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0.3),
                Text = "<b>#" .. v6 .. "</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        };
        local _ = #v28;
        local v29;

        if u4.IsLocalLeader then
            local v30 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(0.9, 1),
                MaxCharacters = TournamentTeamUtil.MAX_TEAM_NAME_LENGTH
            };
            local TeamName = u4.TeamName;
            v30.PlaceholderText = TeamName == nil and "Your tournament team name" or TeamName;

            function v30.OnFocusLost(p31) -- Line: 266
                -- upvalues: u13 (copy)
                u13(p31);
            end;

            v30.LeftPadding = 0.02;
            v30.TextXAlignment = "Left";
            v30.Font = Enum.Font.Roboto;
            v30.TextYAlignment = "Center";
            v30.MaxTextSize = 36;
            v29 = u2.createFragment({
                EditTeamName = u2.createElement(HostPanelTextBox, v30)
            });
        else
            v29 = u2.createFragment({
                TeamName = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 3,
                    Size = UDim2.fromScale(0.9, 1),
                    Text = v8,
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 46
                    }) })
            });
        end;

        local v32 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.25)
        };
        local v33 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.01, 0)
            }),
            EditTeamNameIcon = u2.createElement("ImageLabel", {
                ImageTransparency = 0.5,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                ZIndex = 3,
                Size = UDim2.fromScale(0.05, 1),
                Image = BedwarsImageId.EDIT_FILLED_ICON,
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ScaleType = Enum.ScaleType.Fit
            }),
            [#v33 + 1] = v29
        };
        v28["Team Name"] = u2.createElement(Empty, v32, v33);
        v28["Team Division and Region"] = u2.createElement(Empty, {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.15)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.01, 0)
            }),
            Division = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(0.08, 1),
                Image = BedwarsImageId.TOURNAMENT_DIVISION_ICON,
                ScaleType = Enum.ScaleType.Fit
            }),
            DivisionText = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                LayoutOrder = 2,
                ZIndex = 3,
                TextXAlignment = "Left",
                Size = UDim2.fromScale(0.3, 1),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Text = TournamentTeamUtil.convertDivisionToText(u4.Division)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 32
                }) }),
            u2.createElement(Empty, {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.1, 0)
            }),
            Region = u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 4,
                ZIndex = 3,
                Size = UDim2.fromScale(0.08, 1),
                Image = BedwarsImageId.TOURNAMENT_REGION_ICON,
                ScaleType = Enum.ScaleType.Fit
            }),
            RegionText = u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                RichText = true,
                Font = "Roboto",
                LayoutOrder = 5,
                ZIndex = 3,
                TextXAlignment = "Left",
                Size = UDim2.fromScale(0.25, 1),
                Text = TournamentQueueUtil.convertRegionToText(u4.Region),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 32
                }) })
        });
        v26.TeamInfo = u2.createElement(Empty, v27, v28);
        v20["Team Info Content"] = u2.createElement(Empty, v25, v26);
        v18.TournamentTeamHeader = u2.createFragment({
            TournamentTeamHeader = u2.createElement("Frame", v19, v20)
        });

        return u2.createFragment(v18);
    end)
};