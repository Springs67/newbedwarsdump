-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TabsComponent = v1.TabsComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanBorderType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderType;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local ClanWarLeaderboardType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-leaderboard").ClanWarLeaderboardType;
local ClanWarMedal = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal;
local ClanWarDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-profile-dto").ClanWarDivision;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ClanWarActiveBanner = RuntimeLib.import(script, script.Parent.Parent, "clan-war-active-banner").ClanWarActiveBanner;
local ClanWarLeaderboardCard = RuntimeLib.import(script, script.Parent, "clan-war-leaderboard-entry").ClanWarLeaderboardCard;
local u4 = {
    {
        tag = "gg",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.BRONZE] = 1,
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 1
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.BRONZE] = 1,
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 1
        }
    },
    {
        tag = "gg",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.BRONZE] = 3
        }),
        division = ClanWarDivision.Division_II,
        medals = {
            [ClanWarMedal.BRONZE] = 3
        }
    },
    {
        tag = "gg",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 2
        }),
        division = ClanWarDivision.Division_III,
        medals = {
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 2
        }
    },
    {
        tag = "gg",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.GOLD] = 3
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.GOLD] = 3
        }
    },
    {
        tag = "gg",
        score = 450,
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        division = ClanWarDivision.Division_I,
        medals = {}
    },
    {
        tag = "gg",
        score = 450,
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        division = ClanWarDivision.Division_I,
        medals = {}
    }
};
local u5 = {
    {
        tag = "FAST",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.BRONZE] = 1,
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 1
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.BRONZE] = 1,
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 1
        },
        border = ClanBorderType.GOLD
    },
    {
        tag = "LOVE",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.BRONZE] = 3
        }),
        division = ClanWarDivision.Division_II,
        medals = {
            [ClanWarMedal.BRONZE] = 3
        }
    },
    {
        tag = "EZ",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 2
        }),
        division = ClanWarDivision.Division_III,
        medals = {
            [ClanWarMedal.SILVER] = 3,
            [ClanWarMedal.GOLD] = 2
        },
        border = ClanBorderType.WANTED
    },
    {
        tag = "RCR",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.GOLD] = 3
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.GOLD] = 3
        }
    },
    {
        tag = "EASY",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.GOLD] = 3
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.GOLD] = 3
        }
    },
    {
        tag = "HOOK",
        clanId = "123",
        icon = BedwarsImageId.AFK_CRATE_RENDER,
        score = ClanWarUtils.calculateMedalsScore({
            [ClanWarMedal.GOLD] = 3
        }),
        division = ClanWarDivision.Division_I,
        medals = {
            [ClanWarMedal.GOLD] = 3
        },
        border = ClanBorderType.SILVER
    }
};

return {
    ClanWarLeaderboard = v3.new(u2)(function(p6, p7) -- Line: 164
        -- upvalues: ClanWarLeaderboardType (copy), DeviceUtil (copy), u4 (copy), u5 (copy), RunService (copy), ClientStore (copy), ClanWarDivision (copy), KnitClient (copy), u2 (copy), TabsComponent (copy), ClanWarActiveBanner (copy), CircularSpinner (copy), ColorUtil (copy), ClanWarLeaderboardCard (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(true);
        local v10, u11 = useState({});
        local u12, u13 = useState(ClanWarLeaderboardType.WEEKLY);
        useEffect(function() -- Line: 170
            -- upvalues: DeviceUtil (ref), u12 (copy), ClanWarLeaderboardType (ref), u11 (copy), u4 (ref), u5 (ref), u9 (copy), RunService (ref), ClientStore (ref), ClanWarDivision (ref), KnitClient (ref)
            local u14 = true;

            if DeviceUtil.isHoarceKat() then
                if u12 == ClanWarLeaderboardType.WEEKLY then
                    u11(u4);
                else
                    u11(u5);
                end;

                u9(false);

                return nil;
            end;

            if RunService:IsStudio() then
                local myClan = ClientStore:getState().Clans.myClan;

                if myClan and u12 == ClanWarLeaderboardType.WEEKLY then
                    u11({
                        {
                            score = 450,
                            tag = myClan.tag,
                            icon = myClan.image,
                            clanId = myClan.id,
                            medals = {},
                            division = ClanWarDivision.Division_I
                        }
                    });
                else
                    u11(u5);
                end;

                u9(false);

                return nil;
            end;

            if u12 == ClanWarLeaderboardType.WEEKLY then
                KnitClient.Controllers.ClanController:requestClanWarWeeklyLeaderboardAsync():andThen(function(p15) -- Line: 199
                    -- upvalues: u14 (ref), u11 (ref), u9 (ref)
                    if not u14 then
                        return nil;
                    end;

                    if p15 then
                        u11(p15);
                    end;

                    u9(false);
                end);
            elseif u12 == ClanWarLeaderboardType.ALLTIME then
                KnitClient.Controllers.ClanController:requestClanWarAllTimeLeaderboardAsync():andThen(function(p16) -- Line: 211
                    -- upvalues: u14 (ref), u11 (ref), u9 (ref)
                    if not u14 then
                        return nil;
                    end;

                    if p16 then
                        u11(p16);
                    end;

                    u9(false);
                end);
            end;

            local function _() -- Line: 223
                -- upvalues: u14 (ref)
                u14 = false;
            end;
        end, { u12 });
        local v17 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.02, 0)
            }), u2.createElement(TabsComponent, {
                Value = u12,
                Tabs = {
                    {
                        text = "WEEKLY",
                        value = ClanWarLeaderboardType.WEEKLY
                    },
                    {
                        text = "ALL-TIME",
                        value = ClanWarLeaderboardType.ALLTIME
                    }
                },

                OnChange = function(p18) -- Line: 246, Name: OnChange
                    -- upvalues: u13 (copy)
                    u13(p18.value);
                end,

                FrameProps = {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0.06)
                },
                UIListLayout = {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }
            }) };
        local v20 = #v19;
        local v21;

        if u12 == ClanWarLeaderboardType.WEEKLY then
            v21 = u2.createElement(ClanWarActiveBanner, {
                FrameProps = {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.14)
                }
            });
        else
            v21 = false;
        end;

        if v21 then
            v19[v20 + 1] = v21;
        end;

        local v22;

        if v8 then
            v22 = u2.createElement(CircularSpinner, {
                Size = UDim2.fromScale(0.5, 0.5)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        elseif #v10 == 0 then
            v22 = u2.createFragment({
                Empty = u2.createElement("TextLabel", {
                    Text = "Leaderboard is empty",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(0.6, 0.3),
                    TextColor3 = ColorUtil.WHITE
                })
            });
        elseif v10 == nil then
            v22 = v10;
        else
            table.sort(v10, function(p23, p24) -- Line: 299
                return p23.tag < p24.tag;
            end);
            table.sort(v10, function(p25, p26) -- Line: 303
                return p25.score > p26.score;
            end);

            local function v30(p27, p28) -- Line: 307
                -- upvalues: u12 (copy), u2 (ref), ClanWarLeaderboardCard (ref)
                local v29 = {
                    ClanWarLeaderboardType = u12,
                    Placement = p28 + 1,
                    ClanId = p27.clanId
                };
                local icon = p27.icon;
                v29.Icon = icon == nil and "" or icon;
                v29.Name = p27.tag;
                v29.Division = p27.division;
                v29.Tag = p27.tag;
                v29.Score = p27.score;
                v29.Medals = p27.medals;
                v29.Border = p27.border;

                return u2.createElement(ClanWarLeaderboardCard, v29);
            end;

            v22 = table.create(#v10);

            for i, v in v10 do
                v22[i] = v30(v, i - 1, v10);
            end;
        end;

        local v31 = {
            ScrollingFrameProps = {
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, u12 == ClanWarLeaderboardType.WEEKLY and 0.64 or 0.8),
                Position = UDim2.fromScale(0, 0.1)
            }
        };
        local v32 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 6)
            }) };
        local v33 = #v32;

        if v22.elements == nil and (v22.props == nil or v22.component == nil) then
            for i, v in v22 do
                v32[v33 + i] = v;
            end;
        else
            v32[v33 + 1] = v22;
        end;

        v19[#v19 + 1] = u2.createElement(AutoCanvasScrollingFrame, v31, v32);

        return u2.createElement(Empty, v17, v19);
    end)
};