local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u12 = v1.import(script, script.Parent.Parent, "shop-tab", "countdown-component").CountdownComponent
return {
    ["ClanProfileGeneralKitUnlocks"] = v9.new(u8)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u7
            [4] = u11
            [5] = u5
            [6] = u10
            [7] = u12
            [8] = u6
            [9] = u3
        --]]
        local _ = p14.useState
        local v15 = {}
        for v16, v17 in p13 do
            v15[v16] = v17
        end
        v15.KitShopUnlocks = nil
        v15[u8.Children] = nil
        local v18 = {}
        for v19, v20 in v15 do
            v18[v19] = v20
        end
        local v21 = { u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.1, 0)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u8.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Font"] = "Roboto",
                ["Text"] = "<b>Kit Shop Unlocks</b>",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = u4.WHITE
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) }) }
        local v22 = #v21
        local v23 = u7.entries(p13.KitShopUnlocks)
        local function v28(p24) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u8
                [3] = u5
                [4] = u10
                [5] = u12
                [6] = u4
                [7] = u6
                [8] = u3
            --]]
            local v25 = p24[1]
            local v26 = p24[2]
            local v27 = u11(v25)
            return u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(0.21, 0.8)
            }, { u8.createElement(u10, {
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Kit"] = v25
                }), u8.createElement(u12, {
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["EndTime"] = v26.endTime
                }, { u8.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Color"] = u4.BLACK
                    }) }), u8.createElement(u6, {}, { u8.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = v27.name,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
        end
        local v29 = table.create(#v23)
        for v30, v31 in v23 do
            v29[v30] = v28(v31, v30 - 1, v23)
        end
        local v32 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v33 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v34 = #v33
        for v35, v36 in v29 do
            v33[v34 + v35] = v36
        end
        v21[v22 + 1] = u8.createElement(u5, v32, v33)
        return u8.createElement("Frame", v18, v21)
    end)
}