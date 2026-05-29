local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u10 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "section-title").SectionTitle
local u11 = v1.import(script, script.Parent, "favorite-kit-cell").FavoriteKitCell
return {
    ["FavoriteKits"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u10
            [4] = u6
            [5] = u9
            [6] = u11
            [7] = u3
            [8] = u4
        --]]
        local _ = p13.useState
        local v14 = {
            ["Size"] = u12.Size or UDim2.fromScale(1, 1),
            ["LayoutOrder"] = u12.LayoutOrder
        }
        local v15 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 5)
            }), u7.createElement(u5, {
                ["Padding"] = UDim.new(0, 10)
            }), u7.createElement(u10, {
                ["title"] = "Favorite Kit(s)",
                ["SectionDivider"] = true
            }) }
        local v16 = #v15
        local v17 = u6.keys(u12.ProfileData.favoriteKitData)
        local function v23(p18, p19) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
                [3] = u7
                [4] = u11
            --]]
            local v20 = u9(p18)
            local v21 = u12.ProfileData.favoriteKitData[p18]
            local v22 = v21 == nil and 0 or v21
            return u7.createElement(u11, {
                ["KitMeta"] = v20,
                ["Plays"] = v22,
                ["LayoutOrder"] = p19
            })
        end
        local v24 = table.create(#v17)
        for v25, v26 in v17 do
            v24[v25] = v23(v26, v25 - 1, v17)
        end
        local v27 = {
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 0.93)
            }
        }
        local v28 = { u7.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 2,
                ["CellSize"] = UDim2.fromOffset(110, 110),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }) }
        local v29 = #v28
        for v30, v31 in v24 do
            v28[v29 + v30] = v31
        end
        v15[v16 + 1] = u7.createElement(u3, v27, v28)
        return u7.createElement(u4, v14, v15)
    end)
}