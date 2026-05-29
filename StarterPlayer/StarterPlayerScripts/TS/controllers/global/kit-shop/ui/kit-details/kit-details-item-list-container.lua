local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CalcTotalUIScale
local u4 = v2.GetUIScaleAncestors
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["KitDetailsItemListContainer"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10, u11 = v8({})
        local v12, u13 = v8(Vector2.new(0, 0))
        local u14 = u5.createRef()
        local v15 = u6.ScrollBarThickness
        local v16 = v15 == nil and 3 or v15
        local u17 = u6.CalculateCellSize(v12, v16)
        local v18 = u6.CellPadding
        local v19 = v18 == nil and 10 or v18
        local v20
        if u6.CanvasOffset then
            v20 = u6.CanvasOffset(v12, v16)
        else
            v20 = nil
        end
        v9(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u6
                [3] = u17
            --]]
            u11(u6.SetItems(u17))
        end, { u6.SetItems, u17 })
        local v21 = {}
        for v22, v23 in u6 do
            v21[v22] = v23
        end
        v21.CalculateCellSize = nil
        v21.CellPadding = nil
        v21.CanvasOffset = nil
        v21.SetItems = nil
        v21.ScrollBarThickness = nil
        local v24 = {}
        for v25, v26 in v21 do
            v24[v25] = v26
        end
        v24[u5.Ref] = u14
        local v27 = UDim2
        local v28 = u17.X.Offset * #v10 + v19 * (#v10 - 1)
        local v29
        if v20 == nil then
            v29 = v20
        else
            v29 = v20.X
        end
        local v30 = v28 + (v29 == nil and 0 or v29)
        if v20 ~= nil then
            v20 = v20.Y
        end
        local v31 = v20 == nil and 0 or v20
        v24.CanvasSize = v27.fromOffset(v30, 1 + v31)
        v24.ScrollBarThickness = v16
        v24.BorderSizePixel = 0
        v24.BackgroundTransparency = 1
        v24[u5.Change.AbsoluteSize] = function(p32) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u4
                [3] = u3
                [4] = u13
            --]]
            local v33 = u14:getValue()
            if v33 then
                local v34 = u3((u4(v33)))
                u13(p32.AbsoluteSize * (1 / v34))
            else
                u13(p32.AbsoluteSize)
            end
        end
        local v35 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0, v19)
            }) }
        local v36 = #v35
        for v37, v38 in v10 do
            v35[v36 + v37] = v38
        end
        return u5.createElement("ScrollingFrame", v24, v35)
    end)
}