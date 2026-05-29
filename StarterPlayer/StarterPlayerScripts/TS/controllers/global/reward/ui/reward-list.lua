local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
return {
    ["RewardList"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        u3.createRef()
        local v8 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v9 = p6.FrameProps
        if v9 then
            for v10, v11 in v9 do
                v8[v10] = v11
            end
        end
        local v12 = {}
        local v13 = #v12
        local v14 = {
            ["FillDirection"] = "Horizontal"
        }
        local v15 = p6.MaxCellsInList
        v14.FillDirectionMaxCells = v15 == nil and 6 or v15
        v14.CellSize = p6.CellSize or UDim2.new(0, 48, 0, 48)
        v14.CellPadding = p6.CellPadding or UDim2.new(0, 8, 0, 8)
        v14.HorizontalAlignment = "Center"
        v14.VerticalAlignment = "Center"
        local v16 = p6.UIGridlayoutProps
        if v16 then
            for v17, v18 in v16 do
                v14[v17] = v18
            end
        end
        v12[v13 + 1] = u3.createElement("UIGridLayout", v14)
        local v19 = p6.Rewards
        local v20
        if v19 == nil then
            v20 = v19
        else
            v20 = table.create(#v19)
            for v21, v22 in v19 do
                local _ = v21 - 1
                v20[v21] = u3.createElement(u5, {
                    ["Reward"] = v22
                })
            end
        end
        if v20 then
            for v23, v24 in v20 do
                v12[v13 + 1 + v23] = v24
            end
        end
        local v25 = #v12
        local v26 = p6[u3.Children]
        if v26 then
            for v27, v28 in v26 do
                if type(v27) == "number" then
                    v12[v25 + v27] = v28
                else
                    v12[v27] = v28
                end
            end
        end
        return u3.createElement(u2, v8, v12)
    end)
}