-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local Logger = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MapDataUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-data-util").MapDataUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchOutcome = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-outcome").MatchOutcome;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LabelledText = RuntimeLib.import(script, script.Parent.Parent.Parent, "labelled-text", "labelled-text").LabelledText;

return {
    MatchHistoryEntryCard = v2.new(u1)(function(u3, p4) -- Line: 21
        -- upvalues: ColorUtil (copy), BedwarsImageId (copy), MatchOutcome (copy), Logger (copy), u1 (copy), getQueueMeta (copy), MapDataUtil (copy), BedwarsKit (copy), getBedwarsKitMeta (copy), Theme (copy), LabelledText (copy), Empty (copy)
        local _ = p4.useState;

        local function _(p5) -- Line: 24
            -- upvalues: u3 (copy)
            return p5.playerInfo.userId == u3.userId;
        end;

        local v6 = nil;

        for i, v in u3.match.players do
            local _ = i - 1;

            if v.playerInfo.userId == u3.userId == true then
                v6 = v;
                break;
            end;
        end;

        local v7;

        if v6 == nil then
            v7 = v6;
        else
            v7 = v6.generic.matchOutcome;
        end;

        local v8 = ColorUtil.hexColor(5832693);
        local CIRCLE_HOLLOW = BedwarsImageId.CIRCLE_HOLLOW;
        local v9;

        if v7 then
            if v7 == MatchOutcome.WIN then
                CIRCLE_HOLLOW = BedwarsImageId.TROPHY_SOLID;
                v8 = ColorUtil.hexColor(16772696);
                v9 = "VICTORY";
            elseif v7 == MatchOutcome.LOSS then
                CIRCLE_HOLLOW = BedwarsImageId.STAT_UPGRADE_DESTRUCTION;
                v8 = ColorUtil.hexColor(14408667);
                v9 = "DEFEAT";
            else
                CIRCLE_HOLLOW = BedwarsImageId.QUESTION_MARK_SOLID;
                v8 = ColorUtil.hexColor(14408667);
                v9 = "PENDING";
            end;
        else
            v9 = "TIE";
        end;

        if u3.match.matchCancelled then
            v8 = ColorUtil.hexColor(5832693);
            CIRCLE_HOLLOW = BedwarsImageId.CIRCLE_HOLLOW;
            v9 = "Cancelled";
        end;

        local v10 = DateTime.fromUnixTimestamp(u3.match.matchStartTime):FormatLocalTime("llll", "en-us");
        local matchDuration = u3.match.matchDuration;
        local v11 = math.floor(matchDuration / 60);
        local v12 = math.floor(matchDuration - v11 * 60);
        local v13 = tostring(v11) .. "m " .. tostring(v12) .. "s";
        local v14 = not u3.match;

        if not v14 then
            local mapId = u3.match.mapId;

            if mapId == "" then
                mapId = false;
            end;

            v14 = not mapId;
        end;

        if v14 then
            Logger:default():Info("[MATCH HISTORY] {matchId}", u3.match.matchId);

            return u1.createFragment();
        end;

        local title = getQueueMeta(u3.match.queueType).title;
        local v15 = MapDataUtil.getMapDisplayName(u3.match.mapId);
        local v16 = MapDataUtil.getMapImage(u3.match.mapId);
        local v17;

        if v6 == nil then
            v17 = v6;
        else
            v17 = v6.bedwars.kit;
        end;

        if v17 == nil then
            v17 = BedwarsKit.NONE;
        end;

        local renderImage = getBedwarsKitMeta(v17).renderImage;
        local teams = u3.match.teams;

        local function v21(p18) -- Line: 99
            -- upvalues: u3 (copy)
            local u19 = false;

            local function _(p20) -- Line: 102
                -- upvalues: u3 (ref), u19 (ref)
                if p20.userId == u3.userId then
                    u19 = true;

                    return nil;
                end;
            end;

            for _, v in p18.members do
                if v.userId == u3.userId then
                    u19 = true;
                end;
            end;

            return u19;
        end;

        local v22 = nil;

        for i, v in teams do
            if v21(v, i - 1, teams) == true then
                v22 = v;
                break;
            end;
        end;

        local v23;

        if v22 == nil then
            v23 = v22;
        else
            v23 = v22.name;
        end;

        local v24;

        if v22 == nil then
            v24 = v22;
        else
            v24 = v22.colorHex;
        end;

        local v25;

        if v24 == "" or not v24 then
            v25 = ColorUtil.WHITE;
        else
            v25 = Color3.fromHex(v22.colorHex);
        end;

        if v6 ~= nil then
            v6 = v6.ranked;

            if v6 ~= nil then
                v6 = v6.rpDelta;
            end;
        end;

        local v26 = {
            Size = UDim2.new(1, 0, 0, 70),
            BorderSizePixel = 0,
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = 0,
            LayoutOrder = u3.LayoutOrder,

            [u1.Event.Activated] = function() -- Line: 151
                -- upvalues: u3 (copy)
                u3.onClick();
            end
        };
        local v27 = {};
        local v28 = u1.createElement("ImageLabel", {
            ImageTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.73, 1),
            Image = v16,
            ScaleType = Enum.ScaleType.Crop,
            BackgroundColor3 = ColorUtil.WHITE
        }, { u1.createElement("UIGradient", {
                Rotation = 0,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.26, 0.55), NumberSequenceKeypoint.new(1, 1) })
            }) });
        local createElement = u1.createElement;
        local v29 = {
            Rotation = 0
        };
        local new = ColorSequence.new;
        local v30 = {};
        local new2 = ColorSequenceKeypoint.new;
        local v31;

        if v7 == MatchOutcome.WIN then
            v31 = ColorUtil.darken(Theme.backgroundSuccess, 0.6);
        else
            v31 = ColorUtil.darken(Theme.backgroundTertiaryCard, 1);
        end;

        local v32 = new2(0, v31);
        local new3 = ColorSequenceKeypoint.new;
        local v33;

        if v7 == MatchOutcome.WIN then
            v33 = ColorUtil.darken(Theme.backgroundSuccess, 0.4);
        else
            v33 = ColorUtil.darken(Theme.backgroundTertiaryCard, 1);
        end;

        v30[1], v30[2], v30[3] = v32, new3(0.26, v33), ColorSequenceKeypoint.new(1, Theme.backgroundTertiaryCard);
        v29.Color = new(v30);
        v27[1], v27[2] = v28, createElement("UIGradient", v29);
        local _ = #v27;
        local v34 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v35 = {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            Results = u1.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.14, 1)
            }, { u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.6,
                    Size = UDim2.fromScale(0.85, 0.85),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = CIRCLE_HOLLOW,
                    ImageColor3 = v8
                }, { u1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }), u1.createElement("TextLabel", {
                    TextSize = 20,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.85, 0.85),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Text = v9,
                    TextColor3 = v8,
                    Font = Enum.Font.LuckiestGuy
                }) }),
            KitUsed = u1.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.12, 1)
            }, { u1.createElement("Frame", {
                    BackgroundTransparency = 1,
                    ClipsDescendants = true,
                    Size = UDim2.fromScale(0.95, 0.8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, { u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ImageTransparency = 0,
                        Size = UDim2.fromScale(1.5, 1.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.7),
                        ScaleType = Enum.ScaleType.Fit,
                        Image = renderImage
                    }, { u1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }) }) })
        };
        local _ = #v35;
        local v36 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.27, 1),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local v37 = { u1.createElement("UIGradient", {
                Rotation = 0,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Theme.backgroundTertiary), ColorSequenceKeypoint.new(1, Theme.backgroundTertiary) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.9, 0.5), NumberSequenceKeypoint.new(1, 0.5) })
            }) };
        local v38 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.9),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v39 = {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = UDim.new(0, 8)
            }),
            StartTime = u1.createElement("TextLabel", {
                LayoutOrder = 0,
                TextSize = 15,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.2),
                Text = v10,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Right
            })
        };
        local v40 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.2)
        };
        local v41 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = UDim.new(0, 8)
            }) };
        local _ = #v41;
        local v42 = {
            FrameProps = {
                Size = UDim2.fromScale(0.4, 1)
            },
            Image = BedwarsImageId.SERVER_ICON
        };
        local serverRegion = u3.match.serverRegion;

        if serverRegion ~= nil then
            serverRegion = serverRegion.countryCode;
        end;

        local v43 = tostring(serverRegion) .. "-";
        local serverRegion2 = u3.match.serverRegion;

        if serverRegion2 ~= nil then
            serverRegion2 = serverRegion2.region;
        end;

        v42.Text = v43 .. tostring(serverRegion2);
        v42.TextProps = {
            TextSize = 20,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
            TextXAlignment = Enum.TextXAlignment.Right
        };
        v42.ListLayoutProps = {
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        };
        v42.LayoutOrder = 1;
        v42.ImageLeft = true;
        v42.TextScale = 1.2;
        v42.Padding = UDim.new(0, 5);
        v41.Region = u1.createElement(LabelledText, v42);
        v41.Duration = u1.createElement(LabelledText, {
            LayoutOrder = 1,
            ImageLeft = true,
            TextScale = 1.2,
            FrameProps = {
                Size = UDim2.fromScale(0.4, 1)
            },
            Image = BedwarsImageId.HUD_TIMER_ICON,
            Text = v13,
            TextProps = {
                TextSize = 20,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Right
            },
            ListLayoutProps = {
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            },
            Padding = UDim.new(0, 5)
        });
        v39[#v39 + 1] = u1.createElement(Empty, v40, v41);
        v37[#v37 + 1] = u1.createElement("Frame", v38, v39);
        v35.TimeInfo = u1.createElement("Frame", v36, v37);
        v35.QueueInfo = u1.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.25, 1)
        }, { u1.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.95, 0.95),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5)
            }, {
                u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = UDim.new(0, 8)
                }),
                QueueType = u1.createElement("TextLabel", {
                    LayoutOrder = 0,
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.2),
                    Text = title,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }),
                Map = u1.createElement("TextLabel", {
                    LayoutOrder = 1,
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.2),
                    Text = v15,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                })
            }) });
        local v44 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(0.22, 1)
        };
        local v45 = {};
        local v46 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.95, 0.95),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v47 = {
            u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 8)
            }),
            TeamName = u1.createElement("TextLabel", {
                LayoutOrder = 0,
                TextSize = 16,
                BackgroundTransparency = 1,
                RichText = true,
                Size = UDim2.fromScale(1, 0.2),
                Text = "Team: <font color=\"" .. ColorUtil.richTextColor(v25) .. "\">" .. (v23 == nil and "N/A" or v23) .. "</font>",
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
        };
        local v48 = #v47;
        local v49;

        if v6 == nil then
            v49 = false;
        else
            local createFragment = u1.createFragment;
            local v50 = {};
            local createElement2 = u1.createElement;
            local v51 = {
                LayoutOrder = 1,
                ImageLeft = true,
                FrameProps = {
                    Size = UDim2.fromScale(1, 0.2)
                }
            };
            local v52 = math.abs(v6);
            v51.Text = "<b>" .. (v6 >= 0 and "+" or "-") .. tostring(v52) .. "</b>";
            v51.TextProps = {
                RichText = true,
                TextSize = 16,
                TextColor3 = ColorUtil.WHITE
            };
            local v53;

            if v6 >= 0 then
                v53 = BedwarsImageId.CARET_UP;
            else
                v53 = BedwarsImageId.CARET_DOWN;
            end;

            v51.Image = v53;
            local v54 = {};
            local v55;

            if v6 >= 0 then
                v55 = Theme.backgroundSuccess;
            else
                v55 = Theme.backgroundError;
            end;

            v54.ImageColor3 = v55;
            v51.ImageProps = v54;
            v51.Padding = UDim.new(0, 5);
            v50.RankDelta = createElement2(LabelledText, v51);
            v49 = createFragment(v50);
        end;

        if v49 then
            v47[v48 + 1] = v49;
        end;

        v45[#v45 + 1] = u1.createElement("Frame", v46, v47);
        v35.GameInfo = u1.createElement("Frame", v44, v45);
        v27.MatchInfo = u1.createElement("Frame", v34, v35);

        return u1.createFragment({
            MatchHistoryEntryCard = u1.createElement("ImageButton", v26, v27)
        });
    end)
};