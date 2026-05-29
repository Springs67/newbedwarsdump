local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ArmorTrimToolbar"] = v6.new(u5)(function(u9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u4
            [4] = u3
            [5] = u8
        --]]
        local v10 = u5.createElement
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = u9.Size
        }
        local v12 = {}
        local v13 = u5.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 8)
        })
        local v14 = u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        })
        local v15 = u5.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }, { u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.8),
                ["Text"] = u7[u9.SelectedKit].name .. " Armor Trim",
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
        local v16 = u5.createElement
        local v17 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v18 = {
            ["ViewAllArmorTrimsButton"] = u5.createElement(u3, {
                ["LayoutOrder"] = 2,
                ["Text"] = u9.ViewAll and "<b>Return to Selection</b>" or "<b>View All Armor Trims</b>",
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(0.95, 0.5),
                ["Size"] = UDim2.fromScale(0.6, 0.8),
                ["BackgroundColor3"] = u8.backgroundPrimary,
                ["OnClick"] = function() --[[ Name: OnClick, Line 51 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    u9.OnViewAll()
                end
            })
        }
        __set_list(v12, 1, {v13, v14, v15, v16("Frame", v17, v18)})
        return v10("Frame", v11, v12)
    end)
}