local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Button
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "custom-kit-creation-kit-selection-slot-gui").CustomKitCreation_KitSelection_SlotGUI
return {
    ["CustomKitCreation_KitSelectionGUI"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u9
            [4] = u4
            [5] = u5
            [6] = u10
            [7] = u3
            [8] = u6
        --]]
        local _ = p13.useState
        local _ = p13.useEffect
        local function u15(p14) --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            u12.OnKitSlotClicked(p14)
        end
        local v16 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v17 = {}
        local v18 = #v17
        local v19 = u12.CustomKits
        local function v24(p20, u21) --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u15
                [3] = u7
                [4] = u11
            --]]
            local v22 = {
                ["Index"] = u21,
                ["Kit"] = p20,
                ["LayoutOrder"] = u21
            }
            local v23 = u12.CurrentKit
            if v23 ~= nil then
                v23 = v23.id
            end
            v22.Selected = v23 == p20.id
            function v22.OnClicked() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u21
                --]]
                return u15(u21)
            end
            function v22.OnEditClicked() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u21
                --]]
                return u12.OnEditKitSlotClicked(u21)
            end
            function v22.OnDeleteClicked() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u21
                --]]
                return u12.OnDeleteKitSlotClicked(u21)
            end
            return u7.createElement(u11, v22)
        end
        local v25 = table.create(#v19)
        for v26, v27 in v19 do
            v25[v26] = v24(v27, v26 - 1, v19)
        end
        local v28 = {
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            }
        }
        local v29 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.01, 0)
            }), u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.02, 0),
                ["PaddingBottom"] = UDim.new(0.02, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) }
        local v30 = #v29
        for v31, v32 in v25 do
            v29[v30 + v31] = v32
        end
        local v33 = #v29
        local v34
        if #u12.CustomKits < u9.MaxKits then
            v34 = u7.createElement(u4, {
                ["LayoutOrder"] = 100,
                ["Text"] = "ADD NEW KIT",
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.new(0.5, 0, 0, u5.isSmallScreen() and 35 or 45),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u10.buttonPrimary,
                ["OnClick"] = function() --[[ Name: OnClick, Line 89 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                    --]]
                    u12.OnAddKitSlotClicked()
                end,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["Size"] = UDim2.fromScale(0.8, 0.55),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            })
        else
            v34 = false
        end
        if v34 then
            v29[v33 + 1] = v34
        end
        v17[v18 + 1] = u7.createElement(u3, v28, v29)
        return u7.createFragment({
            ["CustomKitCreation_KitSelectionGUI"] = u7.createElement(u6, v16, v17)
        })
    end)
}