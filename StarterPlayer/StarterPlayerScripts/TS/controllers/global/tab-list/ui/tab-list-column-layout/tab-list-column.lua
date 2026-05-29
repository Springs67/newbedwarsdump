local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["TabListColumn"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, _) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        local v4
        if p3.AllElements then
            local v5 = {}
            local v6 = #v5
            for v7, v8 in p3.AllElements do
                v6 = v6 + 1
                v5[v6] = { v7, v8 }
            end
            local v9 = 0
            local v10 = {}
            for v11, v12 in v5 do
                local _ = v11 - 1
                local _ = v12[1]
                local v13 = v12[2]
                local v14 = p3.ColumnData.children
                local v15 = v13.props.Team.id
                if table.find(v14, v15) ~= nil == true then
                    v9 = v9 + 1
                    v10[v9] = v12
                end
            end
            v4 = table.create(#v10)
            for v16, v17 in v10 do
                local _ = v16 - 1
                local _ = v17[1]
                v4[v16] = v17[2]
            end
        else
            v4 = nil
        end
        local v18 = {
            ["AutomaticSize"] = "Y",
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1 / p3.Columns, 1),
            ["LayoutOrder"] = p3.ColumnData.columnId
        }
        local v19 = { u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v20 = #v19
        if v4 then
            for v21, v22 in v4 do
                v19[v20 + v21] = v22
            end
        end
        return u2.createElement("Frame", v18, v19)
    end)
}