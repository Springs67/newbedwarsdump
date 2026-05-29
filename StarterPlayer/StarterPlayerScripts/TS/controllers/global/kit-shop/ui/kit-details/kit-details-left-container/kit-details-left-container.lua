local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-check-box-text-button").SquareCheckBoxTextButton
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u9 = v8.BedwarsKitSkinMeta
local u10 = v8.getSkinsForKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, script.Parent.Parent, "kit-details-item-list-container").KitDetailsItemListContainer
local u13 = v1.import(script, script.Parent, "kit-details-info-card-buttons", "kit-details-info-card-buttons").KitDetailsInfoCardButtons
local u14 = v1.import(script, script.Parent, "kit-details-kit-info-card").KitDetailsKitInfoCard
local u15 = v1.import(script, script.Parent, "kit-details-kit-skin-card").KitDetailsKitSkinCard
local u16 = v1.import(script, script.Parent, "kit-details-skin-variant-select").KitDetailsSkinVariantSelect
return {
    ["KitDetailsLeftContainer"] = v4.new(u3)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u9
            [4] = u3
            [5] = u14
            [6] = u13
            [7] = u16
            [8] = u5
            [9] = u11
            [10] = u6
            [11] = u2
            [12] = u12
            [13] = u15
        --]]
        local _ = p18.useState
        local v19
        if u17.SelectedKit then
            v19 = u10(u17.SelectedKit)
        else
            v19 = nil
        end
        local v20 = { u7.DEFAULT }
        local v21 = #v20
        local v22 = v19 or {}
        table.move(v22, 1, #v22, v21 + 1, v20)
        local v23 = 0
        local u24 = {}
        for v25, v26 in v20 do
            local _ = v25 - 1
            local v27 = u9[v26].variantOfSkin
            if v27 ~= nil then
                v27 = v27.parentSkin
            end
            if (not v27 and true or v27 == v26) == true then
                v23 = v23 + 1
                u24[v23] = v26
            end
        end
        local v28
        if u17.SelectedKitSkin then
            v28 = u9[u17.SelectedKitSkin]
        else
            v28 = nil
        end
        local v29 = {}
        for v30, v31 in u17 do
            v29[v30] = v31
        end
        v29.SelectedKit = nil
        v29.SelectedKitSkin = nil
        v29.SetSelectedKitSkin = nil
        v29.SelectedKitBundle = nil
        v29.store = nil
        local v32 = {}
        for v33, v34 in v29 do
            v32[v33] = v34
        end
        local v35 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u3.createElement(u14, {
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["SelectedKit"] = u17.SelectedKit,
                ["SelectedKitSkin"] = u17.SelectedKitSkin,
                ["SelectedKitBundle"] = u17.SelectedKitBundle
            }) }
        local v36 = #v35
        local v37 = u17.SelectedKit
        if v37 then
            v37 = u3.createElement(u13, {
                ["Size"] = UDim2.fromScale(1, 0.175),
                ["SelectedKit"] = u17.SelectedKit,
                ["store"] = u17.store
            })
        end
        if v37 then
            v35[v36 + 1] = v37
        end
        local v38 = #v35
        local v39
        if u24 == nil then
            v39 = false
        else
            v39 = u17.SelectedKit
        end
        if v39 then
            local v40 = {
                ["Size"] = UDim2.fromScale(1, 0.325)
            }
            local v41 = { u3.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u3.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 5)
                }) }
            local v42 = #v41
            local v43 = u17.SelectedKitSkin
            if v43 then
                if v28 ~= nil then
                    v28 = v28.variantOfSkin
                end
                if v28 then
                    v28 = u3.createElement(u16, {
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["SelectedKitSkin"] = u17.SelectedKitSkin,
                        ["SetSelectedSkin"] = u17.SetSelectedKitSkin,
                        ["store"] = u17.store
                    })
                end
            else
                v28 = v43
            end
            local v44 = {
                ["Size"] = UDim2.fromScale(1, 0.1)
            }
            local v47 = { u3.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u3.createElement(u5, {
                    ["Selectable"] = true,
                    ["Size"] = UDim2.fromScale(0.5, 1),
                    ["Text"] = {
                        ["Text"] = "Use Kit Skin",
                        ["Bold"] = true,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    },
                    ["Checked"] = u17.store.Bedwars.useKitSkin,
                    ["OnChecked"] = function(p45) --[[ Name: OnChecked, Line 141 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u6
                        --]]
                        u11.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                            ["useKitSkin"] = p45
                        }):andThen(function() --[[ Line: 145 ]] end):catch(function(p46) --[[ Line: 146 ]]
                            warn(p46)
                        end)
                        u6:dispatch({
                            ["type"] = "SetUseKitSkin",
                            ["useKitSkin"] = p45
                        })
                    end,
                    ["UIListLayoutProps"] = {
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
                    }
                }) }
            local v48 = #v47
            if v28 then
                v47[v48 + 1] = v28
            end
            v41[v42 + 1] = u3.createElement(u2, v44, v47)
            v41[v42 + 2] = u3.createElement(u2, {
                ["Size"] = UDim2.fromScale(1, 0.9)
            }, { u3.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 5)
                }), u3.createElement(u12, {
                    ["CellPadding"] = 10,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["CalculateCellSize"] = function(p49, p50) --[[ Name: CalculateCellSize, Line 173 ]]
                        return UDim2.fromOffset(p49.X / 3.5 - 10, p49.Y - p50 - 10)
                    end,
                    ["CanvasOffset"] = function(p51, _) --[[ Name: CanvasOffset, Line 176 ]]
                        return Vector2.new(p51.X / 3.5 * 0.05, 0)
                    end,
                    ["SetItems"] = function(u52) --[[ Name: SetItems, Line 179 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u3
                            [3] = u15
                            [4] = u17
                        --]]
                        local v53 = u24
                        local function v55(p54) --[[ Line: 181 ]]
                            --[[
                            Upvalues:
                                [1] = u3
                                [2] = u15
                                [3] = u17
                                [4] = u52
                            --]]
                            return u3.createElement(u15, {
                                ["store"] = u17.store,
                                ["Size"] = u52,
                                ["Position"] = UDim2.fromScale(0.5, 0.5),
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Kit"] = u17.SelectedKit,
                                ["Skin"] = p54,
                                ["SelectedKitSkin"] = u17.SelectedKitSkin,
                                ["SetSelectedKitSkin"] = u17.SetSelectedKitSkin
                            })
                        end
                        local v56 = table.create(#v53)
                        for v57, v58 in v53 do
                            v56[v57] = v55(v58, v57 - 1, v53)
                        end
                        return v56
                    end
                }) })
            v39 = u3.createElement(u2, v40, v41)
        end
        if v39 then
            v35[v38 + 1] = v39
        end
        return u3.createElement(u2, v32, v35)
    end)
}