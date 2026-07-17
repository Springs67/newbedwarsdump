-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local deepCopy = v2.deepCopy;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local DropdownSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "dropdown-searchbar").DropdownSearchbar;
local MapBrowser = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-types");
local MapBrowserQueryFields = v5.MapBrowserQueryFields;
local MapBrowserSortFields = v5.MapBrowserSortFields;
local SortPreference = v5.SortPreference;
local MapBrowserTagsGrid = RuntimeLib.import(script, script.Parent, "map-browser-tags-grid").MapBrowserTagsGrid;
local u6 = {
    {
        text = "ALL",
        value = "all"
    },
    {
        text = "MAP TITLE",
        value = MapBrowserQueryFields["0" + 1]
    },
    {
        text = "MAP DESCRIPTION",
        value = MapBrowserQueryFields["1" + 1]
    },
    {
        text = "CREATOR",
        value = MapBrowserQueryFields["2" + 1]
    },
    {
        text = "MAP CODE",
        value = MapBrowserQueryFields["3" + 1]
    }
};
local u7 = { "dislikes" };

local function _(p8) -- Line: 38
    -- upvalues: u7 (copy)
    return table.find(u7, p8) == nil;
end;

local v9 = 0;
local v10 = {};

for i, v in deepCopy(MapBrowserSortFields) do
    local _ = i - 1;

    if table.find(u7, v) == nil == true then
        v9 = v9 + 1;
        v10[v9] = v;
    end;
end;

local function _(p11) -- Line: 53
    return {
        text = "SORT: " .. string.upper(p11),
        value = p11
    };
end;

local u12 = table.create(#v10);

for i, v in v10 do
    local _ = i - 1;
    u12[i] = {
        text = "SORT: " .. string.upper(v),
        value = v
    };
end;

local v13 = v2.entries(SortPreference);

local function _(p14) -- Line: 67
    local v15 = p14[2];

    return {
        text = "SORT: " .. string.upper(p14[1]),
        value = tostring(v15)
    };
end;

local u16 = table.create(#v13);

for i, v in v13 do
    local _ = i - 1;
    local v17 = v[2];
    u16[i] = {
        text = "SORT: " .. string.upper(v[1]),
        value = tostring(v17)
    };
end;

return {
    CustomMapsBrowserSearch = v4.new(u3)(function(u18, p19) -- Line: 82
        -- upvalues: u12 (copy), u16 (copy), SortPreference (copy), MapBrowserQueryFields (copy), KnitClient (copy), DeviceUtil (copy), MapBrowser (copy), u3 (copy), Empty (copy), DropdownSearchbar (copy), u6 (copy), DropdownComponent (copy), MapBrowserTagsGrid (copy)
        local useState = p19.useState;
        local useBinding = p19.useBinding;
        local useEffect = p19.useEffect;
        local u20, u21 = useState(u12[1].value);
        local v22 = tonumber(u16[2].value);

        if v22 == nil then
            v22 = SortPreference.DESCENDING;
        end;

        local u23, u24 = useState(v22);
        local u25, u26 = useState("");
        local u27, u28 = useState(false);
        local u29, u30 = useBinding({});
        local u31, u32 = useBinding(0);

        local function u45(p33, p34, u35) -- Line: 96
            -- upvalues: MapBrowserQueryFields (ref), u26 (copy), u18 (copy), u20 (copy), u23 (copy), u29 (copy), u27 (copy), KnitClient (ref)
            local v36 = {};
            local v37;

            if u35 == nil then
                v37 = u35;
            else
                v37 = u35.queryField;
            end;

            if v37 ~= "" and v37 then
                local function _(p38) -- Line: 104
                    -- upvalues: u35 (copy)
                    local v39 = u35;

                    if v39 ~= nil then
                        v39 = v39.queryField;
                    end;

                    return p38 == v39;
                end;

                local v40 = nil;

                for i, v in MapBrowserQueryFields do
                    local _ = i - 1;
                    local v41;

                    if u35 == nil then
                        v41 = u35;
                    else
                        v41 = u35.queryField;
                    end;

                    if v == v41 == true then
                        v40 = v;
                        break;
                    end;
                end;

                if v40 then
                    table.insert(v36, v40);
                end;
            end;

            u26(p33);
            u18.SetLoading(true);
            local u42 = {
                search = p33
            };

            if #v36 == 0 then
                v36 = nil;
            end;

            u42.queryFields = v36;
            u42.sortBy = u20;
            u42.sortPreference = u23;
            u42.filterTags = u29:getValue();

            if u35 ~= nil then
                u35 = u35.skip;
            end;

            u42.skip = u35;
            u42.featured = u27;
            local CustomMapBrowserController = KnitClient.Controllers.CustomMapBrowserController;
            local v43 = {};

            for i, v in u42 do
                v43[i] = v;
            end;

            CustomMapBrowserController:searchMap(v43):andThen(function(p44) -- Line: 149
                -- upvalues: u18 (ref), u42 (copy)
                u18.onSearchComplete(u42, p44);
                u18.SetLoading(false);
            end);
        end;

        useEffect(function() -- Line: 155
            -- upvalues: u31 (copy), u18 (copy), DeviceUtil (ref), u45 (copy), u25 (copy), MapBrowser (ref), u32 (copy)
            if u31:getValue() == u18.Page then
                return nil;
            end;

            if not DeviceUtil.isHoarceKat() then
                u45(u25, false, {
                    skip = (u18.Page - 1) * MapBrowser.MAPS_PER_PAGE
                });
            end;

            u32(u18.Page);
        end, { u18.Page });

        return u3.createFragment({
            CustomMapsBrowserSearch = u3.createElement(Empty, {
                LayoutOrder = 1,
                ZIndex = 100,
                Size = u18.Size or UDim2.fromScale(1, 0.12)
            }, {
                u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 4)
                }),
                SearchContainer = u3.createElement(Empty, {
                    LayoutOrder = 1,
                    ZIndex = 100,
                    Size = UDim2.new(1, 0, 0.625, 0)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0.01, 0)
                    }),
                    u3.createElement(DropdownSearchbar, {
                        Size = UDim2.new(0.68, 0, 1, 0),
                        DropdownItems = u6,

                        OnFocusLost = function(p46, p47, p48, p49) -- Line: 194, Name: OnFocusLost
                            -- upvalues: u45 (copy)
                            if p47 then
                                u45(p46, p47, {
                                    queryField = p48
                                });
                            end;
                        end,

                        Searchbar = {
                            PlaceHolderText = "SEARCH",
                            HideSearchIcon = true,
                            DisplaySearchButton = true,
                            Size = UDim2.fromScale(0.81, 1)
                        },
                        FrameProps = {
                            LayoutOrder = 1,
                            ZIndex = 100
                        }
                    }),
                    SortByDropdown = u3.createElement(DropdownComponent, {
                        LayoutOrder = 2,
                        Size = UDim2.new(0.125, 0, 0.825, 0),
                        DefaultItem = u12[1],
                        Items = u12,

                        OnItemSelected = function(p50) -- Line: 216, Name: OnItemSelected
                            -- upvalues: u21 (copy)
                            u21(p50);
                        end
                    }),
                    SortPreferenceDropdown = u3.createElement(DropdownComponent, {
                        LayoutOrder = 3,
                        Size = UDim2.new(0.175, 0, 0.825, 0),
                        DefaultItem = u16[2],
                        Items = u16,

                        OnItemSelected = function(p51) -- Line: 225, Name: OnItemSelected
                            -- upvalues: u24 (copy)
                            local v52 = tonumber(p51);

                            if v52 ~= 0 and (v52 == v52 and v52) then
                                u24(v52);
                            end;
                        end
                    })
                }),
                u3.createElement(MapBrowserTagsGrid, {
                    Featured = true,

                    OnChange = function(p53, p54, p55) -- Line: 235, Name: OnChange
                        -- upvalues: u30 (copy)
                        u30(p55);
                    end,

                    OnSelectFeatured = function(p56) -- Line: 238, Name: OnSelectFeatured
                        -- upvalues: u28 (copy)
                        u28(p56);
                    end,

                    FrameProps = {
                        Size = UDim2.new(1, 0, 0.35, 0)
                    }
                })
            })
        });
    end)
};