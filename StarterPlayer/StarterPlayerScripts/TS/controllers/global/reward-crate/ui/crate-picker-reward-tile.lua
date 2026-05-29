local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-meta").getCrateItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-tier-types").CrateStarTierColors
return {
    ["CratePickerRewardTile"] = v8.new(u7)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u12
            [4] = u7
            [5] = u9
            [6] = u4
            [7] = u3
            [8] = u6
            [9] = u5
        --]]
        local _ = p14.useState
        local v15 = u10(p13.CrateEntry.itemType)
        local v16 = u11(p13.CrateEntry.rarity)
        local v17 = u12[v16.tier]
        local v18 = false
        local v19 = 0
        local v20 = {}
        while true do
            if v18 then
                v19 = v19 + 1
            else
                v18 = true
            end
            if v19 >= v16.stars then
                local v21 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = u4.WHITE
                }
                local v22 = { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u7.createElement("UIGradient", {
                        ["Rotation"] = 90,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v16.gradient.colorTop), ColorSequenceKeypoint.new(1, v16.gradient.colorBottom) })
                    }) }
                local v23 = #v22
                local v24 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v25 = {}
                local v26 = #v25
                local v27 = { u7.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = v15.displayName,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u7.createElement(u3, {
                        ["TextSize"] = 14,
                        ["Text"] = string.upper(v16.id),
                        ["Font"] = Enum.Font.SourceSans,
                        ["TextColor3"] = v16.gradient.colorTop,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }
                local v28 = #v27
                local v29
                if v15.description == nil then
                    v29 = false
                else
                    v29 = u7.createElement(u3, {
                        ["TextSize"] = 14,
                        ["Text"] = v15.description,
                        ["Font"] = Enum.Font.SourceSans,
                        ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                        ["Limits"] = Vector2.new(300, 60)
                    })
                end
                if v29 then
                    v27[v28 + 1] = v29
                end
                v25[v26 + 1] = u7.createElement(u6, {}, v27)
                local v30
                if v15.itemDisplay.image == nil then
                    v30 = false
                else
                    v30 = u7.createFragment({
                        ["RewardImage"] = u7.createElement("ImageLabel", {
                            ["ScaleType"] = "Fit",
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 10,
                            ["Size"] = UDim2.fromScale(0.8, 0.6),
                            ["Position"] = UDim2.fromScale(0.5, 0.4),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = v15.itemDisplay.image
                        })
                    })
                end
                if v30 then
                    v25[v26 + 2] = v30
                end
                local v31 = #v25
                local v32
                if v15.itemDisplay.text == nil then
                    v32 = false
                else
                    local v33 = u7.createFragment
                    local v34 = {
                        ["RewardText"] = u7.createElement("TextLabel", {
                            ["RichText"] = true,
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 10,
                            ["Size"] = UDim2.fromScale(0.8, 0.4),
                            ["Position"] = UDim2.fromScale(0.5, 0.4),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Text"] = "<b>" .. v15.itemDisplay.text.richText .. "</b>",
                            ["TextColor3"] = v15.itemDisplay.text.color or Color3.fromRGB(255, 255, 255)
                        })
                    }
                    v32 = v33(v34)
                end
                if v32 then
                    v25[v31 + 1] = v32
                end
                local _ = #v25
                local v35 = {
                    ["Size"] = UDim2.fromScale(0.9, 0.2),
                    ["Position"] = UDim2.fromScale(0.5, 0.73),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }
                local v36 = { u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["Padding"] = UDim.new(0, 1)
                    }) }
                local v37 = #v36
                for v38, v39 in v20 do
                    v36[v37 + v38] = v39
                end
                v25.Stars = u7.createElement(u5, v35, v36)
                v25.RewardNameContainer = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 12,
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["Position"] = UDim2.fromScale(0.5, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 1),
                    ["BackgroundColor3"] = u4.WHITE
                }, { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u7.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 12,
                        ["Size"] = UDim2.fromScale(0.95, 0.9),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Text"] = v15.displayName,
                        ["TextColor3"] = Color3.fromRGB(39, 39, 39),
                        ["Font"] = Enum.Font.GothamBold
                    }) })
                v22[v23 + 1] = u7.createElement(u5, v24, v25)
                return u7.createFragment({
                    ["RewardFrame"] = u7.createElement("Frame", v21, v22)
                })
            end
            local v40 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u9.STAR_SOLID,
                ["ImageColor3"] = v17
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            table.insert(v20, v40)
        end
    end)
}