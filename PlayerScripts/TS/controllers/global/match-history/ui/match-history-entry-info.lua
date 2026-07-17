-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

local function getOrdinal(p5) -- Line: 18
    local v6 = { "th", "st", "nd", "rd" };
    local v7 = p5 % 100;

    if v7 >= 11 and v7 <= 13 then
        return tostring(p5) .. "th";
    end;

    local v8 = v6[p5 % 10 + 1];

    if v8 == "" or not v8 then
        v8 = v6[1];
    end;

    return tostring(p5) .. v8;
end;

local u9 = {
    TEAM = 0.6,
    KILLS = 0.35,
    BED_BREAKS = 0.35,
    FINAL_KILLS = 0.35,
    DAMAGE = 0.35
};

return {
    MatchHistoryEntryInfo = v4.new(u3)(function(u10, p11) -- Line: 38
        -- upvalues: DeviceUtil (copy), KnitClient (copy), u2 (copy), u9 (copy), u3 (copy), Padding (copy), ColorUtil (copy), getBedwarsKitMeta (copy), BedwarsImageId (copy), Empty (copy), StringUtil (copy), Theme (copy), getOrdinal (copy), AutoCanvasScrollingFrame (copy), AutoSizedText (copy)
        local _ = p11.useState;
        local u12 = DeviceUtil.isHoarceKat() and true or KnitClient.Controllers.PermissionController:hasAnyPermissions({ "admin", "anticheat_mod" });

        local function u18(p13) -- Line: 41
            -- upvalues: u2 (ref), u9 (ref)
            local v14 = u2.values(u9);

            local function _(p15, p16) -- Line: 43
                return p15 + p16;
            end;

            local v17 = 0;

            for i = 1, #v14 do
                local _ = i - 1;
                v17 = v17 + v14[i];
            end;

            return u9[p13] / v17 / 1;
        end;

        local function u47(u19) -- Line: 59
            -- upvalues: u10 (copy), u3 (ref), Padding (ref), u12 (copy), ColorUtil (ref), u18 (copy), getBedwarsKitMeta (ref), BedwarsImageId (ref), Empty (ref), StringUtil (ref)
            local function _(p20) -- Line: 61
                -- upvalues: u19 (copy)
                return tostring(p20.playerInfo.userId) == tostring(u19.userId);
            end;

            local v21 = nil;

            for i, v in u10.match.players do
                local _ = i - 1;

                if tostring(v.playerInfo.userId) == tostring(u19.userId) == true then
                    v21 = v;
                    break;
                end;
            end;

            local offlinePlayer = u19.offlinePlayer;
            local v22 = {
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                BackgroundTransparency = u19.highlight and 0.75 or 1
            };
            local v23 = { u3.createElement(Padding, {
                    Padding = {
                        Horizontal = 8
                    }
                }), u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 4)
                }) };
            local v24 = #v23;
            local v25 = u12;

            if v25 then
                local v26;

                if v21 == nil then
                    v26 = v21;
                else
                    v26 = v21.partyId;
                end;

                v25 = v26 ~= nil;

                if v25 then
                    local createFragment = u3.createFragment;
                    local v27 = {};
                    local createElement = u3.createElement;
                    local v28 = {
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 0.3,
                        Size = UDim2.new(0.85, 0, 0.85, 0),
                        BackgroundColor3 = ColorUtil.WHITE
                    };
                    local v29 = { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), (u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })) };
                    local createElement2 = u3.createElement;
                    local v30 = {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    };
                    local v31 = tostring(v21.partyId);
                    v30.Text = string.sub(v31, 0, 6);
                    v30.TextColor3 = ColorUtil.BLACK;
                    v30.Font = Enum.Font.GothamBold;
                    v29.PartyId = createElement2("TextLabel", v30);
                    v27.PartyIdContainer = createElement("Frame", v28, v29);
                    v25 = createFragment(v27);
                end;
            end;

            local v32 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(u18("TEAM"), 1)
            };
            local v33 = { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 4)
                }) };
            local v34 = #v33;

            if v25 then
                v33[v34 + 1] = v25;
            end;

            local v35 = {
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY
            };
            local v36;

            if v21 == nil then
                v36 = v21;
            else
                v36 = v21.bedwars.kit;
            end;

            local v37;

            if v36 then
                v37 = getBedwarsKitMeta(v21.bedwars.kit).renderImage;

                if v37 == nil then
                    v37 = BedwarsImageId.NONE_KIT_RENDER;
                end;
            else
                v37 = BedwarsImageId.NONE_KIT_RENDER;
            end;

            v35.Image = v37;
            v35.BackgroundTransparency = 1;
            v35.LayoutOrder = 1;
            v33.KitImage = u3.createElement("ImageLabel", v35, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            v33[#v33 + 1] = u3.createElement(Empty, {
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.9, 1)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 0)
                }),
                PlayerDisplayname = u3.createElement("TextBox", {
                    PlaceholderText = "",
                    Size = UDim2.new(1, 0, 0.525, 0),
                    Text = offlinePlayer.displayName,
                    BackgroundTransparency = 1,
                    AutoLocalize = false,
                    TextScaled = true,
                    Font = Enum.Font.SourceSansBold,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = "Left",
                    LayoutOrder = 1,
                    TextEditable = false,
                    ClearTextOnFocus = false,

                    [u3.Change.Text] = function(p38) -- Line: 193
                        -- upvalues: offlinePlayer (copy)
                        p38.Text = offlinePlayer.displayName;
                    end
                }),
                PlayerUsernameWrapper = u3.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0.475, 0)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        SortOrder = "LayoutOrder"
                    }),
                    ["@"] = u3.createElement("TextLabel", {
                        Text = "@",
                        BackgroundTransparency = 1,
                        AutomaticSize = "X",
                        BorderSizePixel = 0,
                        AutoLocalize = false,
                        LayoutOrder = 1,
                        Size = UDim2.new(0, 0, 1, 0),
                        Font = Enum.Font.SourceSans,
                        TextColor3 = Color3.fromRGB(191, 191, 191)
                    }),
                    PlayerUsername = u3.createElement("TextBox", {
                        PlaceholderText = "",
                        Size = UDim2.new(1, 0, 1, 0),
                        Text = offlinePlayer.name,
                        BackgroundTransparency = 1,
                        AutoLocalize = false,
                        TextScaled = true,
                        Font = Enum.Font.SourceSans,
                        TextColor3 = Color3.fromRGB(191, 191, 191),
                        TextXAlignment = "Left",
                        LayoutOrder = 2,
                        TextEditable = false,
                        ClearTextOnFocus = false,

                        [u3.Change.Text] = function(p39) -- Line: 230
                            -- upvalues: offlinePlayer (copy)
                            p39.Text = offlinePlayer.name;
                        end
                    })
                })
            });
            v23[v24 + 1] = u3.createElement(Empty, v32, v33);
            local v40 = {
                Size = UDim2.fromScale(u18("KILLS"), 1)
            };
            local v41;

            if v21 == nil then
                v41 = v21;
            else
                v41 = v21.generic.kills.playerKills;
            end;

            v40.Text = tostring(v41 == nil and 0 or v41);
            v40.Font = Enum.Font.Roboto;
            v40.TextColor3 = Color3.fromRGB(255, 255, 255);
            v40.TextTransparency = 0.2;
            v40.TextSize = 14;
            v40.BackgroundTransparency = 1;
            v40.LayoutOrder = 4;
            v23[v24 + 2] = u3.createElement("TextLabel", v40);
            local v42 = {
                Size = UDim2.fromScale(u18("BED_BREAKS"), 1)
            };
            local v43;

            if v21 == nil then
                v43 = v21;
            else
                v43 = v21.bedwars.bedBreaks;
            end;

            v42.Text = tostring(v43 == nil and 0 or v43);
            v42.Font = Enum.Font.Roboto;
            v42.TextColor3 = Color3.fromRGB(255, 255, 255);
            v42.TextTransparency = 0.2;
            v42.TextSize = 14;
            v42.BackgroundTransparency = 1;
            v42.LayoutOrder = 5;
            v23[v24 + 3] = u3.createElement("TextLabel", v42);
            local v44 = {
                Size = UDim2.fromScale(u18("FINAL_KILLS"), 1)
            };
            local v45;

            if v21 == nil then
                v45 = v21;
            else
                v45 = v21.bedwars.finalKills;
            end;

            v44.Text = tostring(v45 == nil and 0 or v45);
            v44.Font = Enum.Font.Roboto;
            v44.TextColor3 = Color3.fromRGB(255, 255, 255);
            v44.TextTransparency = 0.2;
            v44.TextSize = 14;
            v44.BackgroundTransparency = 1;
            v44.LayoutOrder = 6;
            v23[v24 + 4] = u3.createElement("TextLabel", v44);
            local v46 = {
                Size = UDim2.fromScale(u18("DAMAGE"), 1)
            };

            if v21 ~= nil then
                v21 = v21.generic.damageDealt;
            end;

            v46.Text = StringUtil.formatNumberWithCommas((math.round(v21 == nil and 0 or v21)));
            v46.Font = Enum.Font.Roboto;
            v46.TextColor3 = Color3.fromRGB(255, 255, 255);
            v46.TextTransparency = 0.2;
            v46.TextSize = 14;
            v46.BackgroundTransparency = 1;
            v46.LayoutOrder = 7;
            v23[v24 + 5] = u3.createElement("TextLabel", v46);

            return u3.createElement("Frame", v22, v23);
        end;

        local function u73(p48) -- Line: 318
            -- upvalues: Theme (ref), u3 (ref), Padding (ref), u18 (copy), getOrdinal (ref), u2 (ref), u10 (copy), u47 (copy), AutoCanvasScrollingFrame (ref)
            local team = p48.team;
            local v49 = {
                LayoutOrder = 2,
                BorderSizePixel = 0,
                BackgroundColor3 = Theme.backgroundSecondary
            };
            local v50 = {
                u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 4)
                }),
                TableHeader = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.15),
                    BackgroundColor3 = Theme.backgroundTertiaryCard
                }, {
                    u3.createElement(Padding, {
                        Padding = {
                            Horizontal = 8,
                            Vertical = 6
                        }
                    }),
                    u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Center",
                        Padding = UDim.new(0, 4)
                    }),
                    u3.createElement("TextLabel", {
                        TextSize = 14,
                        RichText = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(u18("TEAM"), 1),
                        Text = team.name .. " Team" .. "  <font color=\"#FFFFFF\">(" .. getOrdinal(team.placement + 1) .. ")</font>",
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromHex(team.colorHex),
                        TextXAlignment = Enum.TextXAlignment.Left
                    }),
                    u3.createElement("TextLabel", {
                        Text = "Kills",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(u18("KILLS"), 1),
                        Font = Enum.Font.Roboto,
                        TextColor3 = Color3.fromHex(team.colorHex)
                    }),
                    u3.createElement("TextLabel", {
                        Text = "Bed Breaks",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(u18("BED_BREAKS"), 1),
                        Font = Enum.Font.Roboto,
                        TextColor3 = Color3.fromHex(team.colorHex)
                    }),
                    u3.createElement("TextLabel", {
                        Text = "Final Kills",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(u18("FINAL_KILLS"), 1),
                        Font = Enum.Font.Roboto,
                        TextColor3 = Color3.fromHex(team.colorHex)
                    }),
                    u3.createElement("TextLabel", {
                        Text = "Damage",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(u18("DAMAGE"), 1),
                        Font = Enum.Font.Roboto,
                        TextColor3 = Color3.fromHex(team.colorHex)
                    })
                })
            };

            local function _(p51, p52) -- Line: 394
                -- upvalues: u10 (ref), u3 (ref), u47 (ref)
                local v53 = p51[1];
                local v54 = p51[2];

                if v53 == u10.userId then
                    return u3.createElement(u47, {
                        highlight = true,
                        LayoutOrder = 1,
                        userId = v53,
                        offlinePlayer = v54
                    });
                end;

                return nil;
            end;

            local v55 = 0;
            local v56 = {};

            for i, v in u2.entries(team.members) do
                local _ = i - 1;
                local v57 = v[1];
                local v58 = v[2];
                local v59;

                if v57 == u10.userId then
                    v59 = u3.createElement(u47, {
                        highlight = true,
                        LayoutOrder = 1,
                        userId = v57,
                        offlinePlayer = v58
                    });
                else
                    v59 = nil;
                end;

                if v59 ~= nil then
                    v55 = v55 + 1;
                    v56[v55] = v59;
                end;
            end;

            local v60 = {
                ScrollingFrameProps = {
                    Name = "TableRows",
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0.85, -4)
                }
            };
            local v61 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder"
                }) };
            local v62 = #v61;

            for i, v in v56 do
                v61[v62 + i] = v;
            end;

            local v63 = #v61;

            local function _(p64, p65) -- Line: 438
                -- upvalues: u10 (ref), u3 (ref), u47 (ref)
                local v66 = p64[1];

                if v66 == u10.userId then
                    return nil;
                end;

                return u3.createElement(u47, {
                    userId = v66,
                    offlinePlayer = p64[2],
                    LayoutOrder = p65 + 2
                });
            end;

            local v67 = 0;
            local v68 = {};

            for i, v in u2.entries(team.members) do
                local v69 = i - 1;
                local v70 = v[1];
                local v71 = v[2];
                local v72;

                if v70 == u10.userId then
                    v72 = nil;
                else
                    v72 = u3.createElement(u47, {
                        userId = v70,
                        offlinePlayer = v71,
                        LayoutOrder = v69 + 2
                    });
                end;

                if v72 ~= nil then
                    v67 = v67 + 1;
                    v68[v67] = v72;
                end;
            end;

            for i, v in v68 do
                v61[v63 + i] = v;
            end;

            v50[#v50 + 1] = u3.createElement(AutoCanvasScrollingFrame, v60, v61);

            return u3.createElement("Frame", v49, v50);
        end;

        local v74 = {
            ScrollingFrameProps = {
                LayoutOrder = 3,
                Size = UDim2.new(1, 0, 0.79, -70)
            }
        };
        local v75 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }), u3.createElement(AutoSizedText, {
                TextSize = 10,
                Text = "Match Id: " .. u10.match.matchId,
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(191, 191, 191),
                TextXAlignment = Enum.TextXAlignment.Left,
                Limits = Vector2.new(300, 60)
            }) };

        local function _(p76) -- Line: 490
            -- upvalues: u10 (copy), u3 (ref), u73 (copy)
            if p76.members[u10.userId] == nil then
                return nil;
            end;

            return u3.createElement(u73, {
                layoutOrder = 1,
                team = p76
            });
        end;

        local v77 = 0;
        local v78 = {};

        for i, v in u10.match.teams do
            local _ = i - 1;
            local v79;

            if v.members[u10.userId] == nil then
                v79 = nil;
            else
                v79 = u3.createElement(u73, {
                    layoutOrder = 1,
                    team = v
                });
            end;

            if v79 ~= nil then
                v77 = v77 + 1;
                v78[v77] = v79;
            end;
        end;

        local v80 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v81 = { u3.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                FillDirectionMaxCells = 1,
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                CellSize = UDim2.new(1, 0, 0, 160),
                CellPadding = UDim2.new(0, 0, 0, 0)
            }) };
        local v82 = #v81;

        for i, v in v78 do
            v81[v82 + i] = v;
        end;

        local v83 = #v81;
        local teams = u10.match.teams;
        table.sort(teams, function(p84, p85) -- Line: 534
            return p84.placement < p85.placement;
        end);

        local function _(p86, p87) -- Line: 538
            -- upvalues: u10 (copy), u3 (ref), u73 (copy)
            if p86.members[u10.userId] == nil then
                return u3.createElement(u73, {
                    team = p86,
                    layoutOrder = p87 + 2
                });
            end;

            return nil;
        end;

        local v88 = 0;
        local v89 = {};

        for i, v in teams do
            local v90 = i - 1;
            local v91;

            if v.members[u10.userId] == nil then
                v91 = u3.createElement(u73, {
                    team = v,
                    layoutOrder = v90 + 2
                });
            else
                v91 = nil;
            end;

            if v91 ~= nil then
                v88 = v88 + 1;
                v89[v88] = v91;
            end;
        end;

        for i, v in v89 do
            v81[v83 + i] = v;
        end;

        v75[#v75 + 1] = u3.createElement(Empty, v80, v81);

        return u3.createElement(AutoCanvasScrollingFrame, v74, v75);
    end)
};