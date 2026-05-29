local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Button
local u5 = v2.ColorUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomKitGame_KitSelectionGUI"] = v9.new(u8)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u8
            [4] = u6
            [5] = u4
            [6] = u10
            [7] = u3
        --]]
        local _ = p12.useState
        local v13 = p12.useEffect
        local u14 = u7.new()
        v13(function() --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            return function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:DoCleaning()
            end
        end, {})
        local v15 = {}
        local _ = #v15
        local v16 = {
            ["BackgroundTransparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0.3, 0.8),
            ["Position"] = UDim2.new(0, 10, 0.5, 0),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v17 = {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }),
            ["CustomKitSelection_Header"] = u8.createElement(u6, {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.08),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }, { u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = "Select a Custom Kit",
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u5.WHITE,
                    ["Font"] = Enum.Font.GothamBold
                }) })
        }
        local _ = #v17
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.92),
            ["Position"] = UDim2.fromScale(0, 0.08),
            ["AnchorPoint"] = Vector2.new(0, 0)
        }
        local v19 = {}
        local v20 = #v19
        local v21 = u11.CustomKits
        local function v26(u22, _) --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u10
                [4] = u11
            --]]
            local v23 = u8.createElement
            local v24 = u4
            local v25 = {
                ["LayoutOrder"] = 100,
                ["Selectable"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(0.9, 0.1),
                ["BackgroundColor3"] = u10.buttonPrimary,
                ["Text"] = u22.name,
                ["OnClick"] = function() --[[ Name: OnClick, Line 74 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u22
                    --]]
                    u11.OnKitClicked(u22)
                end,
                ["TextLabel"] = {
                    ["ZIndex"] = 61,
                    ["Size"] = UDim2.fromScale(0.9, 0.8),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }
            }
            return v23(v24, v25)
        end
        local v27 = table.create(#v21)
        local v28 = {
            ["DisplayOrder"] = 22,
            ["ResetOnSpawn"] = false
        }
        for v29, v30 in v21 do
            v27[v29] = v26(v30, v29 - 1, v21)
        end
        local v31 = {
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            }
        }
        local v32 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.02, 0)
            }), u8.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.02, 0),
                ["PaddingBottom"] = UDim.new(0.02, 0),
                ["PaddingLeft"] = UDim.new(0.02, 0),
                ["PaddingRight"] = UDim.new(0.02, 0)
            }) }
        local v33 = #v32
        for v34, v35 in v27 do
            v32[v33 + v34] = v35
        end
        v19[v20 + 1] = u8.createElement(u3, v31, v32)
        v17.CustomKitSelection_Content = u8.createElement(u6, v18, v19)
        v15.CustomKitCreation_Main_Frame = u8.createElement("Frame", v16, v17)
        return u8.createFragment({
            ["CustomKitCreation_MainGui"] = u8.createElement("ScreenGui", v28, v15)
        })
    end)
}