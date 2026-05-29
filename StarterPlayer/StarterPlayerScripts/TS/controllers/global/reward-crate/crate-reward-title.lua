local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
return {
    ["CrateRewardTitle"] = v3.new(u2)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u4
        --]]
        local _ = p7.useState
        local v8 = u5(p6.itemRarity).gradient.colorTop
        local v9 = false
        local v10 = 0
        local v11 = {}
        while true do
            if v9 then
                v10 = v10 + 1
            else
                v9 = true
            end
            if v10 >= u5(p6.itemRarity).stars then
                local v12 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v13 = {}
                local v14 = #v13
                local v15 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0)
                }
                local v16 = { u2.createElement("UIGridLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["CellSize"] = UDim2.fromScale(0.18, 0.9),
                        ["CellPadding"] = UDim2.fromScale(0.02)
                    }) }
                local v17 = #v16
                for v18, v19 in v11 do
                    v16[v17 + v18] = v19
                end
                v13.StarsList = u2.createElement("Frame", v15, v16)
                v13[v14 + 1] = u2.createElement("TextLabel", {
                    ["Font"] = "LuckiestGuy",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Text"] = p6.itemDisplayName,
                    ["TextColor3"] = v8,
                    ["Size"] = UDim2.fromScale(0.95, 0.48),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }, { u2.createElement("UIStroke", {
                        ["Thickness"] = 2
                    }) })
                return u2.createElement("Frame", v12, v13)
            end
            local v20 = u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u4.STAR_SOLID
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            table.insert(v11, v20)
        end
    end)
}