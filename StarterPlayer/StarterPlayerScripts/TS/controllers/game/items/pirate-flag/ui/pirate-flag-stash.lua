local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["PirateFlagStash"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u6
            [4] = u4
            [5] = u3
        --]]
        local _ = p10.useState
        local _ = p10.useEffect
        local v11 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 8, 0),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 200,
            ["Adornee"] = p9.Flag,
            ["Size"] = UDim2.fromScale(2, 2)
        }
        local v12 = {}
        local _ = #v12
        local v13 = u5.entries(p9.ItemsCollected)
        local function v26(p14, p15) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u6
                [3] = u4
                [4] = u3
            --]]
            local v16 = p14[1]
            local v17 = p14[2]
            local v18 = u8(v16)
            local v19 = u6.createFragment
            local v20 = {}
            local v21 = "StashItem_" .. v16
            local v22 = u6.createElement
            local v23 = u4
            local v24 = {
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["LayoutOrder"] = p15 + 5
            }
            local v25 = {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, 3),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                ["ItemImage"] = u6.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["Image"] = v18.image
                }),
                ["ItemAmount"] = u6.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["Font"] = "Roboto",
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["Text"] = "<b>" .. tostring(v17) .. "</b>",
                    ["TextColor3"] = v18.displayNameColor or u3.WHITE
                })
            }
            v20[v21] = v22(v23, v24, v25)
            return v19(v20)
        end
        local v27 = table.create(#v13)
        for v28, v29 in v13 do
            v27[v28] = v26(v29, v28 - 1, v13)
        end
        local v30 = {
            ["BackgroundTransparency"] = 0.3,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v31 = {
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u6.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u3.WHITE
            }),
            ["StashList"] = u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["Title"] = u6.createElement("TextLabel", {
                ["Text"] = "<b>Items Stolen</b>",
                ["Font"] = "Roboto",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.8, 0.2),
                ["TextColor3"] = u3.WHITE
            })
        }
        local v32 = #v31
        for v33, v34 in v27 do
            v31[v32 + v33] = v34
        end
        v12.PirateFlagStashContainer = u6.createElement("Frame", v30, v31)
        return u6.createFragment({
            ["PirateFlagStashGUI"] = u6.createElement("BillboardGui", v11, v12)
        })
    end)
}