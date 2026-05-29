local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "tab-list-column").TabListColumn
return {
    ["TabListColumnLayout"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
        --]]
        local _ = p7.useMemo
        local u8 = {}
        local v9 = u6.Columns;
        (function(p10) --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            local v11 = false
            local v12 = 0
            while true do
                if v11 then
                    v12 = v12 + 1
                else
                    v11 = true
                end
                if v12 >= p10 then
                    return
                end
                u8[v12] = {
                    ["totalRows"] = 0,
                    ["columnId"] = v12,
                    ["children"] = {}
                }
            end
        end)(v9 == nil and 2 or v9)
        local function u19() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
            --]]
            local v13 = {}
            local v14 = #v13
            for v15, v16 in u6[u3.Children] do
                v14 = v14 + 1
                v13[v14] = { v15, v16 }
            end
            table.sort(v13, function(p17, p18) --[[ Line: 46 ]]
                return p17[2].props.LayoutOrder < p18[2].props.LayoutOrder
            end)
            return v13
        end
        local function u30(p20) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            local v21 = p20[0].totalRows
            local v22 = p20[0]
            local v23 = v22
            local v24 = v21
            local v25 = 0
            local v26 = {}
            for v27, v28 in u2.values(p20) do
                local _ = v27 - 1
                if v28.totalRows < v24 then
                    v21 = v28.totalRows
                    v22 = v28
                    v23 = v22
                    v24 = v21
                end
                local v29 = nil
                if v29 ~= nil then
                    v25 = v25 + 1
                    v26[v25] = v29
                end
            end
            return v23.columnId
        end
        local function v55() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u2
                [4] = u8
                [5] = u19
                [6] = u30
            --]]
            local v31 = u6[u3.Children]
            if v31 ~= nil then
                v31 = 0
                for _ in v31 do
                    v31 = v31 + 1
                end
            end
            local u32 = v31 == nil and 0 or v31
            local u33 = #u2.keys(u8)
            local v34 = u19()
            local function v52(p35, p36) --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u30
                    [3] = u8
                    [4] = u32
                    [5] = u33
                --]]
                if u6.MaxPerColumn == nil then
                    local v37 = u32 / u33
                    local v38 = math.ceil(v37)
                    local v39 = (p36 + 1) / v38
                    local v40 = math.ceil(v39) - 1
                    local v41 = u8[v40].children
                    local v42 = p35[2].props.Team.id
                    table.insert(v41, v42)
                    local v43 = 0
                    for _ in p35[2].props.Team.members do
                        v43 = v43 + 1
                    end
                    local v44 = v43 == nil and 0 or v43
                    local v45 = u8[v40]
                    v45.totalRows = v45.totalRows + v44
                else
                    local v46 = u30(u8)
                    local v47 = u8[v46].children
                    local v48 = p35[2].props.Team.id
                    table.insert(v47, v48)
                    local v49 = 0
                    for _ in p35[2].props.Team.members do
                        v49 = v49 + 1
                    end
                    local v50 = v49 == nil and 0 or v49
                    local v51 = u8[v46]
                    v51.totalRows = v51.totalRows + v50
                end
            end
            for v53, v54 in v34 do
                v52(v54, v53 - 1, v34)
            end
            return u8
        end
        local function v61(p56) --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u5
                [4] = u6
            --]]
            local v57 = u2.values(p56)
            local v58 = table.create(#v57)
            for v59, v60 in v57 do
                local _ = v59 - 1
                v58[v59] = u3.createElement(u5, {
                    ["Columns"] = u6.Columns,
                    ["ColumnData"] = v60,
                    ["AllElements"] = u6[u3.Children]
                })
            end
            return v58
        end
        local v62 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = u6.Size
        }
        local v63 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v64 = #v63
        for v65, v66 in v61((v55())) do
            v63[v64 + v65] = v66
        end
        return u3.createElement("Frame", v62, v63)
    end)
}