local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.DividerComponent
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v2.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "game-update-card").GameUpdateCard
local u15 = v1.import(script, script.Parent, "promo-cards", "game-update-promo-cards-list").GameUpdatePromoCardsList
return {
    ["GameUpdatesCore"] = v11.new(u10)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u8
            [4] = u12
            [5] = u5
            [6] = u10
            [7] = u7
            [8] = u14
            [9] = u6
            [10] = u3
            [11] = u15
            [12] = u9
        --]]
        local v18 = p17.useEffect
        local _ = p17.useState
        local v19 = nil
        v19 = 0
        local v20 = u16.store.GameUpdates.updates
        local u21 = v19
        local v22 = {
            ["newUpdates"] = {},
            ["oldUpdates"] = {}
        }
        for v23 = 1, #v20 do
            local v24 = v20[v23]
            local _ = v23 - 1
            if v24.new then
                local v25 = v22.newUpdates
                table.insert(v25, v24)
                v19 = u21 + 1
                u21 = v19
            else
                local v26 = v22.oldUpdates
                table.insert(v26, v24)
            end
        end
        v18(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u12
            --]]
            u8:playSound(u12.UI_OPEN_2)
            return function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u12
                --]]
                u8:playSound(u12.UI_CLOSE_2)
            end
        end, {})
        local v27 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v28
        if u5.isSmallScreen() then
            v28 = UDim2.fromScale(0.95, 0.95)
        else
            v28 = UDim2.fromScale(0.95, 0.95)
        end
        v27.Size = v28
        local v29 = {}
        local v30 = u10.createElement
        local v31 = "UIAspectRatioConstraint"
        local v32 = {
            ["AspectType"] = "FitWithinMaxSize"
        }
        u5.isSmallScreen()
        local v33 = 1.5454545454545454
        v32.AspectRatio = v33
        __set_list(v29, 1, {v30(v31, v32), u10.createElement("UISizeConstraint", {
    ["MaxSize"] = Vector2.new(1062.5, 687.5)
})})
        local v34 = #v29
        local v35 = {
            ["ClipsDescendents"] = false,
            ["AppId"] = u16.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Title"] = "Patch Notes   " .. ((u21 == 0 or (u21 ~= u21 or not u21)) and "" or "<font size=\"16\" color=\"" .. u4.richTextColor(u13.backgroundSuccess) .. "\">" .. tostring(u21) .. " new update" .. (u21 > 1 and "s" or "") .. "</font>")
        }
        local v36 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 14)
            }) }
        local v37 = #v36
        local v38 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.7, -14, 1, 0)
        }
        local v39 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v40 = #v39
        local v41 = v22.newUpdates
        local function v44(p42, p43) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u7
                [3] = u14
                [4] = u16
            --]]
            return u10.createElement(u7, {
                ["AutomaticSize"] = "Y",
                ["Size"] = UDim2.fromScale(1, 0),
                ["LayoutOrder"] = p43
            }, { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 6)
                }), u10.createElement(u14, {
                    ["LayoutOrder"] = 2,
                    ["store"] = u16.store,
                    ["GameUpdate"] = p42,
                    ["Size"] = UDim2.fromScale(0.97, 0)
                }) })
        end
        local v45 = table.create(#v41)
        for v46, v47 in v41 do
            v45[v46] = v44(v47, v46 - 1, v41)
        end
        local v48 = {
            ["GameUpdateCardsListLayout"] = u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            })
        }
        local v49 = #v48
        local v50 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2
            }
        }
        for v51, v52 in v45 do
            v48[v49 + v51] = v52
        end
        local v53 = #v48
        v48[v53 + 1] = u10.createElement(u6, {
            ["LengthScale"] = 0.97,
            ["Text"] = "YOU\'RE ALL CAUGHT UP!",
            ["BarColor"] = {
                ["Transparency"] = 0,
                ["Color"] = Color3.fromRGB(255, 59, 59)
            },
            ["TextLabel"] = {
                ["Transparency"] = 0,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            },
            ["LayoutOrder"] = u21 + 1
        })
        local v54 = v22.oldUpdates
        local function v57(p55, p56) --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u7
                [3] = u21
                [4] = u14
                [5] = u16
            --]]
            return u10.createElement(u7, {
                ["AutomaticSize"] = "Y",
                ["Size"] = UDim2.fromScale(1, 0),
                ["LayoutOrder"] = u21 + 1 + p56
            }, { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 6)
                }), u10.createElement(u14, {
                    ["LayoutOrder"] = 2,
                    ["store"] = u16.store,
                    ["GameUpdate"] = p55,
                    ["Size"] = UDim2.fromScale(0.97, 0)
                }) })
        end
        local v58 = table.create(#v54)
        for v59, v60 in v54 do
            v58[v59] = v57(v60, v59 - 1, v54)
        end
        for v61, v62 in v58 do
            v48[v53 + 1 + v61] = v62
        end
        v39[v40 + 1] = u10.createElement(u3, v50, v48)
        v36.UpdateContents = u10.createElement(u7, v38, v39)
        v36[v37 + 1] = u10.createElement(u15, {
            ["LayoutOrder"] = 2,
            ["store"] = u16.store,
            ["Size"] = UDim2.new(0.3, 0, 1, 0)
        })
        v29[v34 + 1] = u10.createElement(u9, v35, v36)
        return u10.createElement(u7, v27, v29)
    end)
}