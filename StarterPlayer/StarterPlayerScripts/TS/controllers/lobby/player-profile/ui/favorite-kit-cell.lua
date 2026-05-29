local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["FavoriteKitCell"] = v4.new(u3)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u2
            [4] = u6
            [5] = u7
            [6] = u5
        --]]
        local _ = p10.useState
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v12 = { u3.createElement("ImageLabel", {
                ["Image"] = p9.KitMeta.renderImage,
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["LayoutOrder"] = p9.LayoutOrder,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["BackgroundColor3"] = u8.backgroundSecondary
            }) }
        local v13 = #v12
        local v14 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1)
        }
        local v15 = {}
        local v16 = u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.03, 0)
        })
        local v17 = u3.createElement
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(1, 0.16)
        }
        local v19 = p9.Plays
        v18.Text = tostring(v19) .. " Plays"
        v18.TextColor3 = u2.WHITE
        v18.Font = Enum.Font.Roboto
        __set_list(v15, 1, {v16, v17("TextLabel", v18, { u3.createElement("UIStroke", {
        ["Thickness"] = 2,
        ["Color"] = u2.BLACK
    }) })})
        local v20 = #v15
        local v21 = {
            ["BackgroundTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1),
            ["BackgroundColor3"] = u2.BLACK
        }
        local v22 = {}
        local v23 = #v22
        local v24 = {
            ["TextScale"] = 0.7,
            ["FrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            },
            ["Text"] = "<b>" .. p9.KitMeta.name .. "</b>",
            ["TextProps"] = {
                ["RichText"] = true,
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u2.WHITE
            }
        }
        local v25 = p9.KitMeta.kitClass
        if v25 == nil then
            v25 = u6.MISC
        end
        v24.Image = u7(v25).imageId
        v24.ImageLeft = true
        v24.Padding = UDim.new(0.02, 0)
        v22[v23 + 1] = u3.createElement(u5, v24)
        v15[v20 + 1] = u3.createElement("Frame", v21, v22)
        v12[v13 + 1] = u3.createElement("Frame", v14, v15)
        return u3.createElement("Frame", v11, v12)
    end)
}