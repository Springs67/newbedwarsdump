-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local getLeaderboardMeta = v4.getLeaderboardMeta;
local LEADERBOARD_DISABLED = v4.LEADERBOARD_DISABLED;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SectionDivider = RuntimeLib.import(script, script.Parent.Parent, "stats-board", "ui", "section-divider").SectionDivider;
local StatRankElement = RuntimeLib.import(script, script.Parent, "ui", "stat-rank-element").StatRankElement;
local u5 = GetTarmacAsset("CrownIcon");

local function _(p6) -- Line: 18
    return string.gsub(string.reverse((string.gsub(string.reverse(p6), "%d%d%d", "%1,"))), "^,", "");
end;

return {
    LeaderboardList = v3.new(u2)(function(p7, p8) -- Line: 21
        -- upvalues: getLeaderboardMeta (copy), u2 (copy), SectionDivider (copy), LEADERBOARD_DISABLED (copy), Empty (copy), ColorUtil (copy), StringUtil (copy), u5 (copy), Theme (copy), StatRankElement (copy), AutoCanvasScrollingFrame (copy)
        local _ = p8.useState;
        local u9 = getLeaderboardMeta(p7.LeaderboardType);

        local function u10() -- Line: 25
            -- upvalues: u2 (ref), SectionDivider (ref)
            return u2.createFragment({
                TopThreeDivider = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(0, 48),
                    Size = UDim2.new(1, 0, 0, 4)
                }, { u2.createElement(SectionDivider) })
            });
        end;

        local v11 = {
            ScrollingDirection = Enum.ScrollingDirection.Y
        };
        local v12 = {};

        for i, v in p7.FrameProps do
            v11[i] = v;
        end;

        v12.ScrollingFrameProps = v11;
        local v13 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }) };
        local v14 = #v13;
        local v15;

        if LEADERBOARD_DISABLED == true then
            v15 = u2.createFragment({
                LeaderboardElementContainer = u2.createElement(Empty, {
                    Size = UDim2.new(0.98, 0, 0, 38)
                }, {
                    LeaderboardElementBody = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundColor3 = ColorUtil.hexColor(7567033)
                    }, {
                        UserLeaderBoardDataContainer = u2.createElement(Empty, {
                            Size = UDim2.fromScale(1, 1)
                        }, {
                            u2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal,
                                VerticalAlignment = Enum.VerticalAlignment.Center,
                                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                SortOrder = Enum.SortOrder.LayoutOrder,
                                Padding = UDim.new(0, 10)
                            }),
                            u2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 10),
                                PaddingRight = UDim.new(0, 10)
                            }),
                            DisabledContainer = u2.createElement(Empty, {
                                Size = UDim2.new(0.6, 0, 1, 0)
                            }, {
                                u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    Padding = UDim.new(0, 10)
                                }),
                                DisabledIcon = u2.createElement("ImageLabel", {
                                    Image = "rbxassetid://7804178661",
                                    LayoutOrder = 2,
                                    Size = UDim2.fromOffset(24, 24),
                                    BackgroundColor3 = Color3.new(0.95, 0.95, 0.95)
                                }, { u2.createElement("UICorner", {
                                        CornerRadius = UDim.new(1, 0)
                                    }) }),
                                DisabledText = u2.createElement("TextLabel", {
                                    Text = "<b><font color=\"rgb(185, 188, 255)\"></font></b>Leaderboard Temporarily Hidden",
                                    RichText = true,
                                    BackgroundTransparency = 1,
                                    TextScaled = true,
                                    AutoLocalize = false,
                                    LayoutOrder = 3,
                                    Font = Enum.Font.RobotoMono,
                                    Size = UDim2.new(1, -60, 0, 18),
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    TextColor3 = Color3.fromRGB(255, 255, 255)
                                })
                            })
                        })
                    })
                })
            });
        else
            v15 = false;
        end;

        if v15 then
            v13[v14 + 1] = v15;
        end;

        local v16 = #v13;
        local users = p7.LeaderboardData.users;

        local function v42(p17, p18) -- Line: 119
            -- upvalues: u9 (copy), StringUtil (ref), ColorUtil (ref), u2 (ref), u5 (ref), Empty (ref), Theme (ref), StatRankElement (ref), u10 (copy)
            local v19;

            if p17.statRank then
                v19 = p17.statRank.rankStatValue;
            else
                v19 = p17.statValue;
            end;

            local v20 = tostring(v19);
            local v21 = u9;

            if v21 ~= nil then
                v21 = v21.statsType;
            end;

            if v21 == "time" then
                v20 = StringUtil.formatCountdownTime(p17.statValue);
            end;

            local v22 = {
                Size = UDim2.new(0.98, 0, 0, 38),
                LayoutOrder = p18
            };
            local v23 = {};
            local v24 = #v23;
            local v25 = {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = ColorUtil.hexColor(7567033)
            };
            local v26 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                }) };
            local v27 = #v26;
            local v28;

            if p18 < 3 then
                local createFragment = u2.createFragment;
                local v29 = {};
                local createElement = u2.createElement;
                local v30 = {
                    BackgroundTransparency = 1,
                    Rotation = -25,
                    Position = UDim2.fromOffset(-10, -12),
                    Size = UDim2.fromOffset(26, 20.8),
                    Image = u5.Image,
                    ImageRectOffset = u5.ImageRectOffset,
                    ImageRectSize = u5.ImageRectSize
                };
                local v31;

                if p18 == 0 then
                    v31 = Color3.fromRGB(255, 192, 79);
                elseif p18 == 1 then
                    v31 = Color3.fromRGB(229, 206, 172);
                else
                    v31 = Color3.fromRGB(255, 142, 80);
                end;

                v30.ImageColor3 = v31;
                v29.CrownIcon = createElement("ImageLabel", v30);
                v28 = createFragment(v29);
            else
                v28 = nil;
            end;

            if v28 then
                v26[v27 + 1] = v28;
            end;

            local _ = #v26;
            local v32 = {
                Size = UDim2.fromScale(1, 1)
            };
            local v33 = {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 10)
                }),
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }),
                PlayerContainer = u2.createElement(Empty, {
                    Size = UDim2.new(0.6, 0, 1, 0)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10)
                    }),
                    LeaderboardRank = u2.createElement("TextLabel", {
                        AutomaticSize = "XY",
                        BackgroundTransparency = 1,
                        TextSize = 18,
                        LayoutOrder = 1,
                        Text = tostring(p18 + 1),
                        FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextColor3 = Theme.textPrimary
                    }),
                    PlayerAvatar = u2.createElement("ImageLabel", {
                        LayoutOrder = 2,
                        Size = UDim2.fromOffset(24, 24),
                        BackgroundColor3 = Color3.new(0.95, 0.95, 0.95),
                        Image = p17.avatarImage
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }),
                    PlayerUsername = u2.createElement("TextLabel", {
                        RichText = true,
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        AutoLocalize = false,
                        LayoutOrder = 3,
                        Text = "<b><font color=\"rgb(185, 188, 255)\">@</font></b>" .. p17.username,
                        Font = Enum.Font.RobotoMono,
                        Size = UDim2.new(1, -60, 0, 18),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextColor3 = Color3.fromRGB(255, 255, 255)
                    })
                })
            };
            local _ = #v33;
            local v34 = {
                Size = UDim2.new(0.4, -10, 1, 0)
            };
            local v35 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 10)
                }) };
            local v36 = #v35;
            local v37 = p17.statRank and u2.createElement(StatRankElement, {
                LayoutOrder = 1,
                StatRank = p17.statRank
            });

            if v37 then
                v35[v36 + 1] = v37;
            end;

            local _ = #v35;
            local v38 = {};
            local v39 = string.gsub(string.reverse((string.gsub(string.reverse(v20), "%d%d%d", "%1,"))), "^,", "");
            local v40 = u9;

            if v40 ~= nil then
                v40 = v40.metric;
            end;

            v38.Text = v39 .. " " .. tostring(v40);
            v38.AutomaticSize = Enum.AutomaticSize.XY;
            v38.BackgroundTransparency = 1;
            v38.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
            v38.TextSize = 14;
            v38.TextXAlignment = Enum.TextXAlignment.Right;
            v38.TextColor3 = Theme.textPrimary;
            v38.LayoutOrder = 2;
            v35.StatValue = u2.createElement("TextLabel", v38);
            v33.StatValuesContainer = u2.createElement(Empty, v34, v35);
            v26.UserLeaderBoardDataContainer = u2.createElement(Empty, v32, v33);
            v23.LeaderboardElementBody = u2.createElement("Frame", v25, v26);
            local v41;

            if p18 + 1 == 3 then
                v41 = u2.createElement(u10);
            else
                v41 = nil;
            end;

            if v41 then
                v23[v24 + 1] = v41;
            end;

            return u2.createFragment({
                LeaderboardElementContainer = u2.createElement(Empty, v22, v23)
            });
        end;

        local v43 = table.create(#users);

        for i, v in users do
            v43[i] = v42(v, i - 1, users);
        end;

        for i, v in v43 do
            v13[v16 + i] = v;
        end;

        return u2.createElement(AutoCanvasScrollingFrame, v12, v13);
    end)
};