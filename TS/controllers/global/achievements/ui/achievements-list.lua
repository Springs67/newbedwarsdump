-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DropdownComponent = v1.DropdownComponent;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AutoCompleteSearchbar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local AchievementCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-category").AchievementCategory;
local AchievementId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId;
local AchievementsMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta").AchievementsMeta;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local AchievementCell = RuntimeLib.import(script, script.Parent, "achievement-cell").AchievementCell;
local AchievementRow = RuntimeLib.import(script, script.Parent, "achievement-row").AchievementRow;
local v116 = v4.new(u3)(function(u6, p7) -- Line: 21
    -- upvalues: AchievementId (copy), u2 (copy), AchievementsMeta (copy), AchievementUtil (copy), AchievementCategory (copy), u3 (copy), DropdownComponent (copy), ColorUtil (copy), AutoCompleteSearchbar (copy), Empty (copy), BedwarsImageId (copy), Theme (copy), AchievementCell (copy), AutoCanvasScrollingFrame (copy), AchievementRow (copy)
    local useState = p7.useState;
    local u8, u9 = useState(u6.ViewingOnProfile and "complete" or "all");
    local ProfileData = u6.ProfileData;
    local u10 = {
        AchievementId.BEDWARS_NO_ARMOR,
        AchievementId.BEDWARS_TO4_NO_ARMOR,
        AchievementId.BEDWARS_TO2_NO_ARMOR,
        AchievementId.BEDWARS_TO1_NO_ARMOR,
        AchievementId.BEDWARS_5V5_NO_ARMOR,
        AchievementId.BEDWARS_DUELS_NO_ARMOR,
        AchievementId.BEDWARS_LB_NO_ARMOR,
        AchievementId.BEDWARS_NO_SWORD,
        AchievementId.BEDWARS_TO4_NO_SWORD,
        AchievementId.BEDWARS_TO2_NO_SWORD,
        AchievementId.BEDWARS_TO1_NO_SWORD,
        AchievementId.BEDWARS_5V5_NO_SWORD,
        AchievementId.BEDWARS_DUELS_NO_SWORD,
        AchievementId.BEDWARS_LB_NO_SWORD,
        AchievementId.BEDWARS_NO_DEATHS,
        AchievementId.BEDWARS_TO4_NO_DEATHS,
        AchievementId.BEDWARS_TO2_NO_DEATHS,
        AchievementId.BEDWARS_TO1_NO_DEATHS,
        AchievementId.BEDWARS_5V5_NO_DEATHS,
        AchievementId.BEDWARS_DUELS_NO_DEATHS,
        AchievementId.BEDWARS_LB_NO_DEATHS,
        AchievementId.BEDWARS_NO_DAMAGE,
        AchievementId.BEDWARS_TO4_NO_DAMAGE,
        AchievementId.BEDWARS_TO2_NO_DAMAGE,
        AchievementId.BEDWARS_TO1_NO_DAMAGE,
        AchievementId.BEDWARS_5V5_NO_DAMAGE,
        AchievementId.BEDWARS_DUELS_NO_DAMAGE,
        AchievementId.BEDWARS_LB_NO_DAMAGE
    };
    local v11 = u2.entries(AchievementsMeta);
    table.sort(v11, function(p12, p13) -- Line: 37
        return p12[1] < p13[1];
    end);

    local function _(p14) -- Line: 42
        return p14[2].title;
    end;

    local v15 = table.create(#v11);
    local v16 = { {
            text = "All",
            value = "all"
        }, {
            text = "Incomplete",
            value = "incomplete"
        }, {
            text = "Complete",
            value = "complete"
        } };

    for i, v in v11 do
        local _ = i - 1;
        v15[i] = v[2].title;
    end;

    local u17, u18 = useState(v15);

    local function _(p19) -- Line: 52
        -- upvalues: ProfileData (copy)
        local v20 = ProfileData;

        if v20 ~= nil then
            v20 = v20.achievements[p19[1]];

            if v20 ~= nil then
                v20 = v20.achieved;
            end;
        end;

        if v20 then
            v20 = not p19[2].disabled;
        end;

        return v20;
    end;

    local v21 = 0;
    local v22 = {};

    for i, v in v11 do
        local _ = i - 1;
        local v23;

        if ProfileData == nil then
            v23 = ProfileData;
        else
            v23 = ProfileData.achievements[v[1]];

            if v23 ~= nil then
                v23 = v23.achieved;
            end;
        end;

        if v23 then
            v23 = not v[2].disabled;
        end;

        if v23 == true then
            v21 = v21 + 1;
            v22[v21] = v;
        end;
    end;

    local v24 = #v22;

    local function _(p25) -- Line: 79
        return not p25[2].disabled;
    end;

    local v26 = 0;
    local v27 = {};

    for i, v in v11 do
        local _ = i - 1;

        if not v[2].disabled == true then
            v26 = v26 + 1;
            v27[v26] = v;
        end;
    end;

    local u28 = #v27;

    local function v35(p29) -- Line: 93
        -- upvalues: AchievementUtil (ref), u10 (copy), u17 (copy), ProfileData (copy), u8 (copy)
        local v30 = p29[1];
        local v31 = AchievementUtil.getMeta(v30);

        if v31.disabled then
            return false;
        end;

        if table.find(u10, v30) == nil then
            return false;
        end;

        if table.find(u17, v31.title) == nil then
            return false;
        end;

        local v32 = ProfileData;

        if v32 ~= nil then
            v32 = v32.achievements[v30];
        end;

        local v33 = u8 == "incomplete";

        if v33 then
            if v32 == nil then
                v33 = v32;
            else
                v33 = v32.achieved;
            end;
        end;

        if v33 then
            return false;
        end;

        local v34 = u8 == "complete";

        if v34 then
            if v32 ~= nil then
                v32 = v32.achieved;
            end;

            v34 = not v32;
        end;

        return not v34;
    end;

    local v36 = 0;
    local v37 = {};

    for i, v in v11 do
        if v35(v, i - 1, v11) == true then
            v36 = v36 + 1;
            v37[v36] = v;
        end;
    end;

    local function v44(p38) -- Line: 147
        -- upvalues: AchievementUtil (ref), u10 (copy), AchievementCategory (ref), u17 (copy), ProfileData (copy), u8 (copy)
        local v39 = p38[1];
        local v40 = AchievementUtil.getMeta(v39);

        if v40.disabled then
            return false;
        end;

        if table.find(u10, v39) ~= nil then
            return false;
        end;

        if v40.category == AchievementCategory.EVENT then
            return false;
        end;

        if table.find(u17, v40.title) == nil then
            return false;
        end;

        local v41 = ProfileData;

        if v41 ~= nil then
            v41 = v41.achievements[v39];
        end;

        local v42 = u8 == "incomplete";

        if v42 then
            if v41 == nil then
                v42 = v41;
            else
                v42 = v41.achieved;
            end;
        end;

        if v42 then
            return false;
        end;

        local v43 = u8 == "complete";

        if v43 then
            if v41 ~= nil then
                v41 = v41.achieved;
            end;

            v43 = not v41;
        end;

        return not v43;
    end;

    local v45 = 0;
    local v46 = {};

    for i, v in v11 do
        if v44(v, i - 1, v11) == true then
            v45 = v45 + 1;
            v46[v45] = v;
        end;
    end;

    local function v53(p47) -- Line: 204
        -- upvalues: AchievementUtil (ref), u10 (copy), AchievementCategory (ref), u17 (copy), ProfileData (copy), u8 (copy)
        local v48 = p47[1];
        local v49 = AchievementUtil.getMeta(v48);

        if v49.disabled then
            return false;
        end;

        if table.find(u10, v48) ~= nil then
            return false;
        end;

        if v49.category ~= AchievementCategory.EVENT then
            return false;
        end;

        if table.find(u17, v49.title) == nil then
            return false;
        end;

        local v50 = ProfileData;

        if v50 ~= nil then
            v50 = v50.achievements[v48];
        end;

        local v51 = u8 == "incomplete";

        if v51 then
            if v50 == nil then
                v51 = v50;
            else
                v51 = v50.achieved;
            end;
        end;

        if v51 then
            return false;
        end;

        local v52 = u8 == "complete";

        if v52 then
            if v50 ~= nil then
                v50 = v50.achieved;
            end;

            v52 = not v50;
        end;

        return not v52;
    end;

    local v54 = 0;
    local v55 = {};

    for i, v in v11 do
        if v53(v, i - 1, v11) == true then
            v54 = v54 + 1;
            v55[v54] = v;
        end;
    end;

    local v56 = {
        Size = UDim2.fromScale(1, 1)
    };
    local FrameProps = u6.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v56[i] = v;
        end;
    end;

    local v57 = not u6.ViewingOnProfile;

    if v57 then
        local v58 = {
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.1)
        };
        local v59 = { u3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new((1 / 0), 35)
            }), u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v60 = #v59;
        local v62 = {
            DefaultItem = v16[1],
            Items = v16,

            OnItemSelected = function(p61) -- Line: 293, Name: OnItemSelected
                -- upvalues: u9 (copy)
                u9(p61);
            end,

            Size = UDim2.fromScale(0.3, 1) - UDim2.fromOffset(10, 0),
            LayoutOrder = 0,
            BorderSizePixel = 0
        };
        v59[v60 + 1] = u3.createElement(DropdownComponent, v62);
        local v63 = {
            BarTransparency = 0.5,
            Size = UDim2.fromScale(0.6, 1),
            BarColor = ColorUtil.BLACK,
            CornerRadius = UDim.new(0, 5)
        };

        local function _(p64) -- Line: 309
            return {
                key = p64[2].title
            };
        end;

        local v65 = table.create(#v11);

        for i, v in v11 do
            local _ = i - 1;
            v65[i] = {
                key = v[2].title
            };
        end;

        v63.Items = v65;
        v63.InputText = "";

        function v63.OnTextChange(p66, p67) -- Line: 322
            -- upvalues: u18 (copy)
            u18(p67);
        end;

        v63.PlaceHolderText = "Search Achievements";
        v59[v60 + 2] = u3.createElement(AutoCompleteSearchbar, v63);
        local v68 = {
            Size = UDim2.fromScale(0.1, 1) - UDim2.fromOffset(10, 0),
            LayoutOrder = 2
        };
        v59.AchievementsCompletedCount = u3.createElement(Empty, v68, { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(0.3, 0, 0.7, 0),
                Image = BedwarsImageId.CIRCLE_CHECK_SOLID,
                ScaleType = Enum.ScaleType.Fit,
                ImageColor3 = Theme.textPrimary
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }), u3.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.7, 1),
                Text = tostring(v24) .. "/" .. tostring(u28),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Theme.textPrimary,
                TextXAlignment = Enum.TextXAlignment.Right
            }) });
        v57 = u3.createFragment({
            AchievementFilters = u3.createElement("Frame", v58, v59)
        });
    end;

    local v69 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v70 = #v69;

    if v57 then
        v69[v70 + 1] = v57;
    end;

    local v71 = #v69;
    local ViewingOnProfile = u6.ViewingOnProfile;

    if ViewingOnProfile then
        local v72;

        if ProfileData then
            local function v79(p73) -- Line: 385
                -- upvalues: AchievementUtil (ref), u17 (copy), ProfileData (copy), u8 (copy), u3 (ref), AchievementCell (ref), u6 (copy)
                local u74 = p73[1];
                local v75 = AchievementUtil.getMeta(u74);

                if v75.disabled then
                    return nil;
                end;

                if table.find(u17, v75.title) == nil then
                    return nil;
                end;

                AchievementUtil.getTierGroup(u74);
                local v76 = ProfileData.achievements[u74];
                local v77 = u8 == "incomplete";

                if v77 then
                    if v76 == nil then
                        v77 = v76;
                    else
                        v77 = v76.achieved;
                    end;
                end;

                if v77 then
                    return nil;
                end;

                local v78 = u8 == "complete";

                if v78 then
                    if v76 ~= nil then
                        v76 = v76.achieved;
                    end;

                    v78 = not v76;
                end;

                if v78 then
                    return nil;
                end;

                return u3.createElement(AchievementCell, {
                    Id = u74,
                    ProfileData = ProfileData,

                    OnSelect = function() -- Line: 423, Name: OnSelect
                        -- upvalues: u6 (ref), u74 (copy)
                        return u6.OnSelect(u74);
                    end,

                    Selected = u6.Selected == u74,
                    ViewingOnProfile = u6.ViewingOnProfile
                });
            end;

            local v80 = 0;
            v72 = {};

            for i, v in v11 do
                local v81 = v79(v, i - 1, v11);

                if v81 ~= nil then
                    v80 = v80 + 1;
                    v72[v80] = v81;
                end;
            end;
        else
            v72 = ProfileData;
        end;

        local v82 = {
            ScrollingFrameProps = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.9)
            }
        };
        local v83 = { u3.createElement("UIGridLayout", {
                CellSize = UDim2.new(u6.ViewingOnProfile and 0.24 or 0.32, 0, 0, 200),
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                FillDirectionMaxCells = u6.ViewingOnProfile and 4 or 3
            }), u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 2),
                PaddingBottom = UDim.new(0, 2),
                PaddingLeft = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 1)
            }) };
        local v84 = #v83;

        if v72 then
            for i, v in v72 do
                v83[v84 + i] = v;
            end;
        end;

        ViewingOnProfile = u3.createFragment({
            AchievementsGridView = u3.createElement(AutoCanvasScrollingFrame, v82, v83)
        });
    end;

    if ViewingOnProfile then
        v69[v71 + 1] = ViewingOnProfile;
    end;

    local v85 = #v69;
    local v86 = not u6.ViewingOnProfile;

    if v86 then
        local v87 = {
            ScrollingFrameProps = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.9)
            }
        };
        local v88 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 1),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 1),
                PaddingBottom = UDim.new(0, 1)
            }) };
        local v89 = #v88;
        local v90;

        if #v46 + #v37 > 0 then
            v90 = u3.createElement("TextLabel", {
                Text = "Challenges",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.new(1, 0, 0, 45),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        else
            v90 = false;
        end;

        if v90 then
            v88[v89 + 1] = v90;
        end;

        local v91 = #v88;
        local v92;

        if ProfileData then
            local function v96(p93, p94) -- Line: 522
                -- upvalues: u3 (ref), AchievementRow (ref), ProfileData (copy), u6 (copy)
                local u95 = p93[1];

                return u3.createElement(AchievementRow, {
                    Id = u95,
                    ProfileData = ProfileData,

                    OnSelect = function() -- Line: 527, Name: OnSelect
                        -- upvalues: u6 (ref), u95 (copy)
                        return u6.OnSelect(u95);
                    end,

                    Selected = u6.Selected == u95,
                    ViewingOnProfile = u6.ViewingOnProfile,
                    LayoutOrder = p94 + 1
                });
            end;

            local v97 = 0;
            v92 = {};

            for i, v in v46 do
                local v98 = v96(v, i - 1, v46);

                if v98 ~= nil then
                    v97 = v97 + 1;
                    v92[v97] = v98;
                end;
            end;
        else
            v92 = ProfileData;
        end;

        if v92 then
            for i, v in v92 do
                v88[v91 + i] = v;
            end;
        end;

        local v99 = #v88;
        local v100;

        if ProfileData then
            local function v104(p101, p102) -- Line: 556
                -- upvalues: u3 (ref), AchievementRow (ref), ProfileData (copy), u6 (copy), u28 (copy)
                local u103 = p101[1];

                return u3.createElement(AchievementRow, {
                    Id = u103,
                    ProfileData = ProfileData,

                    OnSelect = function() -- Line: 561, Name: OnSelect
                        -- upvalues: u6 (ref), u103 (copy)
                        return u6.OnSelect(u103);
                    end,

                    Selected = u6.Selected == u103,
                    ViewingOnProfile = u6.ViewingOnProfile,
                    LayoutOrder = u28 + p102 + 10
                });
            end;

            local v105 = 0;
            v100 = {};

            for i, v in v37 do
                local v106 = v104(v, i - 1, v37);

                if v106 ~= nil then
                    v105 = v105 + 1;
                    v100[v105] = v106;
                end;
            end;
        else
            v100 = ProfileData;
        end;

        if v100 then
            for i, v in v100 do
                v88[v99 + i] = v;
            end;
        end;

        local v107 = #v88;
        local v108;

        if #v55 > 0 then
            v108 = u3.createElement("TextLabel", {
                Text = "Event",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 45),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = u28 * 2 + 10
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 24
                }) });
        else
            v108 = false;
        end;

        if v108 then
            v88[v107 + 1] = v108;
        end;

        local v109 = #v88;

        if ProfileData then
            local function v113(p110, p111) -- Line: 609
                -- upvalues: u3 (ref), AchievementRow (ref), ProfileData (copy), u6 (copy), u28 (copy)
                local u112 = p110[1];

                return u3.createElement(AchievementRow, {
                    Id = u112,
                    ProfileData = ProfileData,

                    OnSelect = function() -- Line: 614, Name: OnSelect
                        -- upvalues: u6 (ref), u112 (copy)
                        return u6.OnSelect(u112);
                    end,

                    Selected = u6.Selected == u112,
                    ViewingOnProfile = u6.ViewingOnProfile,
                    LayoutOrder = u28 * 2 + p111 + 10
                });
            end;

            local v114 = 0;
            ProfileData = {};

            for i, v in v55 do
                local v115 = v113(v, i - 1, v55);

                if v115 ~= nil then
                    v114 = v114 + 1;
                    ProfileData[v114] = v115;
                end;
            end;
        end;

        if ProfileData then
            for i, v in ProfileData do
                v88[v109 + i] = v;
            end;
        end;

        v86 = u3.createFragment({
            AchievementsListView = u3.createElement(AutoCanvasScrollingFrame, v87, v88)
        });
    end;

    if v86 then
        v69[v85 + 1] = v86;
    end;

    return u3.createElement(Empty, v56, v69);
end);

return {
    AchievementsList = v5.connect(function(p117, p118) -- Line: 650
        local v119 = {};

        for i, v in p118 do
            v119[i] = v;
        end;

        v119.store = p117;

        return v119;
    end)(v116)
};