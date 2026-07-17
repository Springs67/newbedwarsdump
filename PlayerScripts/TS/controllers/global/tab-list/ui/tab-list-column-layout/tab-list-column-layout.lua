-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TabListColumn = RuntimeLib.import(script, script.Parent, "tab-list-column").TabListColumn;

return {
    TabListColumnLayout = v3.new(u2)(function(u4, p5) -- Line: 7
        -- upvalues: u2 (copy), u1 (copy), TabListColumn (copy)
        local _ = p5.useMemo;
        local u6 = {};
        local Columns = u4.Columns;
        (function(p7) -- Line: 10
            -- upvalues: u6 (copy)
            local v8 = false;
            local v9 = 0;

            while true do
                if v8 then
                    v9 = v9 + 1;
                else
                    v8 = true;
                end;

                if v9 >= p7 then
                    return;
                end;

                u6[v9] = {
                    totalRows = 0,
                    columnId = v9,
                    children = {}
                };
            end;
        end)(Columns == nil and 2 or Columns);

        local function u14() -- Line: 39
            -- upvalues: u4 (copy), u2 (ref)
            local v10 = {};
            local v11 = #v10;

            for i, v in u4[u2.Children] do
                v11 = v11 + 1;
                v10[v11] = { i, v };
            end;

            table.sort(v10, function(p12, p13) -- Line: 46
                return p12[2].props.LayoutOrder < p13[2].props.LayoutOrder;
            end);

            return v10;
        end;

        local function u21(p15) -- Line: 59
            -- upvalues: u1 (ref)
            local totalRows = p15[0].totalRows;
            local u16 = p15[0];

            local function _(p17) -- Line: 63
                -- upvalues: totalRows (ref), u16 (ref)
                if p17.totalRows < totalRows then
                    totalRows = p17.totalRows;
                    u16 = p17;
                end;
            end;

            local v18 = 0;
            local v19 = {};

            for i, v in u1.values(p15) do
                local _ = i - 1;

                if v.totalRows < totalRows then
                    totalRows = v.totalRows;
                    u16 = v;
                end;

                local v20 = nil;

                if v20 ~= nil then
                    v18 = v18 + 1;
                    v19[v18] = v20;
                end;
            end;

            return u16.columnId;
        end;

        local function v36() -- Line: 83
            -- upvalues: u4 (copy), u2 (ref), u1 (ref), u6 (copy), u14 (copy), u21 (copy)
            local v22 = u4[u2.Children];

            if v22 ~= nil then
                v22 = 0;

                for _ in v22 do
                    v22 = v22 + 1;
                end;
            end;

            local u23 = v22 == nil and 0 or v22;
            local u24 = #u1.keys(u6);
            local v25 = u14();

            local function v35(p26, p27) -- Line: 101
                -- upvalues: u4 (ref), u21 (ref), u6 (ref), u23 (copy), u24 (copy)
                if u4.MaxPerColumn ~= nil then
                    local v28 = u21(u6);
                    table.insert(u6[v28].children, p26[2].props.Team.id);
                    local v29 = 0;

                    for _ in p26[2].props.Team.members do
                        v29 = v29 + 1;
                    end;

                    local v30 = u6[v28];
                    v30.totalRows = v30.totalRows + (v29 == nil and 0 or v29);

                    return;
                end;

                local v31 = math.ceil(u23 / u24);
                local v32 = math.ceil((p27 + 1) / v31) - 1;
                table.insert(u6[v32].children, p26[2].props.Team.id);
                local v33 = 0;

                for _ in p26[2].props.Team.members do
                    v33 = v33 + 1;
                end;

                local v34 = u6[v32];
                v34.totalRows = v34.totalRows + (v33 == nil and 0 or v33);
            end;

            for i, v in v25 do
                v35(v, i - 1, v25);
            end;

            return u6;
        end;

        local function v41(p37) -- Line: 145
            -- upvalues: u1 (ref), u2 (ref), TabListColumn (ref), u4 (copy)
            local v38 = u1.values(p37);

            local function _(p39) -- Line: 147
                -- upvalues: u2 (ref), TabListColumn (ref), u4 (ref)
                return u2.createElement(TabListColumn, {
                    Columns = u4.Columns,
                    ColumnData = p39,
                    AllElements = u4[u2.Children]
                });
            end;

            local v40 = table.create(#v38);

            for i, v in v38 do
                local _ = i - 1;
                v40[i] = u2.createElement(TabListColumn, {
                    Columns = u4.Columns,
                    ColumnData = v,
                    AllElements = u4[u2.Children]
                });
            end;

            return v40;
        end;

        local v42 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = u4.Size
        };
        local v43 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v44 = #v43;

        for i, v in v41((v36())) do
            v43[v44 + i] = v;
        end;

        return u2.createElement("Frame", v42, v43);
    end)
};