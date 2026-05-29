local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").WeaponEnchantType
local u8 = v1.import(script, script.Parent, "enchant-item-frame").EnchantItemFrame
return {
    ["EnchantItemGrid"] = v5.new(u4)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u6
            [4] = u4
            [5] = u8
            [6] = u2
        --]]
        local _ = p10.useState
        local v11 = math
        local v12 = 0
        local v13 = {}
        for v14, v15 in u3.values(u7) do
            local _ = v14 - 1
            if not u6[v15].disabled == true then
                v12 = v12 + 1
                v13[v12] = v15
            end
        end
        local v16 = #v13
        local v17 = v11.max(v16, 6)
        local v18 = {
            ["Size"] = p9.Size,
            ["LayoutOrder"] = p9.LayoutOrder
        }
        local v19 = {}
        local v20 = #v19
        local v21 = 0
        local v22 = {}
        for v23, v24 in u3.values(u7) do
            local _ = v23 - 1
            local v25
            if u6[v24].disabled then
                v25 = nil
            else
                v25 = u4.createElement(u8, {
                    ["EnchantTableType"] = p9.EnchantTableType,
                    ["Enchant"] = v24
                })
            end
            if v25 ~= nil then
                v21 = v21 + 1
                v22[v21] = v25
            end
        end
        local v26 = {
            ["Size"] = UDim2.fromScale(0.95, 0.95),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v27 = {}
        local v28 = u4.createElement
        local v29 = {
            ["FillDirectionMaxCells"] = 2,
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Center"
        }
        local v30 = UDim2.fromScale
        local v31 = v17 / 2
        v29.CellSize = v30(0.5, 1 / math.ceil(v31))
        v29.CellPadding = UDim2.new(0, 0, 0.02, 0)
        __set_list(v27, 1, {v28("UIGridLayout", v29)})
        local v32 = #v27
        for v33, v34 in v22 do
            v27[v32 + v33] = v34
        end
        v19[v20 + 1] = u4.createElement(u2, v26, v27)
        return u4.createFragment({
            ["EnchantsImageGrid"] = u4.createElement(u2, v18, v19)
        })
    end)
}