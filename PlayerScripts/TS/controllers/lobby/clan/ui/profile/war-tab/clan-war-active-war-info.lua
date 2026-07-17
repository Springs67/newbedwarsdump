-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanWarActiveBanner = RuntimeLib.import(script, script.Parent, "clan-war-active-banner").ClanWarActiveBanner;
local PillCounter = RuntimeLib.import(script, script.Parent, "pill-counter").PillCounter;
local PillText = RuntimeLib.import(script, script.Parent, "pill-text").PillText;

return {
    ClanWarActiveWarInfo = v3.new(u2)(function(p4, p5) -- Line: 17
        -- upvalues: ClanWarUtils (copy), default (copy), KnitClient (copy), Theme (copy), u2 (copy), ColorUtil (copy), Empty (copy), ClanWarActiveBanner (copy), BedwarsImageId (copy), Countdown (copy), PillText (copy), PillCounter (copy)
        local _ = p5.useState;
        local v6 = not p4.ActiveClanWar and 1 or ClanWarUtils.getDivisionMultipliers(p4.ActiveClanWar.division).matchScore;

        local function _() -- Line: 20
            -- upvalues: default (ref)
            default.Client:GetNamespace("Clans"):Get("GoToClanHQ"):SendToServer();
        end;

        local function _() -- Line: 23
            -- upvalues: KnitClient (ref), ClanWarUtils (ref)
            KnitClient.Controllers.QueueController:joinQueue(ClanWarUtils.activeQueue);
        end;

        local function v9(p7) -- Line: 26
            -- upvalues: Theme (ref), u2 (ref), ColorUtil (ref)
            local v8 = {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.15),
                BackgroundColor3 = Theme.backgroundTertiary
            };
            local LayoutOrder = p7.LayoutOrder;
            v8.LayoutOrder = LayoutOrder == nil and 5 or LayoutOrder;

            return u2.createElement("Frame", v8, {
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }),
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0)
                }),
                Label = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    TextTransparency = 0.3,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Position = UDim2.fromScale(0, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromScale(0.7, 0.7),
                    Text = p7.Label,
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                Value = u2.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    TextXAlignment = "Right",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Size = UDim2.fromScale(0.3, 0.7),
                    Text = tostring(p7.Value),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) })
            });
        end;

        local function u11(p10) -- Line: 84
            -- upvalues: u2 (ref), Empty (ref), ColorUtil (ref), Theme (ref)
            return u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 20)
            }, {
                Left = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.3, 1),
                    BackgroundColor3 = ColorUtil.hexColor(8948973)
                }, { u2.createElement("TextLabel", {
                        TextScaled = true,
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Text = string.upper(p10.LeftText),
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }) }),
                Right = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.7, 1),
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundColor3 = Theme.backgroundTertiary
                }, { u2.createElement("TextLabel", {
                        TextScaled = true,
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 1),
                        Text = p10.RightText,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Theme.textPrimary
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }) })
            });
        end;

        local v12 = ClanWarUtils.isClanWarsQueueLive();
        local v13 = {};
        local _ = #v13;
        local v14 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.85)
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }) };
        local _ = #v15;
        local v16 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }), u2.createElement(ClanWarActiveBanner) };
        local v18 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.52)
        };
        local v19 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0.02, 0)
            }) };
        local _ = #v19;
        local v20 = {
            Size = UDim2.fromScale(1, 0.6)
        };
        local v21 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                Padding = UDim.new(0.02, 0)
            }) };
        local _ = #v21;
        local v22 = ClanWarUtils.getClanWarUTCTimeRanges();

        local function v26(p23) -- Line: 187
            -- upvalues: u2 (ref), u11 (copy)
            local v24 = p23[1];
            local v25 = p23[2];

            return u2.createElement(u11, {
                LeftText = os.date("%x", v24),
                RightText = os.date("%I:%M %p", v24) .. " - " .. os.date("%I:%M %p", v25)
            });
        end;

        local v27 = table.create(#v22);

        for i, v in v22 do
            v27[i] = v26(v, i - 1, v22);
        end;

        local v28 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 0.49)
        };
        local v29 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder"
            }),
            SectionTitle = u2.createElement("TextLabel", {
                Text = "TIME SLOTS",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 18),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        local v30 = #v29;

        for i, v in v27 do
            v29[v30 + i] = v;
        end;

        v21.TimeSlotsTableContainer = u2.createElement(Empty, v28, v29);
        v21.ScoreGuideTableContainer = u2.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 0.49)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder"
            }),
            SectionTitle = u2.createElement("TextLabel", {
                Text = "SCORE GUIDE",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 18),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }),
            u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 20)
            }, { u2.createElement(u11, {
                    LeftText = "Win",
                    RightText = "+" .. tostring(150 * v6)
                }) }),
            u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 20)
            }, { u2.createElement(u11, {
                    LeftText = "Loss",
                    RightText = "+" .. tostring(30 * v6)
                }) })
        });
        v19.TableRow = u2.createElement(Empty, v20, v21);
        v19.TableRow2 = u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.36)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                Padding = UDim.new(0.02, 0)
            }),
            ScoreGuideTableContainer = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.5, 0.49)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }),
                SectionTitle = u2.createElement("TextLabel", {
                    Text = "MISSIONS SCORE GUIDE",
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0, 18),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0, 20)
                }, { u2.createElement(u11, {
                        LeftText = "ALL MISSIONS",
                        RightText = "+20"
                    }) })
            }),
            ScoreGuideTableContainer2 = u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.5, 0.49)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }),
                SectionTitle = u2.createElement("TextLabel", {
                    Text = "War Crystals Guide",
                    TextScaled = true,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.new(1, 0, 0, 18),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0, 20)
                }, { u2.createElement(u11, {
                        LeftText = "Clan War Crystals",
                        RightText = "War Points * 10"
                    }) })
            })
        });
        v17.TableList = u2.createElement(Empty, v18, v19);
        local v31 = {
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, 0.2)
        };
        local v32 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.04, 0)
            }), u2.createElement("ImageButton", {
                Size = UDim2.fromScale(0.48, 1),
                BackgroundColor3 = ColorUtil.WHITE,
                BorderSizePixel = 0,

                [u2.Event.Activated] = function() -- Line: 363
                    -- upvalues: default (ref)
                    default.Client:GetNamespace("Clans"):Get("GoToClanHQ"):SendToServer();
                end,

                LayoutOrder = 1
            }, {
                u2.createElement("UIGradient", {
                    Rotation = 45,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#33355E")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6165B3")) })
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                u2.createElement("UIStroke", {
                    Color = Color3.fromHex("#585BA3")
                }),
                u2.createElement(Empty, {
                    Position = UDim2.fromScale(0.1, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromScale(0.5, 0.75)
                }, { u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center"
                    }), u2.createElement("TextLabel", {
                        Text = "GO TO CLAN HQ",
                        TextScaled = true,
                        TextXAlignment = "Left",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.6),
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) }) }),
                u2.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ImageTransparency = 0.7,
                    BackgroundTransparency = 1,
                    Position = UDim2.fromScale(0.925, 0.5),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.ANNIVERSARY_BALLOON_LOBBY_GADGET,
                    ScaleType = Enum.ScaleType.Crop
                })
            }) };
        local v33 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.48, 1)
        };
        local v34 = {};
        local v35 = #v34;
        local v36 = not v12 and u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 0.6),
            Position = UDim2.fromScale(0, -0.35),
            AnchorPoint = Vector2.new(0, 0),
            BackgroundColor3 = Color3.fromHex("#2B2B2B")
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement(Countdown, {
                PreText = "OPENS IN: ",
                EndTime = ClanWarUtils.getNextQueueOpenTime(),
                TextLabel = {
                    TextTransparency = 0.3,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    ZIndex = 1,
                    Size = UDim2.fromScale(1, 0.7),
                    Position = UDim2.fromScale(0.1, -0.1),
                    AnchorPoint = Vector2.new(0, 0)
                }
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) }) });

        if v36 then
            v34[v35 + 1] = v36;
        end;

        local createElement = u2.createElement;
        local v37 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,

            [u2.Event.Activated] = function() -- Line: 459
                -- upvalues: KnitClient (ref), ClanWarUtils (ref)
                KnitClient.Controllers.QueueController:joinQueue(ClanWarUtils.activeQueue);
            end,

            ZIndex = 2
        };
        local v38 = {};
        local createElement2 = u2.createElement;
        local v39 = {
            Rotation = 45
        };
        local v40;

        if v12 then
            v40 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#48a878")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6AC4A4")) });
        else
            v40 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#8D8D8D")), ColorSequenceKeypoint.new(1, Color3.fromHex("#333333")) });
        end;

        v39.Color = v40;
        local v41 = createElement2("UIGradient", v39);
        local v42 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0.1, 0)
        });
        local createElement3 = u2.createElement;
        local v43 = {};
        local v44;

        if v12 then
            v44 = Color3.fromHex("#63FF8F");
        else
            v44 = Color3.fromHex("#717171");
        end;

        v43.Color = v44;
        local v45 = createElement3("UIStroke", v43);
        local createElement4 = u2.createElement;
        local v46 = {
            ZIndex = 2,
            Position = UDim2.fromScale(0.1, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.5, 0.75)
        };
        local v47 = {};
        local v48 = u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center"
        });
        local createElement5 = u2.createElement;
        local v49 = {
            Text = "QUEUE FOR CLAN WAR",
            TextScaled = true,
            TextXAlignment = "Left",
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ZIndex = 3,
            Size = UDim2.fromScale(1, 0.6),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        };
        local v50;

        if v12 then
            v50 = Color3.fromHex("#63FF8F");
        else
            v50 = ColorUtil.WHITE;
        end;

        v49.TextColor3 = v50;
        v47[1], v47[2], v47[3] = v48, createElement5("TextLabel", v49, { u2.createElement("UITextSizeConstraint", {
        MaxTextSize = 24
    }) }), u2.createElement("TextLabel", {
    Text = "4v4",
    TextScaled = true,
    TextXAlignment = "Left",
    TextYAlignment = "Center",
    TextTransparency = 0.3,
    BackgroundTransparency = 1,
    LayoutOrder = 1,
    ZIndex = 3,
    Size = UDim2.fromScale(1, 0.4),
    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
    TextColor3 = ColorUtil.WHITE
}, { u2.createElement("UITextSizeConstraint", {
        MaxTextSize = 18
    }) });
        v38[1], v38[2], v38[3], v38[4], v38[5] = v41, v42, v45, createElement4(Empty, v46, v47), u2.createElement("ImageLabel", {
    SizeConstraint = "RelativeYY",
    ImageTransparency = 0.7,
    BackgroundTransparency = 1,
    ZIndex = 3,
    Position = UDim2.fromScale(0.925, 0.5),
    AnchorPoint = Vector2.new(1, 0.5),
    Size = UDim2.fromScale(1, 1),
    Image = BedwarsImageId.NOOB_RAGEBLADE,
    ScaleType = Enum.ScaleType.Crop
});
        v34[#v34 + 1] = createElement("ImageButton", v37, v38);
        v32[#v32 + 1] = u2.createElement(Empty, v33, v34);
        v17[#v17 + 1] = u2.createElement(Empty, v31, v32);
        v15.Left = u2.createElement(Empty, v16, v17);
        local v51 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.37, 1)
        };
        local v52 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }) };
        local _ = #v52;
        local v53 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.22),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v54 = { u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.075, 0),
                PaddingBottom = UDim.new(0.075, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }) };
        local v55 = #v54;
        local v56 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.45, 1)
        };
        local v57 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            Title = u2.createElement("TextLabel", {
                Text = "MATCHES PLAYED",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.25),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        local v58 = {
            Icon = BedwarsImageId.BATTLE_ICON
        };
        local ActiveClanWar = p4.ActiveClanWar;
        local v59 = ActiveClanWar ~= nil and #ActiveClanWar.matches or ActiveClanWar;
        v58.Text = "<b>" .. tostring(v59 == nil and 0 or v59) .. " / " .. tostring(ClanWarUtils.maxMatchesPerClan) .. "</b>";
        v58.FrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(0.9, 0, 0, 25)
        };
        v58.Tooltip = "The total matches counts for the whole clan";
        v57[#v57 + 1] = u2.createElement(PillText, v58);
        v54[v55 + 1] = u2.createElement(Empty, v56, v57);
        local v60 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.45, 1)
        };
        local v61 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            DivisionTitle = u2.createElement("TextLabel", {
                Text = "DIVISION",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.25),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        local v62 = {
            Icon = BedwarsImageId.CLAN_CASTLE_ICON
        };
        local ActiveClanWar2 = p4.ActiveClanWar;

        if ActiveClanWar2 ~= nil then
            ActiveClanWar2 = ActiveClanWar2.division;
        end;

        v62.Text = "<b>" .. tostring(ActiveClanWar2 == nil and "" or ActiveClanWar2) .. "</b>";
        v62.FrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(0.9, 0, 0, 25)
        };
        v62.Tooltip = "Clan War Division determines your clan war matchmaking";
        v61[#v61 + 1] = u2.createElement(PillText, v62);
        v54[v55 + 2] = u2.createElement(Empty, v60, v61);
        v52.MatchesPlayedInfo = u2.createElement("Frame", v53, v54);
        local v63 = {
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.75),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v64 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local _ = #v64;
        local v65 = {
            Size = UDim2.fromScale(1, 0.7)
        };
        local v66 = {
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.035, 0),
                PaddingBottom = UDim.new(0.035, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 6)
            }),
            SectionTitle = u2.createElement("TextLabel", {
                Text = "CLAN STATS",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.1),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        local v67 = #v66;
        local v68 = {
            Label = "Wins"
        };
        local ActiveClanWar3 = p4.ActiveClanWar;

        if ActiveClanWar3 ~= nil then
            ActiveClanWar3 = ActiveClanWar3.stats.generic.wins;
        end;

        v68.Value = ActiveClanWar3 == nil and 0 or ActiveClanWar3;
        v66[v67 + 1] = u2.createElement(v9, v68);
        local v69 = {
            Label = "Losses"
        };
        local ActiveClanWar4 = p4.ActiveClanWar;

        if ActiveClanWar4 ~= nil then
            ActiveClanWar4 = ActiveClanWar4.stats.generic.losses;
        end;

        v69.Value = ActiveClanWar4 == nil and 0 or ActiveClanWar4;
        v66[v67 + 2] = u2.createElement(v9, v69);
        v64.StatInfo = u2.createElement(Empty, v65, v66);
        local v70 = {
            BorderSizePixel = 0,
            ImageTransparency = 0.95,
            Size = UDim2.fromScale(1, 0.35),
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1),
            BackgroundColor3 = Theme.backgroundTertiaryCard,
            Image = BedwarsImageId.TROPHY_ICON,
            ScaleType = Enum.ScaleType.Crop,
            TileSize = UDim2.fromOffset(30, 30)
        };
        local v71 = {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }),
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            SectionTitle = u2.createElement("TextLabel", {
                Text = "CLAN WAR POINTS",
                TextScaled = true,
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.3),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            })
        };
        local v72 = {
            Icon = BedwarsImageId.TROPHY_ICON
        };
        local ActiveClanWar5 = p4.ActiveClanWar;

        if ActiveClanWar5 ~= nil then
            ActiveClanWar5 = ActiveClanWar5.score;
        end;

        v72.Amount = ActiveClanWar5 == nil and 0 or ActiveClanWar5;
        v72.Tooltip = "Clan War Points";
        v72.FrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(0.6, 0, 0, 25)
        };
        v71[#v71 + 1] = u2.createElement(PillCounter, v72);
        v64.ClanWarScoreContainer = u2.createElement("ImageLabel", v70, v71);
        v52.StatContainer = u2.createElement("Frame", v63, v64);
        v15.Right = u2.createElement(Empty, v51, v52);
        v13.WAR_INFO = u2.createFragment({
            WAR_INFO = u2.createElement(Empty, v14, v15)
        });

        return u2.createFragment(v13);
    end)
};