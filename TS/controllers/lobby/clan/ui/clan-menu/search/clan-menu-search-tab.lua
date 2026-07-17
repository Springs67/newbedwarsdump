-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Pagination = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "custom-matches", "ui", "tabs", "map-browser", "pagination", "pagination").Pagination;
local DropdownSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "dropdown-searchbar").DropdownSearchbar;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local SearchClansField = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "http-clients", "clan", "requests", "search-clans-request").SearchClansField;
local HoarcekatDummyClanSearchList = RuntimeLib.import(script, script.Parent.Parent, "dummy-clan-search-list").HoarcekatDummyClanSearchList;
local ClanMenuSearchClanList = RuntimeLib.import(script, script.Parent, "clan-menu-search-clan-list").ClanMenuSearchClanList;
local ClanSearchInspectCard = RuntimeLib.import(script, script.Parent, "clan-search-inspect-card").ClanSearchInspectCard;
local v5 = v2.entries(SearchClansField);

local function _(p6) -- Line: 21
    -- upvalues: StringUtil (copy)
    local _ = p6[1];
    local v7 = p6[2];

    return {
        text = StringUtil.capitalizeFirstLetter(v7),
        value = v7
    };
end;

local u8 = table.create(#v5);

for i, v in v5 do
    local _ = i - 1;
    local _ = v[1];
    local v9 = v[2];
    u8[i] = {
        text = StringUtil.capitalizeFirstLetter(v9),
        value = v9
    };
end;

return {
    ClanMenuSearchTab = v4.new(u3)(function(p10, p11) -- Line: 36
        -- upvalues: SearchClansField (copy), DeviceUtil (copy), HoarcekatDummyClanSearchList (copy), KnitClient (copy), u3 (copy), CircularSpinner (copy), ClanMenuSearchClanList (copy), Pagination (copy), DropdownSearchbar (copy), u8 (copy), ClanUtil (copy), Empty (copy), Padding (copy), ClanSearchInspectCard (copy)
        local useState = p11.useState;
        local useEffect = p11.useEffect;
        local u12, u13 = useState("");
        local u14, u15 = useState(SearchClansField.Name);
        local v16, u17 = useState(1);
        local v18, u19 = useState(not DeviceUtil.isHoarceKat() and {} or HoarcekatDummyClanSearchList);
        local v20, u21 = useState(false);
        local v22, u23 = useState(nil);
        local u24 = nil;

        local function u30(p25, p26) -- Line: 49
            -- upvalues: u21 (copy), KnitClient (ref), u14 (copy), u19 (copy), u17 (copy), u23 (copy), u24 (ref)
            local u27 = p26 == nil and 1 or p26;

            if p25 == "" or not p25 then
                u24();
            else
                u21(true);
                KnitClient.Controllers.ClanSearchController:searchClan({
                    keyword = p25,
                    searchField = u14,
                    page = math.max(u27 - 1, 0)
                }):andThen(function(p28) -- Line: 60
                    -- upvalues: u19 (ref), u17 (ref), u27 (ref), u23 (ref), u21 (ref)
                    local v29 = {};
                    local clans = p28.clans;
                    table.move(clans, 1, #clans, #v29 + 1, v29);
                    u19(v29);
                    u17(u27);

                    if #v29 ~= 0 then
                        u23(v29[1]);
                    end;

                    u21(false);
                end);
            end;
        end;

        u24 = function(u31) -- Line: 78
            -- upvalues: u21 (copy), KnitClient (ref), u19 (copy), u23 (copy)
            if u31 then
                u21(true);
            end;

            KnitClient.Controllers.ClanSearchController:getRecommenedClans():andThen(function(p32) -- Line: 83
                -- upvalues: u19 (ref), u23 (ref), u31 (copy), u21 (ref)
                local v33 = {};
                local clans = p32.clans;
                table.move(clans, 1, #clans, #v33 + 1, v33);
                u19(v33);

                if #v33 ~= 0 then
                    u23(v33[1]);
                end;

                if u31 then
                    u21(false);
                end;
            end):catch(function(p34) -- Line: 97
                -- upvalues: u31 (copy), u21 (ref)
                if u31 then
                    u21(false);
                end;
            end);
        end;

        local function u39(u35) -- Line: 103
            -- upvalues: u21 (copy), KnitClient (ref), u19 (copy), u23 (copy)
            if u35 then
                u21(true);
            end;

            return KnitClient.Controllers.ClanSearchController:getRandomClans():andThen(function(p36) -- Line: 108
                -- upvalues: u19 (ref), u23 (ref), u35 (copy), u21 (ref)
                local v37 = {};
                local clans = p36.clans;
                table.move(clans, 1, #clans, #v37 + 1, v37);
                u19(v37);

                if #v37 ~= 0 then
                    u23(v37[1]);
                end;

                if u35 then
                    u21(false);
                end;
            end):catch(function(p38) -- Line: 122
                -- upvalues: u35 (copy), u21 (ref)
                if u35 then
                    u21(false);
                end;
            end);
        end;

        local function _() -- Line: 128
            -- upvalues: u39 (copy)
            u39(true);
        end;

        useEffect(function() -- Line: 131
            -- upvalues: DeviceUtil (ref), u39 (copy)
            if not DeviceUtil.isHoarceKat() then
                u39(true);
            end;
        end, {});
        local v40 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v41 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }) };
        local v42 = #v41;
        local v43;

        if v20 then
            v43 = u3.createElement(CircularSpinner, {
                LayoutOrder = 10,
                Size = UDim2.fromScale(0.3, 0.3),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
        else
            local v44;

            if #v18 == 0 then
                v44 = u3.createElement("TextLabel", {
                    Text = "No clans found from search",
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    TextSize = 16,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(0.33, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                });
            else
                local v45 = {};
                local v46 = #v45;
                local v47 = {
                    LayoutOrder = 3,
                    Size = UDim2.new(1, 0, 0.76, 0),
                    Clans = v18
                };
                local v48;

                if v22 == nil then
                    v48 = v22;
                else
                    v48 = v22.clanId;
                end;

                v47.SelectedClanId = v48;
                v47.SetSelectedClan = u23;
                v45[v46 + 1] = u3.createElement(ClanMenuSearchClanList, v47);
                local v49;

                if u12 == nil then
                    v49 = false;
                else
                    v49 = u3.createElement(Pagination, {
                        NumPagesAroundCurr = 0,
                        Page = v16,

                        OnPageChage = function(p50) -- Line: 181, Name: OnPageChage
                            -- upvalues: u17 (copy), u30 (copy), u12 (copy)
                            u17(p50);
                            u30(u12, p50);
                        end,

                        FrameProps = {
                            LayoutOrder = 4,
                            Size = UDim2.new(1, 0, 0.06, 0)
                        }
                    });
                end;

                if v49 then
                    v45[v46 + 2] = v49;
                end;

                v44 = u3.createFragment(v45);
            end;

            local v51 = {
                [#v51 + 1] = v44
            };
            v43 = u3.createFragment(v51);
        end;

        local v52 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v56 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.03, 0)
            }),
            u3.createElement(DropdownSearchbar, {
                Size = UDim2.fromScale(1, 0.08),
                DropdownItems = u8,

                OnFocusLost = function(p53, p54) -- Line: 230, Name: OnFocusLost
                    -- upvalues: u13 (copy), u30 (copy)
                    if not p54 then
                        return nil;
                    end;

                    u13(p53);
                    u30(p53);
                end,

                OnDropdownValueChange = function(p55) -- Line: 237, Name: OnDropdownValueChange
                    -- upvalues: u15 (copy)
                    u15(p55);
                end,

                Searchbar = {
                    HideSearchIcon = true,
                    DisplaySearchButton = true,
                    Size = UDim2.fromScale(0.85, 1),
                    PlaceHolderText = "Search clan " .. u14,
                    MaxCharLength = ClanUtil.CLAN_TAG_MAX_CHAR_LIMIT
                },
                DropdownProps = {
                    Size = UDim2.fromScale(0.15, 1)
                }
            }),
            TableHeadersWrapper = u3.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.05),
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1, 0)
            }, {
                TableHeaders = u3.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0)
                }, {
                    u3.createElement(Padding, {
                        Padding = {
                            Horizontal = 8
                        }
                    }),
                    u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        VerticalAlignment = "Bottom",
                        HorizontalAlignment = "Right",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.03, 0)
                    }),
                    TableHeaderLevel = u3.createElement("TextLabel", {
                        Text = "Lv.",
                        TextXAlignment = "Left",
                        TextYAlignment = "Bottom",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.33, 1),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }),
                    TableHeaderMembers = u3.createElement("TextLabel", {
                        Text = "Members",
                        TextXAlignment = "Left",
                        TextYAlignment = "Bottom",
                        TextSize = 14,
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(0.33, 1),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                })
            }),
            [#v56 + 1] = v43
        };
        v41.LeftContainer = u3.createElement(Empty, v52, v56);
        local v57;

        if v22 == nil then
            v57 = false;
        else
            v57 = u3.createElement(ClanSearchInspectCard, {
                Clan = v22
            });
        end;

        if v57 then
            v41[v42 + 1] = v57;
        end;

        return u3.createElement(Empty, v40, v41);
    end)
};