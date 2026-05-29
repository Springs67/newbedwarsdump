local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "alchemist", "alchemist-brew-util").getAlchemistFlaskRecipes
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = UDim2.fromScale(0.012, 0.625)
local u10 = Color3.fromRGB(22, 24, 28)
local u11 = Color3.fromRGB(36, 44, 60)
local u12 = Color3.fromRGB(52, 60, 80)
local u13 = Color3.fromRGB(48, 42, 58)
local u14 = Color3.fromRGB(34, 38, 46)
local u15 = Color3.fromRGB(150, 158, 175)
local u16 = v5()
local function u27(p17, p18, p19) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u12
    --]]
    local v20
    if p17 == nil then
        v20 = nil
    else
        v20 = u7(p17)
    end
    local v21 = v20 ~= nil
    if v21 then
        local v22 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.82, 0.82),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v23 = v20.image
        v22.Image = v23 == nil and "" or v23
        v22.ScaleType = Enum.ScaleType.Fit
        v21 = u3.createFragment({
            ["MixIcon_" .. tostring(p18)] = u3.createElement("ImageLabel", v22)
        })
    end
    local v24 = {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = p19,
        ["Size"] = UDim2.fromOffset(32, 32),
        ["BackgroundColor3"] = u12,
        ["BackgroundTransparency"] = p17 == nil and 0.22 or 0.1
    }
    local v25 = { u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }) }
    local v26 = #v25
    if v21 then
        v25[v26 + 1] = v21
    end
    return u3.createFragment({
        ["MixSlot_" .. tostring(p18)] = u3.createElement("Frame", v24, v25)
    })
end
local function u50(u28, p29) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u14
    --]]
    local u30 = {}
    local function v41(p31, p32) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u28
            [4] = u30
        --]]
        local v33 = u7(p31)
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = p32,
            ["Size"] = UDim2.fromOffset(32, 32)
        }
        local v35 = v33.image
        v34.Image = v35 == nil and "" or v35
        v34.ScaleType = Enum.ScaleType.Fit
        local v36 = u3.createFragment
        local v37 = {}
        local v38 = u28
        v37["Rec_" .. tostring(v38) .. "_IngIcon_" .. tostring(p32)] = u3.createElement("ImageLabel", v34)
        local v39 = v36(v37)
        local v40 = u30
        table.insert(v40, v39)
    end
    local v42 = 114
    for v43, v44 in p29 do
        v41(v44, v43 - 1, p29)
    end
    local v45 = {
        ["LayoutOrder"] = 0,
        ["BackgroundTransparency"] = 0.28,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromOffset(v42, 32),
        ["BackgroundColor3"] = u14
    }
    local v46 = { u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u3.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 5),
            ["PaddingRight"] = UDim.new(0, 5),
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0)
        }) }
    local v47 = #v46
    for v48, v49 in u30 do
        v46[v47 + v48] = v49
    end
    v46[#v46 + 1] = u3.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["Padding"] = UDim.new(0, 4),
        ["SortOrder"] = Enum.SortOrder.LayoutOrder
    })
    return u3.createFragment({
        ["RecBox_" .. tostring(u28)] = u3.createElement("Frame", v45, v46)
    })
end
local function u60(p51, p52, p53, p54) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u2
    --]]
    local v55 = u7(p51)
    local v56 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = p54,
        ["Size"] = UDim2.fromOffset(49, 22)
    }
    local v57 = {}
    local _ = #v57
    local v58 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromOffset(18, 18),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 0, 0.5, 0)
    }
    local v59 = v55.image
    v58.Image = v59 == nil and "" or v59
    v58.ScaleType = Enum.ScaleType.Fit
    v57[p53 .. "_Icon"] = u3.createElement("ImageLabel", v58)
    v57[p53 .. "_Count"] = u3.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextSize"] = 12,
        ["Size"] = UDim2.new(0, 26, 1, 0),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["Text"] = tostring(p52),
        ["Font"] = Enum.Font.GothamBold,
        ["TextColor3"] = u2.WHITE,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center
    })
    return u3.createFragment({
        [p53] = u3.createElement("Frame", v56, v57)
    })
end
local function u68(p61) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u15
    --]]
    local v62 = u3.createFragment
    local v63 = {}
    local v64 = "RecArrow_" .. tostring(p61)
    local v65 = u3.createElement
    local v66 = {
        ["LayoutOrder"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromOffset(17, 32)
    }
    local v67 = {
        ["RecArrowImg_" .. tostring(p61)] = u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromOffset(17, 12),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u6.LONG_ARROW_RIGHT,
            ["ImageColor3"] = u15,
            ["ScaleType"] = Enum.ScaleType.Fit
        })
    }
    v63[v64] = v65("Frame", v66, v67)
    return v62(v63)
end
return {
    ["AlchemistRecipeSidebar"] = v4.new(u3)(function(p69, _) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u50
            [4] = u68
            [5] = u13
            [6] = u3
            [7] = u9
            [8] = u10
            [9] = u11
            [10] = u27
            [11] = u60
            [12] = u8
        --]]
        local v70 = p69.stagedIngredients
        local v71 = 114 + 5 + 17 + 5 + 32
        local v72 = math.max(106, v71) + 14
        local v73 = #u16
        local v74
        if v73 > 0 then
            local v75 = v73 * 32
            local v76 = v73 - 1
            v74 = v75 + math.max(0, v76) * 4
        else
            v74 = 0
        end
        local v77 = (v73 <= 0 and 0 or v74 + 7) + 56 + 7 + 22
        local u78 = {}
        local function v94(p79, p80) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u50
                [3] = u68
                [4] = u13
                [5] = u3
                [6] = u78
            --]]
            if p79.result == nil then
                return nil
            end
            local v81 = u7(p79.result)
            local v82 = 114 + 5 + 17 + 5 + 32
            local v83 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = p80,
                ["Size"] = UDim2.new(1, 0, 0, 32)
            }
            local v84 = {}
            local _ = #v84
            local v85 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromOffset(v82, 32),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v86 = { u50(p80, p79.ingredients), u68(p80) }
            local v87 = #v86
            local v88 = {
                ["LayoutOrder"] = 2,
                ["BackgroundTransparency"] = 0.08,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromOffset(32, 32),
                ["BackgroundColor3"] = u13
            }
            local v89 = { u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }
            local _ = #v89
            local v90 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.82, 0.82),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v91 = v81.image
            v90.Image = v91 == nil and "" or v91
            v90.ScaleType = Enum.ScaleType.Fit
            v89["RecipeRow_" .. tostring(p80) .. "_ResultIcon"] = u3.createElement("ImageLabel", v90)
            v86["RecipeRow_" .. tostring(p80) .. "_Result"] = u3.createElement("Frame", v88, v89)
            v86[v87 + 1] = u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 5),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
            v84["RecipeRowInner_" .. tostring(p80)] = u3.createElement("Frame", v85, v86)
            local v92 = u3.createFragment({
                ["RecipeRow_" .. tostring(p80)] = u3.createElement("Frame", v83, v84)
            })
            local v93 = u78
            table.insert(v93, v92)
        end
        for v95, v96 in u16 do
            v94(v96, v95 - 1, u16)
        end
        local v97 = 106
        local v98 = {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true,
            ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
        }
        local v99 = {}
        local _ = #v99
        local v100 = v73 > 0
        if v100 then
            local v101 = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, v74)
            }
            local v102 = {}
            local v103 = #v102
            for v104, v105 in u78 do
                v102[v103 + v104] = v105
            end
            v102[#v102 + 1] = u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            })
            v100 = u3.createFragment({
                ["RecipeList"] = u3.createElement("Frame", v101, v102)
            })
        end
        local v106 = {
            ["BackgroundTransparency"] = 0.08,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = u9,
            ["Size"] = UDim2.fromOffset(v72, v77),
            ["BackgroundColor3"] = u10
        }
        local v107 = {
            u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 7)
            }),
            u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 7),
                ["PaddingBottom"] = UDim.new(0, 7),
                ["PaddingLeft"] = UDim.new(0, 7),
                ["PaddingRight"] = UDim.new(0, 7)
            }),
            ["CurrentMixPanel"] = u3.createElement("Frame", {
                ["LayoutOrder"] = 0,
                ["BackgroundTransparency"] = 0.04,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 42),
                ["BackgroundColor3"] = u11
            }, {
                u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 7)
                }),
                u3.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 5),
                    ["PaddingBottom"] = UDim.new(0, 5),
                    ["PaddingLeft"] = UDim.new(0, 5),
                    ["PaddingRight"] = UDim.new(0, 5)
                }),
                ["CurrentMixRowHolder"] = u3.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1)
                }, {
                    ["CurrentMixRow"] = u3.createElement("Frame", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromOffset(v97, 32),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }, {
                        u27(v70[1], 0, 0),
                        u27(v70[2], 1, 1),
                        u27(v70[3], 2, 2),
                        u3.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                            ["Padding"] = UDim.new(0, 5),
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder
                        })
                    }),
                    u3.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    })
                })
            })
        }
        local v108 = #v107
        if v100 then
            v107[v108 + 1] = v100
        end
        local v109 = #v107
        v107.OwnedIngredients = u3.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = v73 > 0 and 2 or 1,
            ["Size"] = UDim2.new(1, 0, 0, 22)
        }, {
            u60(u8.WILD_FLOWER, p69.wildFlowerCount, "OwnFlower", 0),
            u60(u8.MUSHROOMS, p69.mushroomsCount, "OwnMush", 1),
            u60(u8.THORNS, p69.thornsCount, "OwnThorn", 2),
            u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 12),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
        })
        v107[v109 + 1] = u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 7)
        })
        v99.AlchemistRecipeRoot = u3.createElement("Frame", v106, v107)
        return u3.createElement("ScreenGui", v98, v99)
    end)
}