local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["KitDetailsKitInfoCard"] = v6.new(u5)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u7
            [4] = u11
            [5] = u8
            [6] = u3
            [7] = u12
            [8] = u5
            [9] = u4
        --]]
        local _ = p14.useState
        local v15
        if p13.SelectedKit then
            v15 = u10(p13.SelectedKit)
        else
            v15 = nil
        end
        local v16
        if p13.SelectedKitSkin then
            v16 = u9[p13.SelectedKitSkin]
        else
            v16 = nil
        end
        local v17
        if p13.SelectedKitBundle then
            v17 = u7[p13.SelectedKitBundle]
        else
            v17 = nil
        end
        local v18 = ""
        local v19 = ""
        local v20 = ""
        local u21 = nil
        local v22 = ""
        if v15 then
            local v23 = v15.kitClass
            if v23 ~= 0 and (v23 == v23 and v23) then
                v18 = u11(v15.kitClass).imageId
                v19 = u11(v15.kitClass).display
            end
            if p13.SelectedKitSkin and p13.SelectedKitSkin ~= u8.DEFAULT then
                if v16 ~= nil then
                    v16 = v16.name
                end
                v20 = tostring(v16) .. " <font color=\"" .. u3.richTextColor(u3.darken(u3.WHITE, 0.5)) .. "\">(Skin)</font>"
            elseif v15 == nil then
                v20 = v15
            else
                v20 = v15.name
            end
            u21 = v15.difficulty
            v22 = v15.description
        elseif v17 then
            v18 = u12.STAR_SOLID
            v19 = "Bundle"
            if v17.kitShopBundle then
                v20 = v17.kitShopBundle.name
                v22 = v17.kitShopBundle.description
            end
        else
            v18 = u12.SCROLL_SOLID
            v20 = ""
            v19 = "Miscellaneous"
        end
        local v24 = {}
        for v25, v26 in p13 do
            v24[v25] = v26
        end
        v24.SelectedKit = nil
        v24.SelectedKitSkin = nil
        v24.SelectedKitBundle = nil
        local v27 = {}
        for v28, v29 in v24 do
            v27[v28] = v29
        end
        local v30 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 3)
            }) }
        local v31 = #v30
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 0.125)
        }
        local v33 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 5)
            }) }
        local v34 = #v33
        local v35
        if v18 == "" then
            v35 = false
        else
            v35 = u5.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["Image"] = v18
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v35 then
            v33[v34 + 1] = v35
        end
        v33[#v33 + 1] = u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(0.75, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.025, 0)
            }), u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["TextTransparency"] = 0.5,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = string.upper(v19),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
        v30[v31 + 1] = u5.createElement(u4, v32, v33)
        v30[v31 + 2] = u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 0.15)
        }, { u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v20,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
        local v36
        if u21 == nil then
            v36 = false
        else
            v36 = u21 > 0
        end
        if v36 then
            local v37 = {
                ["Size"] = UDim2.fromScale(1, 0.15)
            }
            local v38 = { u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0)
                }), u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Text"] = "DIFFICULTY",
                    ["TextTransparency"] = 0.25,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) }
            local v39 = #v38
            local v40 = table.create(3, "")
            local function v47(_, p41) --[[ Line: 175 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u5
                    [3] = u3
                --]]
                local v42 = p41 < u21
                local v43 = u5.createElement
                local v44 = "Frame"
                local v45 = {
                    ["Size"] = UDim2.fromScale(0.075, 1)
                }
                local v46
                if v42 then
                    v46 = Color3.fromRGB(255, 235, 133)
                else
                    v46 = u3.WHITE
                end
                v45.BackgroundColor3 = v46
                v45.BackgroundTransparency = v42 and 0 or 0.5
                return v43(v44, v45, { u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) })
            end
            local v48 = table.create(#v40)
            for v49, v50 in v40 do
                v48[v49] = v47(v50, v49 - 1, v40)
            end
            local v51 = {
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v52 = { u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 5)
                }), u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0)
                }) }
            local v53 = #v52
            for v54, v55 in v48 do
                v52[v53 + v54] = v55
            end
            v38[v39 + 1] = u5.createElement(u4, v51, v52)
            v36 = u5.createElement(u4, v37, v38)
        end
        if v36 then
            v30[v31 + 3] = v36
        end
        v30[#v30 + 1] = u5.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 0.575)
        }, { u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextTransparency"] = 0.25,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v22,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }, { u5.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 28,
                    ["MinTextSize"] = 8
                }) }) })
        return u5.createElement(u4, v27, v30)
    end)
}