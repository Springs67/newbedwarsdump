-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local tabListLayout = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local PlayerRow = RuntimeLib.import(script, script.Parent, "player-row", "player-row").PlayerRow;
local TabListTeamHeader = RuntimeLib.import(script, script.Parent, "team-card-header").TabListTeamHeader;
local v23 = v2.new(u1)(function(u4, p5) -- Line: 10
    -- upvalues: tabListLayout (copy), u1 (copy), PlayerRow (copy), Empty (copy), TabListTeamHeader (copy)
    local _ = p5.useState;
    local _ = p5.useEffect;
    local CardDimensions = u4.CardDimensions;
    local u6 = CardDimensions[1];
    local _ = CardDimensions[2];

    local function v22() -- Line: 16
        -- upvalues: u4 (copy), u6 (copy), tabListLayout (ref), u1 (ref), PlayerRow (ref), Empty (ref)
        local v7 = {};
        local v8 = #v7;

        for i, v in u4.Team.members do
            v8 = v8 + 1;
            v7[v8] = { i, v };
        end;

        table.sort(v7, function(p9, p10) -- Line: 23
            local _ = p9[1];
            local _ = p10[1];
            local v11 = p10[2];

            return string.lower(p9[2].displayName) < string.lower(v11.displayName);
        end);

        local function v17(p12, p13) -- Line: 31
            -- upvalues: u4 (ref), u6 (ref), tabListLayout (ref), u1 (ref), PlayerRow (ref)
            local _ = p12[1];
            local v14 = p12[2];
            local v15 = 0;
            local v16 = {};

            for _ in u4.Team.members do
                v15 = v15 + 1;
            end;

            v16.LastRow = p13 == v15 - 1;
            v16.LayoutOrder = p13;
            v16.Player = v14;
            v16.Team = u4.Team;
            v16.RowWidth = u6;
            v16.RowHeight = tabListLayout.maxRowSizeY;

            return u1.createElement(PlayerRow, v16);
        end;

        local v18 = table.create(#v7);

        for i, v in v7 do
            v18[i] = v17(v, i - 1, v7);
        end;

        local v19 = {
            AutomaticSize = "Y",
            Size = UDim2.fromScale(1, 0)
        };
        local v20 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v21 = #v20;

        for i, v in v18 do
            v20[v21 + i] = v;
        end;

        return u1.createElement(Empty, v19, v20);
    end;

    return u1.createElement("Frame", {
        AutomaticSize = "Y",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, tabListLayout.rows.cards.card.height, 0),
        LayoutOrder = u4.LayoutOrder
    }, { u1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0)
        }), u1.createElement(TabListTeamHeader, {
            Team = u4.Team,
            RowWidth = u6
        }), u1.createElement(v22) });
end);

return {
    TeamCard = v3.connect(function(p24, p25) -- Line: 97
        local v26 = {};

        for i, v in p25 do
            v26[i] = v;
        end;

        return v26;
    end)(v23)
};