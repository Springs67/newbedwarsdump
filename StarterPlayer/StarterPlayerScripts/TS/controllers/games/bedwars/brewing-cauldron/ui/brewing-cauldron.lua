local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.TimedProgressBar
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, script.Parent, "ingredient-box").IngredientBox
return {
    ["BrewingCauldron"] = v8.new(u7)(function(u13, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u10
            [4] = u9
            [5] = u5
            [6] = u3
            [7] = u6
            [8] = u11
            [9] = u4
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(0)
        local v19 = u13.MaxNumIngredients
        local v20 = (v19 == nil and 3 or v19) - #u13.Inventory
        local v21 = false
        local v22 = 0
        local v23 = {}
        while true do
            if v21 then
                v22 = v22 + 1
            else
                v21 = true
            end
            if v22 >= v20 then
                local v24 = u13.Text
                v16(function() --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u10
                        [3] = u18
                        [4] = u9
                    --]]
                    if u13.CraftingStatus == u10.crafting then
                        local v25 = u13.timeToCraft
                        u18(u9:GetServerTimeNow() + v25)
                    end
                end, { u13.CraftingStatus })
                local v26 = {
                    ["MaxDistance"] = 35,
                    ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 1, 0),
                    ["AlwaysOnTop"] = true,
                    ["ResetOnSpawn"] = false,
                    ["Size"] = UDim2.fromScale(7, 3),
                    ["SizeOffset"] = Vector2.new(0, 1)
                }
                local v27 = {}
                local v28 = #v27
                local v29
                if u13.CraftingStatus == u10.crafting and v17 > 0 then
                    v29 = u7.createElement(u5, {
                        ["HideOnComplete"] = true,
                        ["EndTime"] = v17,
                        ["ProgressBarConfig"] = {
                            ["BarColor"] = u3.WHITE
                        },
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Position"] = UDim2.fromScale(0, 0),
                        ["Size"] = UDim2.fromScale(1, 0.1)
                    }, { u7.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) })
                else
                    v29 = false
                end
                if v29 then
                    v27[v28 + 1] = v29
                end
                local _ = #v27
                local v30 = {
                    ["BackgroundTransparency"] = 0.3,
                    ["AnchorPoint"] = Vector2.new(0, 0),
                    ["Position"] = UDim2.fromScale(0, 0.13),
                    ["Size"] = UDim2.fromScale(1, 0.87),
                    ["BackgroundColor3"] = u3.BLACK
                }
                local v31 = {
                    u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }),
                    u7.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.1, 0),
                        ["PaddingBottom"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.05, 0),
                        ["PaddingLeft"] = UDim.new(0.05, 0)
                    }),
                    u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Center",
                        ["HorizontalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.05, 0)
                    }),
                    ["Title"] = u7.createElement("TextLabel", {
                        ["SizeConstraint"] = "RelativeYY",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["TextXAlignment"] = "Center",
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.15),
                        ["Text"] = v24,
                        ["TextColor3"] = u3.WHITE
                    })
                }
                local _ = #v31
                local v32 = u6.entries(u13.Inventory)
                local v33 = table.create(#v32)
                for v34, v35 in v32 do
                    local _ = v34 - 1
                    local _ = v35[1]
                    local v36 = u11(v35[2])
                    v33[v34] = u7.createElement(u12, {
                        ["Amount"] = 1,
                        ["Image"] = v36.image
                    })
                end
                local v37 = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.75)
                }
                local v38 = { u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["VerticalAlignment"] = "Center",
                        ["HorizontalAlignment"] = "Center",
                        ["Padding"] = UDim.new(0.05, 0)
                    }) }
                local v39 = #v38
                for v40, v41 in v33 do
                    v38[v39 + v40] = v41
                end
                local v42 = #v38
                for v43, v44 in v23 do
                    v38[v42 + v43] = v44
                end
                v31.IngredientList = u7.createElement(u4, v37, v38)
                v27.Container = u7.createElement("Frame", v30, v31)
                return u7.createFragment({
                    ["BrewingCauldronBillboard"] = u7.createElement("BillboardGui", v26, v27)
                })
            end
            local v45 = u7.createElement(u12)
            table.insert(v23, v45)
        end
    end)
}