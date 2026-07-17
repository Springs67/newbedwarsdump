-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local KitContractKitStatsCardRow = RuntimeLib.import(script, script.Parent, "kit-contract-kit-stats-card-row").KitContractKitStatsCardRow;
local u5 = {
    wins = BedwarsImageId.TROPHY_SOLID,
    kills = BedwarsImageId.SKULL_SOLID
};

return {
    KitContractKitStatsCard = v4.new(u3)(function(p6, p7) -- Line: 19
        -- upvalues: u2 (copy), KitContractRewards (copy), u3 (copy), Empty (copy), BedwarsKitMeta (copy), ColorUtil (copy), KitContractKitStatsCardRow (copy), KitContractUtils (copy), u5 (copy), MathUtil (copy)
        local _ = p7.useState;
        local v8 = {};

        for i, v in p6 do
            v8[i] = v;
        end;

        v8.SelectedKit = nil;
        v8.UserKitStatProfile = nil;
        v8.HighestUnlockedTier = nil;
        local v9 = u2.entries(p6.UserKitStatProfile);

        local function _(p10) -- Line: 30
            return {
                key = p10[1],
                value = p10[2]
            };
        end;

        local u11 = table.create(#v9);

        for i, v in v9 do
            local _ = i - 1;
            u11[i] = {
                key = v[1],
                value = v[2]
            };
        end;

        local v12 = {};
        local v13 = KitContractRewards[p6.SelectedKit];

        if v13 ~= nil then
            v13 = v13.kitStats;
        end;

        if v13 then
            local v14 = u2.entries(v13);

            local function _(p15) -- Line: 53
                local _ = p15[1];

                return {
                    value = 0,
                    key = p15[2]
                };
            end;

            v12 = table.create(#v14);

            for i, v in v14 do
                local _ = i - 1;
                local _ = v[1];
                v12[i] = {
                    value = 0,
                    key = v[2]
                };
            end;
        end;

        local function v19(p16) -- Line: 70
            -- upvalues: u11 (copy)
            local key = p16.key;
            local _ = p16.value;

            local function _(p17) -- Line: 74
                -- upvalues: key (copy)
                return p17.key == key;
            end;

            local v18 = false;

            for i, v in u11 do
                local _ = i - 1;

                if v.key == key then
                    v18 = true;
                    break;
                end;
            end;

            return not v18;
        end;

        local v20 = 0;
        local v21 = {};

        for i, v in v12 do
            if v19(v, i - 1, v12) == true then
                v20 = v20 + 1;
                v21[v20] = v;
            end;
        end;

        local function _(p22) -- Line: 100
            -- upvalues: u11 (copy)
            table.insert(u11, p22);
        end;

        for i, v in v21 do
            local _ = i - 1;
            table.insert(u11, v);
        end;

        local v23 = {};

        for i, v in v8 do
            v23[i] = v;
        end;

        local v24 = {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }),
            u3.createElement("UIPadding", {
                PaddingRight = UDim.new(0.085, 0),
                PaddingLeft = UDim.new(0.085, 0),
                PaddingTop = UDim.new(0.055, 0),
                PaddingBottom = UDim.new(0.055, 0)
            }),
            u3.createElement(Empty, {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.24)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0.15, 0)
                }), u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.39),
                    Text = BedwarsKitMeta[p6.SelectedKit].name .. " Contract",
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                }), u3.createElement(KitContractKitStatsCardRow, {
                    StatTitle = "Level",
                    LayoutOrder = 1,
                    StatValue = tostring(p6.HighestUnlockedTier),
                    Size = UDim2.new(1, -8, 0.545, 0),
                    BackgroundColor3 = KitContractUtils.ProgressColor
                }) })
        };
        local v25 = {
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.7)
        };
        local v26 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Text = "Kit Stats",
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.13),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            }) };
        table.sort(u11, function(p27, p28) -- Line: 187
            -- upvalues: u5 (ref)
            local v29 = u5[p27.key];
            local v30 = u5[p28.key];

            if v29 ~= "" and v29 then
                if v30 == "" then
                    v30 = false;
                end;

                v29 = not v30;
            end;

            return v29 ~= "" and v29 and true or false;
        end);

        local function v32(p31) -- Line: 201
            -- upvalues: u3 (ref), KitContractKitStatsCardRow (ref), u5 (ref), MathUtil (ref)
            local key = p31.key;
            local value = p31.value;

            return u3.createElement(KitContractKitStatsCardRow, {
                BackgroundTransparency = 0.3,
                StatImage = u5[key],
                StatTitle = string.upper((string.sub(key, 0, 1))) .. string.lower((string.sub(key, 2))),
                StatValue = tostring(MathUtil.roundToDecimalPlaces(value, 2))
            });
        end;

        local v33 = table.create(#u11);

        for i, v in u11 do
            v33[i] = v32(v, i - 1, u11);
        end;

        local v34 = {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ScrollBarThickness = 3,
            ScrollBarImageTransparency = 0.3,
            Size = UDim2.fromScale(1, 0.845),
            CanvasSize = UDim2.new(1, -5, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            VerticalScrollBarInset = Enum.ScrollBarInset.Always,
            ScrollBarImageColor3 = ColorUtil.WHITE
        };
        local v35 = { u3.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                CellSize = UDim2.new(1, -3, 0.2, 0),
                CellPadding = UDim2.new(0, 0, 0, 5),
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }) };
        local v36 = #v35;

        for i, v in v33 do
            v35[v36 + i] = v;
        end;

        v26[#v26 + 1] = u3.createElement("ScrollingFrame", v34, v35);
        v24[#v24 + 1] = u3.createElement(Empty, v25, v26);

        return u3.createFragment({
            KitContractStatsCard = u3.createElement(Empty, v23, v24)
        });
    end)
};