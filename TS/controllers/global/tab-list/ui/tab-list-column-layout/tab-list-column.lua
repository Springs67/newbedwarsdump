-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    TabListColumn = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local v4;

        if u2.AllElements then
            local v5 = {};
            local v6 = #v5;

            for i, v in u2.AllElements do
                v6 = v6 + 1;
                v5[v6] = { i, v };
            end;

            local function _(p7) -- Line: 14
                -- upvalues: u2 (copy)
                local _ = p7[1];

                return table.find(u2.ColumnData.children, p7[2].props.Team.id) ~= nil;
            end;

            local v8 = 0;
            local v9 = {};

            for i, v in v5 do
                local _ = i - 1;
                local _ = v[1];

                if table.find(u2.ColumnData.children, v[2].props.Team.id) ~= nil == true then
                    v8 = v8 + 1;
                    v9[v8] = v;
                end;
            end;

            local function _(p10) -- Line: 34
                local _ = p10[1];

                return p10[2];
            end;

            v4 = table.create(#v9);

            for i, v in v9 do
                local _ = i - 1;
                local _ = v[1];
                v4[i] = v[2];
            end;
        else
            v4 = nil;
        end;

        local v11 = {
            AutomaticSize = "Y",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1 / u2.Columns, 1),
            LayoutOrder = u2.ColumnData.columnId
        };
        local v12 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v13 = #v12;

        if v4 then
            for i, v in v4 do
                v12[v13 + i] = v;
            end;
        end;

        return u1.createElement("Frame", v11, v12);
    end)
};