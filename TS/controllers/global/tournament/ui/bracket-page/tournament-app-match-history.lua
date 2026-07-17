-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RegionValues = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local TournamentQueueUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil;
local TournamentTeamUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil;
local TournamentAppMatchPanel = RuntimeLib.import(script, script.Parent, "tournament-app-match-panel").TournamentAppMatchPanel;

return {
    TournamentAppMatchHistory = v2.new(u1)(function(u3, p4) -- Line: 14
        -- upvalues: ClientStore (copy), EmoteType (copy), TournamentTeamUtil (copy), TournamentQueueUtil (copy), RegionValues (copy), RuntimeLib (copy), KnitClient (copy), u1 (copy), EmoteMeta (copy), ColorUtil (copy), TournamentAppMatchPanel (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(true);
        local v7, u8 = useState(false);
        local v9, u10 = useState({});
        local myTeamDivision = ClientStore:getState().Tournament.myTeamDivision;
        local myTeamRegion = ClientStore:getState().Tournament.myTeamRegion;
        local myTeamIcon = ClientStore:getState().Tournament.myTeamIcon;
        local u11 = myTeamIcon or EmoteType.AGNI_ANGRY;
        local myTeamName = ClientStore:getState().Tournament.myTeamName;
        local u12 = (myTeamName == "" or not myTeamName) and "" or TournamentTeamUtil.convertNameToTag(myTeamName);
        local v13 = not myTeamDivision and "" or TournamentTeamUtil.convertDivisionToText(myTeamDivision);
        local v14 = not myTeamRegion and "" or TournamentQueueUtil.convertRegionToText(myTeamRegion);
        local v15 = not u3.inATeam and "Tournament" or v14 .. " Tournament Division - " .. v13;
        local v16 = TournamentQueueUtil.getFormattedTournamentDate(myTeamRegion or RegionValues.NA);
        useEffect(function() -- Line: 39
            -- upvalues: u3 (copy), u6 (copy), RuntimeLib (ref), ClientStore (ref), KnitClient (ref), u10 (copy), u8 (copy)
            if not u3.inATeam then
                u6(false);
            end;

            RuntimeLib.async(function() -- Line: 43
                -- upvalues: ClientStore (ref), KnitClient (ref), u10 (ref), u6 (ref), u8 (ref)
                local myTeamId = ClientStore:getState().Tournament.myTeamId;

                if myTeamId == "" or not myTeamId then
                    return nil;
                end;

                local v17 = { KnitClient.Controllers.TournamentTeamController:requestTournamentTeamData(myTeamId):await() };

                if not (v17[1] and v17[2]) then
                    if v17[2] == nil then
                        u8(true);
                        u6(false);
                    end;

                    return;
                end;

                u10(v17[2].matches);
                u6(false);
            end)();
        end, {});
        local v18 = #v9 > 0;
        local v19 = {
            LayoutOrder = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1),
            BackgroundColor3 = Color3.fromHex("403E74")
        };
        local v20 = {};
        local createElement = u1.createElement;
        local v21 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ImageTransparency = 0.96,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v22;

        if myTeamIcon then
            v22 = EmoteMeta[myTeamIcon].image;
        else
            v22 = EmoteMeta[EmoteType.AFK_TEAMMATE].image;
        end;

        v21.Image = v22;
        v21.ScaleType = Enum.ScaleType.Crop;
        v20.TeamIconBackground = createElement("ImageLabel", v21);
        v20.Gradient = u1.createElement("UIGradient", {
            Rotation = 60,
            Transparency = NumberSequence.new(0.6, 1),
            Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
        });
        v20[1] = u1.createElement("UICorner", {
    CornerRadius = UDim.new(0, 6)
});
        v20.DivisionInformation = u1.createElement("Frame", {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.18),
            Position = UDim2.fromScale(0.03, 0)
        }, {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 2)
            }),
            MatchHistoryTitle = u1.createElement("TextLabel", {
                RichText = true,
                TextScaled = true,
                Text = "<b>Match History</b>",
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.9, 0.35),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            DivisionName = u1.createElement("TextLabel", {
                RichText = true,
                TextScaled = true,
                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                TextTransparency = 0.3,
                Size = UDim2.fromScale(0.9, 0.2),
                Text = "<b>" .. v15 .. "</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }),
            ["Tournament Date"] = u1.createElement("TextLabel", {
                RichText = true,
                TextScaled = true,
                Font = "Roboto",
                TextTransparency = 0.3,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.9, 0.15),
                Text = "<b>" .. v16 .. "</b>",
                TextColor3 = Color3.fromRGB(255, 255, 255)
            })
        });
        v20.Line = u1.createElement("Frame", {
            BackgroundTransparency = 0.75,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.18),
            Size = UDim2.fromScale(0.85, 0.003),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        });
        local _ = #v20;
        local v23 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.94, 0.78),
            Position = UDim2.fromScale(0.03, 0.2)
        };
        local v24 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }) };
        local v25 = #v24;
        local v26;

        if v5 then
            v26 = u1.createFragment({
                Loading = u1.createElement("Frame", {
                    LayoutOrder = 1,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.8,
                    Size = UDim2.fromScale(1, 0.15),
                    BackgroundColor3 = ColorUtil.WHITE
                }, {
                    u1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 2)
                    }),
                    NoMatchesText = u1.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        Text = "<b>Loading Match Data</b>",
                        Font = "Roboto",
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        TextTransparency = 0.2,
                        LayoutOrder = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 0.2),
                        TextColor3 = ColorUtil.WHITE
                    })
                })
            });
        else
            v26 = v5;
        end;

        if v26 then
            v24[v25 + 1] = v26;
        end;

        local v27 = #v24;
        local v28 = not u3.inATeam and u1.createFragment({
            Loading = u1.createElement("Frame", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                BackgroundTransparency = 0.8,
                Size = UDim2.fromScale(1, 0.15),
                BackgroundColor3 = ColorUtil.WHITE
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 2)
                }),
                NoTeamText = u1.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>No Matches To Display\n- Join Or Create A Team -</b>",
                    Font = "Roboto",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    TextTransparency = 0.2,
                    LayoutOrder = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 0.4),
                    TextColor3 = ColorUtil.WHITE
                })
            })
        });

        if v28 then
            v24[v27 + 1] = v28;
        end;

        local v29 = #v24;
        local v30;

        if v18 then
            v30 = not v5;
        else
            v30 = v18;
        end;

        if v30 then
            local function _(p31, p32) -- Line: 226
                -- upvalues: u1 (ref), TournamentAppMatchPanel (ref), u11 (copy), u12 (copy)
                return u1.createElement(TournamentAppMatchPanel, {
                    LayoutOrder = p32,
                    WonMatch = p31.won,
                    team1Icon = u11,
                    team1Tag = u12,
                    tournamentMatch = p31
                });
            end;

            v30 = table.create(#v9);

            for i, v in v9 do
                v30[i] = u1.createElement(TournamentAppMatchPanel, {
                    LayoutOrder = i - 1,
                    WonMatch = v.won,
                    team1Icon = u11,
                    team1Tag = u12,
                    tournamentMatch = v
                });
            end;
        end;

        if v30 then
            for i, v in v30 do
                v24[v29 + i] = v;
            end;
        end;

        local v33 = #v24;
        local v34 = not (v18 or v5) and (u3.inATeam and not v7) and u1.createFragment({
            NoMatches = u1.createElement("Frame", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                BackgroundTransparency = 0.8,
                Size = UDim2.fromScale(1, 0.15),
                BackgroundColor3 = ColorUtil.WHITE
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 2)
                }),
                NoMatchesText = u1.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>No Matches To Display</b>",
                    Font = "Roboto",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    TextTransparency = 0.2,
                    LayoutOrder = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 0.2),
                    TextColor3 = ColorUtil.WHITE
                })
            })
        });

        if v34 then
            v24[v33 + 1] = v34;
        end;

        local v35 = #v24;
        local v36 = v7 and u3.inATeam and u1.createFragment({
            NoMatches = u1.createElement("Frame", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                BackgroundTransparency = 0.8,
                Size = UDim2.fromScale(1, 0.15),
                BackgroundColor3 = ColorUtil.WHITE
            }, {
                u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 2)
                }),
                NoMatchesText = u1.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>No Matches To Display</b>",
                    Font = "Roboto",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    TextTransparency = 0.2,
                    LayoutOrder = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 0.2),
                    TextColor3 = ColorUtil.WHITE
                })
            })
        });

        if v36 then
            v24[v35 + 1] = v36;
        end;

        v20.MatchHistory = u1.createElement("Frame", v23, v24);

        return u1.createFragment({
            ["Left Side - Match History"] = u1.createElement("Frame", v19, v20)
        });
    end)
};