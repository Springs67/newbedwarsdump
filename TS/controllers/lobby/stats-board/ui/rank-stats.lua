-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-decay-config");
local RANK_DECAY_FLOOR_DIVISION = v4.RANK_DECAY_FLOOR_DIVISION;
local RANK_DECAY_GRACE_SECONDS = v4.RANK_DECAY_GRACE_SECONDS;
local RANK_DECAY_INTERVAL_SECONDS = v4.RANK_DECAY_INTERVAL_SECONDS;
local RankDistribution = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SectionTitle = RuntimeLib.import(script, script.Parent, "section-title").SectionTitle;

return {
    RankStats = v3.new(u2)(function(p5, p6) -- Line: 19
        -- upvalues: RankDistribution (copy), RankMeta (copy), RankUtil (copy), RANK_DECAY_FLOOR_DIVISION (copy), RANK_DECAY_GRACE_SECONDS (copy), RANK_DECAY_INTERVAL_SECONDS (copy), u2 (copy), Empty (copy), ColorUtil (copy), Theme (copy), ProgressBar (copy), StringUtil (copy), SectionTitle (copy)
        local _ = p6.useState;
        local u7 = p5.RankStats or p5.store.Leaderboard.rankStats;
        local v8;

        if u7 == nil then
            v8 = u7;
        else
            v8 = u7.rankPoints;
        end;

        local v9;

        if u7 == nil then
            v9 = u7;
        else
            v9 = u7.leaderboardPosition;
        end;

        local u10 = RankDistribution:getDisplayedRank(v8 == nil and 0 or v8, v9 == nil and -1 or v9);
        local u11 = RankMeta[u10.division];
        local v12;

        if u7 == nil then
            v12 = u7;
        else
            v12 = u7.leaderboardPosition;
        end;

        local u13;

        if v12 == -1 then
            u13 = nil;
        elseif u7 == nil then
            u13 = u7;
        else
            u13 = u7.leaderboardPosition;
        end;

        local NUM_PROVISIONAL_MATCHES = RankUtil.NUM_PROVISIONAL_MATCHES;
        local v14;

        if u7 == nil then
            v14 = u7;
        else
            v14 = u7.matchesPlayed;
        end;

        local u15 = v14 == nil and 0 or v14;
        local OtherPlayerViewing = p5.OtherPlayerViewing;
        local v16 = RankDistribution:getRankPointsFromDivision(RANK_DECAY_FLOOR_DIVISION);
        local v17 = NUM_PROVISIONAL_MATCHES <= u15;

        if v17 then
            local v18;

            if u7 == nil then
                v18 = u7;
            else
                v18 = u7.rankPoints;
            end;

            v17 = v16 <= (v18 == nil and 0 or v18);
        end;

        local profileData = p5.store.Lobby.profileData;

        if profileData ~= nil then
            profileData = profileData.queues[RankUtil.activeRankMeta.queueType];

            if profileData ~= nil then
                profileData = profileData.lastPlayTime;
            end;
        end;

        local v19 = profileData == nil and 0 or profileData;
        local u20;

        if OtherPlayerViewing or (not v17 or v19 <= 0) then
            u20 = nil;
        else
            local v21 = v19 + RANK_DECAY_GRACE_SECONDS - os.time();

            if v21 > 0 then
                local v22 = math.ceil(v21 / RANK_DECAY_INTERVAL_SECONDS);
                local v23 = math.max(1, v22);
                u20 = "Rank Decay: " .. tostring(v23) .. " " .. (v23 == 1 and "day" or "days");
            else
                u20 = "Rank Decay: Active";
            end;
        end;

        local function v25(p24) -- Line: 106
            -- upvalues: u2 (ref), Empty (ref), ColorUtil (ref), Theme (ref)
            return u2.createFragment({
                Unranked = u2.createElement(Empty, {
                    Size = p24.Size
                }, { u2.createElement("Frame", {
                        BackgroundTransparency = 0.8,
                        Size = UDim2.fromScale(0.9, 0.9),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, {
                        ProvisionalInfo = u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            Text = "UNRANKED",
                            TextSize = 10,
                            LayoutOrder = 4,
                            Size = UDim2.fromScale(1, 1),
                            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = Theme.textPrimary,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center
                        }),
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0.1, 0)
                        })
                    }) })
            });
        end;

        local function v27(p26) -- Line: 137
            -- upvalues: u2 (ref), Empty (ref), ProgressBar (ref), u15 (copy), NUM_PROVISIONAL_MATCHES (copy)
            return u2.createFragment({
                ProvisionalMatchesProgress = u2.createElement(Empty, {
                    Size = p26.Size
                }, {
                    ProvisionalInfo = u2.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Text = "Complete 5 placement games to unlock your rank",
                        TextSize = 10,
                        TextXAlignment = "Center",
                        LayoutOrder = 4,
                        Size = UDim2.new(1, 0, 0.4, 0),
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    }),
                    u2.createElement(Empty, {
                        Position = UDim2.fromScale(0, 0.4),
                        Size = UDim2.new(1, 0, 0.6, 0)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Center",
                            VerticalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0, 6)
                        }),
                        u2.createElement(ProgressBar, {
                            AcceptZero = true,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(0.85, 0.5),
                            Progress = u15 / NUM_PROVISIONAL_MATCHES
                        }),
                        ProvisionalMatchesPlayed = u2.createElement("TextLabel", {
                            AutomaticSize = "Y",
                            BackgroundTransparency = 1,
                            RichText = true,
                            TextSize = 10,
                            TextXAlignment = "Right",
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.85, 0),
                            Text = "<b><font color=\"#ffffff\">" .. tostring(u15) .. " games</font></b> / " .. tostring(NUM_PROVISIONAL_MATCHES),
                            TextColor3 = Color3.fromRGB(207, 209, 231)
                        })
                    })
                })
            });
        end;

        local function v47(p28) -- Line: 185
            -- upvalues: u2 (ref), u11 (copy), ColorUtil (ref), Theme (ref), u13 (copy), StringUtil (ref), u20 (ref), Empty (ref), u10 (copy), ProgressBar (ref), u7 (copy)
            local v29 = {
                Size = p28.Size
            };
            local v30 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0)
                }), u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = u11.image
                }) };
            local v31 = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.7, 0.9)
            };
            local v32 = { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 12)
                }) };
            local v33 = #v32;
            local v34 = {
                Size = UDim2.fromScale(1, 0.6)
            };
            local v35 = {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 6)
                }),
                RankName = u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    TextSize = 12,
                    TextXAlignment = "Left",
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0),
                    Text = u11.name,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }),
                LeaderboardRank = u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    TextSize = 10,
                    RichText = true,
                    TextXAlignment = "Left",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0),
                    Text = "Leaderboard Rank: <b><font color=\"" .. Theme.textPrimaryRichText .. "\">" .. ((u13 == 0 or (u13 ~= u13 or not u13)) and "Not on leaderboard" or StringUtil.formatNumberWithCommas(u13 - 1)) .. "</font></b>",
                    TextColor3 = Color3.fromRGB(207, 209, 231)
                })
            };
            local v36 = #v35;
            local v37;

            if u20 == nil then
                v37 = false;
            else
                v37 = u2.createFragment({
                    RankDecayInfo = u2.createElement("TextLabel", {
                        AutomaticSize = "Y",
                        BackgroundTransparency = 1,
                        TextSize = 10,
                        TextXAlignment = "Left",
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 0),
                        Text = u20,
                        TextColor3 = Color3.fromRGB(207, 209, 231)
                    })
                });
            end;

            if v37 then
                v35[v36 + 1] = v37;
            end;

            v32[v33 + 1] = u2.createElement(Empty, v34, v35);
            local v38;

            if u11.noRPLimit then
                local v39 = {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.85, 0)
                };
                local v40 = u7;

                if v40 ~= nil then
                    v40 = v40.demotionShield;
                end;

                v39.Text = (v40 == nil and "" or "🛡️ ") .. tostring(u10.rankPoints) .. " RP";
                v39.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
                v39.TextSize = 10;
                v39.TextColor3 = Color3.fromRGB(255, 255, 255);
                v39.TextXAlignment = "Left";
                v39.LayoutOrder = 4;
                v38 = u2.createFragment({
                    CurrentRP = u2.createElement("TextLabel", v39)
                });
            else
                local v41 = {};
                local v42 = {
                    Size = UDim2.fromScale(0.85, 0.5)
                };
                local rankPoints = u10.rankPoints;
                v42.Progress = (rankPoints == nil and 0 or rankPoints) / 100;
                v42.AcceptZero = true;
                v42.LayoutOrder = 3;
                v42.BarColor = u11.color;
                v41[#v41 + 1] = u2.createElement(ProgressBar, v42);
                local v43 = {
                    AutomaticSize = "Y",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.85, 0)
                };
                local v44 = u7;

                if v44 ~= nil then
                    v44 = v44.demotionShield;
                end;

                v43.Text = (v44 == nil and "" or "🛡️ ") .. "<b><font color=\"#ffffff\">" .. tostring(u10.rankPoints) .. " RP</font></b> / " .. tostring(100);
                v43.RichText = true;
                v43.TextSize = 10;
                v43.TextColor3 = Color3.fromRGB(207, 209, 231);
                v43.TextXAlignment = "Right";
                v43.LayoutOrder = 4;
                v41.CurrentRP = u2.createFragment({
                    CurrentRP = u2.createElement("TextLabel", v43)
                });
                v38 = u2.createFragment(v41);
            end;

            local v45 = {
                Size = UDim2.fromScale(1, 0.4)
            };
            local v46 = {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 6)
                }),
                [#v46 + 1] = v38
            };
            v32[v33 + 2] = u2.createElement(Empty, v45, v46);
            v30[#v30 + 1] = u2.createElement(Empty, v31, v32);

            return u2.createElement(Empty, v29, v30);
        end;

        local createElement = u2.createElement;
        local v48 = {
            Size = UDim2.new(1, 0, 0, 112)
        };
        local v49 = {};
        local v50 = u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 12)
        });
        local v51 = u2.createElement(SectionTitle, {
            title = "Ranked",
            SectionDivider = true
        });
        local v52;

        if u15 >= 5 then
            v52 = u2.createElement(v47, {
                Size = UDim2.new(1, 0, 1, -32)
            });
        elseif OtherPlayerViewing then
            v52 = u2.createElement(v25, {
                Size = UDim2.new(1, 0, 1, -32)
            });
        else
            v52 = u2.createElement(v27, {
                Size = UDim2.new(1, 0, 1, -32)
            });
        end;

        v49[1], v49[2], v49[3] = v50, v51, v52;

        return createElement(Empty, v48, v49);
    end)
};